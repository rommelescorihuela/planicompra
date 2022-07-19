<?php

namespace app\controllers;

use app\models\Requerimiento;
use app\models\RequerimientoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\Especifico;
use app\models\Iva;
use app\models\Medida;
use app\models\Costo;
use yii\helpers\ArrayHelper;

/**
 * RequerimientoController implements the CRUD actions for Requerimiento model.
 */
class RequerimientoController extends Controller
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
     * Lists all Requerimiento models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new RequerimientoSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Requerimiento model.
     * @param int $idproducto Idproducto
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
     * Creates a new Requerimiento model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
    $model = new Requerimiento();
        $costo = new Costo();

        $medida=Medida::find()->orderBy('medida')->all();
        $listamedida=ArrayHelper::map($medida, 'idmedida', 'medida');

        $especifico=Especifico::find()->orderBy('descripcion')->all();
        $listaespecifico=ArrayHelper::map($especifico, 'id_especifico', 'descripcion', 'codigo');

        $iva=Iva::find()->orderBy('iva')->all();
        $listaiva=ArrayHelper::map($iva, 'id_iva', 'iva');

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $costo->load($this->request->post())) {
                if ($model->save()){
                    $costo->idproducto =$model->idproducto;
                    $costo->idmedida =$model->idmedida;
                    if ($costo->save()){
                        return $this->redirect(['view', 'id' => $model->idproducto]);
                    }
                }               
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
            'costo' => $costo,
            'listamedida'=> $listamedida,
            'listaespecifico'=> $listaespecifico,
            'listaiva'=> $listaiva,
        ]);
    }

    /**
     * Updates an existing Requerimiento model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $idproducto Idproducto
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    
    {
        $model = $this->findModel($id);

        $costo = Costo::find()->Where(['idproducto'=>$id])->one();

        $medida=Medida::find()->orderBy('medida')->all();
        $listamedida=ArrayHelper::map($medida, 'idmedida', 'medida');

        $especifico=Especifico::find()->orderBy('descripcion')->all();
        $listaespecifico=ArrayHelper::map($especifico, 'id_especifico', 'descripcion', 'codigo');

        $iva=Iva::find()->orderBy('iva')->all();
        $listaiva=ArrayHelper::map($iva, 'id_iva', 'iva');

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $costo->load($this->request->post())) {
                if ($model->save() && $costo->save()){
                    
                    return $this->redirect(['view', 'id' => $model->idproducto]);
                   
                }               
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('update', [
            'model' => $model,
            'costo' => $costo,
            'listamedida'=> $listamedida,
            'listaespecifico'=> $listaespecifico,
            'listaiva'=> $listaiva,
        ]);
    }

    /**
     * Deletes an existing Requerimiento model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $idproducto Idproducto
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Requerimiento model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $idproducto Idproducto
     * @return Requerimiento the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($idproducto)
    {
        if (($model = Requerimiento::findOne(['idproducto' => $idproducto])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
