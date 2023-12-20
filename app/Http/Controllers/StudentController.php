<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StudentController extends Controller
{
    public function studentRegister(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'number' => 'required',
            'std' => 'required',
            'school' => 'required',
            'password' => 'required',
        ]);

            $validation['name'] =  $request->name;
            $validation['number'] = $request->number;
            $validation['password'] = bcrypt($request->password);
            $validation['std'] = $request->std;
            $validation['user_type'] = 'student';
            $validation['school'] = $request->school;
            $validation['is_verified'] = 0;



        $user = new User($validation);

        if ($user->save()) {
            $tokenResult = $user->createToken('Personal Access Token');
            $token = $tokenResult->plainTextToken;

            return response()->json([
                'message' => 'Successfully student created!',
                'accessToken' => $token,
            ], 201);
        } else {
            return response()->json(['error' => 'Provide proper details']);
        }
    }
    public function getStudent()
    {
        $student = DB::table('users')->where('user_type','student')->where('deleted_at',null)->select('id','name', 'number', 'std' , 'school' ,'subject',)->get();
        return response([
            'users' =>  $student],200);
    }
    public function deleteStudent(Request $request){

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
