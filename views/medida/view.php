<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Medida */

$this->title = 'Medida';
$this->params['breadcrumbs'][] = ['label' => 'Medidas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="medida-view">

    <p>
        <?= Html::a('Editar', ['update', 'id' => $model->idmedida], ['class' => 'btn btn-primary']) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'medida:ntext',
        ],
    ]) ?>

</div>
