@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Читать</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="btn-group-vertical">
                                <a href="/mail" class="btn btn-default btn-primary btn-sm">Входящие</a>
                                <a href="/mail/to" class="btn btn-default btn-primary btn-sm">Отправленные</a>
                            </div>
                        </div>
                        <div class="col-md-10">
                            @if ($results['route'] === 'from')
                                <p>От:</p>
                            @elseif ($results['route'] === 'to')
                                <p>Кому:</p>
                            @endif
                            <p> {{ $results['email'] }} </p>
                            <p>Тема:</p>
                            <p> {{ $results['subject'] }} </p>
                            <p>Текст письма:</p>
                            <p> {{ $results['text'] }} </p>
                            <p>Дата:</p>
                            <p> {{ $results['created_at'] }} </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
