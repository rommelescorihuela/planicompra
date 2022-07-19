<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "actividades".
 *
 * @property int $idactividad
 * @property int|null $idaccionespecifica
 * @property string|null $descripcion
 * @property int|null $id_poa
 * @property int|null $id_tipo
 * @property int|null $id_gerencia         
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
            [['idaccionespecifica', 'id_poa', 'id_tipo', 'id_gerencia'], 'default', 'value' => null],
            [['idaccionespecifica', 'id_poa', 'id_tipo', 'id_gerencia'], 'integer'],
            [['descripcion'], 'string'],
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
            'id_tipo'=>'Categoria',
            'id_poa' => 'Proyecto o Acción Centralizada',
            'idactividad' => 'Idactividad',
            'idaccionespecifica' => 'Accion Especifica',
            'descripcion' => 'Actividad',
            'id_gerencia' => 'Dependencia'
        ];
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
        if (Yii::$app->user->identity->id_perfil == 1)  {
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
