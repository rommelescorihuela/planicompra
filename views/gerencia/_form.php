<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Gerencia */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="gerencia-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'gerencia')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'mostrar')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
