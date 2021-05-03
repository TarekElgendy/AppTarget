<?php

namespace App\Http\Controllers\Dashboard;

use App\Dinner;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\backend\DinnerRequest;
use Illuminate\Support\Facades\Storage;

class DinnerController extends Controller
{
    public function __construct()
    {
        //create read update delete
        $this->middleware(['permission:read_dinners'])->only('index');
        $this->middleware(['permission:create_dinners'])->only('create');
        $this->middleware(['permission:update_dinners'])->only('edit');
        $this->middleware(['permission:delete_dinners'])->only('destroy');
    } //end of constructor
    public function index(Request $request)
    {
        $dinners = Dinner::when($request->search, function ($q) use ($request) {
            return $q->whereTranslationLike('title', '%' . $request->search . '%');
        })->latest()->get();
        return view('dashboard.dinners.index', compact('dinners'));
    } //end of index
    public function create()
    {
        return view('dashboard.dinners.create');
    } //end of create
    public function store(DinnerRequest $request)
    {
        $request_data = $request->all();
        if ($request->image) {
            $request_data['image'] = upload_img($request->image, 'uploads/dinner/', 600);
        } //end of if
        $dinner = Dinner::create($request_data);

        session()->flash('success', __('site.added_successfully'));
        return redirect()->back();
    } //end of store


    public function show(Dinner $dinner)
    {
        //
    }
    public function edit(Dinner $dinner)
    {
        return view('dashboard.dinners.edit', compact('dinner'));
    } //end of edit
    public function update(DinnerRequest $request, Dinner $dinner)
    {
        $request_data = $request->except(['image',]);
        if ($request->image) {
            //check if img not empty remove the current img to replace the new img
            if ($dinner->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/' . $dinner->image);
            } //end of inner if
            $request_data['image'] = upload_img($request->image, 'uploads/dinner/', 600);
        } //end of external if
        $dinner->update($request_data);

        session()->flash('success', __('site.updated_successfully'));
        return redirect()->back();
    } //end of update
    public function destroy($dinner)
    {
        $item = Dinner::find($dinner);
        if ($item) {
            if ($item->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/dinner/' . $item->image);
            } //end of if
            $item->delete();
            session()->flash('success', __('site.deleted_successfully'));
            return redirect()->back();
        } else {
            session()->flash('success', __('site.deleted_successfully'));
            return redirect()->back();
        }
    } //end of destroy

    public function duplicate($id)
    {
        $item = Dinner::find($id);
        if ($item) {
            Dinner::create([
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
            return redirect()->back();
        }
    } //end of duplicate

}
