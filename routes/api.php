<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});



################## Auth Area #################
Route::group(['namespace' => "Customer"], function () {

    Route::get('logout', 'AuthController@logout');
    Route::post('social_login', 'AuthController@social_login');
    Route::post('login', 'AuthController@login');
    Route::post('signupCustomer', 'AuthController@signupCustomer')->name('signupCustomer');
    Route::post('verifyAccount', 'AuthController@verifyAccount');
    Route::post('checkPhone', 'AuthController@checkPhone');
    Route::post('RestPasswordByPhone', 'AuthController@RestPasswordByPhone');
});

Route::group(['namespace' => "Customer", 'prefix' => 'customer/', 'middleware' => 'auth:customer-api'], function () {

    Route::post('profile', 'AuthController@profile');
    Route::post('editCustomerProfile', 'AuthController@editCustomerProfile');
    Route::post('changePassword', 'AuthController@changePassword');
    Route::get('logout', 'AuthController@logout');
    Route::post('updateFirebaseToken', 'AuthController@updateFirebaseToken');


    #######    Favourite   ###########
    Route::post('addTofavourite', 'OrderController@addTofavourite');
    Route::post('deleteFavourite', 'OrderController@deleteFavourite');
    Route::post('listDatafavourite', 'OrderController@listDatafavourite');
    ####### End Favourite ################

    ####### start  Cart   ################
    Route::post('addToCart', 'OrderController@addToCart');
    Route::post('listDataCart', 'OrderController@listDataCart');
    Route::post('totalCartWithAdidtion', 'OrderController@totalCartWithAdidtion');
    Route::post('deleteCart', 'OrderController@deleteCart');
    Route::post('editCart', 'OrderController@editCart');
    ####### End Cart ######################

 
    #######    Order   #####################
    Route::post('createOrder', 'OrderController@createOrder');
    Route::post('listOrder', 'OrderController@listOrder');
    Route::post('update_payment_status', 'OrderController@update_payment_status');
    ####### End Order ######################

    #######    Rating Start   #####################
    Route::post('createRateProduct', 'OrderController@createRateProduct');
    ####### End Rating ######################
    
    #######    subscribes Start   #####################
    Route::post('subscribe', 'OrderController@subscribe');
    Route::post('editChoosedMeals', 'OrderController@editChoosedMeals');
    
    ####### End subscribes ######################





});

################## Auth Area #################


Route::group(
    [
        'namespace' => 'General', 'middleware' => 'localization',
    ],
    function () {

        Route::get('/cities', 'MainController@cities')->name('cities');
        Route::get('/breakfasts', 'MainController@breakfasts')->name('breakfasts');
        Route::get('/launches', 'MainController@launches')->name('launches');
        Route::get('/dinners', 'MainController@dinners')->name('dinners');
        Route::get('/snacks', 'MainController@snacks')->name('snacks');
        Route::get('/days', 'MainController@days')->name('days');
        Route::get('/programs', 'MainController@programs')->name('programs');
        Route::get('/collections', 'MainController@collections');
      
        Route::post('addPromoCode', 'MainController@addPromoCode');

        

        Route::get('/sliders', 'MainController@sliders')->name('sliders');
        Route::get('/blogs', 'MainController@blogs')->name('blogs');
        Route::get('/sections', 'MainController@sections');
        Route::get('/categories', 'MainController@categories');
        Route::get('/sub_categories', 'MainController@sub_categories');
        Route::get('/products', 'MainController@products');
        Route::get('/relatedProduct', 'MainController@relatedProduct');

        Route::get('/offers', 'MainController@offers');
  
        Route::get('/addtions', 'MainController@addtions');
        Route::get('/tags', 'MainController@tags');
        Route::get('/about', 'MainController@about');
        Route::get('/pages', 'MainController@pages');
        Route::get('/countries', 'MainController@countries');
        Route::get('/search', 'MainController@search');
        Route::get('/filter', 'MainController@filter');
        Route::post('/contact', 'MainController@contact');
    }
);
