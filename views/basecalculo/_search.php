<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\BasecalculoSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="basecalculo-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_plan') ?>

    <?= $form->field($model, 'id_poa') ?>

    <?= $form->field($model, 'id_accion') ?>

    <?= $form->field($model, 'id_actividad') ?>

    <?= $form->field($model, 'id_producto') ?>

    <?php // echo $form->field($model, 'id_medida') ?>

    <?php // echo $form->field($model, 'cantidad') ?>

    <?php // echo $form->field($model, 'monto_total') ?>

    <?php // echo $form->field($model, 'id_gerencia') ?>

    <?php // echo $form->field($model, 'fecha') ?>

    <?php // echo $form->field($model, 'id_partida') ?>

    <?php // echo $form->field($model, 'id_generica') ?>

    <?php // echo $form->field($model, 'id_especifico') ?>

    <?php // echo $form->field($model, 'costo') ?>

    <?php // echo $form->field($model, 'id_usuario') ?>

    <?php // echo $form->field($model, 'iva') ?>

    <?php // echo $form->field($model, 'total_iva') ?>

    <?php // echo $form->field($model, 'iva_monto') ?>

    <?php // echo $form->field($model, 'fecha_h') ?>

    <?php // echo $form->field($model, 'id_moneda') ?>

    <?php // echo $form->field($model, 'n_dias') ?>

    <?php // echo $form->field($model, 'fecha_i') ?>

    <?php // echo $form->field($model, 'fecha_f') ?>

    <?php // echo $form->field($model, 'estatus')->checkbox() ?>

    <?php // echo $form->field($model, 'enero') ?>

    <?php // echo $form->field($model, 'febrero') ?>

    <?php // echo $form->field($model, 'marzo') ?>

    <?php // echo $form->field($model, 'abril') ?>

    <?php // echo $form->field($model, 'mayo') ?>

    <?php // echo $form->field($model, 'junio') ?>

    <?php // echo $form->field($model, 'julio') ?>

    <?php // echo $form->field($model, 'agosto') ?>

    <?php // echo $form->field($model, 'septiembre') ?>

    <?php // echo $form->field($model, 'octubre') ?>

    <?php // echo $form->field($model, 'noviembre') ?>

    <?php // echo $form->field($model, 'diciembre') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
