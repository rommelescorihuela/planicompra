<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "iva".
 *
 * @property int $id_iva
 * @property int|null $iva
 *
 * @property Producto[] $productos
 * @property TblProducto[] $tblProductos
 */
class Iva extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'iva';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['iva'], 'default', 'value' => null],
            [['iva'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_iva' => 'Id Iva',
            'iva' => 'Iva',
        ];
    }

    /**
     * Gets query for [[Productos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProductos()
    {
        return $this->hasMany(Producto::className(), ['iva' => 'id_iva']);
    }
}