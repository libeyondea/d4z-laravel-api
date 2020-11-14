<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;
use Carbon\Carbon;

class UserCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return $this->collection->transform(function($user){
            return [
                'id' => $user->id,
                'first_name' => $user->first_name,
                'last_name' => $user->last_name,
                'user_name' => $user->user_name,
                'email' => $user->email,
                'password' => $user->password,
                'phone_number' => $user->phone_number,
                'address' => $user->address,
                'gender' => $user->gender,
                'image' => $user->image,
                'created_at' => $user->created_at,
                'updated_at' => $user->updated_at,
                'role' => $user->role,
                'total_post' => $user->post()->get()->count(),
                'total_post_week' => $user->post()->where('post.created_at', '>', Carbon::now()->startOfWeek())
                ->where('post.created_at', '<', Carbon::now()->endOfWeek())->get()->count(),
                'total_post_today' => $user->post()->whereDate('post.created_at', Carbon::today())->get()->count()
            ];
        });
    }
}
