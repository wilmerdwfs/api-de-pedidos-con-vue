<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    public $timestamps = false;

    protected $table = 'c_pedidos';

    protected $fillable = [
        'idCliente',
        'idSitioEntrega',
        'fecDoc',
    ];
    
    public function items()
    {
        return $this->hasMany(PedidoItem::class, 'idPedido');
    }

    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'idCliente');
    }

    public function sitioEntrega()
    {
        return $this->belongsTo(SitioEntrega::class, 'idSitioEntrega');
    }
    use HasFactory;
}
