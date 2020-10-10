<?php

namespace App;

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
    	return $this->belongsTo('App\Post', 'post_id', 'id');
    }

    public function User()
    {
    	return $this->belongsTo('App\User', 'user_id', 'id');
    }

    public function ChildrenComment()
    {
    	return $this->hasMany('App\Comment', 'parent_id', 'id');
    }

    //public function AllChildrenComment()
    //{
    //    return $this->ChildrenComment()->with('ChildrenComment');
    //}
}
