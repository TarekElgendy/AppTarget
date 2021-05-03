<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $guarded = [];


    public function products()
    {
        return $this->hasMany(Product::class);
    } //end of products

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    } //end fo customer

    public function program()
    {
        return $this->belongsTo(Program::class,'program_id');
    } //end fo program
    public function collection()
    {
        return $this->belongsTo(Collection::class,'collection_id');
    } //end fo collection


    public function breakfast()
    {
        return $this->belongsTo(Breakfast::class,'breakfast_id');
    } //end fo breakfast

    
    public function dinner()
    {
        return $this->belongsTo(Dinner::class,'dinner_id');
    } //end fo dinner

    
    public function launch()
    {
        return $this->belongsTo(Launch::class,'launch_id');
    } //end fo launch

    public function snack()
    {
        return $this->belongsTo(Snack::class,'snack_id');
    } //end fo snack





    public function orderAddtions()
    {
        return $this->hasMany(OrderAddition::class);
    } //end of products


    public function orderDetails()
    {
        return $this->hasMany(OrderDetail::class);
    } //end of products


}
