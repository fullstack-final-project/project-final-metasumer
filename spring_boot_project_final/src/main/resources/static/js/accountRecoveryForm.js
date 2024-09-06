$(document).ready(function() {
    if (typeof formState === 'undefined' || formState === "" || formState === "id") {
        $("#idForm").show();
        $("#pwdForm").hide();
        $("#showIdForm").addClass('active-button');
        $("#showPwdForm").removeClass('active-button');
    } else if (formState === "pwd") {
        $("#idForm").hide();
        $("#pwdForm").show();
        $("#showPwdForm").addClass('active-button');
        $("#showIdForm").removeClass('active-button');
    }

    var messageBox = $("#messageBox");
    if (messageBox.text().trim() !== "") {
        messageBox.show();
        $.post("/member/clearMessage");
    }

    $("#showIdForm").click(function() {
        $("#idForm").show();
        $("#pwdForm").hide();
        $(this).addClass('active-button');
        $("#showPwdForm").removeClass('active-button');
        $("#messageBox").hide();
    });

    $("#showPwdForm").click(function() {
        $("#idForm").hide();
        $("#pwdForm").show();
        $(this).addClass('active-button');
        $("#showIdForm").removeClass('active-button');
        $("#messageBox").hide();
    });
});
