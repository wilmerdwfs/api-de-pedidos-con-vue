<?php

namespace App\Repositories;

use App\Models\Cliente;

class ClientesRepository
{
    public function all()
    {
        return Cliente::all();
    }

}