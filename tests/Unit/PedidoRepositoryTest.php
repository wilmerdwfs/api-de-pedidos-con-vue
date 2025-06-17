<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Pedido;
use App\Models\PedidoItem;
use App\Models\Cliente;
use App\Models\SitioEntrega;
use App\Models\Articulo;
use App\Repositories\PedidoRepository;

class PedidoRepositoryTest extends TestCase
{

    public function test_generarPedido_crea_pedido_e_items()
    {
        // Crear datos base
        $cliente = Cliente::factory()->create();
        $sitio = SitioEntrega::factory()->create(['idCliente' => $cliente->id]);
        $articulo1 = Articulo::factory()->create();
        $articulo2 = Articulo::factory()->create();

        $data = [
            'idCliente' => $cliente->id,
            'idSitioEntrega' => $sitio->id,
            'fecDoc' => now()->format('Y-m-d'),
            'items' => [
                [
                    'id' => $articulo1->id,
                    'cantidad' => 2,
                    'precio' => 100,
                    'total' => 200,
                ],
                [
                    'id' => $articulo2->id,
                    'cantidad' => 1,
                    'precio' => 150,
                    'total' => 150,
                ],
            ],
        ];

        $repo = new PedidoRepository();

        $pedido = $repo->generarPedido($data);

        // Afirmaciones
        $this->assertInstanceOf(Pedido::class, $pedido);
        $this->assertEquals($cliente->id, $pedido->idCliente);
        $this->assertEquals($sitio->id, $pedido->idSitioEntrega);
        $this->assertCount(2, $pedido->items);

        // Verificar uno de los items
        $item = $pedido->items->first();
        $this->assertEquals($articulo1->id, $item->idArticulo);
        $this->assertEquals(2, $item->cantidad);
        $this->assertEquals(100, $item->precio);
        $this->assertEquals(200, $item->totalBruto);
    }

    public function test_buscar_articulo_encuentra_por_nombre()
    {
        // Crear artículos de ejemplo
        Articulo::factory()->create(['nombre' => 'Lapicero Azul']);
        Articulo::factory()->create(['nombre' => 'Cuaderno']);
        Articulo::factory()->create(['nombre' => 'Borrador']);

        $repo = new PedidoRepository();

        // Buscar por parte del nombre
        $resultadosNombre = $repo->buscarArticulo('lapicero');
        
        $this->assertGreaterThan(0, $resultadosNombre->count()); // ✅ Verifica que trajo al menos uno
        
        $this->assertTrue(
            $resultadosNombre->every(fn ($item) => str_contains(strtolower($item->nombre), 'lapicero')),
            'Todos los resultados deben contener "lapicero" en el nombre'
        );

        // Buscar algo que no exista
        $resultadosVacios = $repo->buscarArticulo('NOEXISTE');
        $this->assertCount(0, $resultadosVacios);
    }

}