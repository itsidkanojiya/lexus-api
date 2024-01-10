<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GeneratorController extends Controller
{
    public function addPaper(Request $request){

        $pdf= '';

        $validation=  $request->validate([
           'uid'    => 'required',
           'pdf_link' => 'required',
         ]);

        if($request->pdf_link->isValid()){
            $pdf= $request->file('pdf_link')->store('pdf_link');
        }
             $validation['uid'] =  $request->uid;
             $validation['pdf_link'] = $pdf;
             $validation['type'] = 'paper';

        DB::table('generator')->insertGetId($validation);

        return response([
            'message' => 'Paper added Successfully',
          ],201);
    }

    public function getPaperbyUser(){
        $userID = Auth::user();
        $paper = DB::table('generator')->where('deleted_at',null)->where('uid',$userID->id)->where('type','paper')->get();

        return response([
            'paper' =>$paper,
            ],200);
    }

    public function addAssignment(Request $request){

        $pdf= '';

        $validation=  $request->validate([
           'uid'    => 'required',
           'pdf_link' => 'required',
         ]);

        if($request->pdf_link->isValid()){
            $pdf= $request->file('pdf_link')->store('pdf_link');
        }
             $validation['uid'] =  $request->uid;
             $validation['pdf_link'] = $pdf;
             $validation['type'] = 'assignment';

        DB::table('generator')->insertGetId($validation);

        return response([
            'message' => 'Assignment added Successfully',
          ],201);
    }

    public function getAssignmentbyUser(){
        $userID = Auth::user();
        $paper = DB::table('generator')->where('deleted_at',null)->where('uid',$userID->id)->where('type','assignment')->get();

        return response([
            'Assignment' =>$paper,
            ],200);
    }


}
