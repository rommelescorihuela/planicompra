<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Medida */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="medida-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'medida')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
