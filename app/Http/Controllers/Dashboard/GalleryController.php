<?php

namespace App\Http\Controllers\Dashboard;

use App\CategoryGallery;
use App\Gallery;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\backend\GalleryRequest;
use Illuminate\Support\Facades\Storage;

class GalleryController extends Controller
{

    public function __construct()
    {
        //create read update delete
        $this->middleware(['permission:read_galleries'])->only('index');
        $this->middleware(['permission:create_galleries'])->only('create');
        $this->middleware(['permission:update_galleries'])->only('edit');
        $this->middleware(['permission:delete_galleries'])->only('destroy');
    } //end of constructor
    public function index(Request $request)
    {
        $galleries = CategoryGallery::when($request->search, function ($q) use ($request) {
            return $q->whereTranslationLike('title', '%' . $request->search . '%');
        })->latest()->get();
        return view('dashboard.galleries.index', compact('galleries'));
    } //end of index
    public function create()
    {
        return view('dashboard.galleries.create');
    } //end of create
    public function store(GalleryRequest $request)
    {
        $request_data = $request->except(['image', 'images',]);
        if ($request->image) {
            $request_data['image'] = upload_img($request->image, 'uploads/galleries/', 755);
        } //end of if
        $category = CategoryGallery::create($request_data);
        if ($request->file('images')) {
            $this->InsertImages($request->file('images'), $category->id);
        } //end of if
        session()->flash('success', __('site.added_successfully'));
        return redirect()->route('dashboard.galleries.index');
    } //end of store

    public function InsertImages($request, $last_id)
    {
        $data = MultipleUploadImages($request, 'uploads/galleries/', 755);
        foreach ($data as $file_name) {
            Gallery::insert([
                'image' => $file_name,
                'category_gallery_id' => $last_id,
            ]);
        }
    } //insert images
    public function show(CategoryGallery $category)
    {
        //
    }
    public function edit($category)
    {
        $category = CategoryGallery::find($category);

        return view('dashboard.galleries.edit', compact('category'));
    } //end of edit
    public function update(GalleryRequest $request,  $category)
    {
        $category = CategoryGallery::find($category);
        $request_data = $request->except(['image', 'images',]);
        if ($request->image) {
            //check if img not empty remove the current img to replace the new img
            if ($category->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/' . $category->image);
            } //end of inner if
            $request_data['image'] = upload_img($request->image, 'uploads/galleries/', 755);
        } //end of external if
        $category->update($request_data);
        if ($request->file('images')) {
            $this->InsertImages($request->file('images'), $category->id);
        } //end of if
        session()->flash('success', __('site.updated_successfully'));
        return redirect()->route('dashboard.galleries.index');
    } //end of update
    public function destroy($category)
    {
        $item = CategoryGallery::find($category);
        if ($item) {
            if ($item->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/galleries/' . $item->image);
            } //end of if
            $item->delete();
            session()->flash('success', __('site.deleted_successfully'));
            return redirect()->route('dashboard.galleries.index');
        } else {
            session()->flash('success', __('site.deleted_successfully'));
            return redirect()->route('dashboard.galleries.index');
        }
    } //end of destroy

    public function duplicate($id)
    {
        $item = CategoryGallery::find($id);
        if ($item) {
            CategoryGallery::create([
                'image' =>  $item->image,
                'ar' => [
                    'title' => $item->title . 'copy' . $item->id,
                    'description'  => $item->description,
                    'short_description' => $item->short_description,
                ],
                'en' => [
                    'title' => $item->title . 'copy' . $item->id,
                    'description'  => $item->description,
                    'short_description' => $item->short_description,
                ],
            ]);/* end of create */
            session()->flash('success', __('site.added_successfully'));
            return redirect()->route('dashboard.galleries.index');
        }
    } //end of duplicate
    public function delete_image($id)
    {
        $img = Gallery::find($id);
        if ($img->image != 'default.png') {
            Storage::disk('public_uploads')->delete('/galleries/' . $img->image);
        } //end of if
        $img->delete();
        session()->flash('success', __('site.deleted_successfully'));
        return redirect()->back();
    }
}
