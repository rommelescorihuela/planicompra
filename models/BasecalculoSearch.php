<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Basecalculo;

/**
 * BasecalculoSearch represents the model behind the search form of `app\models\Basecalculo`.
 */
class BasecalculoSearch extends Basecalculo
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_plan', 'id_poa', 'id_accion', 'id_actividad', 'id_producto', 'id_medida', 'cantidad', 'id_gerencia', 'id_partida', 'id_generica', 'id_especifico', 'id_usuario', 'iva', 'id_moneda', 'n_dias'], 'integer'],
            [['monto_total', 'costo', 'total_iva', 'iva_monto', 'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'], 'number'],
            [['fecha', 'fecha_h', 'fecha_i', 'fecha_f'], 'safe'],
            [['estatus'], 'boolean'],
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
        $query = Basecalculo::find()->orderBy(['id_poa' => SORT_DESC,'id_plan' => SORT_DESC]);

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
            'id_plan' => $this->id_plan,
            'id_poa' => $this->id_poa,
            'id_accion' => $this->id_accion,
            'id_actividad' => $this->id_actividad,
            'id_producto' => $this->id_producto,
            'id_medida' => $this->id_medida,
            'cantidad' => $this->cantidad,
            'monto_total' => $this->monto_total,
            'id_gerencia' => $this->id_gerencia,
            'fecha' => $this->fecha,
            'id_partida' => $this->id_partida,
            'id_generica' => $this->id_generica,
            'id_especifico' => $this->id_especifico,
            'costo' => $this->costo,
            'id_usuario' => $this->id_usuario,
            'iva' => $this->iva,
            'total_iva' => $this->total_iva,
            'iva_monto' => $this->iva_monto,
            'fecha_h' => $this->fecha_h,
            'id_moneda' => $this->id_moneda,
            'n_dias' => $this->n_dias,
            'fecha_i' => $this->fecha_i,
            'fecha_f' => $this->fecha_f,
            'estatus' => $this->estatus,
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
        ]);

        return $dataProvider;
    }
}
