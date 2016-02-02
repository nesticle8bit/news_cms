$(document).ready(function () {
    //Botones de Accion
    $("#edit[data-id]").click(function (e) {
        var data_id = $(this).attr("data-id");
        console.log("ID = " + data_id);

        if (data_id != undefined) {
            $.ajax({
                url: "/Icons/DetailsIcon/",
                type: "GET",
                dataType: "json",
                contentType: "application/json",
                data: { id: data_id }
            }).success(function (e) {
                $('#modalDetails').appendTo("body").modal('show');
                $('#titleOfModal').text('Edit Icon Information');

                var name = $('#nameIcon');

                if (e.data != undefined) {
                    //Add the Id for Edit/Details
                    $('#idIcon').attr("data-id", e.data.Id);

                    name.val(e.data.Name);
                    console.log("Datos Obtenidos = (" + e.data.Id + ") " + e.data.Name);
                }
            })
        }
    });

    $('#formIcon').submit(function (e) {
        var id = $('#idIcon').data("id");
        var name = $('#nameIcon').val();
        var token = $('input[name="__RequestVerificationToken"]').val();
        
        var icon = {
            Id: parseInt(id),
            IconName: name,
        };

        console.log(icon);
        console.log("Token: " + token);

        $.ajax({
            url: '/Icons/Edit',
            type: 'POST',
            data: {
                __RequestVerificationToken: token,
                icon: icon
            }
        }).success(function (e) {
            console.log("Se guardo el registro");
            Saved('modalDetails');
        }).error(function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status);
        });

        e.preventDefault();
    });

    $('a#remove').click(function () {
        var idCategory = $(this).data("id");
        console.log(idCategory);

        if (idCategory != undefined) {
            swal({
                title: "Are you sure?",
                text: "You will not be able to recover this category!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Delete",
                cancelButtonText: "Cancel",
                closeOnConfirm: false,
            }, function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        url: '/Icons/DeleteIcon',
                        type: 'POST',
                        data: { id: idCategory }
                    }).success(function (e) {
                        swal("Deleted!", "The icon has been deleted", "success");
                    }).error(function (e) {
                        console.log('Error: ' + e.statusText);
                    });
                }
            });
        }
    });

    function Saved(modalName) {
        $('#' + modalName).modal('hide');

        swal({
            title: 'Saved',
            text: 'The data has been saved correctly',
            type: 'success',
            timer: 1800,
        });
    }
}); //End