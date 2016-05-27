$(function () {
    //Create a Data
    $('a#create').click(function (e) {
        $('#modalDetails').appendTo("body").modal('show');
        $('#titleOfModal').text('Create Messenger');

        var name = $('#name');
        name.val('');

        name.focus();
    });

    //Button of Edit
    $("#edit[data-id]").click(function (e) {
        var data_id = $(this).attr("data-id");

        if (data_id != undefined) {
            $.ajax({
                url: "/Messenger/DetailsMessenger/",
                type: "GET",
                dataType: "json",
                contentType: "application/json",
                data: { id: data_id }
            }).success(function (e) {
                $('#modalDetails').appendTo("body").modal('show');
                $('#titleOfModal').text('Edit Messenger');

                var name = $('#name');

                if (e.data != undefined) {
                    $('#id').attr("data-id", e.data.Id);
                    name.val(e.data.Name);
                }
            }).error(function (e) {
                console.log("Error " + e);
            })
        }
    });

    $('#modalForm').submit(function (e) {
        var id = $('#id').data("id");
        var name = $('#name').val();
        var url = "";

        //Create
        if (id == undefined || id == null) {
            id = 0;
            url = '/Messenger/Create';
        } else {
            url = '/Messenger/Edit';
        }

        var data = {
            Id: parseInt(id),
            Name: name,
        };

        $.ajax({
            url: url,
            type: 'POST',
            data: {
                __RequestVerificationToken: get_token(),
                messenger: data
            }
        }).success(function (e) {
            modal_saved('modalDetails');
        }).error(function (e) {
            console.log("Error " + e.statusText);
        });

        e.preventDefault();
    });

    $('a#remove').click(function () {
        var id = $(this).data("id");

        if (id != undefined) {
            swal({
                title: "Are you sure?",
                text: "You will not be able to recover this messenger!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Delete",
                cancelButtonText: "Cancel",
                closeOnConfirm: false,
            }, function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        url: '/Messenger/DeleteConfirmed',
                        type: 'POST',
                        data: {
                            __RequestVerificationToken: get_token(),
                            id: id
                        }
                    }).success(function (e) {
                        swal("Deleted!", "The messenger has been deleted", "success");
                    }).error(function (e) {
                        console.log('Error: ' + e.statusText);
                    });
                }
            });
        }
    });
});

function get_token() {
    return $('input[name="__RequestVerificationToken"]').val();
}

function modal_saved(modalName) {
    $('#' + modalName).modal('hide');

    swal({
        title: 'Saved',
        text: 'The data has been saved correctly',
        type: 'success',
        timer: 1800,
    });
}