<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\LoginController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\ExampleController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PublicController;

use App\Http\Controllers\TrabajadoresController;
use App\Http\Controllers\CargosController;

use App\Http\Controllers\PostsController;

use App\Http\Controllers\PedidoController;
use App\Http\Controllers\ClientesController;
use App\Http\Controllers\SitiosEntregaController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware(['auth:sanctum'])->group(function () {

});

Route::get('pedido/buscar-articulo/{id}',[PedidoController::class,'buscarArticulo']);
Route::get('pedido/datos-iniciales',[PedidoController::class,'datosIniciales']);
Route::post('pedido/generar-pedido', [PedidoController::class,'generarPedido']);
Route::resource('pedido',PedidoController::class);

Route::get('clientes/lista',[ClientesController::class,'index']);

Route::get('sitiosentrega/sitios-entrega-por-cliente/{id}',[SitiosEntregaController::class,'sitiosEntregaPorCliente']);


