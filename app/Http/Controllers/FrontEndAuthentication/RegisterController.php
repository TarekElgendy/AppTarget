<?php

namespace App\Http\Controllers\FrontEndAuthentication;

use App\Customer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\frontend\CustomerFormRequest;
use Illuminate\Support\Facades\Auth;

class RegisterController extends Controller
{

    public function index()
    {
        if (authCustomer() != null) {
            session()->flash('success', __('site.Successfully Login'));
            return redirect()->route('home');
            // auth()->guard('customer')->logout();
        }
        session(['setPreviousUrl' => url()->previous()]);
        return view('frontend.customer.auth.register');
    } //end of index
    public function create(CustomerFormRequest $request)
    {
        $request_data = $request->except(['password', 'password_confirmation',   'image',]);
        if ($request->image) {
            $request_data['image'] = upload_img($request->image, 'customers/', '300');
        } // end of if
        $request_data['password'] = bcrypt($request->password);

        $customer = Customer::create($request_data);
        // Auth::login($customer->id);
        $result =    Auth::guard('customer')->loginUsingId($customer->id);


        session()->flash('success',  __('site.Success Regesteration'));
        return redirect(session()->get('setPreviousUrl'));


        //   return redirect()->back();
        //   return redirect()->route('customer.login');
    } //end of store

    public function handleProviderCallback()
    {
        # code...
    }
}
