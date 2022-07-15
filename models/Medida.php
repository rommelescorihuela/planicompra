<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "medida".
 *
 * @property int $idmedida
 * @property string|null $medida
 *
 * @property BaseCalculo[] $baseCalculos
 * @property Costo[] $costos
 * @property Producto[] $productos
 */
class Medida extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'medida';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['medida'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idmedida' => 'Idmedida',
            'medida' => 'Medida',
        ];
    }

    /**
     * Gets query for [[BaseCalculos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBaseCalculos()
    {
        return $this->hasMany(BaseCalculo::className(), ['id_medida' => 'idmedida']);
    }

    /**
     * Gets query for [[Costos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCostos()
    {
        return $this->hasMany(Costo::className(), ['idmedida' => 'idmedida']);
    }

    /**
     * Gets query for [[Productos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProductos()
    {
        return $this->hasMany(Producto::className(), ['idmedida' => 'idmedida']);
    }
}
