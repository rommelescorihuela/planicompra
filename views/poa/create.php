<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Poa */

$this->title = 'Crear Formulacion';
$this->params['breadcrumbs'][] = ['label' => 'POA', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="poa-create">
    <?= $this->render('_form', [
        'model' => $model,
        'listatipo' =>$listatipo,
    ]) ?>
</div>
