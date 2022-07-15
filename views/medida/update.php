<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Medida */

$this->title = 'Editar Medida: ' . $model->medida;
$this->params['breadcrumbs'][] = ['label' => 'Medidas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->idmedida, 'url' => ['view', 'id' => $model->idmedida]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="medida-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
