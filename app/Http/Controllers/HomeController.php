<?php

namespace App\Http\Controllers;

use App\About;
use App\Blogs;
use App\Brands;
use App\Category;
use App\CategoryGallery;
use App\Gallery;
use App\Http\Requests\frontend\ContactRequest;
use App\Http\Requests\frontend\QuoteRequest;
use App\Inbox;
use App\Package;
use App\Page;
use App\Parteners;
use App\Product;
use App\ProductTag;
use App\Quote;
use App\Section;
use App\Service;
use App\Slider;
use App\SubCategory;
use App\Subscribe;
use App\Tag;
use App\Testimonails;
use App\Traits\FrontendTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Victorybiz\GeoIPLocation\GeoIPLocation;

class HomeController extends Controller
{
    use FrontendTrait;

    public function __construct()
    {
        // $this->middleware('auth');
    }
    public function index()
    {
        $sliders = Slider::latest()->take(10)->get();
        $categories = Category::latest()->take(10)->get();
        return view('frontend.home', compact('sliders', 'categories'));
    } //end of index
    public function about()
    {
        $abouts = About::get();
        $parteners = Parteners::get();
        return view('frontend.about', compact('abouts', 'parteners'));
    } //end of about
    public function galleries()
    {
        $galleries = CategoryGallery::latest()->paginate($this->PaginateNumber);

        return view('frontend.galleries', compact('galleries'));
    } //end of galleries
    public function gallery_detial($id, $slug)
    {
        $gallery = CategoryGallery::find($id);

        $galleries = Gallery::where('category_gallery_id', $id)->latest()->paginate($this->PaginateNumber);

        return view('frontend.gallery_detial', compact('gallery', 'galleries'));
    } //end of gallery_detial
    public function blogs()
    {
        $blogs = Blogs::latest()->paginate($this->PaginateNumber);

        return view('frontend.blogs', compact('blogs'));
    } //end of blogs
    public function blog_detail($id, $slug)
    {
        $blog = Blogs::find($id);
        $blogs = Blogs::where('id', '!=', $id)->latest()->get();

        return view('frontend.blog_detail', compact('blogs', 'blog'));
    } //end of blog_detail



    public function elite_products()
    {
        $products = Product::Elite()->InStock()->Active()->latest()->paginate($this->PaginateNumber);
        return view('frontend.elite_products', compact('products'));
    } //end of elite_products
    public function products()
    {
        $products = Product::NotElite()->InStock()->Active()->latest()->paginate($this->PaginateNumber);
        $tags = Tag::inRandomOrder()->take(20)->get();
        $categories = Category::inRandomOrder()->take(20)->get();
        $price_max = Product::max('price');
        $price_min = Product::min('price');


        return view('frontend.products', compact('products', 'tags', 'categories', 'price_max', 'price_min'));
    } //end of products
    public function product_details($id, $slug)
    {
        $product =  Product::find($id);



        return view('frontend.product_details', compact('product'));
    } //end of product_details
    public function subCategories($id, $slug)
    {
        $category = Category::find($id);
        $subCategories =  SubCategory::where('category_id', $id)->get();

        return view('frontend.subCategories', compact('category', 'subCategories'));
    } //end of subCategories

    public function productsSubCategories($id, $slug)
    {
        $products = Product::where('subCategory_id', $id)->InStock()->Active()->latest()->paginate($this->PaginateNumber);
        $tags = Tag::inRandomOrder()->take(20)->get();
        $categories = Category::inRandomOrder()->take(20)->get();
        $price_max = Product::max('price');
        $price_min = Product::min('price');


        return view('frontend.products', compact('products', 'tags', 'categories', 'price_max', 'price_min'));
    }

    public function product_search(Request $request)
    {

        $price_max = Product::max('price');
        $price_min = Product::min('price');

        //       dd($request->all());
        $categories = Category::take(20)->get();
        $tags = Tag::take(10)->get();
        if (request('tag_arr')) {
            $product_ids = ProductTag::WhereIn('tag_id', request('tag_arr'))->pluck('product_id');
        } else {
            $product_ids = null;
        }



        $products = Product::when($product_ids, function ($q) use ($product_ids) {
            return $q->whereIn('id', $product_ids);
        })
            ->when(request('subCategory_arr'), function ($qc) use ($request) {
                return $qc->whereIn('subCategory_id', request('subCategory_arr'));
            })
            ->when(request('keyword'), function ($qkeyword) use ($request) {
                return $qkeyword->whereTranslationLike('title', '%' . $request->keyword . '%')->orWhereTranslationLike('description', '%' . $request->keyword . '%');
            })

            ->when(request('price_rang_min'), function ($price_rang) use ($request) {
                return $price_rang->whereBetween('price', array(request('price_rang_min'), request('price_rang_max')));
            })

            // ->when(request('price_sort'), function ($price_sort) use ($request) {
            //     if (request('price_sort')== 'price_HtoL'){
            //         return $price_sort->whereBetween('price', array(request('price_rang_min'), request('price_rang_max')));

            //     }
            // })

            ->InStock()->Active()->latest()->paginate($this->PaginateNumber);


        return view('frontend.search', compact('products', 'tags', 'categories', 'price_max', 'price_min'));
    } //end of product_search


    public function contact()
    {
        $num1 = rand(1, 4);
        $num2 = rand(1, 4);
        return view('frontend.contact', compact('num1', 'num2'));
    } //end of privacies
    public function post_contact(ContactRequest $request)
    {
        $request->validate([
            'phone' => 'required',
            'name' => 'required',
            'message' => 'required',
            'email' => 'required|email',
        ]);
        $request_data = $request->except(['num1', 'num2', 'result']);
        Inbox::create($request_data);
        session()->flash('success', __('site.added_successfully'));
        return redirect()->back();
    } //end of post_contact
    public function subscribe(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);
        $request_data = $request->except(['']);
        Subscribe::create($request_data);
        session()->flash('success', __('site.added_successfully'));
        return redirect()->back();
    } //end of subscribe
    public function privacies()
    {
        $item = Page::where('type', 'privacies')->first();
        return view('frontend.privacies', compact('item'));
    } //end of privacies
    public function polices()
    {
        $item   = Page::where('type', 'polices')->first();
        return view('frontend.polices', compact('item'));
    } //end of polices
}
