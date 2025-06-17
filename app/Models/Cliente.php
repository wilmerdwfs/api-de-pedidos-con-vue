<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    public $timestamps = false;

    protected $table = 'c_clientes';
    
    use HasFactory;

    public function sitiosEntrega()
    {
        return $this->hasMany(SitioEntrega::class, 'idCliente');
    }
}
