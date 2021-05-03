<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Program extends Model
{
    use \Dimsav\Translatable\Translatable;
    protected $guarded = [];
    public $translatedAttributes = ['title', 'short_description', 'description',];
    protected $appends = ['image_path'];
    // protected $hidden = ['pivot'];
    public function getImagePathAttribute()
    {
        return asset('uploads/program/' . $this->image);
    } //end of image path attribute

    public function collections()
    {
        return $this->hasMany(Collection::class);
    } //end of collections.

}//end of Program
