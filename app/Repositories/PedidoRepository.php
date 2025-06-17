<?php

namespace App\Repositories;

use App\Models\Pedido;
use App\Models\PedidoItem;
use App\Models\Articulo;
use Illuminate\Support\Facades\DB;

class PedidoRepository
{
    public function all()
    {
       return Pedido::with(['cliente', 'sitioEntrega'])->get();
    }

    public function generarPedido($data)
    {
        return DB::transaction(function () use ($data) {
            // Crear el pedido
            $pedido = Pedido::create([
                'idCliente' => $data['idCliente'],
                'idSitioEntrega' => $data['idSitioEntrega'],
                'fecDoc' => $data['fecDoc'],
            ]);

            // Crear los items del pedido
            foreach ($data['items'] as $item) {
                PedidoItem::create([
                    'idPedido' => $pedido->id,
                    'idArticulo' => $item['id'],
                    'cantidad' => $item['cantidad'],
                    'precio' => $item['precio'],
                    'totalBruto' => $item['total'],
                ]);
            }

            return Pedido::with('items')->find($pedido->id);
        });
    }

    public function buscarArticulo($criterio)
    {
        return Articulo::where('nombre', 'LIKE', "%{$criterio}%")
                   ->get();
    }

}