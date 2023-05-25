<?php
use yii\helpers\Html;
?>
<div class="card">
    <div class="card-body login-card-body">
        <p class="login-box-msg">Introduzca sus datos para iniciar sesion</p>

        <?php $form = \yii\bootstrap4\ActiveForm::begin(['id' => 'login-form']) ?>

        <?= $form->field($model,'username', [
            'options' => ['class' => 'form-group has-feedback'],
            'inputTemplate' => '{input}<div class="input-group-append"><div class="input-group-text"><span class="fas fa-envelope"></span></div></div>',
            'template' => '{beginWrapper}{input}{error}{endWrapper}',
            'wrapperOptions' => ['class' => 'input-group mb-3']
        ])
            ->label(false)
            ->textInput(['placeholder' => $model->getAttributeLabel('Usuario')]) ?>

        <?= $form->field($model, 'password', [
            'options' => ['class' => 'form-group has-feedback'],
            'inputTemplate' => '{input}<div class="input-group-append"><div class="input-group-text"><span class="fas fa-lock"></span></div></div>',
            'template' => '{beginWrapper}{input}{error}{endWrapper}',
            'wrapperOptions' => ['class' => 'input-group mb-3']
        ])
            ->label(false)
            ->passwordInput(['placeholder' => $model->getAttributeLabel('Clave')]) ?>

        <div class="row">
            <div class="col-12">
                <?= Html::submitButton('Iniciar Sesion', ['class' => 'btn btn-primary btn-block']) ?>
            </div>
        </div>

        <?php \yii\bootstrap4\ActiveForm::end(); ?>

        <div class="pt-3">
            <div class="col-md-12"><?= Html::Button('Registrate', ['class' => 'btn btn-success btn-block']) ?></div>
        </div>
        <div class="p-1">
            <div class="col-md-12"><?= Html::Button('Recordar Clave', ['class' => 'btn btn-warning btn-block']) ?></div>
        </div>
    </div>
    <!-- /.login-card-body -->
</div>