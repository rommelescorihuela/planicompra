<?php

use yii\helpers\Html;
use yii\grid\GridView;

$this->title='pdf view';
$this->params['breadcrumbs'][] = $this->title;
?>

<style>
.tg  {border-collapse:collapse;border-spacing:0;margin-left: 70px;}
.margin {margin-left: 70px;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:160px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-9wq8{border-color:inherit;text-align:center;vertical-align:middle}
.tg .tg-8m8h{background-color:#cbcefb;border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-ikmv{background-color:#cbcefb;text-align:left;vertical-align:top}
.tg .tg-pvvw{background-color:#c0c0c0;border-color:inherit;font-weight:bold;text-align:right;vertical-align:top}
.tg .tg-7btt{border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-0lax{text-align:left;vertical-align:top}
.tg .tg-sh07{background-color:#cbcefb;text-align:center;vertical-align:top}
.tg .tg-fymr{border-color:inherit;font-weight:bold;text-align:left;vertical-align:top}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-dvpl{border-color:inherit;text-align:right;vertical-align:top}

.tiesdate {
    position: relative;
    font-size: 18px;
    right: 70px;
}
</style>

<div class="container">
    <div class="margin">
    <h4>PROYECTO: <?= $model->descripcion ?></h4> <h4>OBJETIVO DEL PROYECTO: <?= $model->objetivo ?></h4><?php foreach($list2 as $lista2) {?><h4>UNIDAD EJECUTORA: <?= $lista2->idgerencia0->gerencia ?></h4><?php }?>
</div>
    <table class="tg">
<thead>
  <tr>
    <th class="tg-7btt" colspan="3" rowspan="2">4. ACCIÓNN ESPECIFICA</th>
    <th class="tg-7btt" colspan="2" rowspan="2">5. PONDERACIÓN</th>
    <th class="tg-7btt" colspan="4">6. PLAZO DE EJECUCIÓN</th>
    <th class="tg-7btt" colspan="3" rowspan="2">7. BIEN O SERVICIO<br>A OBTENER</th>
    <th class="tg-7btt" colspan="4">8. META TOTAL</th>
    <th class="tg-7btt" colspan="16">9. PROGRAMACIÓN FÍSICA DE LA META</th>
    <th class="tg-7btt" rowspan="2">10. ACTIVIDAD</th>
    <th class="tg-7btt" colspan="4">11. META DE LA ACTIVIDAD</th>
    <th class="tg-7btt" colspan="16">12. PROGRAMACIÓN FÍSICA DE LA META DE LA ACTIVIDAD</th>
  </tr>
  <tr>
    <th class="tg-7btt" colspan="2">6.1 INICIO</th>
    <th class="tg-7btt" colspan="2">6.2 FIN</th>
    <th class="tg-7btt" colspan="2">8.1 UNIDAD<br>DE MEDIDA</th>
    <th class="tg-7btt" colspan="2">8.2 CANTIDAD<br>ANUAL</th>
    <th class="tg-7btt">E</th>
    <th class="tg-7btt">F</th>
    <th class="tg-7btt">M</th>
    <th class="tg-8m8h">I T</th>
    <th class="tg-7btt">A</th>
    <th class="tg-7btt">M</th>
    <th class="tg-7btt">J</th>
    <th class="tg-8m8h">II T</th>
    <th class="tg-7btt">J</th>
    <th class="tg-7btt">A</th>
    <th class="tg-7btt">S</th>
    <th class="tg-8m8h">III T</th>
    <th class="tg-7btt">O</th>
    <th class="tg-7btt">N</th>
    <th class="tg-7btt">D</th>
    <th class="tg-8m8h">IV T</th>
    <th class="tg-7btt" colspan="2">10.1 UNIDAD<br>DE MEDIDA</th>
    <th class="tg-7btt" colspan="2">11.2<br>CANTIDAD <br>ANUAL</th>
    <th class="tg-7btt">E</th>
    <th class="tg-7btt">F</th>
    <th class="tg-7btt">M</th>
    <th class="tg-8m8h">I T</th>
    <th class="tg-7btt">A</th>
    <th class="tg-7btt">M</th>
    <th class="tg-7btt">J</th>
    <th class="tg-8m8h">II T</th>
    <th class="tg-7btt">J</th>
    <th class="tg-7btt">A</th>
    <th class="tg-7btt">S</th>
    <th class="tg-8m8h">III T</th>
    <th class="tg-7btt">O</th>
    <th class="tg-7btt">N</th>
    <th class="tg-7btt">D</th>
    <th class="tg-8m8h">IV T</th>
  </tr>
</thead>
<tbody>
  <?php foreach($list as $lista) {?>

<tr>
    <th class="tg-0lax" colspan="3"><?= $lista->accion->descripcion ?></th>
    <th class="tg-0lax" colspan="2"><?= $lista->ponderacion ?>%</th>
    <th class="tg-0lax" colspan="2"><?= $lista->fecha_i?></th>
    <th class="tg-0lax" colspan="2"><?= $lista->fecha_f?></th>
    <th class="tg-0lax" colspan="3"><?= $lista->producto->producto?></th>
    <th class="tg-0lax" colspan="2"><?= $lista->medida->medida?></th>
    <th class="tg-sh07" colspan="2"><?= $lista->iva_monto?></th>
    <th class="tg-0lax"><?= $lista->enero?></th>
    <th class="tg-0lax"><?= $lista->febrero?></th>
    <th class="tg-0lax"><?= $lista->marzo?></th>
    <th class="tg-ikmv"><?= $lista->marzo +  $lista->enero +  $lista->febrero?></th>
    <th class="tg-0lax"><?= $lista->abril?></th>
    <th class="tg-0lax"><?= $lista->mayo?></th>
    <th class="tg-0lax"><?= $lista->junio?></th>
    <th class="tg-ikmv"><?= $lista->abril +  $lista->mayo +  $lista->junio?></th>
    <th class="tg-0lax"><?= $lista->julio?></th>
    <th class="tg-0lax"><?= $lista->agosto?></th>
    <th class="tg-0lax"><?= $lista->septiembre?></th>
    <th class="tg-ikmv"><?= $lista->julio +  $lista->agosto +  $lista->septiembre?></th>
    <th class="tg-0lax"><?= $lista->octubre?></th>    
    <th class="tg-0lax"><?= $lista->noviembre?></th>
    <th class="tg-0lax"><?= $lista->diciembre?></th>
    <th class="tg-ikmv"><?= $lista->octubre +  $lista->noviembre +  $lista->diciembre?></th>
    <th class="tg-0lax"><?= $lista->actividad->descripcion ?></th>
    <th class="tg-0lax" colspan="2"><?= $lista->medida->medida?></th>
    <th class="tg-0lax" colspan="2"><?= $lista->iva_monto?></th>
    <th class="tg-0lax"><?= $lista->enero?></th>
    <th class="tg-0lax"><?= $lista->febrero?></th>
    <th class="tg-0lax"><?= $lista->marzo?></th>
    <th class="tg-ikmv"><?= $lista->marzo +  $lista->enero +  $lista->febrero?></th>
    <th class="tg-0lax"><?= $lista->abril?></th>
    <th class="tg-0lax"><?= $lista->mayo?></th>
    <th class="tg-0lax"><?= $lista->junio?></th>
    <th class="tg-ikmv"><?= $lista->abril +  $lista->mayo +  $lista->junio?></th>
    <th class="tg-0lax"><?= $lista->julio?></th>
    <th class="tg-0lax"><?= $lista->agosto?></th>
    <th class="tg-0lax"><?= $lista->septiembre?></th>
    <th class="tg-ikmv"><?= $lista->julio +  $lista->agosto +  $lista->septiembre?></th>
    <th class="tg-0lax"><?= $lista->octubre?></th>    
    <th class="tg-0lax"><?= $lista->noviembre?></th>
    <th class="tg-0lax"><?= $lista->diciembre?></th>
    <th class="tg-ikmv"><?= $lista->octubre +  $lista->noviembre +  $lista->diciembre?></th>



</tr>
<?php }?>

  <tr>
    <td class="tg-9wq8" colspan="44" rowspan="2">13. REQUERIMIENTOS</td>
    <td class="tg-7btt" colspan="9">14. ASIGNACIÓN<br>PRESUPUESTARIA</td>
  </tr>
  <tr>
    <td class="tg-fymr" colspan="4">14.1 PARTIDA<br>PRESUPUESTARIA</td>
    <td class="tg-fymr" colspan="5">14.2 MONTO ASIGNADO Bs.</td>
  </tr>
  <tr>
    <td class="tg-0pky" colspan="44" rowspan="6"></td>
    <td class="tg-c3ow" colspan="4">402.00.00.00</td>
    <td class="tg-dvpl" colspan="5"></td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="4">403.00.00.00</td>
    <td class="tg-dvpl" colspan="5"></td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="4">404.00.00.00</td>
    <td class="tg-dvpl" colspan="5"></td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="4">407.00.00.00</td>
    <td class="tg-dvpl" colspan="5"></td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="4">408.00.00.00</td>
    <td class="tg-dvpl" colspan="5"></td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="4">411.00.00.00</td>
    <td class="tg-dvpl" colspan="5"></td>
  </tr>
  <tr>
    <td class="tg-pvvw" colspan="48">15. TOTALES:</td>
    <td class="tg-dvpl" colspan="5">0.00</td>
  </tr>
  <tr>
    <td class="tg-0pky" colspan="53"></td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="53">16. FUNCIONARIO RESPONSABLE DE EMITIR LA INFORMACIÓN</td>
  </tr>
  <tr>
    <td class="tg-0pky" colspan="16" rowspan="12">NOMBRE Y APELLIDO: </td>
    <td class="tg-0pky" colspan="19" rowspan="11"></td>
    <td class="tg-0pky" colspan="18" rowspan="11"></td>
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
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="19">FIRMA</td>
    <td class="tg-c3ow" colspan="18">SELLO</td>
  </tr>
</tbody>
</table>

    <hr>
    <div class="timesdate">
        <?php echo date("Y-m-d");?>
    </div>
</div>