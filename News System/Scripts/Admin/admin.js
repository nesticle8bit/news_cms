$(function () {
    $.ajax({
        url: "/Admin/Chart_MostPopularPosts/",
        type: "GET",
        dataType: "json",
        contentType: "application/json"
    }).success(function (e) {
        var labels = [],
            series = [];

        $(e.data).each(function () {
            labels.push(this.Title);
            series.push(this.Visits);
        });

        var data = {
            labels: labels,
            series: [
              series
            ]
        };

        new Chartist.Line('.ct-chart', data);
    });

    //Hide and Show Comments
    $('#approve_comments[class="checkbox"]').click(function (e) {
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
                url: '/Comments/ApproveComment',
                type: 'POST',
                data: {
                    id: id,
                    state: state,
                }
            }).success(function (e) {
                swal({
                    title: 'Nothing wrong',
                    text: 'The selected Post has been saved correctly',
                    type: 'success',
                    timer: 1800,
                });
            }).error(function (e) {
                console.log('Error: ' + e.statusText);
            });
        }
    });

    //Edit Comments
    $("#edit[data-id]").click(function (e) {
        var data_id = $(this).attr("data-id");
        console.log("ID = " + data_id);

        if (data_id != undefined) {
            $.ajax({
                url: "/Comments/DetailsComments/",
                type: "GET",
                dataType: "json",
                contentType: "application/json",
                data: { id: data_id }
            }).success(function (e) {
                $('#modalComments').appendTo("body").modal('show');
                $('#titleOfModal').text('Edit Comment');

                if (e.data != undefined) {
                    $('#idComment').attr("data-id", e.data.Id);
                    $('#postComment').val(e.data.Post);
                    $('#containerComment').val(e.data.Comment);
                    $('#timeComment').val(e.data.Time);
                    
                    console.log("Datos Obtenidos = (" + e.data.Id + ") " + e.data.Name);
                }

            })
        }
    });

    //Delete Comment
    $('button#remove').click(function () {
        var id = $(this).data("id");
        console.log(id);

        if (id != undefined) {
            swal({
                title: "Are you sure?",
                text: "You will not be able to recover this comment!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Delete",
                cancelButtonText: "Cancel",
                closeOnConfirm: false,
            }, function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        url: '/Comments/HideComment',
                        type: 'POST',
                        data: { id: id }
                    }).success(function (e) {
                        swal("Deleted!", "The category has been deleted", "success");
                    }).error(function (e) {
                        console.log('Error: ' + e.statusText);
                    });
                }
            });
        }
    });
});