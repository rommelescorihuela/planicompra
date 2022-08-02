<?php

use app\models\Accion;
use yii\helpers\Html;
use yii\helpers\Url;
use kartik\grid\ActionColumn;
use kartik\grid\GridView;
use kartik\select2\Select2;
use app\models\Poa;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel app\models\AccionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Acciones Especificas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="accion-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Crear Accion', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>



</div>
<?php
$gridColumns = [
    ['class' => 'yii\grid\SerialColumn'],
    [
        'label' => 'Categoria',
        'attribute' => 'id_tipo',
        'group' => true,
        'value' =>'tipo.tipo',
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
    ],
    [
        'label' => 'Proyecto o Acción Centralizada',
        'attribute' => 'idpoa',
        'filter' => Select2::widget([
            'model' =>  $searchModel,
            'attribute' => 'idpoa',
            'data' => Accion::Lista_poa(),
            'theme' => Select2::THEME_BOOTSTRAP,
            'options' => [
                'placeholder' => 'Seleccione...'
            ],
            'pluginOptions' => ['allowClear' => true]
         ]),
        'value' =>'idpoa0.descripcion',
        'group' => true, 
    ],
    [
        'label' => 'Accion Especifica',
        'value' =>'descripcion',
        'attribute' => 'descripcion',
    ],
    [
        'label' => 'Unidad ejecutora',
        'attribute' => 'idgerencia',
        'filter' => Select2::widget([
            'model' =>  $searchModel,
            'attribute' => 'idgerencia',
            'data' => Accion::Lista_gerenci(),
            'theme' => Select2::THEME_BOOTSTRAP,
            'options' => [
                'placeholder' => 'Seleccione...',
                'disabled' => Yii::$app->user->identity->id_perfil == 2 ? true : false
            ],
            'pluginOptions' => ['allowClear' => true],

         ]),
         'value' =>'idgerencia0.gerencia',
    ],
    [
        'class' => ActionColumn::className(),
        'template' => '{view}{update}',  
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
    'itemLabelSingle' => 'Accion especifica',
    'itemLabelPlural' => 'Acciones especificas'
]);
?>