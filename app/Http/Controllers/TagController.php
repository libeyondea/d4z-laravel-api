<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tag;
use App\User;
use JWTAuth;
use App\Http\Resources\TagResource;

class TagController extends Controller
{
    public function fetchTag()
    {
        $fetchTag = TagResource::collection(Tag::all());
        return response()->json(['success' => true, 'data' => $fetchTag], 200);
    }
}
