<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class AuthController extends Controller
{
    public function Register(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'number' => 'required',
            'user_type' => 'required',
            'std' => 'required',
            'school' => 'required',
            'password' => 'required',
        ]);
        if ($request->user_type == 'teacher') {
            $validation['name'] =  $request->name;
            $validation['number'] = $request->number;
            $validation['password'] = bcrypt($request->password);
            $validation['std'] = $request->std;
            $validation['user_type'] = $request->user_type;
            $validation['school'] = $request->school;
            $validation['is_verified'] = 0;
        } else {
            $validation['name'] =  $request->name;
            $validation['number'] = $request->number;
            $validation['password'] = bcrypt($request->password);
            $validation['std'] = $request->std;
            $validation['user_type'] = $request->user_type;
            $validation['school'] = $request->school;
            $validation['is_verified'] = 1;
        }

        $user = new User($validation);

        if ($user->save()) {
            $tokenResult = $user->createToken('Personal Access Token');
            $token = $tokenResult->plainTextToken;

            return response()->json([
                'message' => 'Successfully created user!',
                'accessToken' => $token,
            ], 201);
        } else {
            return response()->json(['error' => 'Provide proper details']);
        }
    }

    public function Login(Request $request)
    {

        if (!Auth::attempt($request->only('number', 'password'))) {
            return response()->json([
                'message' => 'Invalid login details'
            ], 401);
        } else {
            $user = User::where('number', $request['number'])->firstOrFail();
            if ($user->is_verified == 0) {
                return response()->json([

                    'message' => 'Your profile is under verifiaction',
                ]);
            }
            $token = $user->createToken('auth_token')->plainTextToken;

            return response()->json([
                'token' => $token,
                'message' => 'login success',
            ]);
        }
    }

    public function verifyToken()
    {
        $user = Auth::user();
        if ($user = Auth::user()) {
            return response()->json([
                'message' => 'Successfully Verified!',

            ], 200);
        } else {
            return response()->json([
                'message' => $user,

            ], 401);
        }
    }
}
