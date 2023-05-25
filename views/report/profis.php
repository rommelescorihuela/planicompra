<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use kartik\depdrop\DepDrop;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model app\models\ReportForm */
/* @var $form ActiveForm */

 
$year = [
    2022=>2022,
    2023=>2023,
    2024=>2024,
    2025=>2025,
    2026=>2026,
    2027=>2027,
    2028=>2028,
    2029=>2029,
    2030=>2030,
    2031=>2031,
    2032=>2032,
];
?>
<div class="report-profis">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-4">
            <?php echo $form->field($model, 'year')->widget(Select2::classname(), [
                    'data' => $year,
                    'options' => ['placeholder' => 'Seleccione...'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
            ])?>
        </div>
        <div class="col-md-4">
            <?php echo $form->field($model, 'project')->widget(DepDrop::classname(), [
                    'pluginOptions'=>[
                    'depends'=>['reportform-year'],
                    'placeholder'=>'Seleccione...',
                    'url'=>Url::to(['/poa/proyear'])
                ]
            ]); ?>
        </div>
        <div class="col-md-4">
            <?php echo $form->field($model, 'unity')->widget(Select2::classname(), [
                    'data' => $unidad,
                    'options' => ['placeholder' => 'Seleccione...'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
            ])?>
        </div>
    </div>
    
        <div class="form-group">
            <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div><!-- report-profis -->
