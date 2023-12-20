<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class McqController extends Controller
{
    public function getMcq(){
        $skip= (int) request()->skip ?? 0;
        $limit = request()->limit ?? 10;
        $orderBy =request()->orderBy ?? "id";
        $ascending= request()->ascending ?? 'ASC';
        $search= request()->search ?? '';

        $mcq = DB::table('mcq')->where('deleted_at',null)->where(

            function($query) use ($search){
                return $query
                ->orWhere('question','like', '%'. $search . '%')
                ->orWhere('option1','like', '%'. $search . '%')
                ->orWhere('option2','like', '%'. $search . '%')
                ->orWhere('option3','like', '%'. $search . '%')
                ->orWhere('option4','like', '%'. $search . '%')
                ->orWhere('answer','like', '%'. $search . '%')
                ->orWhere('solution','like', '%'. $search . '%');
            }
        )->orderBy($orderBy,$ascending)->skip($skip)->take($limit)->get();

        return response([
            'questions' => $mcq,
            ],200);
    }
    public function addMcq(Request $request){

        $validation=  $request->validate([
          'board'      => 'required',
          'std'      => 'required',
          'question' => 'required',
          'option1' => 'required',
          'option2' => 'required',
          'option3' => 'required',
          'option4' => 'required',
          'answer'   => 'required',
          'solution' => 'required',
         ]);

                 $validation['board'] =  $request->board;
                 $validation['std'] =  $request->std;
                 $validation['question'] = $request->question;
                 $validation['option1'] = $request->option1;
                 $validation['option2'] =  $request->option2;
                 $validation['option3'] =  $request->option3;
                 $validation['option4'] =  $request->option4;
                 $validation['answer'] =  $request->answer;
                 $validation['solution'] =  $request->solution;


   $bookId= DB::table('mcq')->insertGetId($validation);
        return response([
            'message' => 'Mcq added Successfully',
          ],200);
    }
    public function editMcq(Request $request){

        $validation=  $request->validate([
            'board'     => 'required',
            'std'     => 'required',
            'question' => 'required',
            'option1' => 'required',
            'option2' => 'required',
            'option3' => 'required',
            'option4' => 'required',
            'answer'   => 'required',
            'solution' => 'required',
           ]);

                   $validation['board'] =  $request->board;
                   $validation['std'] =  $request->std;
                   $validation['question'] = $request->question;
                   $validation['option1'] = $request->option1;
                   $validation['option2'] =  $request->option2;
                   $validation['option3'] =  $request->option3;
                   $validation['option4'] =  $request->option4;
                   $validation['answer'] =  $request->answer;
                   $validation['solution'] =  $request->solution;


        $bookId= DB::table('mcq')->where('id',$request->id)->update($validation);
        return response([
            'message' => 'Mcq edited Successfully',
            ],201);
    }  public function deleteMcq(Request $request){

        $request->validate([
            'id'    => 'required',

         ]);
         $current_timestamp = Carbon::now();

         DB::table('mcq')->where('id',$request->id)->update(array('deleted_at' =>  $current_timestamp));;
        return response([
            'message' => 'Successfully Deleted',
            ],200);
    }
}
