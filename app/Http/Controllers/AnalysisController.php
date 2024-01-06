<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AnalysisController extends Controller
{
    public function getTeacherAnalysis(Request $request)
    {
        $requestedYear = $request->input('year', date('Y'));
        $currentMonth = Carbon::now()->month;
        $startDate = Carbon::createFromDate($requestedYear, 1, 1)->startOfMonth();
        $endDate = Carbon::createFromDate($requestedYear, 12, 31)->endOfMonth();

        $active = DB::table('users')
            ->where('user_type', 'teacher')
            ->where('deleted_at', null)
            ->where('is_verified', 1)
            ->count();
        $pending = DB::table('users')
            ->where('user_type', 'teacher')
            ->where('deleted_at', null)
            ->where('is_verified', 0)
            ->count();
            $monthlyCounts = User::selectRaw('MONTH(created_at) as month, COUNT(*) as count')
            ->whereBetween('created_at', [$startDate, $endDate])
            ->groupBy(DB::raw('MONTH(created_at)'))
            ->orderByRaw('MONTH(created_at)')
            ->get();

            $countsByMonth = [];
            foreach ($monthlyCounts as $count) {
                $countsByMonth[$count->month] = $count->count;
            }

            // Fill missing months with 0 count
            for ($i = 1; $i <= 12; $i++) {
                if (!isset($countsByMonth[$i])) {
                    $countsByMonth[$i] = 0;
                }
            }


        $currentMonthTotalUsers = User::whereYear('created_at', Carbon::now()->year)
            ->whereMonth('created_at', $currentMonth)->where('user_type', 'teacher')
            ->count();

        // Daily users
        $todayUsers = User::whereDate('created_at', Carbon::today())->where('user_type', 'teacher')->count();

        return response(
            [
                'active' => $active,
                'pending' => $pending,
                'monthly_users' => $currentMonthTotalUsers,
                'daily_users' => $todayUsers,
                'chart' => $countsByMonth,

            ],
            200,
        );
    }
    public function getStudentAnalysis()
    {
        $currentMonth = Carbon::now()->month;


        $startDate = Carbon::now()
            ->subMonths(11)
            ->startOfMonth();
        $endDate = Carbon::now()->endOfMonth();
        $user = DB::table('users')
            ->where('user_type', 'student')
            ->where('deleted_at', null)
            ->count();

        $monthlyCounts = User::selectRaw('MONTH(created_at) as month, COUNT(*) as count')
            ->whereBetween('created_at', [$startDate, $endDate])->where('user_type', 'student')
            ->groupBy(DB::raw('MONTH(created_at)'))
            ->orderByRaw('MONTH(created_at)')
            ->get();

        $countsByMonth = [];
        foreach ($monthlyCounts as $count) {
            $countsByMonth[$count->month] = $count->count;
        }

        // Fill missing months with 0 count
        for ($i = 1; $i <= 12; $i++) {
            if (!isset($countsByMonth[$i])) {
                $countsByMonth[$i] = 0;
            }
        }

        $currentMonthTotalUsers = User::whereYear('created_at', Carbon::now()->year)
            ->whereMonth('created_at', $currentMonth)->where('user_type', 'student')
            ->count();

        // Daily users
        $todayUsers = User::whereDate('created_at', Carbon::today())->where('user_type', 'student')->count();

        return response(
            [
                'total_user' => $user, 'monthly_users' => $currentMonthTotalUsers,
                'daily_users' => $todayUsers,
                'chart' => $countsByMonth,

            ],
            200,
        );
    }
    public function getQuestionAnalysis()
    {
        $total = DB::table('mcq')->where('deleted_at',null)->count()
        +DB::table('long')->where('deleted_at',null)->count()
        +DB::table('short')->where('deleted_at',null)->count()
        +DB::table('true_false')->where('deleted_at',null)->count()
        +DB::table('onetwo')->where('deleted_at',null)->count()
        +DB::table('blanks')->where('deleted_at',null)->count();
        $mcq = DB::table('mcq')->where('deleted_at',null)->count();
        $long = DB::table('long')->where('deleted_at',null)->count();
        $short = DB::table('short')->where('deleted_at',null)->count();
        $truefalse = DB::table('true_false')->where('deleted_at',null)->count();
        $onetwo = DB::table('onetwo')->where('deleted_at',null)->count();
        $blank = DB::table('blanks')->where('deleted_at',null)->count();

        return response(
            [
                'total' => $total,
                'mcq' => $mcq,
                'long' => $long,
                'short' => $short,
                'true&false' => $truefalse,
                'blank' => $blank,
                'onetwo' => $onetwo,

            ],
            200,
        );
    }
}
