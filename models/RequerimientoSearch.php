<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Requerimiento;

/**
 * RequerimientoSearch represents the model behind the search form of `app\models\Requerimiento`.
 */
class RequerimientoSearch extends Requerimiento
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idproducto', 'idmedida', 'idespecifico', 'iva'], 'integer'],
            [['producto'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Requerimiento::find()->orderBy(['idproducto' => SORT_DESC]);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => false,
            'pagination' => [
            'pageSize' => 10,
            ],

        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'idproducto' => $this->idproducto,
            'idmedida' => $this->idmedida,
            'idespecifico' => $this->idespecifico,
            'iva' => $this->iva,
        ]);

        $query->andFilterWhere(['ilike', 'producto', $this->producto]);

        return $dataProvider;
    }
}
