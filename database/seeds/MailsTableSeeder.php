<?php

use Illuminate\Database\Seeder;
use Carbon\Carbon;

class MailsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('mails')->insert(
            [
                [
                    'id_user' => '1',
                    'route' => 'to',
                    'name' => 'Valeriy ' . str_random(15),
                    'email' => str_random(15).'@gmail.com',
                    'subject' => str_random(10).' theme_subject',
                    'text' => 'Что то очень важное и срочное!!',
                    'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                ],
                [
                    'id_user' => '1',
                    'route' => 'to',
                    'name' => 'Valeriy ' . str_random(15),
                    'email' => str_random(15).'@gmail.com',
                    'subject' => str_random(10).' theme_subject',
                    'text' => 'Что то очень важное и срочное!!',
                    'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                ],
                [
                    'id_user' => '1',
                    'route' => 'from',
                    'name' => 'Valeriy ' . str_random(15),
                    'email' => str_random(15).'@gmail.com',
                    'subject' => str_random(10).' theme_subject',
                    'text' => 'Что то очень важное и срочное!!',
                    'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                ],
                [
                    'id_user' => '1',
                    'route' => 'from',
                    'name' => 'Valeriy ' . str_random(15),
                    'email' => str_random(15).'@gmail.com',
                    'subject' => str_random(10).' theme_subject',
                    'text' => 'Что то очень важное и срочное!!',
                    'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                ],
                [
                    'id_user' => '1',
                    'route' => 'from',
                    'name' => 'Valeriy ' . str_random(15),
                    'email' => str_random(15).'@gmail.com',
                    'subject' => str_random(10).' theme_subject',
                    'text' => 'Что то очень важное и срочное!!',
                    'created_at' => Carbon::now()->format('Y-m-d H:i:s')
                ],
            ]);
    }
}
