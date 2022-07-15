<?php

namespace app\controllers;

use app\models\Accion;
use app\models\AccionSearch;
use app\models\Poa;
use app\models\Tipo;
use app\models\Gerencia;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use Yii;


/**
 * AccionController implements the CRUD actions for Accion model.
 */
class AccionController extends Controller
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
     * Lists all Accion models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new AccionSearch();  
        $tipo = new Tipo();  
        $searchModel->idgerencia = Yii::$app->user->identity->id_gerencia;    
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'tipo' => $tipo,
        ]);
    }

    /**
     * Displays a single Accion model.
     * @param int $id_accion Id Accion
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Accion model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Accion();

        $model->idgerencia = Yii::$app->user->identity->id_gerencia;

        if (Yii::$app->user->identity->id_perfil == 1)  {
            $tipo = Tipo::find()->orderBy('tipo')->all();
            $lista_tipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
            }else {
            $tipo = Tipo::find()->Where(['id_tipo'=> 2])->orderBy('tipo')->all();
            $lista_tipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
        }

        $gerencia=Gerencia::find()->orderBy('gerencia')->all();
        $listagerenci=ArrayHelper::map($gerencia, 'id_gerencia', 'gerencia');

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id_accion]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
            'lista_tipo' => $lista_tipo,
            'listagerenci'=> $listagerenci,

        ]);
    }

    /**
     * Updates an existing Accion model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_accion Id Accion
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if (Yii::$app->user->identity->id_perfil == 1)  {
            $tipo = Tipo::find()->orderBy('tipo')->all();
            $lista_tipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
            }else {
            $tipo = Tipo::find()->Where(['id_tipo'=> 2])->orderBy('tipo')->all();
            $lista_tipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
            }

        $gerencia=Gerencia::find()->orderBy('gerencia')->all();
        $listagerenci=ArrayHelper::map($gerencia, 'id_gerencia', 'gerencia');

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id_accion]);
        }

        return $this->render('update', [
            'model' => $model,
            'lista_tipo' => $lista_tipo,
            'listagerenci'=> $listagerenci,

        ]);
    }

    /**
     * Deletes an existing Accion model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_accion Id Accion
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_accion)
    {
        $this->findModel($id_accion)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Accion model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_accion Id Accion
     * @return Accion the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_accion)
    {
        if (($model = Accion::findOne(['id_accion' => $id_accion])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
    public function actionPoas() {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $id = end($_POST['depdrop_parents']);
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
                return ['output' => $out, 'selected' => $selected];
            }
        }
        return ['output' => '', 'selected' => ''];
    }
}
