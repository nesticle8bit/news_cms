$(function () {
    $("#edit[data-id]").click(function (e) {
        var data_id = $(this).attr("data-id");
        console.log("ID = " + data_id);

        if (data_id != undefined) {
            $.ajax({
                url: "/Social/DetailsSocial/",
                type: "GET",
                dataType: "json",
                contentType: "application/json",
                data: { id: data_id }
            }).success(function (e) {
                $('#modalDetails').appendTo("body").modal('show');
                $('#titleOfModal').text('Edit Social Information');

                if (e.data != undefined) {
                    $('#idSocial').attr("data-id", e.data.Id);

                    $('#nameSocial').val(e.data.Name);
                    $('#linkSocial').val(e.data.Link);

                    //console.log(e.icons);

                    //Create the elements of the <Select>
                    console.log('Size of <Select> ' + $('#iconsSocial option').length);
                    if ($('#iconsSocial option').length == 0) {
                        $(e.icons).each(function () {
                            $('#iconsSocial').append($("<option>").attr('value', this.Id).text(this.Icon));
                        });
                    }

                    //Remove all the Selected Items
                    $('#iconsSocial *').removeAttr('selected');
                    
                    //Select the Item
                    if (e.data.Icon != undefined || e.data.Icon != null) {
                        //$('#iconsSocial').prop(e.data.Id);
                        $('#iconsSocial option[value="' + e.data.Id_Icon + '"]').prop('selected', 'selected');
                        console.log('Valor seleccionado = ' + e.data.Id_Icon)
                    }
                    
                    //Checkbox : Status
                    if (e.data.Status == true)
                        $('#statusSocial').prop('checked', true);
                    else
                        $('#statusSocial').prop('checked', false);

                    console.log("Datos Obtenidos = (" + e.data.Id + ") " + e.data.Name);
                }
            })
        }
    });

    //When the User Save the Data on the Modal
    $('#formIcon').submit(function (e) {
        var id = $('#idSocial').data("id");

        var name = $('#nameSocial').val();
        var link = $('#linkSocial').val();
        var icon = $('#iconsSocial option:selected').val();
        var status = $('#statusSocial').prop('checked'); // .val() get -- 'on' or 'off'

        var token = $('input[name="__RequestVerificationToken"]').val();

        //Id,Name,Link,Id_Icon,Status
        var social = {
            Id: parseInt(id),
            Name: name,
            Link: link,
            Id_Icon: icon,
            Status: status,
        };

        $.ajax({
            url: '/Social/Edit',
            type: 'POST',
            data: {
                __RequestVerificationToken: token,
                social: social
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
        var id = $(this).data("id");
        console.log(id);

        if (id != undefined) {
            swal({
                title: "Are you sure?",
                text: "You will not be able to recover this Social Network!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Delete",
                cancelButtonText: "Cancel",
                closeOnConfirm: false,
            }, function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        url: '/Social/DeleteSocial',
                        type: 'POST',
                        data: { id: id }
                    }).success(function (e) {
                        swal("Deleted!", "The Social Network has been deleted", "success");
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

    $('.checkbox').click(function (e) {
        var id = $(this).find('input[data-id]').data('id');
        var state = $(this).attr('class');

        console.log("ID del Registro " + id + " State = " + state);

        if (id != undefined && state != undefined) {
            if (state.indexOf("checkbox checked") > -1) {
                state = false;
            } else {
                state = true;
            }

            $.ajax({
                url: '/Social/ChangeStatus',
                type: 'POST',
                data: {
                    id: id,
                    state: state,
                }
            }).success(function (e) {
                swal({
                    title: 'Nothing wrong',
                    text: 'The state of the selected Social Network has been change correctly',
                    type: 'success',
                    timer: 1800,
                });
            }).error(function (e) {
                console.log('Error: ' + e.statusText);
            });
        }
    });
});