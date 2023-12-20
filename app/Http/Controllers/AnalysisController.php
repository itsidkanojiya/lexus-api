<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AnalysisController extends Controller
{
    public function getAnalysis(){
        $currentMonth = Carbon::now()->month;

        $currentMonthCount = User::whereMonth('created_at', $currentMonth)->count();
        $startDate = Carbon::now()->subMonths(11)->startOfMonth();
        $endDate = Carbon::now()->endOfMonth();
        $active = DB::table('blanks')->where('deleted_at',null)->get();
        $pending = DB::table('blanks')->where('deleted_at',null)->get();
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
        $daily = User::select(DB::raw('DATE(created_at) as date'), DB::raw('COUNT(*) as count'))
        ->groupBy(DB::raw('DATE(created_at)'))
        ->get();
        return response([
            'active' => $active,
            'pending' => $pending,
            'monthly' => $countsByMonth,
            'daily' => $daily,

            ],200);
    }
}
