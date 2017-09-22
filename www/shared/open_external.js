function openExt(){
       var myURL=location.protocol+'//'+location.hostname;
       $('a[herf^="http://",a[herf^="https://"]').not('[herf^="+myURL+"]').attr('target','_blank');
}

function open_cat_jpg() {
    /*var fso = new ActiveXObject("Scripting.FileSystemObject");
     var a = fso.CreateTextFile("text/OREO.txt", true);
     a.WriteLine("This is a test.");
     a.Close();
     document.getElementById("removed").innerHTML = a;*/

    $(document).ready(function () {
        $("#open_new_window").click(function () {
            $('#cat_picture').load('img/08_justacat.jpg');
        });
    });

}