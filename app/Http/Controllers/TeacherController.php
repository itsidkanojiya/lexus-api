<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TeacherController extends Controller
{
    public function teacherRegister(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'number' => 'required',
            'std' => 'required',
            'school' => 'required',
            'subject' => 'required',
            'password' => 'required',

        ]);

            $validation['name'] =  $request->name;
            $validation['number'] = $request->number;
            $validation['password'] = bcrypt($request->password);
            $validation['std'] = $request->std;
            $validation['subject'] = $request->subject;
            $validation['user_type'] = 'teacher';
            $validation['school'] = $request->school;
            $validation['is_verified'] = 1;



        $user = new User($validation);

        if ($user->save()) {
            $tokenResult = $user->createToken('Personal Access Token');
            $token = $tokenResult->plainTextToken;

            return response()->json([
                'message' => 'Successfully created teacher!',
                'accessToken' => $token,
            ], 201);
        } else {
            return response()->json(['error' => 'Provide proper details']);
        }
    }

    public function getActiveTeacher()
    {
        $teacher = DB::table('users')->where('user_type','teacher')->where('deleted_at',null)->where('is_verified',1)->select('id','name', 'number', 'std' , 'school' ,'subject')->get();
        return response([
            'users' =>  $teacher],200);
    }

    public function getPendingTeacher()
    {
        $teacher = DB::table('users')->where('user_type','teacher')->where('deleted_at',null)->where('is_verified',0)->select('id','name', 'number', 'std' , 'school' ,'subject')->get();
        return response([
            'users' =>  $teacher],200);
    }

    public function makeActivate(Request $request){

        $request->validate([
            'id'    => 'required',

         ]);

         DB::table('users')->where('id',$request->id)->update(array('is_verified' => 1));;
        return response([
            'message' => 'Successfully Activated',
            ],200);
    }

    public function makeDeactivate(Request $request){

        $request->validate([
            'id'    => 'required',

         ]);

         DB::table('users')->where('id',$request->id)->update(array('is_verified' => 0));;
        return response([
            'message' => 'Successfully Deactivated',
            ],200);
    }

    public function deleteTeacher(Request $request){

        $request->validate([
            'id'    => 'required',

         ]);
         $current_timestamp = Carbon::now();

         DB::table('users')->where('id',$request->id)->update(array('deleted_at' =>  $current_timestamp));;
        return response([
            'message' => 'Successfully Deleted',
            ],200);
    }



}
