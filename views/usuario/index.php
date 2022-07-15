<?php

use app\models\Usuario;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\Pjax;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $searchModel app\models\UsuarioSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Usuarios';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="usuario-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Usuario', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [
                'label' => 'Nombre y apellido',
                'attribute' => 'usuario',
                'value' => function($model){
                    return $model->nombre.' '.$model->apellido;
                }
            ],
            'cedula',
            'cargo',
            [
                'attribute' => 'id_gerencia',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_gerencia',
                    'data' => Usuario::Lista_gerenci(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                 'value' =>'gerencia.gerencia',
            ],
            //'id_usuario',
            'username',
            //'password',
            [
                'attribute' => 'rol',
                'filter' => Select2::widget([
                    'model' =>  $searchModel,
                    'attribute' => 'id_perfil',
                    'data' => Usuario::Lista_perfil(),
                    'theme' => Select2::THEME_BOOTSTRAP,
                    'options' => [
                        'placeholder' => 'Seleccione...'
                    ],
                    'pluginOptions' => ['allowClear' => true],

                 ]),
                 'value' =>'perfil.descripcion',
            ],
            [
                'attribute' => 'estatu',
                'value' => function($model){
                   if ($model->estatu == 1){
                    return 'ACTIVO';
                   } else{
                    return 'INACTIVO';
                   }
                }
            ],
            [
                'class' => ActionColumn::className(),
                'template' => '{view}{update}',
            ],
        ],
    ]); ?>

    <?php Pjax::end(); ?>

</div>
