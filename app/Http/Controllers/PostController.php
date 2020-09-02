<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;

class PostController extends Controller
{
    public function listPostHome()
    {
        $list = Post::orderBy('created_at', 'desc')->paginate(8);
        return response()->json($list, 200);
    }

    public function detailPost($id)
    {
        $post = Post::findOrFail($id);
        return response()->json(['post' => $post], 200);
    }
}
