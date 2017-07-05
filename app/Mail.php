<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\User as UserName;

class Mail extends Model
{
    public function getEmailAttribute($value)
    {
        $query = UserName::where('email', $value)->select('name')->first();
        if($query)
        {
            $name = $query->toArray();
            return $name['name'] . '<' . ucfirst($value) . '>';
        }
        else
        {
            return ucfirst($value);
        }

    }
}
