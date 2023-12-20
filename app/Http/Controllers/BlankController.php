<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BlankController extends Controller
{
    public function getBlank(){
        $skip= (int) request()->skip ?? 0;
        $limit = request()->limit ?? 10;
        $orderBy =request()->orderBy ?? "id";
        $ascending= request()->ascending ?? 'ASC';
        $search= request()->search ?? '';

        $blanks = DB::table('blanks')->where('deleted_at',null)->where(

            function($query) use ($search){
                return $query
                ->orWhere('question','like', '%'. $search . '%')
                ->orWhere('answer','like', '%'. $search . '%')
                ->orWhere('solution','like', '%'. $search . '%');
            }
        )->orderBy($orderBy,$ascending)->skip($skip)->take($limit)->get();

        return response([
            'questions' => $blanks,
            ],200);
    }
    public function addBlank(Request $request){

        $validation=  $request->validate([
          'board'     => 'required',
          'std'     => 'required',
          'question' => 'required',
          'answer'   => 'required',
          'solution' => 'required',
         ]);

                 $validation['board'] =  $request->board;
                 $validation['std'] =  $request->std;
                 $validation['question'] = $request->question;
                 $validation['answer'] =  $request->answer;
                 $validation['solution'] =  $request->solution;


   $bookId= DB::table('blanks')->insertGetId($validation);
        return response([
            'message' => 'Blank added Successfully',
          ],201);
    }
    public function editBlank(Request $request){

        $validation=  $request->validate([
            'board'     => 'required',
            'std'     => 'required',
            'question' => 'required',

            'answer'   => 'required',
            'solution' => 'required',
           ]);

                   $validation['board'] =  $request->board;
                   $validation['std'] =  $request->std;
                   $validation['question'] = $request->question;
                   $validation['answer'] =  $request->answer;
                   $validation['solution'] =  $request->solution;


        $bookId= DB::table('blanks')->where('id',$request->id)->update($validation);
        return response([
            'message' => 'Blank edited Successfully',
            ],200);
    }
    public function deleteBlank(Request $request){

        $request->validate([
            'id'    => 'required',

         ]);
         $current_timestamp = Carbon::now();

         DB::table('blanks')->where('id',$request->id)->update(array('deleted_at' =>  $current_timestamp));;
        return response([
            'message' => 'Successfully Deleted',
            ],200);
    }
}
