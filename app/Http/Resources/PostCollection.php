<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class PostCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    //public $collects = 'App\Http\Resources\PostResource';

    public function toArray($request)
    {
        return [
            'success' => true,
            'data' => $this->collection->transform(function($post){
                return [
                    'id' => $post->id,
                    'user' => [
                        'id' => $post->user->id,
                        'first_name' => $post->user->first_name,
                        'last_name' => $post->user->last_name,
                        'user_name' => $post->user->user_name,
                        'email' => $post->user->email,
                        'avatar' => $post->user->avatar,
                        'role' => $post->user->role,
                    ],
                    'parent_id' => $post->parent_id,
                    'title' => $post->title,
                    'meta_title' => $post->meta_title,
                    'meta_description' => $post->meta_description,
                    'slug' => $post->slug,
                    'excerpt' => $post->excerpt,
                    'image' => $post->image,
                    'published' => $post->published,
                    'published_at' => $post->published_at,
                    'created_at' => $post->created_at,
                    'updated_at' => $post->updated_at,
                    'category' => $post->category,
                    'tag' => $post->tag,

                ];
            }),
            'pagination' => [
                'total' => $this->total(),
                'count' => $this->count(),
                'per_page' => $this->perPage(),
                'current_page' => $this->currentPage(),
                'total_pages' => $this->lastPage()
            ],
        ];
    }
}
