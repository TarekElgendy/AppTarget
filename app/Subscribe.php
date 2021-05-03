<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subscribe extends Model
{
    protected $guarded = [];

    public function collection()
    {
        return $this->belongsTo(Collection::class,'collection_id');
    } //end fo collection

    

    
    public function customer()
    {
        return $this->belongsTo(Customer::class);
    } //end fo customer
    
}
