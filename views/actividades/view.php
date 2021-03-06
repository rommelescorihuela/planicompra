<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Actividades */

$this->title = 'Actividad';
$this->params['breadcrumbs'][] = ['label' => 'Actividades', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="actividades-view">


    <p>
        <?= Html::a('Editar', ['update', 'id' => $model->idactividad], ['class' => 'btn btn-primary']) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
			'tipo.tipo',
			'poa.descripcion',
            'idaccionespecifica0.descripcion',
            'descripcion:ntext',
			'gerencia.gerencia',
        ],
    ]) ?>

</div>
