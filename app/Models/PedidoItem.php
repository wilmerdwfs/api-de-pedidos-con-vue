<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PedidoItem extends Model
{
    public $timestamps = false;

    protected $table = 'c_pedidos_d';

    protected $fillable = [
        'idPedido',
        'idArticulo',
        'totalBruto',
        'precio',
        'cantidad',
    ];
    
    use HasFactory;
}
