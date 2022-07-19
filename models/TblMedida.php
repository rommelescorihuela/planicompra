<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tbl_medida".
 *
 * @property int $id_medida
 * @property string|null $medida
 * @property int|null $id_producto
 * @property float|null $costo_medida
 *
 * @property TblProducto $producto
 */
class TblMedida extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_medida';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_producto'], 'default', 'value' => null],
            [['id_producto'], 'integer'],
            [['costo_medida'], 'number'],
            [['medida'], 'string', 'max' => 50],
            [['id_producto'], 'exist', 'skipOnError' => true, 'targetClass' => TblProducto::className(), 'targetAttribute' => ['id_producto' => 'id_producto']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_medida' => 'Id Medida',
            'medida' => 'Medida',
            'id_producto' => 'Id Producto',
            'costo_medida' => 'Costo Medida',
        ];
    }

    /**
     * Gets query for [[Producto]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProducto()
    {
        return $this->hasOne(TblProducto::className(), ['id_producto' => 'id_producto']);
    }
}
