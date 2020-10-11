<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use JWTAuth;
use JWTAuthException;
use App\User;
use App\Role;
use App\Http\Resources\ProfileResource;

class AuthController extends Controller
{
    private function getToken($email, $password)
    {
        $token = null;
        //$credentials = $request->only('email', 'password');
        try {
            if (!$token = JWTAuth::attempt(['email' => $email, 'password' => $password])) {
                return response()->json([
                    'response' => 'errors',
                    'errorMessage' => 'Password or email is invalid',
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
        $user = User::where('email', $request->email)->get()->first();
        if ($user && Hash::check($request->password, $user->password)) {
            $token = self::getToken($request->email, $request->password);
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

    public function register(Request $request)
    {
        $rules = [
            'user_name' => ['unique:user'],
            'email' => ['unique:user'],
        ];
        $messages = [
            'user_name.unique' => 'User name already exists',
            'email.unique' => 'Email already exists',
        ];
        $payload = [
            'id' => $request->id,
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'user_name' => $request->user_name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'phone_number' => $request->phone_number,
            'address' => $request->address,
            'gender' => $request->gender,
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
            $token = self::getToken($request->email, $request->password);
            if (!is_string($token))
                return response()->json([
                    'success' => false,
                    'data' => 'Token generation failed'
                ], 200);
            $user = User::where('email', $request->email)->get()->first();
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
        $user = User::select('id', 'first_name', 'last_name')->get();
        return response()->json(['success' => true, 'data' => $user], 200);
    }

    public function singleUser($id, $user_name)
    {
        //$user = JWTAuth::toUser($request->token);
        $user = new ProfileResource(User::where('id', $id)->where('user_name', $user_name)->firstOrFail());
        return response()->json(['success' => true, 'data' => $user], 200);
    }
}
