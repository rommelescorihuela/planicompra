<?php

use app\models\Basecalculo;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use kartik\select2\Select2;


/* @var $this yii\web\View */
/* @var $searchModel app\models\RequerimientoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Requerimientos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="requerimiento-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Crear Requerimiento', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
   
  <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'producto',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'idproducto',
                    'data' => Basecalculo::Lista_producto(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true]
                 ]),
                 'value' =>'producto',
            ],
            [
                'attribute' => 'medida',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'idmedida',
                    'data' => Basecalculo::Lista_medida(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true]
                 ]),
                 'value' =>'idmedida0.medida',
            ],
            [
                'attribute' => 'especifica',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'idespecifico',
                    'data' => Basecalculo::Lista_especifica(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true]
                 ]),
                 'value' =>'idespecifico0.descripcion',
            ],
            [
                'attribute' => 'iva',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'iva',
                    'data' => Basecalculo::Lista_iva(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true]
                 ]),
                 'value' =>'iva0.iva',
            ],
            [
                'class' => ActionColumn::className(),
                'template' => '{view}{update}',
                
            ],
        ],
    ]); ?>
  </div>
</div>
    


</div>
