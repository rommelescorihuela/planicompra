<?php

use app\models\Accion;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use kartik\select2\Select2;
use app\models\Poa;

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
                    'data' => Accion::Lista_tipo(),
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                 'value' =>'tipo.tipo',
            ],
             [
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
            ],
            'descripcion:ntext',
            [
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
        ],
    ]); ?>


</div>
