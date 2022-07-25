<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Actividades */

$this->title = 'Crear Actividades';
$this->params['breadcrumbs'][] = ['label' => 'Actividades', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="actividades-create">

    <?= $this->render('_form', [
        'model' => $model,
        'lista_tipo' => $lista_tipo,
        'modelsAddress' => $modelsUnidadmedida,

    ]) ?>

</div>
