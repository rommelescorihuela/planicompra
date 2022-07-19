<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\MedidaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Medidas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="medida-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Crear Medida', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'medida:ntext',
            [
                'class' => ActionColumn::className(),
                'template' => '{view}{update}',
                
            ],
        ],
    ]); ?>


</div>
