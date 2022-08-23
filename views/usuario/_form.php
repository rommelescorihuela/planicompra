<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */
/* @var $form yii\widgets\ActiveForm */
?>

<?php $form = ActiveForm::begin(); ?>
<div class="usuario-form">
    <div class="row">
        <div class="col-md-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h3><?= Html::encode($this->title) ?></h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4"><?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?></div>
                        <div class="col-md-4"><?= $form->field($model, 'password')->passwordInput(['maxlength' => true]) ?></div>
                        <div class="col-md-4">
                            <?= $form->field($model, 'id_gerencia')->widget(Select2::classname(), [
                                'data' => $listagerenci,
                                'options' => ['placeholder' => 'Seleccionar...'],
                                'pluginOptions' => [
                                    'allowClear' => true
                                ],
                            ])->label('Unidad Ejecutora') ?> 
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4"><?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?></div>
                        <div class="col-md-4"><?= $form->field($model, 'apellido')->textInput(['maxlength' => true]) ?></div>
                        <div class="col-md-4"><?= $form->field($model, 'cedula')->textInput(['maxlength' => 8]) ?></div> 
                    </div>
                    <div class="row">
                        <div class="col-md-4"><?= $form->field($model, 'cargo')->textInput(['maxlength' => true]) ?></div>
                        <div class="col-md-4"><?= $form->field($model, 'correo')->textInput(['maxlength' => true]) ?></div>
                        <div class="col-md-2">
                            <?= $form->field($model, 'status')->widget(Select2::classname(), [
                                'data' => [1 => 'ACTIVO', 2 => 'INACTIVO'],
                                'options' => ['placeholder' => 'Seleccionar...'],
                                'pluginOptions' => [
                                    'allowClear' => true
                                ],
                            ]) ?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($model, 'perfil')->widget(Select2::classname(), [
                                'data' => \yii\helpers\ArrayHelper::map(\app\models\Perfil::find()->orderBy('id_perfil')->asArray()->all(), 'id_perfil', 'descripcion'),
                                'options' => ['placeholder' => 'Seleccionar...'],
                                'pluginOptions' => [
                                    'allowClear' => true
                                ],
                            ]) ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php ActiveForm::end(); ?>
