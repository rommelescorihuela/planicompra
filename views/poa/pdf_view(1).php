<?php

use yii\helpers\Html;
use yii\grid\GridView;

$this->title='pdf view';
$this->params['breadcrumbs'][] = $this->title;
?>

<style>
.tg  {border-collapse:collapse;border-spacing:0;margin-left: 70px;margin-top: 50px; font-size:15px;}
.margin {margin-left: 70px;}
.titulo {margin-left:110px;margin-top: 90px;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:15px;
  overflow:hidden;padding:60px 0px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:15px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-oe15{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-34fe{background-color:#c0c0c0;border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-zv4m{border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-v0hj{background-color:#efefef;border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-8m8h{background-color:#cbcefb;border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-qbk9{background-color:#efefef;border-color:inherit;font-weight:bold;text-align:center;vertical-align:middle}
.tg .tg-pvvw{background-color:#c0c0c0;border-color:inherit;font-weight:bold;text-align:right;vertical-align:top}
.tg .tg-dvid{background-color:#efefef;border-color:inherit;font-weight:bold;text-align:left;vertical-align:top}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-fymr{border-color:inherit;font-weight:bold;text-align:left;vertical-align:top}
.tg .tg-7btt{border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-9wq8{border-color:inherit;text-align:center;vertical-align:middle}
.poa {border-color:inherit;text-align:center;}


.tiesdate {
    font-size: 18px;
}
</style>

<div class="poa">
<h2>PLAN OPERARIVO ANUAL <?php echo date("Y") ?></h2>
</div>

<div class="titulo">
<h4>PROYECTO: <?= $model->descripcion ?></h4> <h4>OBJETIVO DEL PROYECTO: <?= $model->objetivo ?></h4><?php foreach($list2 as $lista2) {?><h4>UNIDAD EJECUTORA: <?= $lista2->idgerencia0->gerencia ?></h4><?php }?>
</div>
<div class="container">
<table class="tg">
<thead>
  <tr>
    <th class="tg-dvid" rowspan="2">4. ACCIÓN ESPECIFICA</th>
    <th class="tg-dvid" rowspan="2">5. PONDERACIÓN (%)</th>
    <th class="tg-dvid" colspan="2">6. PLAZO DE EJECUCIÓN</th>
    <th class="tg-qbk9" rowspan="2">7. BIEN O SERVICIO A<br>OBTENER</th>
    <th class="tg-v0hj" colspan="2">8. META TOTAL</th>
    <th class="tg-v0hj" colspan="16">9. PROGRAMACIÓN FÍSICA DE LA META</th>
  </tr>
  <tr>
    <th class="tg-dvid">6.1 INICIO</th>
    <th class="tg-dvid">6.2 FIN</th>
    <th class="tg-v0hj">8.1 UNIDAD DE <br>MEDIDA</th>
    <th class="tg-v0hj">8.2 CANTIDAD <br>ANUAL</th>
    <th class="tg-v0hj">E</th>
    <th class="tg-v0hj">F</th>
    <th class="tg-v0hj">M</th>
    <th class="tg-8m8h">I T</th>
    <th class="tg-v0hj">A</th>
    <th class="tg-v0hj">M</th>
    <th class="tg-v0hj">J</th>
    <th class="tg-8m8h">II T</th>
    <th class="tg-v0hj">J</th>
    <th class="tg-v0hj">A</th>
    <th class="tg-v0hj">S</th>
    <th class="tg-8m8h">III T</th>
    <th class="tg-v0hj">O</th>
    <th class="tg-v0hj">N</th>
    <th class="tg-v0hj">D</th>
    <th class="tg-8m8h">IV T</th>
  </tr>
</thead>

<?php foreach($list as $lista) {?>

<tr>
    <th class="tg-9wq8"><?= $lista->accion->descripcion ?></th>
    <th class="tg-9wq8"><?= $lista->ponderacion ?>%</th>
    <th class="tg-9wq8"><?= $lista->fecha_i?></th>
    <th class="tg-9wq8"><?= $lista->fecha_f?></th>
    <th class="tg-9wq8"><?= $lista->producto->producto?></th>
    <th class="tg-9wq8"><?= $lista->medida->medida?></th>
    <th class="tg-9wq8"><?= number_format($lista->total_iva, 2, ',', '.')?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->enero)?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->febrero)?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->marzo)?></th>
    <th class="tg-8m8h"><?= Yii::$app->formatter->asDecimal($lista->marzo +  $lista->enero +  $lista->febrero)?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->abril)?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->mayo)?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->junio)?></th>
    <th class="tg-8m8h"><?= Yii::$app->formatter->asDecimal($lista->abril +  $lista->mayo +  $lista->junio)?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->julio)?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->agosto)?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->septiembre)?></th>
    <th class="tg-8m8h"><?= Yii::$app->formatter->asDecimal($lista->julio +  $lista->agosto +  $lista->septiembre)?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->octubre)?></th>    
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->noviembre)?></th>
    <th class="tg-9wq8"><?= Yii::$app->formatter->asDecimal($lista->diciembre)?></th>
    <th class="tg-8m8h"><?= Yii::$app->formatter->asDecimal($lista->octubre +  $lista->noviembre +  $lista->diciembre)?></th>



</tr>

<?php }?>
<tbody>
  <tr>
    <td class="tg-v0hj" colspan="14" rowspan="2">13.REQUERIMIENTOS</td>
    <td class="tg-v0hj" colspan="9">14. ASIGNACIÓN PRESUPUESTARIA</td>
  </tr>
  <tr>
    <td class="tg-v0hj" colspan="8">14.1 PARTIDA PRESUPUESTARIA</td>
    <td class="tg-v0hj">14.2 MONTO ASIGNADO Bs</td>
  </tr>
  <tr>
    <td class="tg-0pky" colspan="14" rowspan="6"><?php foreach($list as $lista) {?><?= $lista->producto->producto?>; <?php }?></td>
    <?php
  $total402 = 0;
  $total403 = 0;
  $total404 = 0;
  $total407 = 0;
  $total408 = 0;
  $total4011 = 0;
  $totales = 0;

  foreach($list as $lista) {
    if($lista->id_partida == 1){
          $total402 = $lista->iva_monto + $total402;
        }
    if($lista->id_partida == 2){
          $total403 = $lista->iva_monto + $total403;
        }
  if($lista->id_partida == 3){
          $total404 = $lista->iva_monto + $total404;
          }
  if($lista->id_partida == 4){
            $total407 = $lista->iva_monto + $total407;
          }
  if($lista->id_partida == 5){
            $total408 = $lista->iva_monto + $total408;
          }
  if($lista->id_partida == 6){
            $total4011 = $lista->iva_monto + $total4011;
          }
  }?>
    <td class="tg-fymr" colspan="8">402.00.00.00</td>
    <td class="tg-9wq8">
    <?php  echo Yii::$app->formatter->asDecimal( $total402) ?>
</td>
  </tr>
  <tr>
    <td class="tg-fymr" colspan="8">403.00.00.00</td>
    <td class="tg-9wq8">
    <?php echo Yii::$app->formatter->asDecimal( $total403) ?>
    </td>
  </tr>
  <tr>
    <td class="tg-fymr" colspan="8">404.00.00.00</td>
    <td class="tg-9wq8">
    <?php echo Yii::$app->formatter->asDecimal($total404) ?>
    </td>
  </tr>
  <tr>
    <td class="tg-fymr" colspan="8">407.00.00.00</td>
    <td class="tg-9wq8">
    <?php echo Yii::$app->formatter->asDecimal($total407) ?>
    </td>
  </tr>
  <tr>
    <td class="tg-fymr" colspan="8">408.00.00.00</td>
    <td class="tg-9wq8">
    <?php echo Yii::$app->formatter->asDecimal($total408) ?>
    </td>
  </tr>
  <tr>
    <td class="tg-fymr" colspan="8">411.00.00.00</td>
    <td class="tg-9wq8">
    <?php echo Yii::$app->formatter->asDecimal($total4011) ?>
    </td>
  </tr>
  <tr>
    <td class="tg-pvvw" colspan="22">15. TOTALES:</td>
    <td class="tg-9wq8">
    <?php echo Yii::$app->formatter->asDecimal($totales = $total402 + $total403  + $total404 + $total407 + $total408 + $total4011); ?>
    </td>
  </tr>
  <tr>
    <td class="tg-34fe" colspan="22">16. FUNCIONARIO RESPONSABLE DE EMITIR LA INFORMACIÓN</td>
    <td class="tg-zv4m"></td>
  </tr>
  <tr>
    <td class="tg-0pky" colspan="4" rowspan="10">NOMBRE Y APELLIDO:<?= $model->nombre_apellido ?>
</td>
    <td class="tg-0pky" colspan="6" rowspan="9"></td>
    <td class="tg-0pky" colspan="12" rowspan="9"></td>
    <td class="tg-oe15"></td>
  </tr>
  <tr>
    <td class="tg-zv4m"></td>
  </tr>
  <tr>
    <td class="tg-oe15"></td>
  </tr>
  <tr>
    <td class="tg-oe15" rowspan="5"></td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-oe15"></td>
  </tr>
  <tr>
    <td class="tg-7btt" colspan="6">FIRMA</td>
    <td class="tg-7btt" colspan="12">SELLO DEL AREA ORGANIZATIVA</td>
    <td class="tg-oe15"></td>
  </tr>
</tbody>

    </table>

    <hr>
    <div class="timesdate">
        <?php echo date("Y-m-i");?>
    </div>
</div>