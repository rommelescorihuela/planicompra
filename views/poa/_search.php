<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\PoaSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="poa-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'idpoa') ?>

    <?= $form->field($model, 'descripcion') ?>

    <?= $form->field($model, 'objetivo') ?>

    <?= $form->field($model, 'monto_asignado') ?>

    <?= $form->field($model, 'nombre_apellido') ?>

    <?php // echo $form->field($model, 'id_tipo') ?>

    <?php // echo $form->field($model, 'idvisibilidad') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
