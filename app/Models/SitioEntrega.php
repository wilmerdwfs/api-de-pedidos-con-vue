<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SitioEntrega extends Model
{
    public $timestamps = false;
    
    use HasFactory;

    protected $table = 'c_sitios_entrega';

    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'idCliente');
    }
}
