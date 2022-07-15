<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\depdrop\DepDrop;
use yii\helpers\Url;


/* @var $this yii\web\View */
/* @var $model app\models\Actividades */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="actividades-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_tipo')
    ->dropDownList($lista_tipo, ['id'=>'id_tipo', 'prompt' => 'Seleccionar']); ?>

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

<?= $form->field($model, 'idaccionespecifica')->widget(DepDrop::classname(), [
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

    <?= $form->field($model, 'descripcion')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
