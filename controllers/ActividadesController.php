<?php

namespace app\controllers;

use app\models\Actividades;
use app\models\UnidadMedida;
use app\models\ActividadesSearch;
use app\models\UnidadMedidaSearch;
use app\models\Accion;
use app\models\Poa;
use app\models\Tipo;
use app\models\Model;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use Yii;
/**
 * ActividadesController implements the CRUD actions for Actividades model.
 */
class ActividadesController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all Actividades models.
     *
     * @return string
     */
    public function actionIndex()
    {
        if (Yii::$app->user->identity->id_perfil == 1) {
            $searchModel = new ActividadesSearch();
            $dataProvider = $searchModel->search($this->request->queryParams);
        } else{
            $searchModel = new ActividadesSearch();
            $searchModel->id_gerencia = Yii::$app->user->identity->id_gerencia;
            $dataProvider = $searchModel->search($this->request->queryParams);
        } 
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Actividades model.
     * @param int $idactividad Idactividad
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);
        $unidadmedida = Unidadmedida::find()->Where(['id_actividad' => $id])->all();
        return $this->render('view', [
            'model' => $model,
            'unidadmedida'=>$unidadmedida,
        ]);
    }

    /**
     * Creates a new Actividades model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Actividades();
        $modelsUnidadmedida = [new Unidadmedida()];




        $model->id_gerencia = Yii::$app->user->identity->id_gerencia;

        if (Yii::$app->user->identity->id_perfil == 1)  {
            $tipo = Tipo::find()->orderBy('tipo')->all();
            $lista_tipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
        }else {
            $tipo = Tipo::find()->Where(['id_tipo'=> 2])->orderBy('tipo')->all();
            $lista_tipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
        }

        if ($this->request->isPost) {
            if ($model->load($this->request->post())) {
                
                $modelsUnidadmedida = Model::createMultiple(Unidadmedida::classname());
                Model::loadMultiple($modelsUnidadmedida, Yii::$app->request->post());

                $valid = $model->validate();
                $valid = Model::validateMultiple($modelsUnidadmedida) && $valid;

                if ($valid) {
                    $transaction = \Yii::$app->db->beginTransaction();
                    try {
                        if ($flag = $model->save(false)) {
                            foreach ($modelsUnidadmedida as $modelUnidadmedida) {
                                $modelUnidadmedida->id_actividad = $model->idactividad;
                                if (! ($flag = $modelUnidadmedida->save(false))) {
                                    $transaction->rollBack();
                                    break;
                                }
                            }
                        }
                        if ($flag) {
                            $transaction->commit();
                            //return $this->redirect(['view', 'id' => $model->id]);
                            return $this->redirect(['view', 'id' => $model->idactividad]);
                        }
                    } catch (Exception $e) {
                        $transaction->rollBack();
                    }
                }
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
            'lista_tipo' => $lista_tipo,
            'modelsUnidadmedida' => (empty($modelsUnidadmedida)) ? [new Unidadmedida] : $modelsUnidadmedida

        ]);
    }

    /**
     * Updates an existing Actividades model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $idactividad Idactividad
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $modelsUnidadmedida = $model->unidadMedidas;

        if (Yii::$app->user->identity->id_perfil == 1)  {
            $tipo = Tipo::find()->orderBy('tipo')->all();
            $lista_tipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
            }else {
            $tipo = Tipo::find()->Where(['id_tipo'=> 2])->orderBy('tipo')->all();
            $lista_tipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
        }

        if ($this->request->isPost && $model->load($this->request->post())) {

            $oldIDs = ArrayHelper::map($modelsUnidadmedida, 'id', 'id');
            $modelsUnidadmedida = Model::createMultiple(Unidadmedida::classname(), $modelsUnidadmedida);
            Model::loadMultiple($modelsUnidadmedida, Yii::$app->request->post());
            $deletedIDs = array_diff($oldIDs, array_filter(ArrayHelper::map($modelsUnidadmedida, 'id', 'id')));

            $valid = $model->validate();
            $valid = Model::validateMultiple($modelsUnidadmedida) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $model->save(false)) {
                        if (! empty($deletedIDs)) {
                            Unidadmedida::deleteAll(['id' => $deletedIDs]);
                        }
                        foreach ($modelsUnidadmedida as $modelUnidadmedida) {
                            $modelUnidadmedida->id_actividad = $model->idactividad;
                            if (! ($flag = $modelUnidadmedida->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $model->idactividad]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }
    
        }

        return $this->render('update', [
            'model' => $model,
            'lista_tipo' => $lista_tipo,
             'modelsUnidadmedida' => (empty($modelsUnidadmedida)) ? [new Unidadmedida] : $modelsUnidadmedida
        ]);
    }

    /**
     * Deletes an existing Actividades model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $idactividad Idactividad
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($idactividad)
    {
        $this->findModel($idactividad)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Actividades model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $idactividad Idactividad
     * @return Actividades the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($idactividad)
    {
        if (($model = Actividades::findOne(['idactividad' => $idactividad])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
    public function actionPoas() {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $id = end($_POST['depdrop_parents']);
            if (Yii::$app->user->identity->id_perfil == 2){ 
            $list = Poa::find()->Where(['id_tipo' => $id, 'id_gerencia' => Yii::$app->user->identity->id_gerencia])->asArray()->all();
            $selected  = null;
            if ($id != null && count($list) > 0) {
                $selected = '';
                foreach ($list as $i => $account) {
                    $out[] = ['id' => $account['idpoa'], 'name' => $account['descripcion']];
                    if ($i == 0) {
                        $selected = $account['idpoa'];
                    }
                }
                // Shows how you can preselect a value
                //return ['output' => $out, 'selected' => $selected];
                return ['output' => $out, 'selected' => ''];

            }
        }else{
        $list = Poa::find()->Where(['id_tipo' => $id])->asArray()->all();
            $selected  = null;
            if ($id != null && count($list) > 0) {
                $selected = '';
                foreach ($list as $i => $account) {
                    $out[] = ['id' => $account['idpoa'], 'name' => $account['descripcion']];
                    if ($i == 0) {
                        $selected = $account['idpoa'];
                    }
                }
                // Shows how you can preselect a value
                //return ['output' => $out, 'selected' => $selected];
                return ['output' => $out, 'selected' => ''];
            }
        }
        return ['output' => '', 'selected' => ''];
        }
    }
    public function actionAccionespecif() {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $id = end($_POST['depdrop_parents']);
            $list = Accion::find()->Where(['idpoa' => $id])->asArray()->all();
            $selected  = null;
            if ($id != null && count($list) > 0) {
                $selected = '';
                foreach ($list as $i => $account) {
                    $out[] = ['id' => $account['id_accion'], 'name' => $account['descripcion']];
                    if ($i == 0) {
                        $selected = $account['id_accion'];
                    }
                }
                // Shows how you can preselect a value
                return ['output' => $out, 'selected' => ''];
            }
        }
        return ['output' => '', 'selected' => ''];
    }
}
