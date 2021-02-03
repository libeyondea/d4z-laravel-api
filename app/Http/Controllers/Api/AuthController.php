<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use JWTAuth;
use JWTAuthException;
use App\Models\User;
use App\Models\Role;
use App\Http\Resources\UserResource;
use App\Http\Resources\UserCollection;
use Exception;
use HttpException;

class AuthController extends Controller
{
    private function getToken($user_name, $password)
    {
        $token = null;
        //$credentials = $request->only('user_name', 'password');
        try {
            if (!$token = JWTAuth::attempt(['user_name' => $user_name, 'password' => $password])) {
                return response()->json([
                    'response' => 'errors',
                    'errorMessage' => 'Password or user_name is invalid',
                    'token' => $token
                ]);
            }
        } catch (JWTAuthException $e) {
            return response()->json([
                'response' => 'errors',
                'errorMessage' => 'Token creation failed',
            ]);
        }
        return $token;
    }

    public function login(Request $request)
    {
        $user = User::where('user_name', $request->user_name)->get()->first();
        if ($user && Hash::check($request->password, $user->password)) {
            $token = self::getToken($request->user_name, $request->password);
            $user->auth_token = $token;
            $user->save();
            $response = [
                'success' => true,
                'token' => $user->auth_token
            ];
        } else {
            $response = [
                'success' => false,
                'errorMessage' => [
                    'user' => 'Email or password does not exists'
                ]
            ];
        }
        return response()->json($response, 200);
    }

    public function checkToken(Request $request)
    {
        $user = JWTAuth::toUser($request->token);
        return response()->json(['success' => true, 'data' => $user->user_name], 200);
    }

    public function register(Request $request)
    {
        $rules = [
            'user_name' => 'unique:user',
            'email' => 'unique:user'
        ];
        $messages = [
            'user_name.unique' => 'User name already exists',
            'email.unique' => 'Email already exists'
        ];
        $payload = [
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'user_name' => $request->user_name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'phone_number' => $request->phone_number,
            'address' => $request->address,
            'gender' => $request->gender,
            'avatar' => $request->avatar,
            'role_id' => Role::where('slug', 'guest')->first()->id,
        ];
        $validator = Validator::make($payload, $rules, $messages);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errorMessage' => $validator->errors()
            ], 200);
        }
        $user = new User($payload);
        if ($user->save()) {
            $token = self::getToken($request->user_name, $request->password);
            if (!is_string($token))
                return response()->json([
                    'success' => false,
                    'errorMessage' => 'Token generation failed'
                ], 200);
            $user = User::where('user_name', $request->user_name)->get()->first();
            $user->auth_token = $token;
            $user->save();
            $response = [
                'success' => true,
                'data' => $user
            ];
        } else {
            $response = [
                'success' => false,
                'errorMessage' => 'Couldnt register user',
            ];
        }
        return response()->json($response, 200);
    }

    public function fetchUser()
    {
        $user = new UserCollection(User::orderBY('created_at', 'desc')->get());
        return response()->json(['success' => true, 'data' => $user], 200);
    }

    public function singleUser($id, $user_name)
    {
        //$user = JWTAuth::toUser($request->token);
        $user = new UserResource(User::where('id', $id)->where('user_name', $user_name)->firstOrFail());
        return response()->json(['success' => true, 'data' => $user], 200);
    }
}

