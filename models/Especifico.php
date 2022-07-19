<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "especifico".
 *
 * @property int $id_especifico
 * @property int|null $id_generico
 * @property string|null $codigo
 * @property string|null $descripcion
 *
 * @property Basecalculo[] $basecalculos
 * @property Generico $generico
 * @property Requerimiento[] $requerimientos
 */
class Especifico extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'especifico';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_generico'], 'default', 'value' => null],
            [['id_generico'], 'integer'],
            [['descripcion'], 'string'],
            [['codigo'], 'string', 'max' => 15],
            [['id_generico'], 'exist', 'skipOnError' => true, 'targetClass' => Generico::className(), 'targetAttribute' => ['id_generico' => 'id_generico']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_especifico' => 'Id Especifico',
            'id_generico' => 'Id Generico',
            'codigo' => 'Codigo',
            'descripcion' => 'Descripcion',
        ];
    }

    /**
     * Gets query for [[Basecalculos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBasecalculos()
    {
        return $this->hasMany(Basecalculo::className(), ['id_especifico' => 'id_especifico']);
    }

    /**
     * Gets query for [[Generico]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGenerico()
    {
        return $this->hasOne(Generico::className(), ['id_generico' => 'id_generico']);
    }

    /**
     * Gets query for [[Requerimientos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequerimientos()
    {
        return $this->hasMany(Requerimiento::className(), ['idespecifico' => 'id_especifico']);
    }
}