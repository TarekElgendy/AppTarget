<?php

namespace App\Http\Controllers\Dashboard;

use App\Program;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\backend\ProgramRequest;
use Illuminate\Support\Facades\Storage;

class ProgramController extends Controller
{
    public function __construct()
    {
        //create read update delete
        $this->middleware(['permission:read_programs'])->only('index');
        $this->middleware(['permission:create_programs'])->only('create');
        $this->middleware(['permission:update_programs'])->only('edit');
        $this->middleware(['permission:delete_programs'])->only('destroy');
    } //end of constructor
    public function index(Request $request)
    {
        $programs = Program::when($request->search, function ($q) use ($request) {
            return $q->whereTranslationLike('title', '%' . $request->search . '%');
        })->latest()->get();
        return view('dashboard.programs.index', compact('programs'));
    } //end of index
    public function create()
    {
        return view('dashboard.programs.create');
    } //end of create
    public function store(ProgramRequest $request)
    {
        $request_data = $request->all();
        if ($request->image) {
            $request_data['image'] = upload_img($request->image, 'uploads/program/', 600);
        } //end of if
        $program = Program::create($request_data);

        session()->flash('success', __('site.added_successfully'));
        return redirect()->back();
    } //end of store


    public function show(Program $program)
    {
        //
    }
    public function edit(Program $program)
    {
        return view('dashboard.programs.edit', compact('program'));
    } //end of edit
    public function update(ProgramRequest $request, Program $program)
    {
        $request_data = $request->except(['image',]);
        if ($request->image) {
            //check if img not empty remove the current img to replace the new img
            if ($program->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/' . $program->image);
            } //end of inner if
            $request_data['image'] = upload_img($request->image, 'uploads/program/', 600);
        } //end of external if
        $program->update($request_data);

        session()->flash('success', __('site.updated_successfully'));
        return redirect()->back();
    } //end of update
    public function destroy($program)
    {
        $item = Program::find($program);
        if ($item) {
            if ($item->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/program/' . $item->image);
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
        $item = Program::find($id);
        if ($item) {
            Program::create([
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
