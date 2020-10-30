<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Carbon\Carbon;
use App\Http\Resources\PostResource;

class SingleCategoryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'meta_title' => $this->meta_title,
            'meta_description' => $this->meta_description,
            'slug' => $this->slug,
            'summary' => $this->summary,
            'content' => $this->content,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'total_post' => $this->post()->get()->count(),
            'total_post_week' => $this->post()->where('post.created_at', '>', Carbon::now()->startOfWeek())
            ->where('post.created_at', '<', Carbon::now()->endOfWeek())->get()->count(),
            'total_post_today' => $this->post()->whereDate('post.created_at', Carbon::today())->get()->count(),
            'post' => PostResource::collection($this->post()->orderBY('created_at', 'desc')->get()),
            'post_week' => PostResource::collection($this->post()->where('post.created_at', '>', Carbon::now()->startOfWeek())
            ->where('post.created_at', '<', Carbon::now()->endOfWeek())->get()),
            'post_today' => PostResource::collection($this->post()->whereDate('post.created_at', Carbon::today())->get()),
        ];
    }
}
