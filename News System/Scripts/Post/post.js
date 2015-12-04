$(document).ready(function () {
    var token = [];
    var engine;
    $.get("/Post/GetTags", function (response) {
        $.each(response.data, function (i, v) {
            token.push({ value: v });
            //console.log(v);
        });
        engine = new Bloodhound({
            local: token,
            datumTokenizer: function (d) {
                return Bloodhound.tokenizers.whitespace(d.value);
            },
            queryTokenizer: Bloodhound.tokenizers.whitespace

        });
        engine.initialize();

        //console.log(token);

        $('#tags').on('tokenfield:createtoken', function (e) {
            var data = e.attrs.value.split('|')
            e.attrs.value = data[1] || data[0]
            e.attrs.label = data[1] ? data[0] + ' (' + data[1] + ')' : data[0]
        }).on('tokenfield:createdtoken', function (e) {
            var re = /\S+\S+\.\S+/
            var valid = re.test(e.attrs.value)
            if (!valid) {
                $(e.relatedTarget).addClass('invalid')
            }
        }).on('tokenfield:edittoken', function (e) {
            if (e.attrs.label !== e.attrs.value) {
                var label = e.attrs.label.split(' (')
                e.attrs.value = label[0] + '|' + e.attrs.value
            }
        }).on('tokenfield:removedtoken', function (e) {
        }).tokenfield({
            typeahead: [null, { source: engine.ttAdapter() }]
        });
    });

    //var wysibbOptions = {
    //    buttons: "bold,italic,underline,strike,|superscript,subscript|,img,youtube,link,|,code,quote"
    //}
    $("#editor").wysibb();
});
