<?php

namespace App\Http\Controllers\Api\General;

use App\About;
use App\Blogs;
use App\Breakfast;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\BlogResource;
use App\Http\Resources\SliderResource;
use App\Http\Resources\SectionResource;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\SubCategoryResource;
use App\Http\Resources\ProductResource;
use App\Http\Resources\ImageProductResource;
use App\Http\Resources\AdditionResource;
use App\Http\Resources\CollectionResource;
use App\Section;
use App\Category;
use App\City;
use App\Collection;
use App\Country;
use App\Day;
use App\Dinner;
use App\Http\Requests\Api\PromoCodeRequest;
use App\Http\Resources\AboutResource;
use App\Http\Resources\BreakfastResource;
use App\Http\Resources\CityResource;
use App\Http\Resources\CountryResource;
use App\Http\Resources\DayResource;
use App\Http\Resources\DinnerResource;
use App\Http\Resources\LaunchResource;
use App\Http\Resources\PageResource;
use App\Http\Resources\ProgramResource;
use App\Http\Resources\PromoResource;
use App\Http\Resources\SnackResource;
use App\Http\Resources\TagsResource;
use App\Inbox;
use App\Launch;
use App\Page;
use App\Piece;
use App\SubCategory;
use App\Product;
use App\ProductPiece;
use App\ProductTag;
use App\Program;
use App\PromoCode;
use App\Slider;
use App\Snack;
use App\Tag;
use App\Traits\ApiResponseTrait;

use Illuminate\Support\Facades\Validator;

class MainController extends Controller
{
    use ApiResponseTrait;


    
    public function addPromoCode(PromoCodeRequest $request)
    {
        $promocode = PromoCode::where('code', $request->code)->whereDate('endDate', '>=', now()->toDateString())->first();
    
        return $this->sendResponse(new PromoResource($promocode), "");
    } //end of addPromoCode

    
    public function cities()
    {
        $cites = CityResource::collection(City::paginate($this->PaginateNumber));
        return $this->sendResponse($cites, "");
    }//end of cities
    public function breakfasts()
    {
        $breakfasts = BreakfastResource::collection(Breakfast::paginate($this->PaginateNumber));
        return $this->sendResponse($breakfasts, "");
    }//end of breakfasts
  
    public function dinners()
    {
        $dinners = DinnerResource::collection(Dinner::paginate($this->PaginateNumber));
        return $this->sendResponse($dinners, "");
    }//end of dinners
    public function launches()
    {
        $launches =  LaunchResource::collection(Launch::paginate($this->PaginateNumber));
        return $this->sendResponse($launches, "");
    }//end of launches

    public function snacks()
    {
        $snacks = SnackResource::collection(Snack::paginate($this->PaginateNumber));
        return $this->sendResponse($snacks, "");
    }//end of snacks
    public function days()
    {
        $days = DayResource::collection(Day::paginate($this->PaginateNumber));
        return $this->sendResponse($days, "");
    }//end of days
    public function programs()
    {
        $programs = ProgramResource::collection(Program::paginate($this->PaginateNumber));
        return $this->sendResponse($programs, "");
    }//end of programs

    public function collections()
    {
        $collections = Collection::get();
        $items = CollectionResource::collection($collections);
        return $this->sendResponse($items, "");
    } //end of collections

    public function sliders()
    {
        // $sliders = Slider::first();
        // return $this->sendResponse(new SliderResource($sliders), "");
        $sliders = SliderResource::collection(Slider::paginate($this->PaginateNumber));
        return $this->sendResponse($sliders, "");
    } //end of slider
    public function about()
    {
        $items = AboutResource::collection(About::paginate($this->PaginateNumber));
        return $this->sendResponse($items, "");
    } //end of about
    public function pages()
    {
        $items = PageResource::collection(Page::paginate($this->PaginateNumber));
        return $this->sendResponse($items, "");
    } //end of pages

 
    public function blogs()
    {
        $items = BlogResource::collection(Blogs::paginate($this->PaginateNumber));
        return $this->sendResponse($items, "");
    } //end of blogs


    public function sections()
    {
        $items = SectionResource::collection(Section::get());
        return $this->sendResponse($items, "");
    } //end of sections
    public function categories(Request $request)
    {

        $items = CategoryResource::collection(Category::where('section_id', $request->id_section)->get());
        return $this->sendResponse($items, "");
    } //end of categories
    public function sub_categories(Request $request)
    {
        $items = SubCategoryResource::collection(SubCategory::where('category_id', $request->category_id)->get());
        return $this->sendResponse($items, "");
    } //end of sub_categories
    public function products(Request $request)
    {

        if ($request->piece_id) {

            $product_id = ProductPiece::where('piece_id', $request->piece_id)->pluck('product_id');
            $products = Product::WhereIn('id', $product_id)->InStock()->Active()->paginate($this->PaginateNumber);
            //     dd(count($products));
        }
        if ($request->subCategory_id) {

            $products = Product::where('subCategory_id', $request->subCategory_id)->InStock()->Active()->paginate($this->PaginateNumber);
        }


        $items = ProductResource::collection($products);
        return $this->sendResponse($items, "");
    } //end of products

    public function relatedProduct(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',

        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        $product = Product::find($request->product_id);
        $products = Product::where('category_id', $product->category_id)->where('id', '!=', $product->id)->InStock()->Active()->paginate($this->PaginateNumber);

        $items = ProductResource::collection($products);
        return $this->sendResponse($items, "");
    } //end of relatedProduct

    public function offers()
    {
        $products = Product::HasOffer()->InStock()->Active()->paginate($this->PaginateNumber);
        $items = ProductResource::collection($products);
        return $this->sendResponse($items, "");
    } //end of offers

    public function search(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'key' => 'required',

        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        $products = Product::when($request->key, function ($q) use ($request) {
            return $q->whereTranslationLike('title', '%' . $request->key . '%');
        })->InStock()->Active()->paginate($this->PaginateNumber);
        $items = ProductResource::collection($products);
        return $this->sendResponse($items, "");
    } //end of search

    public function filter(Request $request)
    {
        $validator = Validator::make($request->all(), [
            //'subCategory_arr' => 'required',
            //'tag_arr' => 'required',

        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }

        $tag_arr = explode(",", request('tag_arr'));

        if ($tag_arr) {
            $product_ids = ProductTag::WhereIn('tag_id', $tag_arr)->pluck('product_id');
        } else {
            $product_ids = null;
        }


        $products = Product::when($product_ids, function ($q) use ($product_ids) {
            return $q->whereIn('id', $product_ids);
        })
            ->when(request('subCategory_arr'), function ($qc) use ($request) {
                return $qc->whereIn('subCategory_id', explode(",", request('subCategory_arr')));
            })
            ->when(request('Category_arr'), function ($qCategory_arr) use ($request) {
                return $qCategory_arr->whereIn('category_id', explode(",", request('Category_arr')));
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


        $items = ProductResource::collection($products);
        return $this->sendResponse($items, "");
    } //end of filter

    public function contact(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'message' => 'required',
            'phone' => 'required',

        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }

        $items = Inbox::create($request->all());
        return $this->sendResponse("", "");
    } //end of search



 

    public function countries()
    {
        $countries = Country::get();
        $items = CountryResource::collection($countries);
        return $this->sendResponse($items, "");
    } //end of countries
    public function tags()
    {
        $items = Tag::get();
        $items = TagsResource::collection($items);
        return $this->sendResponse($items, "");
    } //end of tags
}
