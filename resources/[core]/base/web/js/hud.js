const Online = document.getElementById("Online")
const Player = document.getElementById("Player")

$(document).ready(function () {
	window.addEventListener("message", function (e) {
		if (e.data.Hud) {
			$(".UI").fadeIn(100)
		} else {
			$(".UI").fadeOut(100)
		}

		if (e.data.Hud == "UpdateHud") {
			Online.innerHTML = e.data.Online
			Player.innerHTML = e.data.Player
		}
	})
})
