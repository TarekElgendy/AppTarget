<?php

namespace App\Http\Controllers\Dashboard;

use App\Launch;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\backend\LaunchRequest;
use Illuminate\Support\Facades\Storage;

class LaunchController extends Controller
{
    public function __construct()
    {
        //create read update delete
        $this->middleware(['permission:read_launchs'])->only('index');
        $this->middleware(['permission:create_launchs'])->only('create');
        $this->middleware(['permission:update_launchs'])->only('edit');
        $this->middleware(['permission:delete_launchs'])->only('destroy');
    } //end of constructor
    public function index(Request $request)
    {
        $launchs = Launch::when($request->search, function ($q) use ($request) {
            return $q->whereTranslationLike('title', '%' . $request->search . '%');
        })->latest()->get();
        return view('dashboard.launchs.index', compact('launchs'));
    } //end of index
    public function create()
    {
        return view('dashboard.launchs.create');
    } //end of create
    public function store(LaunchRequest $request)
    {
        $request_data = $request->all();
        if ($request->image) {
            $request_data['image'] = upload_img($request->image, 'uploads/launch/', 600);
        } //end of if
        $launch = Launch::create($request_data);

        session()->flash('success', __('site.added_successfully'));
        return redirect()->back();
    } //end of store


    public function show(Launch $launch)
    {
        //
    }
    public function edit(Launch $launch)
    {
        return view('dashboard.launchs.edit', compact('launch'));
    } //end of edit
    public function update(LaunchRequest $request, Launch $launch)
    {
        $request_data = $request->except(['image',]);
        if ($request->image) {
            //check if img not empty remove the current img to replace the new img
            if ($launch->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/' . $launch->image);
            } //end of inner if
            $request_data['image'] = upload_img($request->image, 'uploads/launch/', 600);
        } //end of external if
        $launch->update($request_data);

        session()->flash('success', __('site.updated_successfully'));
        return redirect()->back();
    } //end of update
    public function destroy($launch)
    {
        $item = Launch::find($launch);
        if ($item) {
            if ($item->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/launch/' . $item->image);
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
        $item = Launch::find($id);
        if ($item) {
            Launch::create([
                'image' =>  $item->image,
                'ar' => [
                    'title' => $item->title . '_' .rand(1,5). $item->id,
                    'description'  => $item->description,
                    'short_description' => $item->short_description,
                ],
                'en' => [
                    'title' => $item->title . '_' .rand(1,5). $item->id,
                    'description'  => $item->description,
                    'short_description' => $item->short_description,
                ],
            ]);/* end of create */
            session()->flash('success', __('site.added_successfully'));
            return redirect()->back();
        }
    } //end of duplicate

}
