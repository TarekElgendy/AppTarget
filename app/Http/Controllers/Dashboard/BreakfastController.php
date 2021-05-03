<?php

namespace App\Http\Controllers\Dashboard;

use App\Breakfast;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\backend\BreakfastRequest;
use Illuminate\Support\Facades\Storage;

class BreakfastController extends Controller
{
    public function __construct()
    {
        //create read update delete
        $this->middleware(['permission:read_breakfasts'])->only('index');
        $this->middleware(['permission:create_breakfasts'])->only('create');
        $this->middleware(['permission:update_breakfasts'])->only('edit');
        $this->middleware(['permission:delete_breakfasts'])->only('destroy');
    } //end of constructor
    public function index(Request $request)
    {
        $breakfasts = Breakfast::when($request->search, function ($q) use ($request) {
            return $q->whereTranslationLike('title', '%' . $request->search . '%');
        })->latest()->get();
        return view('dashboard.breakfasts.index', compact('breakfasts'));
    } //end of index
    public function create()
    {
        return view('dashboard.breakfasts.create');
    } //end of create
    public function store(BreakfastRequest $request)
    {
        $request_data = $request->all();
        if ($request->image) {
            $request_data['image'] = upload_img($request->image, 'uploads/breakfast/', 600);
        } //end of if
        $breakfast = Breakfast::create($request_data);

        session()->flash('success', __('site.added_successfully'));
        return redirect()->back();
    } //end of store


    public function show(Breakfast $breakfast)
    {
        //
    }
    public function edit(Breakfast $breakfast)
    {
        return view('dashboard.breakfasts.edit', compact('breakfast'));
    } //end of edit
    public function update(BreakfastRequest $request, Breakfast $breakfast)
    {
        $request_data = $request->except(['image',]);
        if ($request->image) {
            //check if img not empty remove the current img to replace the new img
            if ($breakfast->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/' . $breakfast->image);
            } //end of inner if
            $request_data['image'] = upload_img($request->image, 'uploads/breakfast/', 600);
        } //end of external if
        $breakfast->update($request_data);

        session()->flash('success', __('site.updated_successfully'));
        return redirect()->back();
    } //end of update
    public function destroy($breakfast)
    {
        $item = Breakfast::find($breakfast);
        if ($item) {
            if ($item->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/breakfast/' . $item->image);
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
        $item = Breakfast::find($id);
        if ($item) {
            Breakfast::create([
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
