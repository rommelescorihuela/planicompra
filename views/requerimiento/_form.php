<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;


/* @var $this yii\web\View */
/* @var $model app\models\Requerimiento */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="requerimiento-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'producto')->textInput() ?>

    <?= $form->field($costo, 'costo')->textInput() ?>

    <?= $form->field($model, 'idmedida')->widget(Select2::classname(), [
    'data' => $listamedida,
    'options' => ['placeholder' => 'Seleccionar Medida...'],
    'pluginOptions' => [
    'allowClear' => true
    ],
    ]) ?>
    <?= $form->field($model, 'idespecifico')->widget(Select2::classname(), [
    'data' => $listaespecifico,
    'options' => ['placeholder' => 'Seleccionar Especifico...'],
    'pluginOptions' => [
        'allowClear' => true
    ],
    ]) ?>

   <?= $form->field($model, 'iva')->widget(Select2::classname(), [
    'data' => $listaiva,
    'options' => ['placeholder' => 'Seleccionar Iva...'],
    'pluginOptions' => [
        'allowClear' => true
    ],
    ]) ?>
    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
