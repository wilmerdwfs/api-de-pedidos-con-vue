<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\CreateUserRequest;
use App\Http\Requests\LoginRequest;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function createUser(CreateUserRequest $request)
    {
        $user = User::create([
            'name'=> $request->name,
            'email'=> $request->email,
            'password' => Hash::make($request->passware)
        ]);

        return response()->json([
            'status' => true,
            'message' => 'User created successfully ',
            'token' => $user->createToken('TOKEN_BLOG')->plainTextToken
        ],200);

    }
    
    public function loginUser(LoginRequest $request)
    {
        if(!Auth::attempt($request->only(['email','password'])))
        {
            return response()->json([
                'user' => false,
                'status' => false,
                'message' => 'Las credenciales no coinciden'
            ],401);
        }
        
        //$user = User::where('email',$request->email)->first();
        $user = Auth::user();
        
        return response()->json([
            'status' => true,
            'user' => [
                'usr_name'=>$user->name,
                'usr_email'=>$user->email
            ],
            'message' => 'User logged in successfuly',
            'token' => $user->createToken('TOKEN_BLOG')->plainTextToken
        ],200);
    }
}
