<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function Register(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'number' => 'required',
            'email' => 'required',
            'user_type' => 'required',
            'std' => 'required',
            'school' => 'required',
            'password' => 'required',
        ]);
        if ($request->user_type == 'teacher') {
            $validation['name'] =  $request->name;
            $validation['email'] =  $request->email;
            $validation['number'] = $request->number;
            $validation['password'] = bcrypt($request->password);
            $validation['std'] = $request->std;
            $validation['user_type'] = $request->user_type;
            $validation['school'] = $request->school;
            $validation['is_verified'] = 0;
        } else {
            $validation['name'] =  $request->name;
             $validation['email'] =  $request->email;
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

        $credentials = $request->only('number', 'password');
        $loginField = filter_var($credentials['number'], FILTER_VALIDATE_EMAIL) ? 'email' : 'number';

        // Attempt login using the identified login field (email or number)
        $user = User::where($loginField, $credentials['number'])->first();

        if (!$user || !Hash::check($credentials['password'], $user->password)) {
            return response()->json([
                'message' => 'Invalid login details'
            ], 401);
        }

        if ($user->is_verified == 0) {
            return response()->json([
                'message' => 'Your profile is under verification',
            ]);
        }

        // Generate token for the authenticated user
        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'token' => $token,
            'message' => 'Login successful',
        ]);
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
