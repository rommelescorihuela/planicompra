<?php

namespace app\controllers;

use Yii;
use app\models\Accion;
use app\models\Basecalculo;
use app\models\Poa;
use app\models\PoaSearch;
use app\models\Tipo;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use Spipu\Html2Pdf\Html2Pdf;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

/**
 * PoaController implements the CRUD actions for Poa model.
 */
class PoaController extends Controller
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
     * Lists all Poa models.
     *
     * @return string
     */
    public function actionIndex()
    {
        if (Yii::$app->user->identity->id_perfil == 1) {
            $searchModel = new PoaSearch();
            $dataProvider = $searchModel->search($this->request->queryParams);
        } else{
            $searchModel = new PoaSearch();
            $searchModel->id_gerencia = Yii::$app->user->identity->id_gerencia;
            $dataProvider = $searchModel->search($this->request->queryParams);
        }        

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Poa model.
     * @param int $idpoa Idpoa
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
     * Creates a new Poa model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Poa();

        $model->id_gerencia = Yii::$app->user->identity->id_gerencia;
        $model->nombre_apellido = Yii::$app->user->identity->nombre.' '.Yii::$app->user->identity->apellido;;

            if (Yii::$app->user->identity->id_perfil == 1)  {
            $tipo = Tipo::find()->orderBy('tipo')->all();
            $listatipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
            }else {
            $tipo = Tipo::find()->Where(['id_tipo'=> 2])->orderBy('tipo')->all();
            $listatipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
            }
        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->idpoa]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
            'listatipo' =>$listatipo,

        ]);
    }

    /**
     * Updates an existing Poa model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $idpoa Idpoa
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if (Yii::$app->user->identity->id_perfil == 1)  {
            $tipo = Tipo::find()->orderBy('tipo')->all();
            $listatipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
            }else {
            $tipo = Tipo::find()->Where(['id_tipo'=> 2])->orderBy('tipo')->all();
            $listatipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
        }

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->idpoa]);
        }

        return $this->render('update', [
            'model' => $model,
            'listatipo' =>$listatipo,

        ]);
    }

    /**
     * Deletes an existing Poa model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $idpoa Idpoa
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
       $model= $this->findModel($id);
       $model->idvisibilidad= 2;
        if ($model->save()) {
            return $this->redirect(['index']);
        }   
    }

    public function actionPdf($idpoa)
    {
        $searchModel = new PoaSearch();

        //$model = Poa::find()->where(['idpoa' => $idpoa])->one();

        $model = $this->findModel($idpoa);


        //var_dump($model->objetivo);exit();

        $list = Basecalculo::find()->Where(['id_poa'=> $idpoa])->all();
        $i=0;
        $accion_especifica[] ='';
        $actividad[] ='';

        $list2 = Accion::find()->Where(['idpoa'=> $idpoa])->limit(1)->all();
        $i=0;
        $accion_especifica[] ='';
        $actividad[] ='';
        $gerencia[] = '';
       
        /*foreach($list as $lista){
            $accion_especifica[$i] = $lista['id_accion'];
            $actividad[$i] = $lista['id_actividad'];
            $i++;
        }*/


        $dataProvider = $searchModel->search($this->request->queryParams);

        /*return $this->render('pdf_view', [
            'model' => $model,
            'dataProvider'=>$dataProvider,
            'accion_especifica'=>$accion_especifica,
            'actividad'=>$actividad,
            'list' => $list,

        ]);*/
        
        $html = $this->renderPartial('pdf_view',[  
        'model' => $model,
        'dataProvider'=>$dataProvider,
        'accion_especifica'=>$accion_especifica,
        'actividad'=>$actividad,
        'list' => $list,
        'list2' => $list2,]);
        $html2pdf = new Html2Pdf('L', 'B1');
        $html2pdf ->showImageErrors= true;
        $html2pdf ->list_indent_first_lavel = 0;
        $html2pdf -> writeHTML($html);
        $html2pdf -> Output();
        exit;
    }
    public function actionPdf2($idpoa)
    {
        $searchModel = new PoaSearch();

        //$model = Poa::find()->where(['idpoa' => $idpoa])->one();

        $model = $this->findModel($idpoa);


        //var_dump($model->objetivo);exit();

        $list = Basecalculo::find()->Where(['id_poa'=> $idpoa])->all();
        $i=0;
        $accion_especifica[] ='';
        $actividad[] ='';

        $list2 = Accion::find()->Where(['idpoa'=> $idpoa])->limit(1)->all();
        $i=0;
        $accion_especifica[] ='';
        $actividad[] ='';
        $gerencia[] = '';
       
        /*foreach($list as $lista){
            $accion_especifica[$i] = $lista['id_accion'];
            $actividad[$i] = $lista['id_actividad'];
            $i++;
        }*/


        $dataProvider = $searchModel->search($this->request->queryParams);

        /*return $this->render('pdf_view', [
            'model' => $model,
            'dataProvider'=>$dataProvider,
            'accion_especifica'=>$accion_especifica,
            'actividad'=>$actividad,
            'list' => $list,

        ]);*/
        
        $html = $this->renderPartial('pdf_view(1)',[  
        'model' => $model,
        'dataProvider'=>$dataProvider,
        'accion_especifica'=>$accion_especifica,
        'actividad'=>$actividad,
        'list' => $list,
        'list2' => $list2,]);
        $html2pdf = new Html2Pdf('L', 'B1');
        $html2pdf ->showImageErrors= true;
        $html2pdf ->list_indent_first_lavel = 0;
        $html2pdf -> writeHTML($html);
        $html2pdf -> Output();
        exit;
    }

    public function actionPdfaccion($idpoa)
    {
        $searchModel = new PoaSearch();

        //$model = Poa::find()->where(['idpoa' => $idpoa])->one();

        $model = $this->findModel($idpoa);


        //var_dump($model->objetivo);exit();

        $list = Basecalculo::find()->Where(['id_poa'=> $idpoa])->all();
        $i=0;
        $accion_especifica[] ='';
        $actividad[] ='';

        $list2 = Accion::find()->Where(['idpoa'=> $idpoa])->limit(1)->all();
        $i=0;
        $accion_especifica[] ='';
        $actividad[] ='';
        $gerencia[] = '';
       
        /*foreach($list as $lista){
            $accion_especifica[$i] = $lista['id_accion'];
            $actividad[$i] = $lista['id_actividad'];
            $i++;
        }*/


        $dataProvider = $searchModel->search($this->request->queryParams);

        /*return $this->render('pdf_view', [
            'model' => $model,
            'dataProvider'=>$dataProvider,
            'accion_especifica'=>$accion_especifica,
            'actividad'=>$actividad,
            'list' => $list,

        ]);*/
        
        $html = $this->renderPartial('pdf_view (accion)',[  
        'model' => $model,
        'dataProvider'=>$dataProvider,
        'accion_especifica'=>$accion_especifica,
        'actividad'=>$actividad,
        'list' => $list,
        'list2' => $list2,]);
        $html2pdf = new Html2Pdf('L', 'B1');
        $html2pdf ->showImageErrors= true;
        $html2pdf ->list_indent_first_lavel = 0;
        $html2pdf -> writeHTML($html);
        $html2pdf -> Output();
        exit;
    }
    public function actionProyear() {
    Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
    $out = [];
    if (isset($_POST['depdrop_parents'])) {
        $parents = $_POST['depdrop_parents'];
        if ($parents != null) {
            $year = $parents[0];
            $project = Poa::find()->select(['idpoa', 'descripcion'])->Where(['periodo'=> $year])->asarray()->orderBy('idpoa')->all();
            //$projectlist = ArrayHelper::map($project, 'idpoa', 'descripcion');
            $out = $project;
            // the getSubCatList function will query the database based on the
            // cat_id and return an array like below:
             $out = [
                ['id'=>'<sub-cat-id-1>', 'name'=>'<sub-cat-name1>'],
                ['id'=>'<sub-cat_id_2>', 'name'=>'<sub-cat-name2>']
             ];
             var_dump($out);die();
            return ['output'=>$out, 'selected'=>''];
        }
    }
    return ['output'=>'', 'selected'=>''];
}
    public function actionPdfcompleto($idpoa)
    {
        $searchModel = new PoaSearch();

        //$model = Poa::find()->where(['idpoa' => $idpoa])->one();

        $model = $this->findModel($idpoa);


        //var_dump($model->objetivo);exit();

        $list = Basecalculo::find()->Where(['id_poa'=> $idpoa])->all();
        $i=0;
        $accion_especifica[] ='';
        $actividad[] ='';

        $list2 = Accion::find()->Where(['idpoa'=> $idpoa])->all();
        $i=0;
        $accion_especifica[] ='';
        $actividad[] ='';
        $gerencia[] = '';
       
        /*foreach($list as $lista){
            $accion_especifica[$i] = $lista['id_accion'];
            $actividad[$i] = $lista['id_actividad'];
            $i++;
        }*/


        $dataProvider = $searchModel->search($this->request->queryParams);

        /*return $this->render('pdf_view', [
            'model' => $model,
            'dataProvider'=>$dataProvider,
            'accion_especifica'=>$accion_especifica,
            'actividad'=>$actividad,
            'list' => $list,

        ]);*/
        
        $html = $this->renderPartial('pdf_view (pdf completo)',[  
        'model' => $model,
        'dataProvider'=>$dataProvider,
        'accion_especifica'=>$accion_especifica,
        'actividad'=>$actividad,
        'list' => $list,
        'list2' => $list2,]);
        $html2pdf = new Html2Pdf('L', '2A0');
        $html2pdf ->showImageErrors= true;
        $html2pdf ->list_indent_first_lavel = 0;
        $html2pdf -> writeHTML($html);
        $html2pdf -> Output();
        exit;
    }

    /**
     * Finds the Poa model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $idpoa Idpoa
     * @return Poa the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($idpoa)
    {
        if (($model = Poa::findOne(['idpoa' => $idpoa])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
