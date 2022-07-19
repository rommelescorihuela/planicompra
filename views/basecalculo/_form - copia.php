<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\depdrop\DepDrop;
use yii\helpers\Url;
use kartik\select2\Select2;


/* @var $this yii\web\View */
/* @var $model app\models\Basecalculo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="basecalculo-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_tipo')->widget(Select2::classname(), [
    'data' => $lista_tipo,
    'options' => ['id'=>'id_tipo', 'placeholder' => 'Seleccionar...'],
    'pluginOptions' => [
    'allowClear' => true
    ],
    ]) ?>

    <?= $form->field($model, 'id_poa')->widget(DepDrop::classname(), [
    'type' => DepDrop::TYPE_SELECT2,
    'data' => [2 => ''],
    'options' => ['id' => 'idpoa', 'placeholder' => 'Seleccione...'],
    'select2Options' => ['pluginOptions' => ['allowClear' => true]],
    'pluginOptions'=>[
        'depends'=>['id_tipo'],
        'url' => Url::to(['poas']),
        'params' => ['input-type-1', 'input-type-2']
        ]
    ]) ?>
    
    <?= $form->field($model, 'id_accion')->widget(DepDrop::classname(), [
    'type' => DepDrop::TYPE_SELECT2,
    'data' => [2 => ''],
    'options' => ['id' => 'idaccionespecifica', 'placeholder' => 'Seleccione...'],
    'select2Options' => ['pluginOptions' => ['allowClear' => true]],
    'pluginOptions'=>[
        'depends'=>['idpoa'],
        'url' => Url::to(['accionespecif']),
        'params' => ['input-type-1', 'input-type-2']
        ]
    ]) ?>
    
    <?= $form->field($model, 'id_actividad')->widget(DepDrop::classname(), [
    'type' => DepDrop::TYPE_SELECT2,
    'data' => [2 => ''],
    'options' => ['id' => 'idactividad', 'placeholder' => 'Seleccione...'],
    'select2Options' => ['pluginOptions' => ['allowClear' => true]],
    'pluginOptions'=>[
        'depends'=>['idaccionespecifica'],
        'url' => Url::to(['actividades']),
        'params' => ['input-type-1', 'input-type-2']
        ]
    ]) ?>

    <?= $form->field($model, 'id_producto')->widget(Select2::classname(), [
    'data' => $lista_producto,
    'options' => ['id'=>'id_producto', 'placeholder' => 'Seleccionar...'],
    'pluginOptions' => [
        'allowClear' => true
    ],
    ]) ?>


    <?= $form->field($model, 'id_medida')->widget(DepDrop::classname(), [
    'type' => DepDrop::TYPE_SELECT2,
    'data' => [2 => ''],
    'options' => ['id' => 'idmedida', 'placeholder' => 'Seleccione...'],
    'select2Options' => ['pluginOptions' => ['allowClear' => true]],
    'pluginOptions'=>[
        'depends'=>['id_producto'],
        'url' => Url::to(['medidas']),
        'params' => ['input-type-1', 'input-type-2']
        ]
    ]) ?>

    <?= $form->field($model, 'costo')->widget(DepDrop::classname(), [
    'type' => DepDrop::TYPE_SELECT2,
    'data' => [2 => ''],
    'options' => ['id' => 'idcosto', 'placeholder' => 'Seleccione...'],
    'select2Options' => ['pluginOptions' => ['allowClear' => true]],
    'pluginOptions'=>[
        'depends'=>['id_producto'],
        'url' => Url::to(['costos']),
        'params' => ['input-type-1', 'input-type-2']
        ]
    ]) ?>

    <?= $form->field($model, 'id_especifico')->widget(DepDrop::classname(), [
    'type' => DepDrop::TYPE_SELECT2,
    'data' => [2 => ''],
    'options' => ['id' => 'id_especifico', 'placeholder' => 'Seleccione...'],
    'select2Options' => ['pluginOptions' => ['allowClear' => true]],
    'pluginOptions'=>[
        'depends'=>['id_producto'],
        'url' => Url::to(['especificos']),
        'params' => ['input-type-1', 'input-type-2']
        ]
    ]) ?>


    <?= $form->field($model, 'id_generica')->widget(DepDrop::classname(), [
    'type' => DepDrop::TYPE_SELECT2,
    'data' => [2 => ''],
    'options' => ['id' => 'id_generica', 'placeholder' => 'Seleccione...'],
    'select2Options' => ['pluginOptions' => ['allowClear' => true]],
    'pluginOptions'=>[
        'depends'=>['id_especifico'],
        'url' => Url::to(['genericas']),
        'params' => ['input-type-1', 'input-type-2']
        ]
    ]) ?>

    <?= $form->field($model, 'id_partida')->widget(DepDrop::classname(), [
    'type' => DepDrop::TYPE_SELECT2,
    'data' => [2 => ''],
    'options' => ['id' => 'id_partida', 'placeholder' => 'Seleccione...'],
    'select2Options' => ['pluginOptions' => ['allowClear' => true]],
    'pluginOptions'=>[
        'depends'=>['id_generica'],
        'url' => Url::to(['partidas']),
        'params' => ['input-type-1', 'input-type-2']
        ]
    ]) ?>

    <?= $form->field($model, 'iva')->widget(DepDrop::classname(), [
    'type' => DepDrop::TYPE_SELECT2,
    'data' => [2 => ''],
    'options' => ['id' => 'iva', 'placeholder' => 'Seleccione...'],
    'select2Options' => ['pluginOptions' => ['allowClear' => true]],
    'pluginOptions'=>[
        'depends'=>['id_producto'],
        'url' => Url::to(['ivas']),
        'params' => ['input-type-1', 'input-type-2']
        ]
    ]) ?>

    <?= $form->field($model, 'cantidad')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>