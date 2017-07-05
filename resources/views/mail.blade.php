@extends('layouts.app')

@section('content')
    <div id="result"></div>
<div id="create-mail-modal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Написать письмо</h4>
            </div>
            <div class="modal-body">
                <form id="create-mail-form" class="form-horizontal">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label for="input-email" class="col-xs-3 control-label">Email:</label>
                        <div class="col-xs-9">
                            <input type="email" class="form-control" id="input-email" name="email" placeholder="Введите email" autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-subject" class="col-xs-3 control-label">Тема:</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="input-subject" name="subject" placeholder="Введите тему">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-text" class="col-xs-3 control-label">Текст письма:</label>
                        <div class="col-xs-9">
                            <textarea class="form-control" id="input-text" rows="5" name="text" placeholder="Пишите тут..."></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="send-mail-btn" class="btn btn-primary">Отправить</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Почтовый ящик</div>
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-offset-6">
                            <div class="form-inline">
                                <button type="button" id="create-mail" class="btn btn-primary">Написать письмо</button>
                                <button type="button" id="del-mail" class="btn btn-primary">Удалить</button>
                                <input type="text" id="search_field" class="form-control" name="search_field"  placeholder="Поиск">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2">

                            <div class="btn-group-vertical">
                                <a href="/mail" class="btn btn-default btn-primary btn-xs">Входящие</a>
                                <a href="/mail/to" class="btn btn-default btn-primary btn-xs">Отправленные</a>
                            </div>
                        </div>
                        <div class="col-md-10">
                            <table id="resultTable" class="table table-hover table-condensed">
                                <thead>
                                    <tr>
                                        <th></th>
                                        @if ($results[0]['route'] === 'from')
                                            <th>Отправитель</th>
                                        @elseif ($results[0]['route'] === 'to')
                                            <th>Получатель</th>
                                        @endif
                                        <th>Тема письма</th>
                                        <th>Дата</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if ($results[0]['id'] !== '-')
                                        @foreach ($results as $result)
                                            <tr>
                                                <td><input type="checkbox" name="selected[]" value="{{ $result['id'] }}"></td>
                                                <td><a href="/read/{{ $result['id'] }}">{{ $result['email'] }}</a></td>
                                                <td><a href="/read/{{ $result['id'] }}">{{ $result['subject'] }}</a></td>
                                                <td><a href="/read/{{ $result['id'] }}">{{ $result['created_at'] }}</a></td>
                                            </tr>
                                        @endforeach
                                    @else
                                        <tr>
                                            <td class="text-center" colspan="3">Нет писем</td>
                                        </tr>
                                    @endif
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
