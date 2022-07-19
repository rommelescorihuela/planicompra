<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Basecalculo */

$this->title = 'Editar Base de calculo: ' . $model->id_plan;
$this->params['breadcrumbs'][] = ['label' => 'Basecalculos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_plan, 'url' => ['view', 'id' => $model->id_plan]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="basecalculo-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'lista_tipo' =>$lista_tipo,
        'lista_producto' =>$lista_producto,
    ]) ?>

</div>
