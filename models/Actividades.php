<?php

namespace app\models;
use yii\helpers\ArrayHelper;
use Yii;

/**
 * This is the model class for table "actividades".
 *
 * @property int $idactividad
 * @property int|null $idaccionespecifica
 * @property string|null $descripcion
 * @property int|null $id_poa
 * @property int|null $id_tipo
 * @property int|null $id_gerencia
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
 * @property Basecalculo[] $basecalculos
 * @property Gerencia $gerencia
 * @property Accion $idaccionespecifica0
 * @property Poa $poa
 * @property Tipo $tipo
 */
class Actividades extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'actividades';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idaccionespecifica', 'id_poa', 'id_tipo', 'id_gerencia', 'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'], 'default', 'value' => null],
            [['idaccionespecifica', 'id_poa', 'id_tipo', 'id_gerencia', 'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'], 'integer'],
            [['descripcion', 'unidadmedida'], 'string'],
            [['idaccionespecifica'], 'exist', 'skipOnError' => true, 'targetClass' => Accion::className(), 'targetAttribute' => ['idaccionespecifica' => 'id_accion']],
            [['id_gerencia'], 'exist', 'skipOnError' => true, 'targetClass' => Gerencia::className(), 'targetAttribute' => ['id_gerencia' => 'id_gerencia']],
            [['id_poa'], 'exist', 'skipOnError' => true, 'targetClass' => Poa::className(), 'targetAttribute' => ['id_poa' => 'idpoa']],
            [['id_tipo'], 'exist', 'skipOnError' => true, 'targetClass' => Tipo::className(), 'targetAttribute' => ['id_tipo' => 'id_tipo']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idactividad' => 'Idactividad',
            'idaccionespecifica' => 'Idaccionespecifica',
            'descripcion' => 'Descripcion',
            'id_poa' => 'Id Poa',
            'id_tipo' => 'Id Tipo',
            'id_gerencia' => 'Id Gerencia',
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
     * Gets query for [[Basecalculos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBasecalculos()
    {
        return $this->hasMany(Basecalculo::className(), ['id_actividad' => 'idactividad']);
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
     * Gets query for [[Idaccionespecifica0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdaccionespecifica0()
    {
        return $this->hasOne(Accion::className(), ['id_accion' => 'idaccionespecifica']);
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
     * Gets query for [[Tipo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipo()
    {
        return $this->hasOne(Tipo::className(), ['id_tipo' => 'id_tipo']);
    }
    public static function Lista_especifi() 
       { 
           if (Yii::$app->user->identity->id_perfil == 1) { 
           $idaccionespecifica=Accion::find()->orderBy('descripcion')->all(); 
           $listaaccion=ArrayHelper::map($idaccionespecifica, 'id_accion', 'descripcion'); 
           return $listaaccion; 
           } else { 
           $idaccionespecifica=Accion::find()->where(['idgerencia' => Yii::$app->user->identity->id_gerencia])->orderBy('descripcion')->all(); 
           $listaaccion=ArrayHelper::map($idaccionespecifica, 'id_accion', 'descripcion'); 
           return $listaaccion; 
           } 
       } 
       public static function Lista_tipo() 
       { 
           if (Yii::$app->user->identity->id_perfil == 1) { 
               $tipo = Tipo::find()->orderBy('tipo')->all(); 
               $listatipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo'); 
           }else{ 
               $tipo = Tipo::find()->Where(['id_tipo'=> 2])->orderBy('tipo')->all(); 
               $listatipo = ArrayHelper::map($tipo, 'id_tipo', 'tipo'); 
           } 
           return $listatipo; 
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
}
