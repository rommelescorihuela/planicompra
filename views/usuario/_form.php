<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="usuario-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'password')->passwordInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'id_perfil')->widget(Select2::classname(), [
    'data' => $lista_perfil,
    'options' => ['placeholder' => 'Seleccionar...'],
    'pluginOptions' => [
        'allowClear' => true
    ],
    ]) ?> 

    <?= $form->field($model, 'id_gerencia')->widget(Select2::classname(), [
    'data' => $listagerenci,
    'options' => ['placeholder' => 'Seleccionar...'],
    'pluginOptions' => [
        'allowClear' => true
    ],
    ]) ?> 

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'apellido')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cedula')->textInput() ?>

    <?= $form->field($model, 'cargo')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'correo')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'estatu')->widget(Select2::classname(), [
    'data' => [1 => 'ACTIVO', 2 => 'INACTIVO'],
    'options' => ['placeholder' => 'Seleccionar...'],
    'pluginOptions' => [
        'allowClear' => true
    ],
    ]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
