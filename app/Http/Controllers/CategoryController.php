<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\User;
use JWTAuth;
use App\Http\Resources\CategoryResource;

class CategoryController extends Controller
{
    public function fetchCategory()
    {
        $fetchCategory = CategoryResource::collection(Category::all());
        return response()->json(['success' => true, 'data' => $fetchCategory], 200);
    }
}
