<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    protected $table = 'tag';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;

    public function PostTag()
    {
    	return $this->hasMany('App\PostTag', 'tag_id', 'id');
    }
}
