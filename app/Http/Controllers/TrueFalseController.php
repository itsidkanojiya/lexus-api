<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TrueFalseController extends Controller
{
    public function getTrueFalse(){
        $skip= (int) request()->skip ?? 0;
        $limit = request()->limit ?? 10;
        $orderBy =request()->orderBy ?? "id";
        $ascending= request()->ascending ?? 'ASC';
        $search= request()->search ?? '';

        $true_false = DB::table('true_false')->where('deleted_at',null)->where(

            function($query) use ($search){
                return $query
                ->orWhere('question','like', '%'. $search . '%')
                ->orWhere('answer','like', '%'. $search . '%')
               ;
            }
        )->orderBy($orderBy,$ascending)->skip($skip)->take($limit)->get();

        return response([
            'questions' => $true_false,
            ],200);
    }
    public function addTrueFalse(Request $request){

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


   $bookId= DB::table('true_false')->insertGetId($validation);
        return response([
            'message' => 'TrueFalse added Successfully',
          ],201);
    }
    public function editTrueFalse(Request $request){

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


        $bookId= DB::table('true_false')->where('id',$request->id)->update($validation);
        return response([
            'message' => 'TrueFalse edited Successfully',
            ],200);
    }
      public function deleteTrueFalse(Request $request){

        $request->validate([
            'id'    => 'required',

         ]);
         $current_timestamp = Carbon::now();

         DB::table('true_false')->where('id',$request->id)->update(array('deleted_at' =>  $current_timestamp));;
        return response([
            'message' => 'Successfully Deleted',
            ],200);
    }
}
