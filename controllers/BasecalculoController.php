<?php

namespace app\controllers;

use app\models\Basecalculo;
use app\models\BasecalculoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\Accion;
use app\models\Actividades;
use app\models\Costo;
use app\models\Especifico;
use app\models\Generico;
use app\models\Iva;
use app\models\Medida;
use app\models\Partida;
use app\models\Poa;
use app\models\Requerimiento;
use app\models\Tipo;
use yii\helpers\ArrayHelper;
use Spipu\Html2Pdf\Html2Pdf;
use Yii;

/**
 * BasecalculoController implements the CRUD actions for Basecalculo model.
 */
class BasecalculoController extends Controller
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
     * Lists all Basecalculo models.
     *
     * @return string
     */
    public function actionIndex()
    {        

        if (Yii::$app->user->identity->id_perfil == 1) {
            $searchModel = new BasecalculoSearch();
            $dataProvider = $searchModel->search($this->request->queryParams);
        } else{
            $searchModel = new BasecalculoSearch();
            $searchModel->id_gerencia = Yii::$app->user->identity->id_gerencia;
            $dataProvider = $searchModel->search($this->request->queryParams);
        }  

        $dataProvider = $searchModel->search($this->request->queryParams);

        $session = Yii::$app->session;
        $session->open();
        $session['query_params'] = json_encode(Yii::$app->request->queryParams);
        $session->close();

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Basecalculo model.
     * @param int $id_plan Id Plan
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
     * Creates a new Basecalculo model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {

        if (Yii::$app->user->identity->id_perfil == 1) {
            $searchModel = new BasecalculoSearch();
            $dataProvider = $searchModel->search($this->request->queryParams);
        } else{
            $searchModel = new BasecalculoSearch();
            $searchModel->id_gerencia = Yii::$app->user->identity->id_gerencia;
            $dataProvider = $searchModel->search($this->request->queryParams);
        }  

        $dataProvider = $searchModel->search($this->request->queryParams);

        $session = Yii::$app->session;
        $session->open();
        $session['query_params'] = json_encode(Yii::$app->request->queryParams);
        $session->close();


        $model = new BaseCalculo();
        $flag = 'create';

        $model->id_gerencia = Yii::$app->user->identity->id_gerencia;
        $model->id_usuario = Yii::$app->user->identity->id;
        $model->estatus = Yii::$app->user->identity->status;


        if (Yii::$app->user->identity->id_perfil == 1)  {
            $tipo = Tipo::find()->orderBy('tipo')->all();
            $lista_tipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
            }else {
            $tipo = Tipo::find()->Where(['id_tipo'=> 2])->orderBy('tipo')->all();
            $lista_tipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
        }

        $producto = Requerimiento::find()->orderBy('producto')->all();
        $lista_producto = ArrayHelper::map($producto, 'idproducto', 'producto');


        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id_plan]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
            'lista_tipo' =>$lista_tipo,
            'lista_producto' =>$lista_producto,
            'flag' => $flag,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,

        ]);
    }

    /**
     * Updates an existing Basecalculo model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_plan Id Plan
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {

        if (Yii::$app->user->identity->id_perfil == 1) {
            $searchModel = new BasecalculoSearch();
            $dataProvider = $searchModel->search($this->request->queryParams);
        } else{
            $searchModel = new BasecalculoSearch();
            $searchModel->id_gerencia = Yii::$app->user->identity->id_gerencia;
            $dataProvider = $searchModel->search($this->request->queryParams);
        }  

        $dataProvider = $searchModel->search($this->request->queryParams);

        $session = Yii::$app->session;
        $session->open();
        $session['query_params'] = json_encode(Yii::$app->request->queryParams);
        $session->close();

        
        $model = $this->findModel($id);
        $flag = 'update';

        if (Yii::$app->user->identity->id_perfil == 1)  {
            $tipo = Tipo::find()->orderBy('tipo')->all();
            $lista_tipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
            }else {
            $tipo = Tipo::find()->Where(['id_tipo'=> 2])->orderBy('tipo')->all();
            $lista_tipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
        }

        $producto = Requerimiento::find()->orderBy('producto')->all();
        $lista_producto = ArrayHelper::map($producto, 'idproducto', 'producto');

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id_plan]);
        }

        return $this->render('update', [
            'model' => $model,
            'lista_tipo' =>$lista_tipo,
            'lista_producto' =>$lista_producto,
            'flag' => $flag,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Deletes an existing Basecalculo model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_plan Id Plan
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Basecalculo model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_plan Id Plan
     * @return Basecalculo the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_plan)
    {
        if (($model = Basecalculo::findOne(['id_plan' => $id_plan])) !== null) {
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
    public function actionActividades() {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $id = end($_POST['depdrop_parents']);
            if (Yii::$app->user->identity->id_perfil == 2){ 
            $list = Actividades::find()->Where(['idaccionespecifica' => $id, 'id_gerencia' => Yii::$app->user->identity->id_gerencia])->asArray()->all();
            $selected  = null;
            if ($id != null && count($list) > 0) {
                $selected = '';
                foreach ($list as $i => $account) {
                    $out[] = ['id' => $account['idactividad'], 'name' => $account['descripcion']];
                    if ($i == 0) {
                        $selected = $account['idactividad'];
                    }
                }
                // Shows how you can preselect a value
                return ['output' => $out, 'selected' => ''];
            }
        }else{
            $list = Actividades::find()->Where(['idaccionespecifica' => $id])->asArray()->all();
            $selected  = null;
            if ($id != null && count($list) > 0) {
                $selected = '';
                foreach ($list as $i => $account) {
                    $out[] = ['id' => $account['idactividad'], 'name' => $account['descripcion']];
                    if ($i == 0) {
                        $selected = $account['idactividad'];
                    }
                }
                // Shows how you can preselect a value
                return ['output' => $out, 'selected' => ''];
            } 
        }
    }
        return ['output' => '', 'selected' => ''];
}
    public function actionMedidas() {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $id = end($_POST['depdrop_parents']);
            $list = Requerimiento::find()->Where(['idproducto' => $id])->asArray()->all();
            $selected  = null;
            if ($id != null && count($list) > 0) {
                $selected = '';
                foreach ($list as $i => $account) {
                    $list_m = Medida::find()->Where(['idmedida' => $account['idmedida']])->asArray()->all();
                    foreach ($list_m as $i => $row) {
                        $out[] = ['id' => $row['idmedida'], 'name' => $row['medida']];
                        if ($i == 0) {
                            $selected = $row['idmedida'];
                        }
                    }
                   
                }
                // Shows how you can preselect a value
                return ['output' => $out, 'selected' => $selected];
            }
        }
        return ['output' => '', 'selected' => ''];
    }
    public function actionCostos($id) {
            $list = Costo::find()->Where(['idproducto'=> $id])->asArray()->one(); 
            $list1 = Requerimiento::find()->Where(['idproducto'=> $id])->asArray()->one();
            $list_m = Iva::find()->where(['id_iva' => $list1['iva']])->asArray()->one();
            echo number_format($list['costo'], 2, ',', '.').'$$'.number_format($list_m['iva'], 2, ',', '.');
            /*$selected  = null;
            if ($id != null && count($list) > 0) {
                $selected = '';
                foreach ($list as $i => $account) {
                    $out[] = ['id' => $account['idcosto'], 'name' => $account['costo']];
                    if ($i == 0) {
                        $selected = $account['idcosto'];
                    }
                }
                // Shows how you can preselect a value
                return ['output' => $out, 'selected' => $selected];
            }
        }
        return ['output' => '', 'selected' => ''];*/
    }
    public function actionEspecificos() {
       Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            $out = [];
            if (isset($_POST['depdrop_parents'])) {
                $id = end($_POST['depdrop_parents']);
                $list = Requerimiento::find()->Where(['idproducto' => $id])->asArray()->all();
                $selected  = null;
                if ($id != null && count($list) > 0) {
                    $selected = '';
                    foreach ($list as $i => $account) {
                        $list_m = Especifico::find()->Where(['id_especifico' => $account['idespecifico']])->asArray()->all();
                        foreach ($list_m as $i => $row) {
                            $out[] = ['id' => $row['id_especifico'], 'name' => $row['descripcion']];
                            if ($i == 0) {
                                $selected = $row['id_especifico'];
                            }
                        }
                       
                    }
                    // Shows how you can preselect a value
                    return ['output' => $out, 'selected' => $selected];
                }
            }
            return ['output' => '', 'selected' => ''];
        }
        public function actionGenericas() {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            $out = [];
            if (isset($_POST['depdrop_parents'])) {
                $id = end($_POST['depdrop_parents']);
                $list = Especifico::find()->Where(['id_especifico' => $id])->asArray()->all();
                $selected  = null;
                if ($id != null && count($list) > 0) {
                    $selected = '';
                    foreach ($list as $i => $account) {
                        $list_m = Generico::find()->Where(['id_generico' => $account['id_generico']])->asArray()->all();
                        foreach ($list_m as $i => $row) {
                            $out[] = ['id' => $row['id_generico'], 'name' => $row['descripcion']];
                            if ($i == 0) {
                                $selected = $row['id_generico'];
                            }
                        }
                       
                    }
                    // Shows how you can preselect a value
                    return ['output' => $out, 'selected' => $selected];
                }
            }
            return ['output' => '', 'selected' => ''];
        }
        public function actionPartidas() {
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            $out = [];
            if (isset($_POST['depdrop_parents'])) {
                $id = end($_POST['depdrop_parents']);
                $list = Generico::find()->Where(['id_generico' => $id])->asArray()->all();
                $selected  = null;
                if ($id != null && count($list) > 0) {
                    $selected = '';
                    foreach ($list as $i => $account) {
                        $list_m = Partida::find()->Where(['id' => $account['id_partida']])->asArray()->all();
                        foreach ($list_m as $i => $row) {
                            $out[] = ['id' => $row['id'], 'name' => $row['descripcion']];
                            if ($i == 0) {
                                $selected = $row['id'];
                            }
                        }
                       
                    }
                    // Shows how you can preselect a value
                    return ['output' => $out, 'selected' => $selected];
                }
            }
            return ['output' => '', 'selected' => ''];
        }
        public function actionIvas($id) {
            $list = Requerimiento::find()->Where(['idproducto'=> $id])->asArray()->one();
            echo $list['iva'];

          /*  Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            $out = [];
            if (isset($_POST['depdrop_parents'])) {
                $id = end($_POST['depdrop_parents']);
                $list = Requerimiento::find()->Where(['idproducto' => $id])->asArray()->all();
                $selected  = null;
                if ($id != null && count($list) > 0) {
                    $selected = '';
                    foreach ($list as $i => $account) {
                        $list_m = Iva::find()->Where(['id_iva' => $account['iva']])->asArray()->all();
                        foreach ($list_m as $i => $row) {
                            $out[] = ['id' => $row['id_iva'], 'name' => $row['iva']];
                            if ($i == 0) {
                                $selected = $row['id_iva'];
                            }
                        }
                       
                    }
                    // Shows how you can preselect a value
                    return ['output' => $out, 'selected' => $selected];
                }
            }
            return ['output' => '', 'selected' => '']; */
        }
        public function actionPdf()
        {
            $session = Yii::$app->session;
            $session->open();
            $queryParams = isset($session['query_params']) ? json_decode($session['query_params'],true) : [];
            $session->close();

            $searchModel = new BasecalculoSearch();
            $dataProvider = $searchModel->search($queryParams);

           

            $i=0;
            

            /*return $this->render('pdf_view', [
                'model' => $model,
                'dataProvider'=>$dataProvider,
                'accion_especifica'=>$accion_especifica,
                'actividad'=>$actividad,
                'list' => $list,
    
            ]);*/
            
            $html = $this->renderPartial('pdf_view',[  
            //'model' => $model,
            'dataProvider'=>$dataProvider,
            //'accion_especifica'=>$accion_especifica,
            //'actividad'=>$actividad,
            //'list' => $list,
            'i' => $i,]);
            $html2pdf = new Html2Pdf('L', 'A2');
            $html2pdf ->showImageErrors= true;
            $html2pdf ->list_indent_first_lavel = 0;
            $html2pdf -> writeHTML($html);
            $html2pdf -> Output();
            exit;
        }
}
