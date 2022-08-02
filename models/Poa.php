<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "poa".
 *
 * @property int $idpoa
 * @property string|null $descripcion
 * @property string|null $objetivo
 * @property float|null $monto_asignado
 * @property string|null $nombre_apellido
 * @property int|null $id_tipo
 * @property int|null $idvisibilidad
 * @property int|null $id_gerencia
 *
 * @property Accion[] $accions
 * @property Basecalculo[] $basecalculos
 * @property Gerencia $gerencia
 * @property Visibilidad $idvisibilidad0
 * @property Tipo $tipo
 */
class Poa extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'poa';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['descripcion', 'objetivo', 'nombre_apellido'], 'string'],
            [['monto_asignado'], 'number'],
            [['id_tipo', 'idvisibilidad', 'id_gerencia'], 'default', 'value' => null],
            [['id_tipo', 'idvisibilidad', 'id_gerencia'], 'integer'],
            [['id_gerencia'], 'exist', 'skipOnError' => true, 'targetClass' => Gerencia::className(), 'targetAttribute' => ['id_gerencia' => 'id_gerencia']],
            [['id_tipo'], 'exist', 'skipOnError' => true, 'targetClass' => Tipo::className(), 'targetAttribute' => ['id_tipo' => 'id_tipo']],
            [['idvisibilidad'], 'exist', 'skipOnError' => true, 'targetClass' => Visibilidad::className(), 'targetAttribute' => ['idvisibilidad' => 'id_visibilidad']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idpoa' => 'Idpoa',
            'descripcion' => 'Proyecto o Acción Centralizada',
            'objetivo' => 'Objetivo',
            'monto_asignado' => 'Monto Asignado',
            'nombre_apellido' => 'Nombre y Apellido',
            'id_tipo' => 'Categoria',
            'idvisibilidad' => 'Idvisibilidad',
            'id_gerencia' => 'Unidad Ejecutora',
        ];
    }

    /**
     * Gets query for [[Accions]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAccions()
    {
        return $this->hasMany(Accion::className(), ['idpoa' => 'idpoa']);
    }

    /**
     * Gets query for [[Basecalculos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBasecalculos()
    {
        return $this->hasMany(Basecalculo::className(), ['id_poa' => 'idpoa']);
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
     * Gets query for [[Idvisibilidad0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdvisibilidad0()
    {
        return $this->hasOne(Visibilidad::className(), ['id_visibilidad' => 'idvisibilidad']);
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
