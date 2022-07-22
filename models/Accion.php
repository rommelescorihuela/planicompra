<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "accion".
 *
 * @property int $id_accion
 * @property string|null $descripcion
 * @property int|null $idpoa
 * @property int|null $idgerencia
 * @property int|null $id_tipo
 * @property int|null $poderacion 
 * @property string|null $fechainicio 
 * @property string|null $fechafin 
 * @property string|null $servicio 
 * @property string|null $unidadmedida 
 * @property int|null $enero 
 * @property int|null $febrero 
 * @property int|null $marzo 
 * @property int|null $abril 
 * @property int|null $mayo 
 * @property int|null $junio 
 * @property int|null $julio 
 * @property int|null $agosto 
 * @property int|null $septiembre 
 * @property int|null $octubre 
 * @property int|null $noviembre 
 * @property int|null $diciembre 
 *
 * @property Actividades[] $actividades
 * @property Basecalculo[] $basecalculos
 * @property Gerencia $idgerencia0
 * @property Poa $idpoa0
 * @property Tipo $tipo
 */

class Accion extends \yii\db\ActiveRecord
{   
    public $distribucion;
    public $cantidad;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'accion';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['descripcion', 'servicio', 'unidadmedida'], 'string'],
            [['idpoa', 'idgerencia', 'id_tipo', 'poderacion', 'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'], 'default', 'value' => null],
            [['idpoa', 'idgerencia', 'id_tipo', 'poderacion', 'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'], 'integer'],
            [['fechainicio', 'fechafin'], 'safe'],
            [['idgerencia'], 'exist', 'skipOnError' => true, 'targetClass' => Gerencia::className(), 'targetAttribute' => ['idgerencia' => 'id_gerencia']],
            [['idpoa'], 'exist', 'skipOnError' => true, 'targetClass' => Poa::className(), 'targetAttribute' => ['idpoa' => 'idpoa']],
            [['id_tipo'], 'exist', 'skipOnError' => true, 'targetClass' => Tipo::className(), 'targetAttribute' => ['id_tipo' => 'id_tipo']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_accion' => 'Id Accion',
            'descripcion' => 'Descripcion',
            'idpoa' => 'Idpoa',
            'idgerencia' => 'Idgerencia',
            'id_tipo' => 'Id Tipo',
            'poderacion' => 'Poderacion',
            'fechainicio' => 'Fechainicio',
            'fechafin' => 'Fechafin',
            'servicio' => 'Servicio',
            'unidadmedida' => 'Unidadmedida',
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

        ];
    }

    /**
     * Gets query for [[Actividades]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getActividades()
    {
        return $this->hasMany(Actividades::className(), ['idaccionespecifica' => 'id_accion']);
    }

    /** 
    * Gets query for [[Basecalculos]]. 
    * 
    * @return \yii\db\ActiveQuery 
    */ 
    public function getBasecalculos() 
    { 
       return $this->hasMany(Basecalculo::className(), ['id_accion' => 'id_accion']); 
    }
    /**

    /**
     * Gets query for [[Idgerencia0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdgerencia0()
    {
        return $this->hasOne(Gerencia::className(), ['id_gerencia' => 'idgerencia']);
    }

    /**
     * Gets query for [[Idpoa0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdpoa0()
    {
        return $this->hasOne(Poa::className(), ['idpoa' => 'idpoa']);
    }

    /**
     * Gets query for [[Tipo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipo()
    {
        return $this->hasOne(Tipo::className(), ['id_tipo' => 'id_tipo']);
    }

    public static function Lista_poa()
    {
    if (Yii::$app->user->identity->id_perfil == 1) {
            $poa=Poa::find()->orderBy('descripcion')->all();
            $listapoa=ArrayHelper::map($poa, 'idpoa', 'descripcion');
            return $listapoa;
    } else {
            $poa=Poa::find()->where(['id_gerencia' => Yii::$app->user->identity->id_gerencia])->orderBy('descripcion')->all();
            $listapoa=ArrayHelper::map($poa, 'idpoa', 'descripcion');
            return $listapoa;
    }
    }
    public static function Lista_gerenci()
    {
        $gerencia=Gerencia::find()->orderBy('gerencia')->all();
        $listagerenci=ArrayHelper::map($gerencia, 'id_gerencia', 'gerencia');
        return $listagerenci;
    }
    public static function Lista_tipo()
    {
        if (Yii::$app->user->identity->id_perfil == 1)  {
            $tipo = Tipo::find()->orderBy('tipo')->all();
            $listatipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
        }else{
            $tipo = Tipo::find()->Where(['id_tipo'=> 2])->orderBy('tipo')->all();
            $listatipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo');
        }
        return $listatipo;
    }
}
