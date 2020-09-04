<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $table = 'post';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'title',
        'meta_title',
        'meta_description',
        'slug',
        'summary',
        'image',
        'content',
        'published',
        'published_at',
        'user_id',
    ];

    public function User()
    {
    	return $this->belongsTo('App\User', 'id', 'user_id');
    }
}
