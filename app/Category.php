<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'category';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;

    public function PostCategory()
    {
    	return $this->hasMany('App\PostCategory', 'category_id', 'id');
    }
}
