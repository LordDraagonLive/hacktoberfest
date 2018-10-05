function validateEmail(theForm) {
    if (/^w+([.-]?w+)*@w+([.-]?w+)*(.w{2,3})+$/.test(theForm.email - id.value)) {
        return (true);
    }
    alert("Invalid e-mail address! Please enter again carefully!.");
    return (false);
}