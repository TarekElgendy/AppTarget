<!doctype html>
<html lang="en">


<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="{{$setting->image_icon}}" type="image/x-icon">
    {{-- new  --}}
    <title> @yield('title_page') | {{$setting->seo_title }}</title>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="description" content="@yield('des_seo'){{$setting->seo_des}}">
    <meta name="keywords" content="@yield('key_seo'){{$setting->seo_key}}">
    <meta name="author" content="{{$setting->seo_title}}">
    {{-- start share button  --}}
    <meta property="og:image" content="@yield('image_url_share')" />
    <meta property="og:title" content="@yield('title_share')">
    <meta property="og:description" content="@yield('description_share')" />
    <meta property="og:url" content="{{url()->current()}}">
    <meta property="og:type" content="website" />
    {{-- end share button  --}}
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="{{url('/')}}/frontend/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="{{url('/')}}/frontend/assets/css/all.min.css">
    <link rel="stylesheet" href="{{url('/')}}/frontend/assets/fonts/fontello-icons.css">
    <link rel="stylesheet" href="{{url('/')}}/frontend/assets/libs/animate/animate.min.css">
    <link rel="stylesheet" href="{{url('/')}}/frontend/assets/libs/selectric/selectric.css">
    <link rel="stylesheet" href="{{url('/')}}/frontend/assets/libs/owl.carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="{{url('/')}}/frontend/assets/libs/owl.carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="{{url('/')}}/frontend/assets/libs/swipper/swiper.min.css">
    <link rel="stylesheet" href="{{url('/')}}/frontend/assets/libs/popup/jquery.fancybox.min.css">
    <link rel="stylesheet" href="{{url('/')}}/frontend/assets/css/main.css">
    {{--noty--}}
    <link rel="stylesheet" href="{{ asset('dashboard/plugins/noty/noty.css') }}">
    <script src="{{ asset('dashboard/plugins/noty/noty.min.js') }}"></script>
    @if (app()->getLocale() == 'ar')
    <link rel="stylesheet" href="{{url('/')}}/frontend/assets/css/ar.css">
    @endif
    <link rel="stylesheet" href="{{url('/')}}/frontend/assets/css/responsive.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
        href="https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
</head>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/60214334c31c9117cb76fac0/1eu0ut1v6';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->


<body class="">
    <!-- Loader -->
    <div class="loaders">
        <div class="preloaders">
            <div class="face face1">
                <div class="circle"></div>
            </div>
            <div class="face face2">
                <div class="circle">
                    <img src="{{$setting->image_footer}}" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- // Loader -->
    <!-- START => Header -->
    <header>
        <div class="container">
            <div class="d-flex align-items-center justify-content-between">
                <div class="logo">
                    <a href=""><img src="{{$setting->image_logo}}" class="img-fluid" alt=""></a>
                </div>
                <nav>
                    <img src="{{$setting->image_logo}}" class="img-fluid logo-mobile" alt="">
                    <hr class="on-mobile">
                    <ul class="d-flex align-content-center">
                        <li><a href="{{route('home')}}" class="{{$page=='home'?'active':''}}">@lang('site.home')</a>
                        </li>

                        <li><a href="{{route('about')}}"
                                class="{{$page=='abouts'?'active':''}} ">@lang('site.abouts')</a></li>

                        <li class="has-dropdown {{$page=='shop'?'active':''}}">
                            <a href="">@lang('site.shop')</a>
                            <div class="mega_menu">
                                <ul class="row">
                               @foreach ($header_sections as $header_section)
                                <li class="col-md-3">
                                    <a href="" class="title_catg">{{$header_section->title}}</a>
                                    <ul>
                                        @foreach ($header_section->category as $category)
                                        <li><a href="{{route('subCategories',['id'=>$category->id,'title'=>make_slug($category->title)])}}">{{$category->title}}</a></li>
                                        @endforeach

                                    </ul>
                                </li>
                                @endforeach
                                </ul>
                            </div>
                            </li>

                        {{-- <li><a href="{{route('products')}}"
                                class="{{$page=='shop'?'active':''}} ">@lang('site.shop')</a></li> --}}
                        <li><a href="{{route('elite_products')}}"
                                class="{{$page=='elite_products'?'active':''}} ">@lang('site.Elite Products')</a></li>
                        <li><a href="{{route('galleries')}}"
                                class="{{$page=='galleries'?'active':''}} ">@lang('site.galleries')</a></li>
                        <li><a href="{{route('blogs')}}"
                                class="{{$page=='blogs'?'active':''}} ">@lang('site.useful_information')</a></li>
                        <li><a href="{{route('contact')}}"
                                class="{{$page=='contact'?'active':''}} ">@lang('site.contact')</a></li>
                    </ul>
                </nav>


                 @include('partials.header._customer_profile')


            </div>
        </div>
    </header>
    <!-- //END => Header -->
    @yield('content')
    @include('partials._session')
    <!-- START => Footer -->
    <footer class="" style="background-image: url({{url('/')}}/frontend/assets/imgs/footer_map-03.png);">
        <div class="container">
            <div class="logo text-center py-5">
                <a href=""><img src="{{$setting->image_footer}}" class="img-fluid" alt=""></a>
                <p class="my-5">
                    @lang('site.footer_slug')
                    <br> @lang('site.footer_slug2').
                </p>
                <div class="social-footer d-flex align-items-center justify-content-center">
                    @foreach($socails as $socail)
                    @if($socail->link!=null)
                    <li><a href="{{$socail->link}}" target="_blank"><i class="fab fa-lg {{$socail->icon}}"></i></a>
                    </li>
                    @endif
                    @endforeach
                </div>
            </div>
        </div>
        <div class="copyright-footer">
            <div class="container">
                <p class="m-0"> &copy; CUTZEGYPT™ All Rights Reserved - <?php echo date("Y"); ?></p>
            </div>
        </div>
    </footer>
    <!-- //END => Footer -->
    <!-- Button Scroll To Top -->
    <!-- <a href="" class="scrollToTop"><i class="fas fa-chevron-up"></i></a> -->
    <!-- <a href="#" class="ltx-go-top floating ltx-go-top-icon show"><span class="go-top-icon-v2 icon icon-top"></span><span class="txt">go top</span></a> -->
    <!-- // Button Scroll To Top -->
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="{{url('/')}}/frontend/assets/js/jquery-1.12.4.min.js"></script>
    <script src="{{url('/')}}/frontend/assets/js/bootstrap.bundle.min.js"></script>
    <script src="{{url('/')}}/frontend/assets/libs/selectric/jquery.selectric.js"></script>
    <script src="{{url('/')}}/frontend/assets/libs/owl.carousel/owl.carousel.min.js"></script>
    <script src="{{url('/')}}/frontend/assets/libs/swipper/swiper.min.js"></script>
    <script src="{{url('/')}}/frontend/assets/libs/wow/wow.min.js"></script>
    <script src="{{url('/')}}/frontend/assets/libs/mixitup/mixitup.min.js"></script>
    <script src="{{url('/')}}/frontend/assets/libs/popup/jquery.fancybox.min.js"></script>
    <script src="{{url('/')}}/frontend/assets/libs/numscroller-1.0.js"></script>
    <script src="{{url('/')}}/frontend/assets/libs/parallax.min.js"></script>
    <script src="{{url('/')}}/frontend/assets/js/main.js"></script>
</body>

</html>
