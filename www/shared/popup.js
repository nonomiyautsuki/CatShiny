	$(document).ready(function () {
		$("#hide").click(function () {
		$("div").hide();
	});
		$("#show").click(function () {
		$("div").show()
	});
 });
 
 
document.addEventListener("DOMContentLoaded", function() {
	chrome.tabs.executeScript({
		file:'javascript/toInsert.js'
	});
    document.getElementById('applyBtn').addEventListener('click', function(e) {
		chrome.tabs.executeScript({
			code: 'window.postMessage({ type: "HIGHT_LIGHT", text: "' +
			document.getElementById('keyword').value + '" }, "*");'
		});
    });
    document.getElementById('removeBtn').addEventListener('click', function(e) {
		chrome.tabs.executeScript({
			code: 'window.postMessage({ type: "REMOVE"}, "*");'
		});
    });
});
