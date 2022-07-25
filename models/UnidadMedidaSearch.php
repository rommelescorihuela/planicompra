<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\UnidadMedida;

/**
 * UnidadMedidaSearch represents the model behind the search form of `app\models\UnidadMedida`.
 */
class UnidadMedidaSearch extends UnidadMedida
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'total', 'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre', 'id_actividad'], 'integer'],
            [['unidadmedida'], 'safe'],
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
        $query = UnidadMedida::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'total' => $this->total,
            'enero' => $this->enero,
            'febrero' => $this->febrero,
            'marzo' => $this->marzo,
            'abril' => $this->abril,
            'mayo' => $this->mayo,
            'junio' => $this->junio,
            'julio' => $this->julio,
            'agosto' => $this->agosto,
            'septiembre' => $this->septiembre,
            'octubre' => $this->octubre,
            'noviembre' => $this->noviembre,
            'diciembre' => $this->diciembre,
            'id_actividad' => $this->id_actividad,
        ]);

        $query->andFilterWhere(['ilike', 'unidadmedida', $this->unidadmedida]);

        return $dataProvider;
    }
}
