<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    //use \App\Http\Traits\UsesUuid;

    protected $table = 'comment';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function Post()
    {
    	return $this->belongsTo('App\Models\Post', 'post_id', 'id');
    }

    public function User()
    {
    	return $this->belongsTo('App\Models\User', 'user_id', 'id');
    }

    public function ChildrenComment()
    {
    	return $this->hasMany('App\Models\Comment', 'parent_id', 'id');
    }

    //public function AllChildrenComment()
    //{
    //    return $this->ChildrenComment()->with('ChildrenComment');
    //}
}
