<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use kartik\grid\GridView;
use kartik\select2\Select2;
use app\models\Poa;
use app\models\Gerencia;
use app\models\Accion;



/* @var $this yii\web\View */
/* @var $searchModel app\models\PoaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'POA';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="poa-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Crear Poa', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
        
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?php
    $gridColumns = [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'id_tipo',
                'group' => true,
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_tipo',
                    'data' => Poa::Lista_tipo(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true],
                 ]),
                 'value' =>'tipo.tipo',
            ],


            'descripcion:ntext',
            'objetivo:ntext',
            'nombre_apellido:ntext',
            [   
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_gerencia',
                    'data' => Accion::Lista_gerenci(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...',
                        'disabled' => Yii::$app->user->identity->id_perfil == 2 ? true : false
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                'label' => 'Unidad Ejecutora',
                'value' =>'gerencia.gerencia'
            ],
    
            [
                'class' => ActionColumn::className(),
                'template' => '{view}{update}{delete}',  
                'header'=>"Acciones",
            ],
        ]; 
        echo GridView::widget([
        'id' => 'kv-grid-demo',
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => $gridColumns, // check this value by clicking GRID COLUMNS SETUP button at top of the page
        'headerContainer' => ['style' => 'top:50px', 'class' => 'kv-table-header'], // offset from top
        'floatHeader' => true, // table header floats when you scroll
        'floatPageSummary' => true, // table page summary floats when you scroll
        'floatFooter' => false, // disable floating of table footer
        'pjax' => false, // pjax is set to always false for this demo
        // parameters from the demo form
        'responsive' => false,
        'bordered' => true,
        'striped' => false,
        'condensed' => true,
        'hover' => true,
        //'showPageSummary' => true,
        // set export properties
        'export' => [
            'fontAwesome' => true
        ],
        'exportConfig' => [
            'html' => [],
            'csv' => [],
            'txt' => [],
            'xls' => [],
            'pdf' => [],
            'json' => [],
        ],
        // set your toolbar
        'toolbar' =>  [
            '{export}',
            '{toggleData}',
        ],
        'toggleDataContainer' => ['class' => 'btn-group mr-2 me-2'],
        'persistResize' => false,
        'toggleDataOptions' => ['minCount' => 10],
        'itemLabelSingle' => 'Proyecto o Acción Centralizada',
        'itemLabelPlural' => 'Proyectos o Acciónes Centralizadas'
    ]);
    ?>
</div>
