<?php

namespace Database\Factories;

use App\Models\SitioEntrega;
use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Cliente;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Cliente>
 */

class SitioEntregaFactory extends Factory
{
    protected $model = SitioEntrega::class;

    public function definition()
    {
        return [
            'idCliente' => Cliente::factory(), // Relación automática
            'nombre' => $this->faker->address,
        ];
    }
}