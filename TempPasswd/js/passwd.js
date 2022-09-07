var engine = new Chance();

function getPasswd(){
    var PasswordElement = document.getElementById('passwd');
    var wordBuffer = "";
    do {
        wordBuffer = engine.animal().split(" ").join("");
        console.log(wordBuffer);
        console.log(wordBuffer.length);
    } while ((wordBuffer.length > 12) || (wordBuffer.length < 6));
    //var wordBuffer2 = wordBuffer.charAt(0).toUpperCase() + wordBuffer.slice(1);
    var digitBuffer = engine.integer({min:1, max:20}).toString();
    var specialBuffer = engine.character({pool:'!@#$%^&*+?'});
    var outBuffer=wordBuffer+digitBuffer+specialBuffer;
    console.log(outBuffer);
    PasswordElement.innerHTML=outBuffer;
}

console.log(('b' + 'a' + + 'a'+'a').toLowerCase());