<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Accion */

$this->title = 'Editar Accion Especifica: ' . $model->descripcion;
$this->params['breadcrumbs'][] = ['label' => 'Accions', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_accion, 'url' => ['view', 'id' => $model->id_accion]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="accion-update">


    <?= $this->render('_form', [
        'model' => $model,
        'lista_tipo' => $lista_tipo,
        'listagerenci'=> $listagerenci,
        'flag' => $flag,
    ]) ?>

</div>
