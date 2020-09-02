<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\User;

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

Route::middleware('auth:api')->get('/users', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => ['jwt.auth', 'api-header']], function () {
    // all routes to protected resources are registered here
    Route::get('users/list', function(){
        $users = User::all();
        $response = ['success' => true, 'data' => $users];
        return response()->json($response, 200);
    });
});

Route::group(['middleware' => 'api-header'], function () {
    // The registration and login requests doesn't come with tokens
    // as users at that point have not been authenticated yet
    // Therefore the jwtMiddleware will be exclusive of them
    Route::post('users/login', 'AuthController@login');
    Route::post('users/register', 'AuthController@register');
    Route::get('post/list-post-home', 'PostController@listPostHome');
    Route::get('post/{id}', 'PostController@detailPost');
});
