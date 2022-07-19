<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Poa */

$this->title = 'POA';
$this->params['breadcrumbs'][] = ['label' => 'POA', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="poa-view">

    <p>
        <?= Html::a('Editar', ['update', 'id' => $model->idpoa], ['class' => 'btn btn-primary']) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'tipo.tipo',
            'descripcion:ntext',
            'objetivo:ntext',
            'nombre_apellido:ntext',
            ],
    ]) ?>

</div>
