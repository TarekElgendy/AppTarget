<?php

namespace App\Http\Controllers\Dashboard;

use App\Snack;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\backend\SnackRequest;
use Illuminate\Support\Facades\Storage;

class SnackController extends Controller
{
    public function __construct()
    {
        //create read update delete
        $this->middleware(['permission:read_snacks'])->only('index');
        $this->middleware(['permission:create_snacks'])->only('create');
        $this->middleware(['permission:update_snacks'])->only('edit');
        $this->middleware(['permission:delete_snacks'])->only('destroy');
    } //end of constructor
    public function index(Request $request)
    {
        $snacks = Snack::when($request->search, function ($q) use ($request) {
            return $q->whereTranslationLike('title', '%' . $request->search . '%');
        })->latest()->get();
        return view('dashboard.snacks.index', compact('snacks'));
    } //end of index
    public function create()
    {
        return view('dashboard.snacks.create');
    } //end of create
    public function store(SnackRequest $request)
    {
        $request_data = $request->all();
        if ($request->image) {
            $request_data['image'] = upload_img($request->image, 'uploads/snack/', 600);
        } //end of if
        $snack = Snack::create($request_data);

        session()->flash('success', __('site.added_successfully'));
        return redirect()->back();
    } //end of store


    public function show(Snack $snack)
    {
        //
    }
    public function edit(Snack $snack)
    {
        return view('dashboard.snacks.edit', compact('snack'));
    } //end of edit
    public function update(SnackRequest $request, Snack $snack)
    {
        $request_data = $request->except(['image',]);
        if ($request->image) {
            //check if img not empty remove the current img to replace the new img
            if ($snack->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/' . $snack->image);
            } //end of inner if
            $request_data['image'] = upload_img($request->image, 'uploads/snack/', 600);
        } //end of external if
        $snack->update($request_data);

        session()->flash('success', __('site.updated_successfully'));
        return redirect()->back();
    } //end of update
    public function destroy($snack)
    {
        $item = Snack::find($snack);
        if ($item) {
            if ($item->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/snack/' . $item->image);
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
        $item = Snack::find($id);
        if ($item) {
            Snack::create([
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
