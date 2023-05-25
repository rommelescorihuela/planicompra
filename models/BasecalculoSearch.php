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
        $query = Basecalculo::find()
        ->innerjoin('poa','poa.idpoa = basecalculo.id_poa')
        ->orderBy(['id_poa' => SORT_DESC,'id_plan' => SORT_DESC]);

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
            'basecalculo.id_plan' => $this->id_plan,
            'basecalculo.id_poa' => $this->id_poa,
            'basecalculo.id_accion' => $this->id_accion,
            'basecalculo.id_actividad' => $this->id_actividad,
            'basecalculo.id_producto' => $this->id_producto,
            'basecalculo.id_medida' => $this->id_medida,
            'basecalculo.cantidad' => $this->cantidad,
            'basecalculo.monto_total' => $this->monto_total,
            'basecalculo.id_gerencia' => $this->id_gerencia,
            'basecalculo.fecha' => $this->fecha,
            'basecalculo.id_partida' => $this->id_partida,
            'basecalculo.id_generica' => $this->id_generica,
            'basecalculo.id_especifico' => $this->id_especifico,
            'basecalculo.costo' => $this->costo,
            'basecalculo.id_usuario' => $this->id_usuario,
            'basecalculo.iva' => $this->iva,
            'basecalculo.total_iva' => $this->total_iva,
            'basecalculo.iva_monto' => $this->iva_monto,
            'basecalculo.fecha_h' => $this->fecha_h,
            'basecalculo.id_moneda' => $this->id_moneda,
            'basecalculo.n_dias' => $this->n_dias,
            'basecalculo.fecha_i' => $this->fecha_i,
            'basecalculo.fecha_f' => $this->fecha_f,
            'basecalculo.estatus' => $this->estatus,
            'basecalculo.enero' => $this->enero,
            'basecalculo.febrero' => $this->febrero,
            'basecalculo.marzo' => $this->marzo,
            'basecalculo.abril' => $this->abril,
            'basecalculo.mayo' => $this->mayo,
            'basecalculo.junio' => $this->junio,
            'basecalculo.julio' => $this->julio,
            'basecalculo.agosto' => $this->agosto,
            'basecalculo.septiembre' => $this->septiembre,
            'basecalculo.octubre' => $this->octubre,
            'basecalculo.noviembre' => $this->noviembre,
            'basecalculo.diciembre' => $this->diciembre,
        ]);

        $query->andWhere(['poa.idvisibilidad' => null]);

        return $dataProvider;
    }
}
