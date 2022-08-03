<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Accion */

$this->title = 'Crear Accion Especifica';
$this->params['breadcrumbs'][] = ['label' => 'Accions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="accion-create">

    

    <?= $this->render('_form', [
        'model' => $model,
        'lista_tipo' => $lista_tipo,
        'listagerenci'=> $listagerenci,
        'flag' => $flag,
    ]) ?>

</div>
