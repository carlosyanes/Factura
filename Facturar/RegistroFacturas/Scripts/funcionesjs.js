function nitIsValid(nit) {
    if (!nit) {
        return true;
    }

    var nitRegExp = new RegExp('^[0-9]+(-?[0-9kK])?$');

    if (!nitRegExp.test(nit)) {
        return false;
    }

    nit = nit.replace(/-/, '');
    var lastChar = nit.length - 1;
    var number = nit.substring(0, lastChar);
    var expectedCheker = nit.substring(lastChar, lastChar + 1).toLowerCase();

    var factor = number.length + 1;
    var total = 0;

    for (var i = 0; i < number.length; i++) {
        var character = number.substring(i, i + 1);
        var digit = parseInt(character, 10);

        total += (digit * factor);
        factor = factor - 1;
    }

    var modulus = (11 - (total % 11)) % 11;
    var computedChecker = (modulus == 10 ? "k" : modulus.toString());

    return expectedCheker === computedChecker;
}

$('#nit').bind('change paste keyup', function (e) {
    var $this = $(this);
    var $parent = $this.parent();
    var $next = $this.next();
    var nit = $this.val();

    if (nit && nitIsValid(nit)) {
        $parent.addClass('has-success');
        $next.addClass('glyphicon-ok');
        $parent.removeClass('has-error');
        $next.removeClass('glyphicon-remove');
    } else if (nit) {
        $parent.addClass('has-error');
        $next.addClass('glyphicon-remove');
        $parent.removeClass('has-success');
        $next.removeClass('glyphicon-ok');
    } else {
        $parent.removeClass('has-error');
        $next.removeClass('glyphicon-remove');
        $parent.removeClass('has-success');
        $next.removeClass('glyphicon-ok');
    }
});