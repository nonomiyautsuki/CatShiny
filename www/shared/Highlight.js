function copypaste() {
    var get_in_article = document.getElementById("article").value;
    document.getElementById("demo").innerHTML = "<font size=\"2\">" + get_in_article + "</font><br><br>I am just a cat.";
    //Copy the article and paste in under place. With unknown reason, this program doesn't copy the line feed.
}

function split() {
    var get_in_article = document.getElementById("article").value;
    var Output_split = get_in_article.split(" ");
    document.getElementById("demo").innerHTML = "<font size=\"2\">" + Output_split + "</font><br><br>I am a cute cat.";
    //Print the article, with the comma.
}

function Highlight_uncompleted() {
    var get_in_article = document.getElementById("article").value;
    //alert( get_in_article);
    var Output_split = get_in_article.split(" ");
    var word_array = new Array();
    //word_array.join (Output_split);
    for (i = 0; i < Output_split.length; i++) {
        if (Output_split[i] == "Resveratrol") {
            word_array[i] = "<mark>" + Output_split[i] + "</mark>";
        } else {
            word_array[i] = Output_split[i]
        }
    }
    word_array.toString();
    document.getElementById("demo").innerHTML = word_array + "<br><br>I am a cool cat.";
    //Highlight target word in the article, but comma still bother me.
}
function highlight(text) {
    var inputText = document.getElementById("demo");
    var innerHTML = inputText.innerHTML;
    var index = innerHTML.indexOf(text);
    if (index >= 0) {
        innerHTML = innerHTML.substring(0, index) + "<span class='highlight'>" + innerHTML.substring(index, index + text.length) + "</span>" + innerHTML.substring(index + text.length);
        //inputText.innerHTML = innerHTML; 
    }

}

function highlightxx(text) {
    //text = document.getElementById("target").value;
    var inputText = document.getElementById("article").value;
    //var originalinputText = document.getElementById("article");
    //alart(inputText);
    //alert(location.hostname);
    //var innerHTML = inputText.innerHTML;
    //for(i=0;i<10;i++){
    var index = inputText.indexOf(text);//the input article's length


    if (index >= 0) {
        inputText = inputText.substring(0, index) +
                "<mark id='a'>" + inputText.substring(index, index + text.length) + "</mark>"


                + inputText.substring(index + text.length);
        //inputText.innerHTML = innerHTML;
        //}
    }
    document.getElementById("demo").innerHTML = inputText + "<br><br>I am a passion cat.";

}//For unknown reason, it works.

function highlight2(text, list)
{

    for (var i = 0; i < list.length; i++)
    {
        var target = list[i].DiseaseName.replace(/\(/gi,"\\(");
        target =  target.replace(/\)/gi,"\\)");
     // var target = list[i].replace(/(/,"\\(");
        var replace = "<mark1 id='a'><a href='http://ctdbase.org/detail.go?type=d_isease&acc="+ list[i].DiseaseID+"' target=_blank>" + target + "</a></mark1>";
        text = text.replace(new RegExp(target, "ig"), replace);//ig mean i & g
        
    }
         text=text.replace(/d_isease/ig,"disease");
    document.getElementById("demo").innerHTML = text;
    return text;
    
}//if the "text" match the "list array", highlight it. 

function highlight3(text, list)
{

    for (var i = 0; i < list.length; i++)
    {
        var target = list[i].DiseaseName.replace(/\(/gi,"\\(");
        target =  target.replace(/\)/gi,"\\)");
     // var target = list[i].replace(/(/,"\\(");
        var replace = "<mark2 id='a'><a href='http://ctdbase.org/detail.go?type=c_hem&acc="+ list[i].DiseaseID+"' target=_blank>" + target + "</a></mark2>";
        text = text.replace(new RegExp(target, "ig"), replace);//ig mean i & g
        
    }
         text=text.replace(/c_hem/ig,"chem");
    document.getElementById("demo").innerHTML = text;
    return text;
    
}//if the "text" match the "list array", highlight it.


function tsvJSON(tsv) {

    var lines = tsv.split("\n");

    var result = [];

    var headers = lines[0].split("\t");

    for (var i = 1; i < lines.length; i++) {

        var obj = {};
        var currentline = lines[i].split("\t");

        for (var j = 0; j < headers.length; j++) {
            obj[headers[j]] = currentline[j];
        }

        result.push(obj);

    }

    //return result; //JavaScript object
    return JSON.stringify(result); //JSON

}



function csvJSON(csv) {

    var lines = csv.split("\n");

    var result = [];

    var headers = lines[0].split(",");

    for (var i = 1; i < lines.length; i++) {

        var obj = {};
        var currentline = lines[i].split(",");

        for (var j = 0; j < headers.length; j++) {
            obj[headers[j]] = currentline[j];
        }

        result.push(obj);

    }

    //return result; //JavaScript object
    return JSON.stringify(result); //JSON
}

function CTDXML(x)
{
    console.log("CTD_diseases");
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET", "database/CTD_diseases.xml", false);
    xmlhttp.send();
    xmlDoc = xmlhttp.responseXML;
    x = xmlDoc.getElementsByTagName("Row");
}