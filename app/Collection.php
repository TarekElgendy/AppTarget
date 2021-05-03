<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Collection extends Model
{
    use \Dimsav\Translatable\Translatable;

    protected $guarded = [];
    public $translatedAttributes = ['title', 'description', 'short_description'];
    protected $appends = ['image_path'];

    public function getImagePathAttribute()
    {
        return asset('uploads/product_images/' . $this->image);
    } //end of image path attribute


    public function program()
    {
        return $this->belongsTo(Program::class);
    } //end of program

    public function day()
    {
        return $this->belongsTo(Day::class);
    } //end of day 

}
