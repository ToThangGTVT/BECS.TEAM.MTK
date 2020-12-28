function ValidateLogin() {
    var email = $("#email").val();
    var password = $("#password").val();

    var patternPassword = new RegExp("\\w{5,10}");
    var patternEmail = new RegExp("(([a-z-A-Z]+\\w+[a-zA-Z0-9]+[@][a-z-A-Z]+\\w+[a-zA-Z0-9][.]" +
        "[a-z-A-Z]+\\w+[a-zA-Z0-9])([.][a-z-A-Z]+\\w+[a-zA-Z0-9])?)");
    var count = 0;
    var report = "";
    console.log(email)
    console.log(patternEmail.test(email));
    if (patternPassword.test(password)) {
        count++;
    } else {
        report = "- Password wrong pattern";
    }
    if (patternEmail.test(email)) {
        count++;
    } else {
        report = report + "<br>- Email wrong pattern";
    }
    if (count == 2) {
        $("form").submit();
    } else {
        showReport("Login submit error", report, true);
    }
}