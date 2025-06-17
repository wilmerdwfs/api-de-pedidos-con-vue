<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Articulo;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Cliente>
 */

class ArticuloFactory extends Factory
{
    protected $model = Articulo::class;

    public function definition()
    {
        return [
            'nombre' => $this->faker->word,
            'cantidad' => $this->faker->randomFloat(0, 1000, 100000),
            'precio' => $this->faker->randomFloat(2, 1000, 100000),
        ];
    }
}
