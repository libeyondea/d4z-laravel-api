<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;
use Carbon\Carbon;

class TagCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return $this->collection->transform(function($tag){
            return [
                'id' => $tag->id,
                'title' => $tag->title,
                'slug' => $tag->slug,
                'content' => $tag->content,
                'created_at' => $tag->created_at,
                'updated_at' => $tag->updated_at,
                'total_post' => $tag->post()->get()->count(),
                'total_post_week' => $tag->post()->where('post.created_at', '>', Carbon::now()->startOfWeek())
                ->where('post.created_at', '<', Carbon::now()->endOfWeek())->get()->count(),
                'total_post_today' => $tag->post()->whereDate('post.created_at', Carbon::today())->get()->count()
            ];
        });
    }
}
