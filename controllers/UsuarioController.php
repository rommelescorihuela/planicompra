<?php

namespace app\controllers;

use Yii;
use app\models\Usuario;
use app\models\UsuarioSearch;
use app\models\Gerencia;
use app\models\Perfil;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;

/**
 * UsuarioController implements the CRUD actions for Usuario model.
 */
class UsuarioController extends Controller
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
     * Lists all Usuario models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new UsuarioSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Usuario model.
     * @param int $id Id 
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
     * Creates a new Usuario model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {

        $model = new Usuario();
        $gerencia=Gerencia::find()->orderBy('gerencia')->all();
        $listagerenci=ArrayHelper::map($gerencia, 'id_gerencia', 'gerencia');

        if ($model->load(Yii::$app->request->post())) {

            $hash =  Yii::$app->security->generatePasswordHash($model->password);
            // echo "hash:" . $hash;
            $model->password = $hash;                                               
            if ($model->save()) {  
                $auth = \Yii::$app->authManager;
                $authorRole = $auth->getRole('Administrador');
                $auth->assign($authorRole, $model->id);
                //echo "<br>Se ha creado el permiso";
            } else {
                die('Error al guardar');
            }

            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
                    'model' => $model,
                    'listagerenci' =>$listagerenci
        ]);
    
        /*$model = new Usuario();

        $perfil = Perfil::find()->all();
        $lista_perfil = ArrayHelper::map($perfil, 'id_perfil', 'descripcion');


        if ($this->request->isPost) {
            if ($model->load($this->request->post())) {
                 //Generar password hash
             $model->setPassword($model->password);

             //Generar authentication key
             $model->generateAuthKey();

                if($model->save()){
                    return $this->redirect(['view', 'id' => $model->id_usuario]);
                }
               
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
            'lista_perfil' => $lista_perfil,
           
        ]);*/
    }

    /**
     * Updates an existing Usuario model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id Id 
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $perfil = Perfil::find()->all();
        $lista_perfil = ArrayHelper::map($perfil, 'id_perfil', 'descripcion');

        $gerencia=Gerencia::find()->orderBy('gerencia')->all();
        $listagerenci=ArrayHelper::map($gerencia, 'id_gerencia', 'gerencia');

        if ($this->request->isPost && $model->load($this->request->post())) {
            //Actualizar password hash solo si es diferente a la registrada por primera vez
            $usuario = Usuario::find()->where(['id' =>$id])->one();
            if ($usuario->password != $model->password) {
                $hash =  Yii::$app->security->generatePasswordHash($model->password);
                // echo "hash:" . $hash;
                $model->password = $hash; 
            }

            //Generar authentication key
            //$model->generateAuthKey();

            if ($model->save()){
                return $this->redirect(['view', 'id' => $model->id]);
            }
        }

        return $this->render('update', [
            'model' => $model,
            'lista_perfil' => $lista_perfil,
            'listagerenci' =>$listagerenci
        ]);
    }

    /**
     * Deletes an existing Usuario model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id Id 
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Usuario model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id Id 
     * @return Usuario the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Usuario::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
