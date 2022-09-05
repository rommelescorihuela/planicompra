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
                'options' => ['id'=>'id_tipo','placeholder' => 'Select a state ...'],
                'pluginOptions' => [
                'allowClear' => true
                ],
            ]);?>
        </div>
        <div class="col-md-4">
            <?php /*echo $form->field($model, 'project')->widget(DepDrop::classname(), [
                    'pluginOptions'=>[
                    'depends'=>['reportform-year'],
                    'placeholder'=>'Select...',
                    'url'=>Url::to(['/poa/proyear'])
                ]
            ]); */?>
            <?= $form->field($model, 'project')->widget(DepDrop::classname(), [
                            'type' => DepDrop::TYPE_SELECT2,
                            'options' => ['id' => 'project', 'placeholder' => 'Seleccione...'],
                            'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                            'pluginOptions'=>[
                                'depends'=>['id_tipo'],
                                'url' => Url::to(['/poa/proyear']),
                                ]
                            ])->label('Accion Centralizada') ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'unity') ?>
        </div>
    </div>
    
        <div class="form-group">
            <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div><!-- report-profis -->
