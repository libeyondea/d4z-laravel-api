<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;
use Carbon\Carbon;

class CategoryCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return $this->collection->transform(function($category){
            return [
                'id' => $category->id,
                'title' => $category->title,
                'meta_title' => $category->meta_title,
                'meta_description' => $category->meta_description,
                'slug' => $category->slug,
                'content' => $category->content,
                'created_at' => $category->created_at,
                'updated_at' => $category->updated_at,
                'total_post' => $category->post()->get()->count(),
                'total_post_week' => $category->post()->where('post.created_at', '>', Carbon::now()->startOfWeek())
                ->where('post.created_at', '<', Carbon::now()->endOfWeek())->get()->count(),
                'total_post_today' => $category->post()->whereDate('post.created_at', Carbon::today())->get()->count()
            ];
        });
    }
}
