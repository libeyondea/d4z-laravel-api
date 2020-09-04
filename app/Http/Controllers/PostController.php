<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\User;

class PostController extends Controller
{
    public function fetchPost()
    {
        $fetchPost = User::select('user.user_name', 'post.title', 'post.summary', 'post.created_at', 'post.slug', 'post.id')
                    ->join('post','post.user_id','user.id')
                    ->get();
        return response()->json(['success' => true, 'data' => $fetchPost], 200);
    }

    public function createPost(Request $request)
    {
        $createPost = Post::create($request->all());
        return response()->json(['success' => true, 'data' => $createPost], 200);
    }

    public function detailPost($slug)
    {
        $post = User::select('user.user_name', 'post.title', 'post.summary', 'post.created_at', 'post.slug', 'post.id', 'post.content')
                    ->join('post','post.user_id','user.id')
                    ->where('slug', $slug)
                    ->first();
        return response()->json(['success' => true, 'data' => $post], 200);
    }
}
