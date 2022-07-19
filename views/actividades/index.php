<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use kartik\select2\Select2;
use app\models\Actividades;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ActividadesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Actividades';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="actividades-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Crear Actividades', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'id_tipo',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_tipo',
                    'data' => Actividades::Lista_tipo(),
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                 'value' =>'tipo.tipo',
            ],
            [
                'attribute' => 'id_poa',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_poa',
                    'data' => Actividades::Lista_poa(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true]
                 ]),
                 'value' =>'poa.descripcion',
            ], 
            [
                'attribute' => 'idaccionespecifica',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'idaccionespecifica',
                    'data' => Actividades::Lista_especifi(),
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                 'value' =>'idaccionespecifica0.descripcion',
            ], 
            'descripcion:ntext',
            [
                'class' => ActionColumn::className(),
                'template' => '{view}{update}',
                
            ],
        ],
    ]); ?>


</div>
