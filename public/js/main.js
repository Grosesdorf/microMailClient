$(document).ready(function() {
    // Модальное окно нового письма
    $('#create-mail-modal').on('shown.bs.modal', function() {
        $('#send-mail-btn').attr('disabled', 'disabled');
    })
// Запрос на отправку письма
    $('#send-mail-btn').click(function () {
        var mail = $('#create-mail-form').serialize();

        $.ajax({
            type: "POST",
            url: "/create",
            data: mail,
            success: function (data) {
                $('#create-mail-modal').modal('hide');
                // $('#results').html(data);
                $(location).attr('href','/mail/to');
            },
            error:  function(xhr){
                alert('Возникла ошибка: ' + xhr.responseCode);
            }
        });
    });
// Поиск по письмам
    $('tbody tr').addClass('visible');

    function filter(selector, query) {
        query =   $.trim(query);
        query = query.replace(/ /gi, '|');

        $(selector).each(function() {
            ($(this).text().search(new RegExp(query, "i")) < 0) ?
                $(this).hide().removeClass('visible') :
                $(this).show().addClass('visible');
        });
    }

    $('#search_field').keyup(function(event) {

        if (event.keyCode == 27 || $(this).val() == '') {
            // Если нажат Escape, нужно очистить строку поиска
            $(this).val('');

            $('tbody tr').removeClass('visible').show().addClass('visible');
        }

        else {
            filter('tbody tr', $(this).val());
        }
    });

    $('#create-mail').click(function () {
        $('#create-mail-modal').modal({
            backdrop: 'static',
            keyboard: true
        });

        $("#input-email").blur(function () {
            var verifyEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;

            if (verifyEmail.test(this.value)) {
                $("#input-email").css("border", "green solid 1px");
                $('#send-mail-btn').removeAttr('disabled', 'disabled');
            }
            else {
                $("#input-email").css("border", "red solid 1px");
            }
        });
    });
// Удаляем письма

    $( "input[type=checkbox]" ).click(function () {
        if($(this).attr('checked')==='checked')
        {
            $(this).removeAttr('checked');
        }
        else
        {
            $(this).attr('checked', 'checked');
        }
    });

    $('#del-mail').click(function () {
        var arr = $("input[type=checkbox]");
        var arrChecked = arr.filter(function(item) {

            if($(arr[item]).attr('checked')==='checked')
            {
                return $(arr[item]).val();
            }
        });
        if(arrChecked.length == 0){
            alert("Нет выбранных писем");
        }
        else
        {
            $.ajax({
                type: "GET",
                url: "/del",
                data: arrChecked,
                success: function (data) {
                    $('#result').html(data);
                    location.reload();
                },
                error:  function(xhr){
                    alert('Возникла ошибка: ' + xhr.responseCode);
                }
            });
        }

    });

    // Сортируем

    $('thead th').each(function(column) {
        $(this).addClass('sortable').click(function(){
            var findSortKey = function($cell) {
                return $cell.find('.sort-key').text().toUpperCase() + ' ' + $cell.text().toUpperCase();
            };
            var sortDirection = $(this).is('.sorted-asc') ? -1 : 1;

            var $rows = $(this).parent().parent().parent().find('tbody tr').get();

            $.each($rows, function(index, row) {
                row.sortKey = findSortKey($(row).children('td').eq(column));
            });

            $rows.sort(function(a, b) {
                if (a.sortKey < b.sortKey) return -sortDirection;
                if (a.sortKey > b.sortKey) return sortDirection;
                return 0;
            });

            $.each($rows, function(index, row) {
                $('tbody').append(row);
                row.sortKey = null;
            });

            $('th').removeClass('sorted-asc sorted-desc');
            var $sortHead = $('th').filter(':nth-child(' + (column + 1) + ')');
            sortDirection == 1 ? $sortHead.addClass('sorted-asc') : $sortHead.addClass('sorted-desc');

            $('td').removeClass('sorted')
                .filter(':nth-child(' + (column + 1) + ')')
                .addClass('sorted');

        });
    });
});
