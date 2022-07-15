<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Requerimiento */

$this->title = 'Editar Requerimiento: ' . $model->producto;
$this->params['breadcrumbs'][] = ['label' => 'Requerimientos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->idproducto, 'url' => ['view', 'id' => $model->idproducto]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="requerimiento-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'costo' => $costo,
        'listamedida'=> $listamedida,
        'listaespecifico'=>$listaespecifico,
        'listaiva'=> $listaiva,
    ]) ?>

</div>
