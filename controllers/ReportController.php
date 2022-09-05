<?php

namespace app\controllers;

use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use Yii;

class ReportController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionProfis()
    {
        $model = new \app\models\ReportForm();

        if ($model->load(Yii::$app->request->post())) {
            if ($model->validate()) {
                // form inputs are valid, do something here
                return;
            }
        }

        return $this->render('profis', [
            'model' => $model,
        ]);
    }
}
