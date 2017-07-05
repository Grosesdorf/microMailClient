<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Mail;
use App\User;
use Carbon\Carbon;

class MailController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * @param $route
     *
     * @return view home
     */
    public function index($route = 'from')
    {
        if($route === 'from' || $route === 'to')
        {
            $user = Auth::user();
            $userId = $user->getAuthIdentifier();
            $query = Mail::where('id_user', $userId)->
            where('route', $route)->
            select('id', 'route', 'email', 'subject', 'created_at')->
            get();

            if(count($query) > 0)
            {
                $results = $query->all();
            }
            else
            {
                $results[0]['route'] = $route;
                $results[0]['id'] = '-';
            }

            return view('mail', ['results'=>$results]);
        }
        else
        {
            return redirect()->action('MailController@index', ['param' => 'from']);
        }
    }

    public function read($id)
    {
        $query = Mail::where('id', $id)->
                       select('id', 'route', 'email', 'subject', 'text', 'created_at')->
                       first();

        if(count($query) > 0)
        {
            $results = $query->toArray();
            return view('mailRead', ['results'=>$results]);
        }
        else
        {
            return redirect()->action('MailController@index', ['param' => 'from']);
        }
    }

    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|max:255'
        ]);

        if ($validator->fails()) {
            dd('Error');
        }

        $user = Auth::user();
        $userId = $user->getAuthIdentifier();

        $email = $request->input('email');
        $subject = $request->input('subject');
        $text = $request->input('text');

        $query = User::where('id', $userId)->select('name')->first();
        $name = $query->toArray();

        $nowDate = Carbon::now()->format('Y-m-d H:i:s');

        // Отправляем письмо, если всё ок, создаем запись в БД

        $data = [
            ["id_user"=>$userId,
            "route"=>"to",
            "name"=>$name['name'],
            "email"=>$email,
            "subject"=>$subject,
            "text"=>$text,
            "created_at"=>$nowDate
            ]
        ];

        Mail::insert($data); // Eloquent
    }

    public function delete(Request $request)
    {
        $selected = $request->input('selected');

        foreach ($selected as $id){
            Mail::destroy($id);
        }
    }
}
