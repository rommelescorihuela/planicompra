<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Actividades */

$this->title = 'Editar Actividad: ' . $model->descripcion;
$this->params['breadcrumbs'][] = ['label' => 'Actividades', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->idactividad, 'url' => ['view', 'id' => $model->idactividad]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="actividades-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'lista_tipo' => $lista_tipo,
        'modelsAddress' => $modelsUnidadmedida,

    ]) ?>

</div>
