var count = 0
var thisCount = 0

const handlers = {
	startInitFunctionOrder(data) {
		count = data.count
	},

	initFunctionInvoking(data) {
		document.querySelector(".Progress").style.left = "0%"
		document.querySelector(".Progress").style.width = (data.idx / count) * 100 + "%"
	},

	startDataFileEntries(data) {
		count = data.count
	},

	performMapLoadFunction(data) {
		++thisCount
		document.querySelector(".Progress").style.left = "0%"
		document.querySelector(".Progress").style.width = (thisCount / count) * 100 + "%"
	},
}

$(document).ready(function () {
	window.addEventListener("message", function (e) {
		;(handlers[e.data.eventName] || function () {})(e.data)
	})
})
