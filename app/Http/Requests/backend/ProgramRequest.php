<?php

namespace App\Http\Requests\backend;

use Illuminate\Foundation\Http\FormRequest;

class ProgramRequest extends FormRequest
{
    public $rules = [

        // 'serve_number' => 'nullable|numeric|gt:0',
        //  'offer_egy_monthly' => 'numeric|lt:price_egy_monthly',
    ];
    public function authorize()
    {
        return true;
    }
    public function rules()
    {
        if ($this->isMethod('post')) {
            return $this->createRules();
        } elseif ($this->isMethod('put')) {
            return $this->updateRules();
        }
    }
    public function createRules()
    {
        foreach (config('translatable.locales') as $locale) {
            // $this->rules += [$locale . '.title' => 'required|unique:product_translations,title'];
            $this->rules += [$locale . '.title' => 'required'];
        } // end of  for each
        $this->rules += ['image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',];

        return $this->rules;
    }
    public function updateRules()
    {
        $item = $this->route('product');
        foreach (config('translatable.locales') as $locale) {
            //  $this->rules += [$locale . '.title' => ['required', Rule::unique('product_translations', 'title')->ignore($item->id, 'product_id')]];
            $this->rules += [$locale . '.title' => ['required']];
        } // end of  for each
        $this->rules += ['image' => 'nullable|image|mimes:jpg,png,jpeg,gif,svg|max:2048',];
        return $this->rules;
    }
    public function messages()
    {
        $msg = [];
        return $msg;
    }
}
