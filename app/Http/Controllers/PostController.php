<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\PostTag;
use App\Tag;
use App\PostCategory;
use App\Category;
use App\User;
use JWTAuth;
use Carbon\Carbon;
use App\Http\Resources\PostResource;

class PostController extends Controller
{
    public function fetchPost()
    {
        $fetchPost = PostResource::collection(Post::orderBY('created_at', 'desc')->get());
        return response()->json(['success' => true, 'data' => $fetchPost], 200);
    }

    public function createPost(Request $request)
    {
        $mytime = Carbon::now();
        $user = JWTAuth::toUser($request->token);
        if($user->Role()->firstOrFail()->slug == 'admin') {
            $published = '1';
            $published_at = $mytime->toDateTimeString();
        } else {
            $published = '0';
            $published_at = null;
        }
        $payload = [
            'title' => $request->title,
            'meta_title' => $request->meta_title,
            'meta_description' => $request->meta_description,
            'slug' => $request->slug,
            'summary' => $request->summary,
            'content' => $request->content,
            'image' => $request->image,
            'published' => $published,
            'published_at' => $published_at,
            'user_id' => $user->id,
        ];
        $createPost = new Post($payload);
        $createPost->save();
        $lastIdPost = $createPost->id;
        foreach ($request->tag as $key => $tag) {
            $postTag = new PostTag;
            $postTag->post_id = $lastIdPost;
            $postTag->tag_id = $tag['id'];
            $postTag->save();
        }
        foreach ($request->category as $key => $category) {
            $postCategory = new PostCategory;
            $postCategory->post_id = $lastIdPost;
            $postCategory->category_id = $category['id'];
            $postCategory->save();
        }
        return response()->json([
            'success' => true,
            'data' => [$createPost, $postTag, $postCategory]
        ], 200);
    }

    public function detailPost($id)
    {
        $post = new PostResource(Post::where('id', $id)->firstOrFail());
        return response()->json(['success' => true, 'data' => $post], 200);
    }

    public function editPost(Request $request, $id)
    {
        $user = JWTAuth::toUser($request->token);
        $post = new PostResource(Post::where('id', $id)->firstOrFail());
        if($user->Role()->firstOrFail()->slug == 'admin' || $post->user_id == $user->id) {
            return response()->json(['success' => true, 'data' => $post], 200);
        } else {
            return response()->json(['errors' => 'Unauthorized'], 401);
        }
    }

    public function updatePost(Request $request, $id)
    {
        $user = JWTAuth::toUser($request->token);
        $updatePost = Post::where('id', $id)->firstOrFail();
        if($user->Role()->firstOrFail()->slug == 'admin' || $updatePost->user_id == $user->id) {
            $payload = [
                'title' => $request->title,
                'meta_title' => $request->meta_title,
                'meta_description' => $request->meta_description,
                'slug' => $request->slug,
                'summary' => $request->summary,
                'content' => $request->content,
                'image' => $request->image
            ];
            $updatePost->update($payload);
            $updatePost->save();

            $idPost = $updatePost->id;
            $deletePostTag = PostTag::where('post_id', $idPost);
            if ($deletePostTag->get()->count() > 0) {
                $deletePostTag->delete();
            }
            foreach ($request->tag as $key => $tag) {
                $postTag = new PostTag;
                $postTag->post_id = $idPost;
                $postTag->tag_id = $tag['id'];
                $postTag->save();
            }
            $deletePostCategory = PostCategory::where('post_id', $idPost);
            if ($deletePostTag->get()->count() > 0) {
                $deletePostCategory->delete();
            }
            foreach ($request->category as $key => $category) {
                $postCategory = new PostCategory;
                $postCategory->post_id = $idPost;
                $postCategory->category_id = $category['id'];
                $postCategory->save();
            }
            return response()->json([
                'success' => true,
                'data' => [$updatePost, $postTag, $postCategory]
            ], 200);
        } else {
            return response()->json(['errors' => 'Unauthorized'], 401);
        }
    }

    public function deletePost(Request $request, $id)
    {
        $user = JWTAuth::toUser($request->token);
        $deletePost = Post::where('id', $id)->firstOrFail();
        if($user->Role()->firstOrFail()->slug == 'admin' || $deletePost->user_id == $user->id) {
            $deletePost->delete();
            return response()->json(['success' => true, 'data' => $deletePost], 200);
        } else {
            return response()->json(['errors' => 'Unauthorized'], 401);
        }
    }
}
