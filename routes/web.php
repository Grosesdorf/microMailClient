<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/del', 'MailController@delete');

Auth::routes();

Route::get('/mail/{param?}', 'MailController@index')->name('/mail');
Route::get('/', 'MailController@index');
Route::get('/read/{param}', 'MailController@read');

Route::post('/create', 'MailController@create');

