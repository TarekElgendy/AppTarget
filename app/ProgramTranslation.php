<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProgramTranslation extends Model
{
    public $timestamps = false;
    protected $fillable = ['title', 'short_description', 'description',];
}//end of model
