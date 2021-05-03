<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DinnerTranslation extends Model
{
    public $timestamps = false;
    protected $fillable = ['title', 'description', 'short_description',];
}

