$(document).ready(function () {
    //Botones de Accion
    $("#edit[data-id]").click(function (e) {
        var data_id = $(this).attr("data-id");
        console.log("ID = " + data_id);

        if (data_id != undefined) {
            $.ajax({
                url: "/Category/DetailsCategory/",
                type: "GET",
                dataType: "json",
                contentType: "application/json",
                data: { id: data_id }
            }).success(function (e) {
                $('#modalDetails').appendTo("body").modal('show');
                $('#titleOfModal').text('Edit Category');

                var nameCategory = $('#nameCategory');

                if (e.data != undefined) {
                    //Add the Id for Edit/Details
                    $('#idCategory').attr("data-id", e.data.Id);

                    nameCategory.val(e.data.Name);
                    console.log("Datos Obtenidos = (" + e.data.Id + ") " + e.data.Name);
                }
            }).error(function (e) {
                console.log("Error " + e);
            })
        }
    });

    $('#formCategory').submit(function (e) {
        var idCategory = $('#idCategory').data("id");
        var nameCategory = $('#nameCategory').val();
        var token = $('input[name="__RequestVerificationToken"]').val();

        var category = {
            Id: parseInt(idCategory),
            Name: nameCategory,
        };

        console.log(category);

        $.ajax({
            url: '/Category/Edit',
            type: 'POST',
            data: {
                __RequestVerificationToken: token,
                category: category
            }
        }).success(function (e) {
            console.log("Se guardo el registro");
            Saved('modalDetails');
        }).error(function (e) {
            console.log("Error " + e.statusText);
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
                        url: '/Category/DeleteCategory',
                        type: 'POST',
                        data: { id: idCategory }
                    }).success(function (e) {
                        swal("Deleted!", "The category has been deleted", "success");
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