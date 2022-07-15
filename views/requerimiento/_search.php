<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\RequerimientoSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="requerimiento-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'idproducto') ?>

    <?= $form->field($model, 'producto') ?>

    <?= $form->field($model, 'idmedida') ?>

    <?= $form->field($model, 'idespecifico') ?>

    <?= $form->field($model, 'iva') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
