<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "basecalculo".
 *
 * @property int $id_plan
 * @property int|null $id_poa
 * @property int|null $id_accion
 * @property int|null $id_actividad
 * @property int|null $id_producto
 * @property int|null $id_medida
 * @property int|null $cantidad
 * @property float|null $monto_total
 * @property int|null $id_gerencia
 * @property string|null $fecha
 * @property int|null $id_partida
 * @property int|null $id_generica
 * @property int|null $id_especifico
 * @property float|null $costo
 * @property int|null $id_usuario
 * @property int|null $iva
 * @property float|null $total_iva
 * @property float|null $iva_monto
 * @property string|null $fecha_h
 * @property int|null $id_moneda
 * @property int|null $n_dias
 * @property string|null $fecha_i
 * @property string|null $fecha_f
 * @property bool|null $estatus
 * @property float|null $enero
 * @property float|null $febrero
 * @property float|null $marzo
 * @property float|null $abril
 * @property float|null $mayo
 * @property float|null $junio
 * @property float|null $julio
 * @property float|null $agosto
 * @property float|null $septiembre
 * @property float|null $octubre
 * @property float|null $noviembre
 * @property float|null $diciembre
 * @property float|null $ponderacion
 *
 * @property Accion $accion
 * @property Actividades $actividad
 * @property Especifico $especifico
 * @property Generico $generica
 * @property Gerencia $gerencia
 * @property Medida $medida
 * @property TipoMoneda $moneda
 * @property Partida $partida
 * @property Poa $poa
 * @property Requerimiento $producto
 */
class Basecalculo extends \yii\db\ActiveRecord
{
    public $id_tipo;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'basecalculo';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_poa', 'id_accion', 'id_actividad', 'id_producto', 'id_medida', 'cantidad', 'id_gerencia', 'id_partida', 'id_generica', 'id_especifico', 'id_usuario', 'iva', 'id_moneda', 'n_dias'], 'default', 'value' => null],
            [['id_poa', 'id_accion', 'id_actividad', 'id_producto'], 'required'],
            [['id_poa', 'id_accion', 'id_actividad', 'id_producto', 'id_medida', 'cantidad', 'id_gerencia', 'id_partida', 'id_generica', 'id_especifico', 'id_usuario', 'iva', 'id_moneda', 'n_dias'], 'integer'],
            [['monto_total', 'costo', 'total_iva', 'iva_monto', 'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre', 'ponderacion'], 'number'],
            [['fecha', 'fecha_h', 'fecha_i', 'fecha_f'], 'safe'],
            [['estatus'], 'boolean'],
            [['id_accion'], 'exist', 'skipOnError' => true, 'targetClass' => Accion::className(), 'targetAttribute' => ['id_accion' => 'id_accion']],
            [['id_actividad'], 'exist', 'skipOnError' => true, 'targetClass' => Actividades::className(), 'targetAttribute' => ['id_actividad' => 'idactividad']],
            [['id_especifico'], 'exist', 'skipOnError' => true, 'targetClass' => Especifico::className(), 'targetAttribute' => ['id_especifico' => 'id_especifico']],
            [['id_generica'], 'exist', 'skipOnError' => true, 'targetClass' => Generico::className(), 'targetAttribute' => ['id_generica' => 'id_generico']],
            [['id_gerencia'], 'exist', 'skipOnError' => true, 'targetClass' => Gerencia::className(), 'targetAttribute' => ['id_gerencia' => 'id_gerencia']],
            [['id_medida'], 'exist', 'skipOnError' => true, 'targetClass' => Medida::className(), 'targetAttribute' => ['id_medida' => 'idmedida']],
            [['id_partida'], 'exist', 'skipOnError' => true, 'targetClass' => Partida::className(), 'targetAttribute' => ['id_partida' => 'id']],
            [['id_poa'], 'exist', 'skipOnError' => true, 'targetClass' => Poa::className(), 'targetAttribute' => ['id_poa' => 'idpoa']],
            [['id_producto'], 'exist', 'skipOnError' => true, 'targetClass' => Requerimiento::className(), 'targetAttribute' => ['id_producto' => 'idproducto']],
            [['id_moneda'], 'exist', 'skipOnError' => true, 'targetClass' => TipoMoneda::className(), 'targetAttribute' => ['id_moneda' => 'id_moneda']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_plan' => 'Id Plan',
            'id_poa' => 'Proyecto o Acción Centralizada',
            'id_accion' => 'Accion Especifica',
            'id_actividad' => 'Actividad',
            'id_producto' => 'Producto',
            'id_medida' => 'Medida',
            'cantidad' => 'Cantidad',
            'monto_total' => 'Monto Total',
            'id_gerencia' => 'Dependencia',
            'fecha' => 'Fecha',
            'id_partida' => 'Partida',
            'id_generica' => 'Generica',
            'id_especifico' => 'Especifico',
            'costo' => 'Costo',
            'id_usuario' => 'Usuario',
            'iva' => 'Iva',
            'total_iva' => 'Total Iva',
            'iva_monto' => 'Iva Monto',
            'fecha_h' => 'Fecha H',
            'id_moneda' => 'Id Moneda',
            'n_dias' => 'N Dias',
            'fecha_i' => 'Fecha I',
            'fecha_f' => 'Fecha F',
            'estatus' => 'Estatus',
            'enero' => 'Enero',
            'febrero' => 'Febrero',
            'marzo' => 'Marzo',
            'abril' => 'Abril',
            'mayo' => 'Mayo',
            'junio' => 'Junio',
            'julio' => 'Julio',
            'agosto' => 'Agosto',
            'septiembre' => 'Septiembre',
            'octubre' => 'Octubre',
            'noviembre' => 'Noviembre',
            'diciembre' => 'Diciembre',
            'ponderacion' => 'Ponderacion',
            'id_tipo' => 'Categoria',
        ];
    }

    /**
     * Gets query for [[Accion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAccion()
    {
        return $this->hasOne(Accion::className(), ['id_accion' => 'id_accion']);
    }

    /**
     * Gets query for [[Actividad]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getActividad()
    {
        return $this->hasOne(Actividades::className(), ['idactividad' => 'id_actividad']);
    }

    /**
     * Gets query for [[Especifico]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEspecifico()
    {
        return $this->hasOne(Especifico::className(), ['id_especifico' => 'id_especifico']);
    }

    /**
     * Gets query for [[Generica]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGenerica()
    {
        return $this->hasOne(Generico::className(), ['id_generico' => 'id_generica']);
    }

    /**
     * Gets query for [[Gerencia]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGerencia()
    {
        return $this->hasOne(Gerencia::className(), ['id_gerencia' => 'id_gerencia']);
    }

    /**
     * Gets query for [[Medida]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMedida()
    {
        return $this->hasOne(Medida::className(), ['idmedida' => 'id_medida']);
    }

    /**
     * Gets query for [[Moneda]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMoneda()
    {
        return $this->hasOne(TipoMoneda::className(), ['id_moneda' => 'id_moneda']);
    }

    /**
     * Gets query for [[Partida]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPartida()
    {
        return $this->hasOne(Partida::className(), ['id' => 'id_partida']);
    }

    /**
     * Gets query for [[Poa]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPoa()
    {
        return $this->hasOne(Poa::className(), ['idpoa' => 'id_poa']);
    }

    /**
     * Gets query for [[Producto]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProducto()
    {
        return $this->hasOne(Requerimiento::className(), ['idproducto' => 'id_producto']);
    }
    public static function Lista_poa()
    {
    if (Yii::$app->user->identity->id_perfil == 1) {
        $poa=Poa::find()->orderBy('descripcion')->all();
        $listapoa=ArrayHelper::map($poa, 'idpoa', 'descripcion');
        return $listapoa;
    }else{
        $poa=Poa::find()->where(['id_gerencia' => Yii::$app->user->identity->id_gerencia])->orderBy('descripcion')->all();
        $listapoa=ArrayHelper::map($poa, 'idpoa', 'descripcion');
        return $listapoa;
    }
    }
    public static function Lista_accion()
    {   
    if (Yii::$app->user->identity->id_perfil == 1){
        $accion=Accion::find()->orderBy('descripcion')->all();
        $listaaccion=ArrayHelper::map($accion, 'id_accion', 'descripcion');
        return $listaaccion;
    }else{
        $accion=Accion::find()->where(['idgerencia' => Yii::$app->user->identity->id_gerencia])->orderBy('descripcion')->all();
        $listaaccion=ArrayHelper::map($accion, 'id_accion', 'descripcion');
        return $listaaccion;
    }
    }
    public static function Lista_actividad()
    {
    if (Yii::$app->user->identity->id_perfil == 1){
        $actividad=Actividades::find()->orderBy('descripcion')->all();
        $listaactividad=ArrayHelper::map($actividad, 'idactividad', 'descripcion');
        return $listaactividad;
    }else{
        $actividad=Actividades::find()->where(['id_gerencia' => Yii::$app->user->identity->id_gerencia])->orderBy('descripcion')->all();
        $listaactividad=ArrayHelper::map($actividad, 'idactividad', 'descripcion');
        return $listaactividad;    
    }
    }
    public static function Lista_producto()
    {
        $producto=Requerimiento::find()->orderBy('producto')->all();
        $listaproducto=ArrayHelper::map($producto, 'idproducto', 'producto');
        return $listaproducto;
    }
    public static function Lista_medida()
    {
        $medida=Medida::find()->orderBy('medida')->all();
        $listamedida=ArrayHelper::map($medida, 'idmedida', 'medida');
        return $listamedida;
    }
    public static function Lista_especifica()
    {
        $especifica=Especifico::find()->orderBy('descripcion')->all();
        $listespecifica=ArrayHelper::map($especifica, 'id_especifico', 'descripcion');
        return $listespecifica;
    }
    public static function Lista_iva()
    {
        $iva=Iva::find()->orderBy('iva')->all();
        $listiva=ArrayHelper::map($iva, 'id_iva', 'iva');
        return $listiva;
    }
}
