<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Iva */

$this->title = 'Editar Iva: ' . $model->iva;
$this->params['breadcrumbs'][] = ['label' => 'Ivas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_iva, 'url' => ['view', 'id' => $model->id_iva]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="iva-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
