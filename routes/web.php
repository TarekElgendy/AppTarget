<?php

Route::get('/clear', function () {
    Artisan::call('view:clear');
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('config:cache');




    session()->flash('success', __('site.cleard done'));
    return redirect()->back();
})->name('clear');



#register customer and social login
Route::get('customer/auth/redirect/{provider}', 'FrontEndAuthentication\SocialController@redirect');
Route::get('customer/callback/{provider}', 'FrontEndAuthentication\SocialController@callback');


Route::group(
    ['prefix' => LaravelLocalization::setLocale(), 'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath']],
    function () {
        ################## Start Customer ####################

        Route::group(['namespace' => 'FrontEndAuthentication', 'prefix'  =>  'customer'], function () {

            Route::get('/register', 'RegisterController@index')->name('register');
            Route::post('/register/post', 'RegisterController@create')->name('customer.register.post');

            Route::get('/login', 'LoginController@index')->name('customer.login');

            Route::post('/login', 'LoginController@login')->name('customer.login.post');
        });
        ##****************** Start AUTH CUSTOMER ************##
        Route::group(['namespace' => 'FrontEndAuthentication\Customer', 'prefix'  =>  'customer', 'middleware'  => 'auth:customer'], function () {

            #profile
            Route::get('/tickets', 'ProfileController@tickets')->name('customer.profile.tickets');
            Route::post('/tickets', 'ProfileController@tickets_create')->name('customer.profile.tickets.create');

            Route::get('/logout', 'ProfileController@logout')->name('customer.profile.logout');
            Route::get('/profile', 'ProfileController@index')->name('customer.profile.index');
            Route::post('/profile/{id}', 'ProfileController@edit')->name('customer.profile.edit');
            Route::get('/profile/change-password', 'ProfileController@change_password')->name('customer.profile.password.change');
            Route::post('/profile/password/{id}', 'ProfileController@edit_password')->name('customer.profile.password.edit');

            Route::post('/profile/orders/rate', 'ProfileController@rate')->name('customer.profile.order.rate');
            Route::get('/profile/orders', 'ProfileController@listOrders')->name('customer.profile.orders');
            Route::get('/profile/orders/{order_id}', 'ProfileController@OrderDetails')->name('customer.profile.orders.details');



            #Wishlist
            Route::get('/wishlist', 'WishlistController@index')->name('customer.wishlist.index');
            Route::get('/wishlist/{product_id}', 'WishlistController@addToWishlist')->name('customer.wishlist');
            Route::get('/wishlist/delete/{id}', 'WishlistController@delete')->name('customer.wishlist.delete');

            #carts
            Route::get('/carts', 'CartController@index')->name('customer.cart.index');
            Route::post('/carts/create', 'CartController@create')->name('customer.cart.add');
            Route::get('/carts/delete/{id}', 'CartController@delete')->name('customer.cart.delete');


            #checkout
            Route::get('/checkout', 'CheckoutController@index')->name('customer.checkout.index');
            Route::post('/checkout', 'CheckoutController@calculate_delivery_cost')->name('customer.checkout.calculate_delivery_cost');
            Route::get('/delivery/remove', 'CheckoutController@removeDeliver')->name('customer.calculate_delivery_cost.remove');
            Route::post('/promo', 'CheckoutController@applyPromo')->name('customer.checkout.applyPromo');
            Route::get('/promo/remove', 'CheckoutController@removePromocode')->name('customer.promocode.remove');

            #setp one checkout
            Route::post('/order/checkout', 'CheckoutController@checkout')->name('customer.checkout');
            Route::get('/order/congratulation', 'CheckoutController@congratulation')->name('customer.profile.orders.congratulation');
            Route::get('/order/paymentSuccess', 'CheckoutController@payemnt_online_done')->name('customer.profile.orders.paymentOnlineDone');
        });
        ##****************** END AUTH CUSTOMER ************##




        ################## End Customer ####################

        Route::get('/', 'HomeController@index')->name('home');
        Route::get('/about', 'HomeController@about')->name('about');
        Route::get('/useful-information', 'HomeController@blogs')->name('blogs');
        Route::get('/useful-information/{id?}/{slug?}', 'HomeController@blog_detail')->name('blogs.details');

        Route::get('/galleries', 'HomeController@galleries')->name('galleries');
        Route::get('/galleries/{id?}/{slug?}', 'HomeController@gallery_detial')->name('gallery_detial');

        Route::get('/products/elite', 'HomeController@elite_products')->name('elite_products');
        Route::get('/products', 'HomeController@products')->name('products');
        Route::get('/products/{id?}/{slug?}', 'HomeController@product_details')->name('product_details');


        Route::get('/search', 'HomeController@product_search')->name('search');

        Route::get('/subCategories/{id?}/{slug?}', 'HomeController@subCategories')->name('subCategories');
        Route::get('/subCategories/products/{id?}/{slug?}', 'HomeController@productsSubCategories')->name('productsSubCategories');

        Route::get('/privacies', 'HomeController@privacies')->name('privacies');
        Route::get('/polices', 'HomeController@polices')->name('polices');


        Route::post('/subscribe', 'HomeController@subscribe')->name('subscribe');
        Route::get('/contact', 'HomeController@contact')->name('contact');
        Route::post('/contact', 'HomeController@post_contact')->name('contact');
    }
);
Auth::routes(['register' => false]);
