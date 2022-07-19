<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Requerimiento */

$this->title = 'Requerimiento';
$this->params['breadcrumbs'][] = ['label' => 'Requerimientos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="requerimiento-view">
    
    <p>
        <?= Html::a('Editar', ['update', 'id' => $model->idproducto], ['class' => 'btn btn-primary']) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'producto',
            'idmedida0.medida',
            'idespecifico0.descripcion',
            'iva0.iva',
        ],
    ]) ?>

</div>
