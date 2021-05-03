<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ChooseMeal extends Model
{
 
    protected $guarded = [];
    public function customer()
    {
        return $this->belongsTo(Customer::class,'customer_id');
    } //end fo customer
    public function breakfast()
    {
        return $this->belongsTo(Breakfast::class,'breakfast_id');
    } //end fo breakfast
    public function launch()
    {
        return $this->belongsTo(Launch::class,'launche_id');
    } //end fo launch
    public function dinner()
    {
        return $this->belongsTo(Dinner::class,'dinner_id');
    } //end fo dinner
    public function snack()
    {
        return $this->belongsTo(Snack::class,'snack_id');
    } //end fo snack
    public function collection()
    {
        return $this->belongsTo(Collection::class,'collection_id');
    } //end fo collection
    
}
