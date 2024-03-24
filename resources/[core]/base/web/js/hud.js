const Online = document.getElementById("Online")
const Player = document.getElementById("Player")

$(document).ready(function () {
	window.addEventListener("message", function (e) {
		setTimeout(() => {
			if (e.data.Action) {
				$(".UI").fadeIn(100)
			} else {
				$(".UI").fadeOut(100)
			}
		}, 100)

        if (e.data.Action == "UpdateHud") {
			Online.innerHTML = e.data.Online
			Player.innerHTML = e.data.Player
		}
	})
})
