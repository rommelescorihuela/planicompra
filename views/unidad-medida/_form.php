<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\UnidadMedida */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="unidad-medida-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'unidadmedida')->textInput() ?>

    <?= $form->field($model, 'total')->textInput() ?>

    <?= $form->field($model, 'enero')->textInput() ?>

    <?= $form->field($model, 'febrero')->textInput() ?>

    <?= $form->field($model, 'marzo')->textInput() ?>

    <?= $form->field($model, 'abril')->textInput() ?>

    <?= $form->field($model, 'mayo')->textInput() ?>

    <?= $form->field($model, 'junio')->textInput() ?>

    <?= $form->field($model, 'julio')->textInput() ?>

    <?= $form->field($model, 'agosto')->textInput() ?>

    <?= $form->field($model, 'septiembre')->textInput() ?>

    <?= $form->field($model, 'octubre')->textInput() ?>

    <?= $form->field($model, 'noviembre')->textInput() ?>

    <?= $form->field($model, 'diciembre')->textInput() ?>

    <?= $form->field($model, 'id_actividad')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
