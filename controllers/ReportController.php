<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\IOFactory;
use app\models\ReportForm;
use app\models\Gerencia;
use app\models\Poa;
use app\models\Accion;
use app\models\Actividades;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Alignment;

class ReportController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionProfis()
    {
        $model = new ReportForm();
        $unidad = ArrayHelper::map(Gerencia::find()->Where(['mostrar' => true])->all(),'id_gerencia','gerencia');

        if ($model->load(Yii::$app->request->post())) {
            if ($model->validate()) {
                // form inputs are valid, do something here
                return;
            }
        }

        return $this->render('profis', [
            'model' => $model,
            'unidad'=> $unidad,
        ]);
    }

    public function actionProfipro($id)
    {
        $poa_principal = Poa::find()->where(['idpoa' => $id])->one();

        $consulta = (new \yii\db\Query())
            ->select([
                'accion.descripcion as accion_especifica',
                'accion.fechainicio as fecha_inicio',
                'accion.fechafin as fecha_fin',
                'accion.unidadmedida as unidad_medida_accion',
                'accion.enero','accion.febrero','accion.marzo','accion.abril','accion.mayo','accion.junio',
                'accion.julio','accion.agosto','accion.septiembre','accion.octubre','accion.noviembre','accion.diciembre',
                '(accion.enero+accion.febrero+accion.marzo+accion.abril+accion.mayo+accion.junio+accion.julio+accion.agosto+accion.septiembre+accion.octubre+accion.noviembre+accion.diciembre) as totalmes_accion',
                '(accion.enero+accion.febrero+accion.marzo) as t1',
                '(accion.abril+accion.mayo+accion.junio) as t2',
                '(accion.julio+accion.agosto+accion.septiembre) as t3',
                '(accion.octubre+accion.noviembre+accion.diciembre) as t4',
                'actividades.descripcion as actividades',
                'unidad_medida.unidadmedida as unidadmedida_actividad',
                'unidad_medida.enero as enero_act','unidad_medida.febrero as febrero_act','unidad_medida.marzo as marzo_act','unidad_medida.abril as abril_act',
                'unidad_medida.mayo as mayo_act','unidad_medida.junio as junio_act','unidad_medida.julio as julio_act','unidad_medida.agosto as agosto_act',
                'unidad_medida.septiembre as septiembre_act','unidad_medida.octubre as octubre_act','unidad_medida.noviembre as noviembre_act','unidad_medida.diciembre as diciembre_act',
                '(unidad_medida.enero+unidad_medida.febrero+unidad_medida.marzo+unidad_medida.abril+unidad_medida.mayo+unidad_medida.junio+unidad_medida.julio+unidad_medida.agosto+unidad_medida.septiembre+unidad_medida.octubre+unidad_medida.noviembre+unidad_medida.diciembre) as total_actividades',
                '(unidad_medida.enero+unidad_medida.febrero+unidad_medida.marzo) as t1_act',
                '(unidad_medida.abril+unidad_medida.mayo+unidad_medida.junio) as t2_act',
                '(unidad_medida.julio+unidad_medida.agosto+unidad_medida.septiembre) as t3_act',
                '(unidad_medida.octubre+unidad_medida.noviembre+unidad_medida.diciembre) as t4_act',
            ])
            ->from('poa')
            ->innerjoin('accion','accion.idpoa = poa.idpoa')
            ->leftjoin('actividades','actividades.idaccionespecifica = accion.id_accion')
            ->leftjoin('unidad_medida','unidad_medida.id_actividad = actividades.idactividad')
            ->where(['poa.idpoa' => $id])
            ->all();
        $consulta1 = (new \yii\db\Query())
            ->select([
                'poa.descripcion',
                'poa.objetivo',
                'gerencia.gerencia',
            ])
            ->from('poa')
            ->innerjoin('gerencia','gerencia.id_gerencia = poa.id_gerencia')
            ->where(['poa.idpoa' => $id])
            ->one();
        /*echo '<pre>';
        var_dump($consulta1['descripcion']);
        echo '</pre>';
        exit();*/
        $spreadsheet = new Spreadsheet();

// Agregamos el título
// Cambiamos los títulos de las columnas

/*$spreadsheet->setActiveSheetIndex(0)->mergeCells('A9:AP9')
            ->setCellValue('A9', 'ANTEPROYECTO DEL PLAN OPERATIVO ANUAL');*/



            
$spreadsheet->setActiveSheetIndex(0)
    ->mergeCells('A1:AP4')
    ->setCellValue('A1', 'FORMULACIÓN DEL ANTEPROYECTO DEL PLAN OPERATIVO ANUAL INSTITUCIONAL Y PRESUPUESTO')
    ->getStyle('A1:AP4')
    ->getFill()
    ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
    ->getStartColor()
    ->setARGB('FFFFFF');

$spreadsheet->getActiveSheet()
            ->getStyle('A1')
            ->getAlignment()
            ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
$spreadsheet->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);


$spreadsheet->setActiveSheetIndex(0)
    ->mergeCells('A10:AP10')
    ->setCellValue('A10', 'ANTEPROYECTO DEL PLAN OPERATIVO ANUAL')
    ->getStyle('A10:AP10')
    ->getFill()
    ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
    ->getStartColor()
    ->setARGB('4BEB7B');

/*$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('A10:AP13')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('0000FF');*/

$spreadsheet->getActiveSheet()
            ->getStyle('A10')
            ->getAlignment()
            ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
$spreadsheet->getActiveSheet()->getStyle('A10')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

$spreadsheet->getActiveSheet()->getStyle('AA11')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

$spreadsheet->getActiveSheet()
            ->mergeCells('A11:A13')
            ->setCellValue('A11', 'ACCION ESPECIFICA');
$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('A11')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');


$spreadsheet->getActiveSheet()
            ->getStyle('A11')
            ->getAlignment()
            ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
$spreadsheet->getActiveSheet()->getStyle('A11')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

$spreadsheet->getActiveSheet()
            ->mergeCells('B11:B13')
            ->setCellValue('B11', '%');
$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('B11')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');



$spreadsheet->getActiveSheet()
            ->getStyle('B11')
            ->getAlignment()
            ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
$spreadsheet->getActiveSheet()->getStyle('B11')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

$spreadsheet->getActiveSheet()
            ->mergeCells('C11:C13')
            ->setCellValue('C11', 'BIEN O SERVICIO A OBTENER');

$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('C11')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');

$spreadsheet->getActiveSheet()
            ->getStyle('C11')
            ->getAlignment()
            ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
$spreadsheet->getActiveSheet()->getStyle('C11')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

$spreadsheet->setActiveSheetIndex(0)->mergeCells('D11:E11')
            ->setCellValue('D11', 'PLAZO DE EJECUCIÓN');
$spreadsheet->getActiveSheet()->getStyle('D11')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('D11')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');


$spreadsheet->getActiveSheet()
            ->mergeCells('D12:D13')
            ->setCellValue('D12', 'INICIO');
$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('D12')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');

$spreadsheet->getActiveSheet()
            ->getStyle('D12')
            ->getAlignment()
            ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
$spreadsheet->getActiveSheet()->getStyle('D12')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

$spreadsheet->getActiveSheet()
            ->mergeCells('E12:E13')
            ->setCellValue('E12', 'FIN');
$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('E12')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');

$spreadsheet->getActiveSheet()
            ->getStyle('E12')
            ->getAlignment()
            ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
$spreadsheet->getActiveSheet()->getStyle('E12')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

$spreadsheet->setActiveSheetIndex(0)->mergeCells('F11:G11')
            ->setCellValue('F11', 'META TOTAL');
$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('F11')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');

$spreadsheet->getActiveSheet()->getStyle('F11')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

$spreadsheet->getActiveSheet()
            ->mergeCells('F12:F13')
            ->setCellValue('F12', 'UNIDAD DE MEDIDA');
$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('F11')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');
$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('F12')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');

$spreadsheet->getActiveSheet()
            ->getStyle('F12')
            ->getAlignment()
            ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
$spreadsheet->getActiveSheet()->getStyle('F12')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

$spreadsheet->getActiveSheet()
            ->mergeCells('G12:G13')
            ->setCellValue('G12', 'CANTIDAD ANUAL');
$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('G12')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');


$spreadsheet->getActiveSheet()
            ->getStyle('G12')
            ->getAlignment()
            ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
$spreadsheet->getActiveSheet()->getStyle('G12')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

/*$spreadsheet->setActiveSheetIndex(0)->mergeCells('H11:W11')
            ->setCellValue('H11', 'PROGRAMACIÓN FISICA DE LA META  (Acción Específica)');
$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('H11')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');

$spreadsheet->getActiveSheet()->getStyle('H11')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);*/

// fusionar celdas y establecer el contenido
$spreadsheet->setActiveSheetIndex(0)->mergeCells('H11:W12')
    ->setCellValue('H11', 'PROGRAMACIÓN FISICA DE LA META  (Acción Específica)');

// obtener la hoja activa
$worksheet = $spreadsheet->getActiveSheet();

// establecer la alineación horizontal y vertical del texto en el centro de la celda
$cell = $worksheet->getStyle('H11');
$cell->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
$cell->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);

// extender la fusión de celdas a la fila 12
$worksheet->getStyle('H12')->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);

// Aplicar estilo de relleno a la celda
$worksheet->getStyle('H11:W12')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');

$spreadsheet->getActiveSheet()
            ->mergeCells('X11:X13')
            ->setCellValue('X11', 'ACTIVIDADES');
$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('X11')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');

$spreadsheet->getActiveSheet()
            ->getStyle('X11')
            ->getAlignment()
            ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
$spreadsheet->getActiveSheet()->getStyle('X11')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

$spreadsheet->setActiveSheetIndex(0)->mergeCells('Y11:Z11')
            ->setCellValue('Y11', 'META DE LA ACTIVIDAD');
$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('Y11')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');

$spreadsheet->getActiveSheet()->getStyle('Y11')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

$spreadsheet->getActiveSheet()
            ->mergeCells('Y12:Y13')
            ->setCellValue('Y12', 'UNIDAD DE MEDIDA');
$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('Y12')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');


$spreadsheet->getActiveSheet()
            ->getStyle('Y12')
            ->getAlignment()
            ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
$spreadsheet->getActiveSheet()->getStyle('Y12')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

$spreadsheet->getActiveSheet()
            ->mergeCells('Z12:Z13')
            ->setCellValue('Z12', 'CANTIDAD ANUAL');
$worksheet = $spreadsheet->getActiveSheet();
$worksheet->getStyle('Z12')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');


$spreadsheet->getActiveSheet()
            ->getStyle('Z12')
            ->getAlignment()
            ->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
$spreadsheet->getActiveSheet()->getStyle('Z12')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

// fusionar celdas y establecer el contenido
$spreadsheet->setActiveSheetIndex(0)->mergeCells('AA11:AP12')
    ->setCellValue('AA11', 'PROGRAMACIÓN FISICA DE LA META  DE LA ACTIVIDAD');

// obtener la hoja activa
$worksheet = $spreadsheet->getActiveSheet();

// establecer alineación horizontal y vertical del texto en el centro de la celda
$cell = $worksheet->getStyle('AA11');
$cell->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
$cell->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);

// extender la fusión de celdas a la fila 12
$worksheet->getStyle('AA12:AP12')->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);

// aplicar estilo de relleno a la celda
$worksheet->getStyle('AA11:AP12')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('3CB9E8');

// Define el estilo
$styleArray = [
    'font' => [
        'color' => [
            'argb' => \PhpOffice\PhpSpreadsheet\Style\Color::COLOR_WHITE,
        ],
    ],
    'borders' => [
        'allBorders' => [
            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
            'color' => [
                'argb' => \PhpOffice\PhpSpreadsheet\Style\Color::COLOR_BLACK,
            ],
        ],
    ],
];

// Aplica el estilo a las celdas de las filas 10, 11, 12 y 13 desde la columna A hasta la AP
$worksheet->getStyle('A10:AP13')->applyFromArray($styleArray);


// Define el estilo
$styleArray = [
    'alignment' => [
        'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
    ],
    'fill' => [
        'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
        'startColor' => [
            'argb' => 'FFC0C0C0',
        ],
    ],
];

// Aplica el estilo a las celdas de las filas H13 hasta W13
$worksheet->getStyle('H13:W13')->applyFromArray($styleArray);

// Define el estilo
$styleArray = [
    'alignment' => [
        'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
    ],
    'fill' => [
        'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
        'startColor' => [
            'argb' => 'FFC0C0C0',
        ],
    ],
];

// Aplica el estilo a las celdas de las filas H13 hasta W13
$worksheet->getStyle('AA13:AP13')->applyFromArray($styleArray);

// establecemos el ancho de las columnas
$sheet = $spreadsheet->getActiveSheet();
$sheet->getColumnDimension('A')->setWidth(50);
$sheet->getColumnDimension('B')->setWidth(10);
$sheet->getColumnDimension('C')->setWidth(27);
$sheet->getColumnDimension('D')->setWidth(12);
$sheet->getColumnDimension('E')->setWidth(12);
$sheet->getColumnDimension('F')->setWidth(20);
$sheet->getColumnDimension('G')->setWidth(20);
$sheet->getColumnDimension('H')->setWidth(4);
$sheet->getColumnDimension('I')->setWidth(4);
$sheet->getColumnDimension('J')->setWidth(4);
$sheet->getColumnDimension('K')->setWidth(4);
$sheet->getColumnDimension('L')->setWidth(4);
$sheet->getColumnDimension('M')->setWidth(4);
$sheet->getColumnDimension('N')->setWidth(4);
$sheet->getColumnDimension('O')->setWidth(4);
$sheet->getColumnDimension('P')->setWidth(4);
$sheet->getColumnDimension('Q')->setWidth(4);
$sheet->getColumnDimension('R')->setWidth(4);
$sheet->getColumnDimension('S')->setWidth(4);
$sheet->getColumnDimension('T')->setWidth(4);
$sheet->getColumnDimension('U')->setWidth(4);
$sheet->getColumnDimension('V')->setWidth(4);
$sheet->getColumnDimension('W')->setWidth(4);
$sheet->getColumnDimension('X')->setWidth(65);
$sheet->getColumnDimension('Y')->setWidth(25);
$sheet->getColumnDimension('Z')->setWidth(20);
$sheet->getColumnDimension('AA')->setWidth(4);
$sheet->getColumnDimension('AB')->setWidth(4);
$sheet->getColumnDimension('AC')->setWidth(4);
$sheet->getColumnDimension('AD')->setWidth(4);
$sheet->getColumnDimension('AE')->setWidth(4);
$sheet->getColumnDimension('AF')->setWidth(4);
$sheet->getColumnDimension('AG')->setWidth(4);
$sheet->getColumnDimension('AH')->setWidth(4);
$sheet->getColumnDimension('AI')->setWidth(4);
$sheet->getColumnDimension('AJ')->setWidth(4);
$sheet->getColumnDimension('AK')->setWidth(4);
$sheet->getColumnDimension('AL')->setWidth(4);
$sheet->getColumnDimension('AM')->setWidth(4);
$sheet->getColumnDimension('AN')->setWidth(4);
$sheet->getColumnDimension('AO')->setWidth(4);
$sheet->getColumnDimension('AP')->setWidth(4);


$spreadsheet->setActiveSheetIndex(0)
    ->mergeCells('A5:AP5') // expandimos el rango de la celda A5 hasta la columna AP
    ->setCellValue('A5', '1. PROYECTO: ' . $consulta1['descripcion']);

$spreadsheet->setActiveSheetIndex(0)
    ->mergeCells('A6:AP6') // expandimos el rango de la celda A5 hasta la columna AP
    ->setCellValue('A6', '2. OBJETIVO DEL PROYECTO:  ' . $consulta1['objetivo']);


$spreadsheet->setActiveSheetIndex(0)
    ->mergeCells('A7:AP7') // expandimos el rango de la celda A5 hasta la columna AP
    ->setCellValue('A7', '3. UNIDAD EJECUTORA: ' . $consulta1['gerencia']);

// Actualizamos las referencias de las otras celdas que continúan debajo
$spreadsheet->getActiveSheet()
            //->getStyle('A5:W13')->getAlignment()->setHorizontal('center')
            ->mergeCells('A11:A13')
            ->mergeCells('E11:E13')
            ->mergeCells('X11:X13')
            //->setCellValue('A5',  '1. PROYECTO: '.$consulta1['descripcion'])
            //->setCellValue('A6', '2. OBJETIVO DEL PROYECTO: '.$consulta1['objetivo'])
            //->setCellValue('A7', '3. UNIDAD EJECUTORA: '.$consulta1['gerencia'])
            ->setCellValue('H13', 'E')
            ->setCellValue('I13', 'F')
            ->setCellValue('J13', 'M')
            ->setCellValue('K13', 'I T')
            ->setCellValue('L13', 'A')
            ->setCellValue('M13', 'M')
            ->setCellValue('N13', 'J')
            ->setCellValue('O13', 'II T')
            ->setCellValue('P13', 'J')
            ->setCellValue('Q13', 'A')
            ->setCellValue('R13', 'S')
            ->setCellValue('S13', 'III T')
            ->setCellValue('T13', 'O')
            ->setCellValue('U13', 'N')
            ->setCellValue('V13', 'D')
            ->setCellValue('W13', 'IV T')
            ->setCellValue('E12', 'FIN')
            ->setCellValue('AA13', 'E')
            ->setCellValue('AB13', 'F')
            ->setCellValue('AC13', 'M')
            ->setCellValue('AD13', 'I T')
            ->setCellValue('AE13', 'A')
            ->setCellValue('AF13', 'M')
            ->setCellValue('AG13', 'J')
            ->setCellValue('AH13', 'II T')
            ->setCellValue('AI13', 'J')
            ->setCellValue('AJ13', 'A')
            ->setCellValue('AK13', 'S')
            ->setCellValue('AL13', 'III T')
            ->setCellValue('AM13', 'O')
            ->setCellValue('AN13', 'N')
            ->setCellValue('AO13', 'D')
            ->setCellValue('AP13', 'IV T');

        $i = 14;
        foreach ($consulta as $resultado) {

            $fecha_original_inicio = $resultado['fecha_inicio'];
            $fecha_formateada_inicio = date('d/m/Y', strtotime($fecha_original_inicio));

            $fecha_original_fin = $resultado['fecha_fin'];
            $fecha_formateada_fin = date('d/m/Y', strtotime($fecha_original_fin));


            $spreadsheet->setActiveSheetIndex(0)
                ->setCellValue('A'.$i, $resultado['accion_especifica'])
                ->setCellValue('B'.$i, "%")
                ->setCellValue('C'.$i, "Resultado bien o servicio")
                ->setCellValue('D'.$i, $fecha_formateada_inicio)
                ->setCellValue('E'.$i, $fecha_formateada_fin)
                ->setCellValue('F'.$i, $resultado['unidad_medida_accion'])
                ->setCellValue('G'.$i, $resultado['totalmes_accion'])
                ->setCellValue('H'.$i, $resultado['enero'])
                ->setCellValue('I'.$i, $resultado['febrero'])
                ->setCellValue('J'.$i, $resultado['marzo'])
                ->setCellValue('K'.$i, $resultado['t1'])
                ->setCellValue('L'.$i, $resultado['abril'])
                ->setCellValue('M'.$i, $resultado['mayo'])
                ->setCellValue('N'.$i, $resultado['junio'])
                ->setCellValue('O'.$i, $resultado['t2'])
                ->setCellValue('P'.$i, $resultado['julio'])
                ->setCellValue('Q'.$i, $resultado['agosto'])
                ->setCellValue('R'.$i, $resultado['septiembre'])
                ->setCellValue('S'.$i, $resultado['t3'])
                ->setCellValue('T'.$i, $resultado['octubre'])
                ->setCellValue('U'.$i, $resultado['noviembre'])
                ->setCellValue('V'.$i, $resultado['diciembre'])
                ->setCellValue('W'.$i, $resultado['t4'])
                ->setCellValue('X'.$i, $resultado['actividades'])
                ->setCellValue('Y'.$i, $resultado['unidadmedida_actividad'])
                ->setCellValue('Z'.$i, $resultado['total_actividades'])
                ->setCellValue('AA'.$i, $resultado['enero_act'])
                ->setCellValue('AB'.$i, $resultado['febrero_act'])
                ->setCellValue('AC'.$i, $resultado['marzo_act'])
                ->setCellValue('AD'.$i, $resultado['t1_act'])
                ->setCellValue('AE'.$i, $resultado['abril_act'])
                ->setCellValue('AF'.$i, $resultado['mayo_act'])
                ->setCellValue('AG'.$i, $resultado['junio_act'])
                ->setCellValue('AH'.$i, $resultado['t2_act'])
                ->setCellValue('AI'.$i, $resultado['julio_act'])
                ->setCellValue('AJ'.$i, $resultado['agosto_act'])
                ->setCellValue('AK'.$i, $resultado['septiembre_act'])
                ->setCellValue('AL'.$i, $resultado['t3_act'])
                ->setCellValue('AM'.$i, $resultado['octubre_act'])
                ->setCellValue('AN'.$i, $resultado['noviembre_act'])
                ->setCellValue('AO'.$i, $resultado['diciembre_act'])
                ->setCellValue('AP'.$i, $resultado['t4_act']);
           for ($col = 'A'; $col !== 'AQ'; $col++) {
        $spreadsheet->getActiveSheet()
            ->getStyle($col.$i)
            ->getAlignment()
            ->setHorizontal(Alignment::HORIZONTAL_CENTER)
            ->setVertical(Alignment::VERTICAL_CENTER);
    }

    // Agregar bordes a las celdas
    $borderStyle = [
        'borders' => [
            'allBorders' => [
                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                'color' => [
                    'rgb' => '000000'
                ]
            ]
        ]
    ];
    $spreadsheet->getActiveSheet()->getStyle('A'.$i.':AP'.$i)->applyFromArray($borderStyle);

    $i++;
}

            

        // Rename worksheet
        $spreadsheet->getActiveSheet()->setTitle('plan operativo anual');
        // Set active sheet index to the first sheet, so Excel opens this as the first sheet
        $spreadsheet->setActiveSheetIndex(0);


        // Redirect output to a client’s web browser (Xlsx)
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="plan_operativo_anual.xlsx"');
        header('Cache-Control: max-age=0');
        // If you're serving to IE 9, then the following may be needed
        header('Cache-Control: max-age=1');
        // If you're serving to IE over SSL, then the following may be needed
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
        header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
        header('Pragma: public'); // HTTP/1.0

        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        $writer->save('php://output');
        exit;
        //echo 'hola';
        //echo $id;
    }
}
