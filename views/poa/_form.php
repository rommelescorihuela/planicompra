<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;


/* @var $this yii\web\View */
/* @var $model app\models\Poa */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="poa-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_tipo')
     ->dropDownList($listatipo, ['prompt' => 'Seleccionar']) ?>

    <?= $form->field($model, 'descripcion')->textarea() ?>

    <?= $form->field($model, 'objetivo')->textarea() ?>

    <?= $form->field($model, 'nombre_apellido')->textInput(['ReadOnly'=>true]) ?>



    <div class="form-group"></br>
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>