<?php

use app\models\Basecalculo;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $searchModel app\models\BasecalculoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Base de Calculo';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="basecalculo-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Crear Basecalculo', ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('PDF', ['pdf'], ['class' => 'btn btn-danger']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [
                'attribute' => 'id_poa',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_poa',
                    'data' => Basecalculo::Lista_poa(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                        
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                 'value' =>'poa.descripcion',
            ],
            [
                'attribute' => 'id_accion',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_accion',
                    'data' => Basecalculo::Lista_accion(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                 'value' =>'accion.descripcion',
            ],
            [
                'attribute' => 'id_actividad',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_actividad',
                    'data' => Basecalculo::Lista_actividad(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                 'value' =>'actividad.descripcion',
            ],
            [
                'attribute' => 'id_producto',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_producto',
                    'data' => Basecalculo::Lista_producto(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                 'value' =>'producto.producto',
            ],
            [
                'class' => ActionColumn::className(),
                'template' => '{view}{update}{delete}  {pdf}',
                'buttons' => [
                    'pdf' => function($url, $model){
                        return Html::a('', ['pdf', 'id_plan' => $model->id_plan],['class'=>'glyphicon glyphicon-print	
                        ']);
                    }
                ]
                
            ],
        ],
    ]); ?>


</div>
