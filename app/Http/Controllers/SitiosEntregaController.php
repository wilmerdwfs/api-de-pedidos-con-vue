<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\SitiosEntregaRepository;

class SitiosEntregaController extends Controller
{
    protected $clientesRepository; 
    public function __construct(SitiosEntregaRepository $sitiosEntregaRepository){
        $this->sitiosEntregaRepository = $sitiosEntregaRepository;
    }
    
    public function sitiosEntregaPorCliente($id)
    {
        return response()->json([
            'dtSitiosEntrega' => $this->sitiosEntregaRepository->sitiosEntregaPorCliente($id),
        ]);
    }

}
