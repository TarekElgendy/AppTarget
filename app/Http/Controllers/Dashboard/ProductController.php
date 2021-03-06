<?php

namespace App\Http\Controllers\Dashboard;

use App\Addition;
use App\Category;
use App\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\backend\ProductRequest;
use App\ProductTag;
use App\Section;
use App\SubCategory;
use App\Tag;
use App\Image;
use App\Piece;
use App\ProductPiece;
use App\Provenance;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Nexmo\Account\Price;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $categories = Category::all();
        $products = Product::when($request->search, function ($q) use ($request) {
            return $q->whereTranslationLike('title', '%' . $request->search . '%');
        })->when($request->category_id, function ($q) use ($request) {
            return $q->where('category_id', $request->category_id);
        })
            ->when($request->stock_stauts, function ($q) use ($request) {
                if ($request->stock_stauts == "OutOfStock") {
                    return $q->StockOff();
                } elseif ($request->stock_stauts == "LimitedOfStock") {
                    return $q->StockLimited();
                } elseif ($request->stock_stauts == "AvailableOfStock") {
                    return $q->StockAvailable();
                }
            })



            ->latest()->get();
        // $products = Product::StockAvailable()->latest()->get();

        return view('dashboard.products.index', compact('categories', 'products'));
    } //end of index
    public function category_list($id)
    {
        $categories = Category::where('section_id', $id)->get();
        return json_encode($categories);
    } //end of category_list
    public function sub_category_list($id)
    {
        $subcategories = SubCategory::where('category_id', $id)->get();
        return json_encode($subcategories);
    } //end of sub_category_list
    public function pieces($id)
    {
        $pieces = Piece::where('category_id', $id)->get();
        return json_encode($pieces);
    } //end of pieces


    public function create()
    {
        $tags = Tag::get();
        $pieces = Piece::get();
        $sections = Section::get();
        $provenances = Provenance::get();
        return view('dashboard.products.create', compact('sections', 'tags', 'pieces', 'provenances'));
    } //end of create
    public function store(ProductRequest $request)
    {
        $request_data = $request->except(['image', 'image_flag', 'images', 'tag_id', 'piece_id', 'title_en', 'title_ar', 'price_addtion', 'discount_addtion']);
        if ($request->image) {
            $request_data['image'] = upload_img($request->image, 'uploads/product_images/', 800);
        } //end of if

        if ($request->image_flag) {
            $request_data['image_flag'] = upload_img($request->image_flag, 'uploads/product_images/', 600);
        } //end of if
        $product = Product::create($request_data);

        if ($request->file('images')) {
            $this->InsertImages($request->file('images'), $product->id);
        } //end of if
        if ($request->tag_id) {
            $this->tags_create($request->tag_id, $product->id);
        } //end of tag_id
        if ($request->piece_id) {
            $this->pieces_create($request->piece_id, $product->id);
        } //end of piece_id

        if ($request->price_addtion) {
            $this->addtion_product($request->price_addtion, $product->id);
        } //end of piece_id
        session()->flash('success', __('site.added_successfully'));
        return redirect()->back();
    } //end of store
    public function InsertImages($request, $last_id)
    {
        $data = MultipleUploadImages($request, 'uploads/product_images/', 800);
        foreach ($data as $file_name) {
            Image::insert([
                'image' => $file_name,
                'product_id' => $last_id,
            ]);
        }
    } //insert images
    public function addtion_product($price_addtion, $product_id)
    {
        if ($price_addtion) {
            $input = Input::all();
            // dd($input);
            foreach ($input['price_addtion'] as $index => $value) {
                Addition::create([
                    // 'discount' => $input['discount_addtion'][$index],
                    'price' => $input['price_addtion'][$index],
                    'title_en' => $input['title_en'][$index],
                    'title_ar' => $input['title_ar'][$index],
                    'product_id' => $product_id, 'ar' => [
                        //     'title' => $input['title_addtion'],
                    ]
                ]);
            }
        }
    } //insert images
    public function tags_create($tag_id, $product_id)
    {
        if ($tag_id) {
            $input = Input::all();
            foreach ($input['tag_id'] as $index => $value) {
                ProductTag::create(['tag_id' => $input['tag_id'][$index], 'product_id' => $product_id]);
            }
        }
    } // insert tags
    public function pieces_create($piece_id, $product_id)
    {
        if ($piece_id) {
            $input = Input::all();
            foreach ($input['piece_id'] as $index => $value) {
                ProductPiece::create(['piece_id' => $input['piece_id'][$index], 'product_id' => $product_id]);
            }
        }
    } // insert tags
    public function edit(Product $product)
    {
        
        $tag_ids = ProductTag::where('product_id', $product->id)->pluck('tag_id');
        $tag_selects  = Tag::whereIn('id', $tag_ids)->get();
        $tags = Tag::whereNotIn('id', $tag_ids)->get();
        $sections = Section::get();
        $categories = Category::get();
        $subCategories = SubCategory::get();
        $provenances = Provenance::get();


        $piece_id = ProductPiece::where('product_id', $product->id)->pluck('piece_id');
        $piece_selects  = Piece::whereIn('id', $piece_id)->get();
        $pieces = Piece::whereNotIn('id', $piece_id)->get();
        $additions = Addition::where('product_id', $product->id)->get();

        return view('dashboard.products.edit', compact('piece_selects', 'pieces', 'sections', 'categories', 'subCategories', 'provenances',  'product', 'tag_selects', 'tags', 'additions'));
    } //end of edit
    public function update(ProductRequest $request, Product $product)
    {
        $request_data = $request->except(['image', 'image_flag', 'images', 'tag_id', 'piece_id', 'title_en', 'title_ar', 'price_addtion', 'discount_addtion']);
        if ($request->image) {
            if ($product->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/' . $product->image);
            } //end of inner if
            $request_data['image'] = upload_img($request->image, 'uploads/product_images/', 800);
        } //end of external if
        if ($request->image_flag) {
            if ($product->image_flag != 'default.png') {
                Storage::disk('public_uploads')->delete('/' . $product->image_flag);
            } //end of inner if
            $request_data['image_flag'] = upload_img($request->image_flag, 'uploads/product_images/', 600);
        } //end of external if

        $product->update($request_data);
        if ($request->tag_id) {
            ProductTag::where('product_id', $product->id)->delete();
            $this->tags_create($request->tag_id, $product->id);
        } //end of if


        if ($request->piece_id) {

            ProductPiece::where('product_id', $product->id)->delete();
            $this->pieces_create($request->piece_id, $product->id);
        } //end of if


        if ($request->file('images')) {
            $this->InsertImages($request->file('images'), $product->id);
        } //end of if


        if ($request->price_addtion) {
            Addition::where('product_id', $product->id)->delete();
            $this->addtion_product($request->price_addtion, $product->id);
        } //end of piece_id

        session()->flash('success', __('site.updated_successfully'));
        return redirect()->back();
    } //end of update
    public function destroy(Product $product)
    {
        if ($product->image != 'default.png') {
            Storage::disk('public_uploads')->delete('/product_images/' . $product->image);
        } //end of if
        $product->delete();
        session()->flash('success', __('site.deleted_successfully'));
        return redirect()->back();
    } //end of destroy

    public function delete_image($id)
    {
        $img = Image::find($id);
        if ($img->image != 'default.png') {
            Storage::disk('public_uploads')->delete('/product_images/' . $img->image);
        } //end of if
        $img->delete();
        session()->flash('success', __('site.deleted_successfully'));
        return redirect()->back();
    }

    public function duplicate($id)
    {
        $item = Product::find($id);
        if ($item) {
            Product::create([
                'subCategory_id' =>  $item->subCategory_id,
                'section_id' =>  $item->section_id,
                'category_id' =>  $item->category_id,
                'home_page' =>  $item->home_page,
                'ifram' =>  $item->ifram,
                'link' =>  $item->link,
                'sku' =>  $item->sku,
                'falg' =>  $item->falg,
                // 'status' =>  'not active',
                'status' =>  'active',

                'discount' =>  $item->discount,
                'price' =>  $item->price,
                'image' =>  $item->image,
                'ar' => [
                    'title' => $item->title .   $item->id,
                    'description'  => $item->description,
                    'short_description' => $item->short_description,
                    'extra_description' => $item->extra_description,
                ],
                'en' => [
                    'title' => $item->title .   $item->id,
                    'description'  => $item->description,
                    'short_description' => $item->short_description,
                    'extra_description' => $item->extra_description,
                ],
            ]);/* end of create */
            session()->flash('success', __('site.added_successfully'));
            return redirect()->back();
        }
    } //end of duplicate

}//end of controller
