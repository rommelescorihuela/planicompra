<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;


/* @var $this yii\web\View */
/* @var $model app\models\Poa */
/* @var $form yii\widgets\ActiveForm */
?>

<?php $form = ActiveForm::begin(); ?>
<div class="poa-form">
    <div class="row">
        <div class="col-md-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h3><?= Html::encode($this->title) ?></h3>
                </div>
                <div class="card-body">

                    <?= $form->field($model, 'id_tipo')->dropDownList($listatipo, ['prompt' => 'Seleccionar']) ?>

                    <div id="proyecto"></div>

                    <?= $form->field($model, 'objetivo')->textarea() ?>

                    <?= $form->field($model, 'nombre_apellido')->textInput(['ReadOnly'=>true]) ?>



                    <div class="form-group"></br>
                        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
                    </div>    
                </div>
            </div>
        </div>
    </div>
</div>
<?php ActiveForm::end(); ?>