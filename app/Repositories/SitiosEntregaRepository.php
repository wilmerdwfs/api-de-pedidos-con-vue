<?php

namespace App\Repositories;

use App\Models\Cliente;

class SitiosEntregaRepository
{
    public function sitiosEntregaPorCliente($id)
    {
        $cliente = Cliente::with('sitiosEntrega')->find($id);

        return $cliente ? $cliente->sitiosEntrega : [];
    }
}