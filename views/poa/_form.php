<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use app\models\Tipo;


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

                    <?= $form->field($model, 'id_tipo')->dropDownList(ArrayHelper::map(Tipo::find()->orderBy('tipo')->where(['id_tipo' => 2])->all(), 'id_tipo', 'tipo'), ['id'=>'id_tipo', 'prompt' => 'Seleccionar'])->label('Categoría Presupuestaria'); ?>

                    <?= $form->field($model, 'descripcion')->textarea() ?>

                    <?= $form->field($model, 'objetivo')->textarea() ?>

                    <?= $form->field($model, 'nombre_apellido')->textInput(['ReadOnly'=>true]) ?>

                    <?= $form->field($model, 'periodo')->dropDownList([2023=>2023,2023=>2023,2025=>2025,2026=>2026,2027=>2027,2028=>2028,2029=>2029,2030=>2030,2031=>2031,2032=>2032], ['prompt' => 'Seleccionar'])->label('Periodo (año)'); ?>

                    <div class="form-group"></br>
                        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
                    </div>    
                </div>
            </div>
        </div>
    </div>
</div>
<?php ActiveForm::end(); ?>