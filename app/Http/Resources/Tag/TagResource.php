<?php

namespace App\Http\Resources\Tag;

use Illuminate\Http\Resources\Json\JsonResource;
use Carbon\Carbon;

class TagResource extends JsonResource
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
            'slug' => $this->slug,
            'content' => $this->content,
            'total_post' => $this->post()->get()->count(),
            'total_post_week' => $this->post()->where('post.created_at', '>', Carbon::now()->startOfWeek())
            ->where('post.created_at', '<', Carbon::now()->endOfWeek())->get()->count(),
            'total_post_today' => $this->post()->whereDate('post.created_at', Carbon::today())->get()->count()
        ];
    }
}
