<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\ClientesRepository;

class ClientesController extends Controller
{
    protected $clientesRepository; 
    public function __construct(ClientesRepository $clientesRepository){
        $this->clientesRepository = $clientesRepository;
    }
    
    public function index()
    {
        return response()->json([
            'dtClientes' => $this->clientesRepository->all(),
        ]);
    }

}
