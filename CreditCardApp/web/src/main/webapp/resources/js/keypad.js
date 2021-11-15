document.getElementsByName("editbtn").forEach(e => e.addEventListener("click", function() {
document.getElementsByName('numpad').forEach(element => {
element.setAttribute('onclick', `document.getElementsByName("${e.value}")[0].value = document.getElementsByName("${e.value}")[0].value + ${element.textContent}`);
}); 

document.getElementsByName('numpad-back')[0].setAttribute('onclick', `document.getElementsByName("${e.value}")[0].value = document.getElementsByName("${e.value}")[0].value.slice(0, -1)`); 

document.getElementsByName('numpad-clear')[0].setAttribute('onclick', `document.getElementsByName("${e.value}")[0].value = document.getElementsByName("${e.value}")[0].value = '';`);

document.getElementsByName('numpad-/')[0].setAttribute('onclick', `document.getElementsByName("${e.value}")[0].value = document.getElementsByName("${e.value}")[0].value = /;`);
}));
