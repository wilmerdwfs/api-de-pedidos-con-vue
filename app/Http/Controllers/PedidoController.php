<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\PedidoRepository;

class PedidoController extends Controller
{
    protected $pedidosRepository; 
    public function __construct(PedidoRepository $pedidoRespository){
        $this->pedidoRepository = $pedidoRespository;
    }
    public function index()
    {
        return response()->json(
            [
                'dtPedidos' => $this->pedidoRepository->all(),
            ]
        );
        
    }

    public function buscarArticulo($criterio)
    {
        return response()->json(
            [
                'dtArticulos' => $this->pedidoRepository->buscarArticulo($criterio),
            ]
        );
        
    }

    public function datosIniciales()
    {
        return response()->json(
            [
                'dtPedidos' => $this->pedidoRepository->all(),
            ]
        );
        
    }

    public function generarPedido(Request $request)
    {
        $data = $request->all();
        
        return response()->json(
            [
                'dtPedido' => $this->pedidoRepository->generarPedido( $data ),
            ]
        );
        
    }
}
