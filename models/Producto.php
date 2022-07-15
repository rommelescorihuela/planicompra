<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "producto".
 *
 * @property int $idproducto
 * @property string|null $producto
 * @property int|null $idmedida
 * @property int|null $idespecifico
 * @property int|null $iva
 *
 * @property Basecalculo[] $basecalculos
 * @property Costo[] $costos
 * @property Especifico $idespecifico0
 * @property Medida $idmedida0
 * @property Iva $iva0
 */
class Producto extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'producto';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['producto'], 'string'],
            [['idmedida', 'idespecifico', 'iva'], 'default', 'value' => null],
            [['idmedida', 'idespecifico', 'iva'], 'integer'],
            [['idespecifico'], 'exist', 'skipOnError' => true, 'targetClass' => Especifico::className(), 'targetAttribute' => ['idespecifico' => 'id_especifico']],
            [['iva'], 'exist', 'skipOnError' => true, 'targetClass' => Iva::className(), 'targetAttribute' => ['iva' => 'id_iva']],
            [['idmedida'], 'exist', 'skipOnError' => true, 'targetClass' => Medida::className(), 'targetAttribute' => ['idmedida' => 'idmedida']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idproducto' => 'Idproducto',
            'producto' => 'Producto',
            'idmedida' => 'Idmedida',
            'idespecifico' => 'Idespecifico',
            'iva' => 'Iva',
        ];
    }

    /**
     * Gets query for [[Basecalculos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBasecalculos()
    {
        return $this->hasMany(Basecalculo::className(), ['id_producto' => 'idproducto']);
    }

    /**
     * Gets query for [[Costos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCostos()
    {
        return $this->hasMany(Costo::className(), ['idproducto' => 'idproducto']);
    }

    /**
     * Gets query for [[Idespecifico0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdespecifico0()
    {
        return $this->hasOne(Especifico::className(), ['id_especifico' => 'idespecifico']);
    }

    /**
     * Gets query for [[Idmedida0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdmedida0()
    {
        return $this->hasOne(Medida::className(), ['idmedida' => 'idmedida']);
    }

    /**
     * Gets query for [[Iva0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIva0()
    {
        return $this->hasOne(Iva::className(), ['id_iva' => 'iva']);
    }
}
