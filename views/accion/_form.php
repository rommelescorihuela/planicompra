<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\depdrop\DepDrop;
use yii\helpers\Url;
use kartik\select2\Select2;



/* @var $this yii\web\View */
/* @var $model app\models\Accion */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="accion-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_tipo')
    ->dropDownList($lista_tipo, ['id'=>'id_tipo', 'prompt' => 'Seleccionar']); ?>

    <?= $form->field($model, 'idpoa')->widget(DepDrop::classname(), [
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

    <?= $form->field($model, 'descripcion')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'idgerencia')->widget(Select2::classname(), [
    'data' => $listagerenci,
    'options' => ['placeholder' => 'Seleccionar...', 'disabled' => Yii::$app->user->identity->id_perfil == 2 ? true : false],
    'pluginOptions' => [
    'allowClear' => true
    ],
    ]) ?>
    </br>
    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
