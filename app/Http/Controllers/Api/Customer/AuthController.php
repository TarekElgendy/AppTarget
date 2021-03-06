<?php

namespace App\Http\Controllers\Api\Customer;

use App\Customer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\CustomerFormRequest;
use App\Http\Requests\Api\EditCustomerFormRequest;
use App\Http\Resources\AddressCustomerResource;
use App\Http\Resources\CustomerResource;
use App\Traits\ApiResponseTrait;
use App\Traits\AuthenticateUser;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Laravel\Passport\HasApiTokens;

class AuthController extends Controller
{
    use AuthenticateUser;
    use ApiResponseTrait;
    use HasApiTokens, Notifiable;

    public function checkPhone(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required|exists:customers,phone',
        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        } else {
            return $this->sendResponse('Registered in the databases', "");
        }
    } //end of checkPhone

    public function verifyAccount(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'phone' => 'required|exists:customers,phone',
        ]);

        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        $verifyAccount = Customer::where('phone', $request->phone)->update([
            'verified' => 1
        ]);
        $customer = Customer::where('phone', $request->phone)->first();
        $tokenResult = $this->createAuthToken($customer);
        return $this->sendResponse($tokenResult, "");
    }
    public function RestPasswordByPhone(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required|exists:customers,phone',
            'password' => ['required', 'string', 'min:6'],
            'password_confirmation' => ['required', 'same:password', 'min:6'],
        ]);

        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        Customer::where('phone', $request->phone)->update([
            'password' => bcrypt($request->password)
        ]);

        $customer = Customer::where('phone', $request->phone)->first();
        $tokenResult = $this->createAuthToken($customer);
        return $this->sendResponse($tokenResult, "");
    }
    public function signupCustomer(CustomerFormRequest  $request)
    {
        $request_data = $request->except(['type', 'password', 'password_confirmation', 'address', 'image',]);
        if ($request->image) {
            $request_data['image'] = upload_img($request->image, 'uploads/customers/', 600);
        } // end of if
        $request_data['password'] = bcrypt($request->password);
        $request_data['deviceType'] = $request->deviceType;
        $customer = Customer::create($request_data);


        // if ($customer->verified == 0) {
        //     return $this->sendError('', 'Verifiy Your Account ', 201);
        // }

        $tokenResult = $this->createAuthToken($customer);
        return $this->sendResponse($tokenResult, "");

        // return $this->successResponse($tokenResult, 'customer');
    }

    public function editCustomerProfile(EditCustomerFormRequest $request)
    {

        $request_data = $request->except(['image',]);
        if ($request->image) {
            $request_data['image'] = upload_img($request->image, 'uploads/customers/', 600);
        } // end of if
        $update = $request->user()->update($request_data);
        return $this->sendResponse("", "Success update");
    }
    public function addressCustomerProfile(Request $request)
    {
        $request_data = $request->except(['type', 'password', 'password_confirmation', 'address', 'image',]);
        $update = $request->user()->update($request_data);
        return $this->sendResponse("", "Success update");
    }

    public function updateFirebaseToken(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'firebaseToken' => 'required|string',
            'deviceType'    => 'required|string|in:ios,android',
        ]);

        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }

        $data = request(['firebaseToken', 'deviceType']);

        $request->user()->update($data);
        return $this->sendResponse("", "");
    }

    public function social_login(Request $request)
    {

        $validator = Validator::make($request->all(), [

            // 'provider' => 'required' ,
            'social_id' => 'required',
            'full_name' => 'required',
            'email' => 'required',
            // 'email' => 'required|unique:customers,email',
        ]);

        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }

        $customer = Customer::where('provider_id', $request->social_id)->first();
        if (!$customer) {

            #not exist with email
            $customer = Customer::where('email', $request->email)->first();
            if (!$customer) {

                $pro = str_random(7);

                $customer = Customer::create([
                    'full_name'     => $request->full_name,
                    'email'    => $request->email,
                    // 'provider' => $provider,
                    'social_id' => $request->social_id,
                    'deviceType' => $request->deviceType,
                    'phone' => null,

                ]);
                $customer = Auth::guard('customer')->loginUsingId($customer->id);
            }
        }

        $tokenResult = $this->createAuthToken($customer);
        //return $this->successResponse($tokenResult, 'customer');
        return $this->sendResponse($tokenResult, "");
    }

    public function login(Request $request)
    {

        $validator = Validator::make($request->all(), [
            // 'email' => 'required|string|email',
            'phone' => 'required',
            'password' => 'required|string',
            //  'remember_me' => 'boolean'
        ]);

        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        // $credentials = request(['email', 'password']);
        $credentials = request(['phone', 'password']);

        if (!Auth::guard('customer')->attempt($credentials)) {
            return $this->sendError(' ', "Unauthorized");
        }


        $user  =  Auth::guard('customer')->user();


        if ($user->verified == 0) {
            return $this->sendError('', 'Verifiy Your Account ', 201);
        }

        $tokenResult = $this->createAuthToken($user);


        return $this->sendResponse($tokenResult, "");



        //  return $this->successResponse($tokenResult, 'customer');
    }

    public function logout(Request $request)
    {

        $request->user()->token()->revoke();
        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }

    public function profile(Request $request)
    {
        return $this->sendResponse(new CustomerResource($request->user()), "");
    }
    public function addressCustomer(Request $request)
    {
        //  return $this->sendResponse(new AddressCustomerResource($request->user()), "");
    }

    public function changePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'password' => 'required|string|min:6',
            'password_confirmation' => 'required|same:password|min:6',
            'old_password' => 'required',

        ]);

        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        $credentials = ['email' => $request->user()['email'], 'password' => $request->old_password];
        if (!Auth::guard('customer')->attempt($credentials)) {
            return $this->sendError('Password Not Correct', '');
        }
        $request->user()->update(['password' => bcrypt($request->password)]);
        return $this->sendResponse("", "");
    }
}
