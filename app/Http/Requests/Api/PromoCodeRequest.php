<?php

namespace App\Http\Requests\Api;

use App\Traits\APIRequest;
use Illuminate\Foundation\Http\FormRequest;

class PromoCodeRequest extends APIRequest
{ 
    public $rules = [
        'collection_id' => 'required|exists:collections,id',
        'code' => 'required|exists:promo_codes,code',

    ];

    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        if( $this->requestType=='create' ) {
            
            return $this->createRules();
        } elseif ( $this->requestType=='edit' ) {
            return $this->updateRules();
        }else{
            return $this->rules;
        }
    }

    public function createRules(){
        $this->rules+=[

        ];
        return $this->rules;
    }

    public function updateRules(){
   
    }

}