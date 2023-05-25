
<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\depdrop\DepDrop;
use yii\helpers\Url;
use wbraganca\dynamicform\DynamicFormWidget;
use yii\helpers\ArrayHelper;
use app\models\Poa;
use app\models\Accion;


?>

<div class="customer-form">
    <div class="row">
        <div class="col-md-12">
             <div class="card card-primary">
                <div class="card-header">
                    <h3><?= Html::encode($this->title) ?></h3>
                </div>
                <div class="card-body">
                    <?php $form = ActiveForm::begin(['id' => 'dynamic-form-actividades']); ?>
                    <div class="row">
                        <div class="col-md-3">
                            <?= $form->field($model, 'id_tipo')->dropDownList($lista_tipo, ['id'=>'id_tipo', 'prompt' => 'Seleccionar']); ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($model, 'id_poa')->widget(DepDrop::classname(), [
                            'type' => DepDrop::TYPE_SELECT2,
                            'data' => ArrayHelper::map(Poa::find()->where(['id_tipo' =>$model->id_tipo])->orderBy('idpoa')->all(), 'idpoa', 'descripcion'),
                            'options' => ['id' => 'idpoa', 'placeholder' => 'Seleccione...'],
                            'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                            'pluginOptions'=>[
                                'depends'=>['id_tipo'],
                                'url' => Url::to(['poas']),
                                'params' => ['input-type-1', 'input-type-2']
                                ]
                            ]) ?>
                        </div>
                        <div class="col-md-3">
                            <?= $form->field($model, 'idaccionespecifica')->widget(DepDrop::classname(), [
                                'type' => DepDrop::TYPE_SELECT2,
                                'data' =>  ArrayHelper::map(Accion::find()->where(['idpoa' =>$model->id_poa])->orderBy('id_accion')->all(), 'id_accion', 'descripcion'),
                                'options' => ['id' => 'idaccionespecifica', 'placeholder' => 'Seleccione...'],
                                'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                                'pluginOptions'=>[
                                    'depends'=>['idpoa'],
                                    'url' => Url::to(['accionespecif']),
                                    'params' => ['input-type-1', 'input-type-2']
                                    ]
                                ]) ?>
                        </div>                        
                        <div class="col-md-3">
                            <?= $form->field($model, 'descripcion')->textinput(['rows' => 6]) ?>
                        </div>
                    </div>
                    <?php DynamicFormWidget::begin([
                        'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
                        'widgetBody' => '.container-items', // required: css class selector
                        'widgetItem' => '.item', // required: css class
                        'limit' => 20, // the maximum times, an element can be cloned (default 999)
                        'min' => 1, // 0 or 1 (default 1)
                        'insertButton' => '.add-item', // css class
                        'deleteButton' => '.remove-item', // css class
                        'model' => $modelsAddress[0],
                        'formId' => 'dynamic-form-actividades',
                        'formFields' => [
                            'unidadmedida',
                            'enero',
                            'febrero',
                            'marzo',
                            'abril',
                            'mayo',
                            'junio',
                            'agosto',
                            'septiembre',
                            'octubre',
                            'novimbre',
                            'diciembre',
                        ],
                    ]); ?>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>
                                <button type="button" class="add-item btn btn-success btn-sm pull-right"><i class="fa fa-plus"></i></button>
                                <i class="glyphicon glyphicon-envelope"></i> Programacion de la meta fisica por unidad de medida
                            </h4>
                        </div>
                        <div class="panel-body">
                            <div class="container-items"><!-- widgetBody -->
                                <?php $j =0; ?>
                            <?php foreach ($modelsAddress as $i => $modelAddress): ?>
                                <?php $j++; ?>
                                <div class="item panel panel-default"><!-- widgetItem -->
                                    <div class="panel-heading">
                                        <h3 class="panel-title pull-left"></h3>
                                        <div class="pull-right">
                                            <button type="button" class="remove-item btn btn-danger btn-xs"><i class="fa fa-minus"></i></button>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body">
                                        <?php
                                            // necessary for update action.
                                            if (! $modelAddress->isNewRecord) {
                                                echo Html::activeHiddenInput($modelAddress, "[{$i}]id");
                                            }
                                        ?>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <?= $form->field($modelAddress, "[{$i}]unidadmedida")->textInput(['maxlength' => true])->label('Unidad de Medida') ?>
                                            </div>
                                            <div class="col-md-6">
                                                <?= $form->field($modelAddress, "[{$i}]total")->textInput(['maxlength' => true])->label('Total de la meta') ?>
                                            </div>
                                        </div>
                                        <?php if (! $modelAddress->isNewRecord) :?>
                                            <div class="row">
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]enero")->textInput(['maxlength' => true, 'onblur'=>'validar(this)']) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]febrero")->textInput(['maxlength' => true,]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]marzo")->textInput(['maxlength' => true]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]abril")->textInput(['maxlength' => true]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]mayo")->textInput(['maxlength' => true,]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]junio")->textInput(['maxlength' => true,]) ?>
                                                </div>
                                            </div><!-- .row -->
                                            <div class="row">
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]julio")->textInput(['maxlength' => true,]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]agosto")->textInput(['maxlength' => true,]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]septiembre")->textInput(['maxlength' => true,]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]octubre")->textInput(['maxlength' => true,]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]noviembre")->textInput(['maxlength' => true,]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]diciembre")->textInput(['maxlength' => true,]) ?>
                                                </div>
                                            </div><!-- .row -->
                                        <?php else:?>
                                            
                                            <div class="row">
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]enero")->textInput(['maxlength' => true, 'onblur'=>'validar(this)','value' =>0]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]febrero")->textInput(['maxlength' => true,'value' =>0]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]marzo")->textInput(['maxlength' => true,'value' =>0]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]abril")->textInput(['maxlength' => true,'value' =>0]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]mayo")->textInput(['maxlength' => true,'value' =>0]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]junio")->textInput(['maxlength' => true,'value' =>0]) ?>
                                                </div>
                                            </div><!-- .row -->
                                            <div class="row">
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]julio")->textInput(['maxlength' => true,'value' =>0]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]agosto")->textInput(['maxlength' => true,'value' =>0]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]septiembre")->textInput(['maxlength' => true,'value' =>0]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]octubre")->textInput(['maxlength' => true,'value' =>0]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]noviembre")->textInput(['maxlength' => true,'value' =>0]) ?>
                                                </div>
                                                <div class="col-sm-2">
                                                    <?= $form->field($modelAddress, "[{$i}]diciembre")->textInput(['maxlength' => true,'value' =>0]) ?>
                                                </div>
                                            </div><!-- .row -->
                                        <?php endif?>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                            </div>
                        </div>
                    </div><!-- .panel -->
                    <?php DynamicFormWidget::end(); ?>
                    <div id="miDiv">
                       <input type="hidden" readonly='readonly' id="miCampo" value=<?php echo $j;?>>
                    </div>
                    
                    <div class="form-group">
                        <?= Html::Button('Guardar', ['id'=>'submit-act','class' => 'btn btn-primary']) ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>