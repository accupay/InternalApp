function RefreshBalance() {
    var AgentRefID = $('#Header1_HidAgentRefID').val();
    $.ajax({
        url: "Index.aspx/RefreshBalance",
        data: '{value: ' + AgentRefID + '}',
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        //dataFilter: function (data) { return data; },
        success: function (mydata) {
            debugger;
            var obj = mydata.d;
            if (obj != null) {
                $("Header1_LblBalance").val(obj);
                $("#Header1_LblBalance").html(obj);
                return false;
            }

        },
        failure: function (response) {
            alert(response.d);
        }

    });
    return false;
}
