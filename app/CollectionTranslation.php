<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CollectionTranslation extends Model
{
    public $timestamps = false;
    protected $guarded = [];
    public $translatedAttributes = ['title', 'short_description', 'description',];
}
