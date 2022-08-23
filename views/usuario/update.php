<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */

$this->title = 'Editar usuario: '. $model->username;
$this->params['breadcrumbs'][] = ['label' => 'Usuarios', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="usuario-update">

    <?= $this->render('_form', [
        'model' => $model,
        'lista_perfil' => $lista_perfil,
        'listagerenci' =>$listagerenci
    ]) ?>

</div>
