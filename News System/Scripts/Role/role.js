$(document).ready(function () {
    //Botones de Accion
    $("#edit[data-id]").click(function (e) {
        var data_id = $(this).attr("data-id");
        console.log("ID = " + data_id);

        if (data_id != undefined) {
            $.ajax({
                url: "/Role/DetailsRole/",
                type: "GET",
                dataType: "json",
                contentType: "application/json",
                data: { id: data_id }
            }).success(function (e) {
                $('#modalDetails').appendTo("body").modal('show');
                $('#titleOfModal').text('Edit Role Information');

                var name = $('#nameRole');

                if (e.data != undefined) {
                    //Add the Id for Edit/Details
                    $('#idRole').attr("data-id", e.data.Id);

                    name.val(e.data.Name);
                    console.log("Datos Obtenidos = (" + e.data.Id + ") " + e.data.Name);
                }
            })
        }
    });
});