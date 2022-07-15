<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Poa */

$this->title = 'Editar POA: ' . $model->descripcion;
$this->params['breadcrumbs'][] = ['label' => 'POA', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->idpoa, 'url' => ['view', 'id' => $model->idpoa]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="poa-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'listatipo' =>$listatipo,

    ]) ?>

</div>