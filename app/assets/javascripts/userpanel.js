/* global $ */
$(document).ready(function(){
    $('#btnTest').click(function(){
    console.log("button works")    
    ShowCustomDialog();
    });
});

function ShowCustomDialog() {
    ShowDialogBox('Welcome to RailsBit.com',
    'Congratulations You Are About to Become a Web Developer.',
    'Start Your Journey!','', 'GoToAssetList',null);
	}

function ShowDialogBox(title, content, btn1text, btn2text, functionText, parameterList) {
    var btn1css;
    var btn2css;

    if (btn1text == '') {
        btn1css = "hidecss";
    } else {
        btn1css = "showcss btn btn-md btn-primary";
    }

    if (btn2text == '') {
        btn2css = "hidecss";
    } else {
        btn2css = "showcss";
        }
    $("#lblMessage").html(content);

    $("#dialog").dialog({
        show: { effect: "blind", duration: 300 },
        resizable: false,
        title: title,
        modal: true,
        width: '500px',
        height: 'auto',
        bgiframe: false,
        hide: { effect: 'clip', duration: 400 },
        buttons: [
                    {
                        text: btn1text,
                        "class": btn1css,
                        click: function () {
                            $("#dialog").dialog('close')
                            
                        }
                    },
                    {
                        text: btn2text,
                        "class": btn2css,
                        click: function () {
                            $("#dialog").dialog('close');
                        }
                    }
                ]
            });
        }

