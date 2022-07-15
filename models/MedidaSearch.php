<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Medida;

/**
 * MedidaSearch represents the model behind the search form of `app\models\Medida`.
 */
class MedidaSearch extends Medida
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idmedida'], 'integer'],
            [['medida'], 'safe'],
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
        $query = Medida::find()->orderBy(['idmedida' => SORT_DESC]);

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
            'idmedida' => $this->idmedida,
        ]);

        $query->andFilterWhere(['ilike', 'medida', $this->medida]);

        return $dataProvider;
    }
}
