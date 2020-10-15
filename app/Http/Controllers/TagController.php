<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tag;
use App\User;
use JWTAuth;
use App\Http\Resources\Tag\TagResource;
use App\Http\Resources\Tag\SingleTagResource;

class TagController extends Controller
{
    public function fetchTag()
    {
        $fetchTag = TagResource::collection(Tag::orderBY('created_at', 'desc')->get());
        return response()->json(['success' => true, 'data' => $fetchTag], 200);
    }

    public function singleTag($id) {
        $singleTag = new SingleTagResource(Tag::where('id', $id)->firstOrFail());
        return response()->json(['success' => true, 'data' => $singleTag], 200);
    }
}
