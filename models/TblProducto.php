<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tbl_producto".
 *
 * @property int $id_producto
 * @property string|null $producto
 * @property float|null $costo
 * @property int|null $id_especifico
 * @property int|null $iva
 *
 * @property Especifico $especifico
 * @property Iva $iva0
 * @property TblMedida[] $tblMedidas
 */
class TblProducto extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_producto';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['producto'], 'string'],
            [['costo'], 'number'],
            [['id_especifico', 'iva'], 'default', 'value' => null],
            [['id_especifico', 'iva'], 'integer'],
            [['id_especifico'], 'exist', 'skipOnError' => true, 'targetClass' => Especifico::className(), 'targetAttribute' => ['id_especifico' => 'id_especifico']],
            [['iva'], 'exist', 'skipOnError' => true, 'targetClass' => Iva::className(), 'targetAttribute' => ['iva' => 'id_iva']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_producto' => 'Id Producto',
            'producto' => 'Producto',
            'costo' => 'Costo',
            'id_especifico' => 'Id Especifico',
            'iva' => 'Iva',
        ];
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
     * Gets query for [[Iva0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIva0()
    {
        return $this->hasOne(Iva::className(), ['id_iva' => 'iva']);
    }

    /**
     * Gets query for [[TblMedidas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTblMedidas()
    {
        return $this->hasMany(TblMedida::className(), ['id_producto' => 'id_producto']);
    }
}
