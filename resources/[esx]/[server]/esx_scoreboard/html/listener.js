var visable = false;

$(function () {
	window.addEventListener('message', function (event) {

		switch (event.data.action) {
			case 'toggle':
				if (visable) {
					$('#wrap').fadeOut();
				} else {
					$('#wrap').fadeIn();
				}

				visable = !visable;
				break;

			case 'close':
				$('#wrap').fadeOut();
				visable = false;
				break;

			case 'toggleID':

				if (event.data.state) {
					$('td:nth-child(2), th:nth-child(2)').show();
					$('td:nth-child(5), th:nth-child(5)').show();
				} else {
					$('td:nth-child(2), th:nth-child(2)').hide();
					$('td:nth-child(5),t h:nth-child(5)').hide();
				}

				break;

			case 'updatePlayerJobs':
				var jobs = event.data.jobs;

				$('#player_count').html(jobs.player_count);

				$('#ems').html(jobs.ems);
				$('#police').html(jobs.police);
				$('#sheriff').html(jobs.sheriff);
				$('#hasici').html(jobs.hasici);
				$('#taxi').html(jobs.taxi);
				$('#ammu').html(jobs.ammu);
				$('#mechanic').html(jobs.mechanic);
				$('#mecano').html(jobs.mecano);
				$('#bazar').html(jobs.bazar);
				$('#benefactor').html(jobs.benefactor);
				$('#state').html(jobs.state);
				$('#galdin').html(jobs.galdin);
				$('#unicorn').html(jobs.unicorn);
				$('#vigne').html(jobs.vigne);
				$('#casino').html(jobs.casino);
				$('#pivovar').html(jobs.pivovar);
				$('#easyway').html(jobs.easyway);
				$('#coffee').html(jobs.coffee);
				$('#ranch').html(jobs.ranch);
				$('#lifeinvader').html(jobs.lifeinvader);
				$('#farma').html(jobs.farma);
				$('#cozinheiro').html(jobs.cozinheiro);
				$('#steakhouse').html(jobs.gang);
				break;

			case 'updatePlayerList':
				$('#playerlist tr:gt(0)').remove();
				$('#playerlist').append(event.data.players);
				applyPingColor();
				// sortPlayerList();
				break;

			case 'updatePing':
				updatePing(event.data.players);
				applyPingColor();
				break;

			case 'updateServerInfo':
				if (event.data.maxPlayers) {
					$('#max_players').html(event.data.maxPlayers);
				}

				if (event.data.uptime) {
					$('#server_uptime').html(event.data.uptime);
				}

				if (event.data.playTime) {
					$('#play_time').html(event.data.playTime);
				}

				break;

			default:
				console.log('esx_scoreboard: unknown action!');
				break;
		}
	}, false);
});

function applyPingColor() {
	$('#playerlist tr').each(function () {
		$(this).find('td:nth-child(3),td:nth-child(6)').each(function () {
			var ping = $(this).html();
			var color = 'green';

			if (ping > 50 && ping < 80) {
				color = 'orange';
			} else if (ping >= 80) {
				color = 'red';
			}

			$(this).css('color', color);
			$(this).html(ping + " <span style='color:white;'>ms</span>");
		});

	});
}

// Todo: not the best code
function updatePing(players) {
	jQuery.each(players, function (index, element) {
		if (element != null) {
			$('#playerlist tr:not(.heading)').each(function () {
				$(this).find('td:nth-child(2):contains(' + element.id + ')').each(function () {
					$(this).parent().find('td').eq(2).html(element.ping);
				});

				$(this).find('td:nth-child(5):contains(' + element.id + ')').each(function () {
					$(this).parent().find('td').eq(5).html(element.ping);
				});
			});
		}
	});
}

function sortPlayerList() {
	var table = $('#playerlist'),
		rows = $('tr:not(.heading)', table);

	rows.sort(function(a, b) {
		var keyA = $('td', a).eq(1).html();
		var keyB = $('td', b).eq(1).html();

		return (keyA - keyB);
	});

	rows.each(function(index, row) {
		table.append(row);
	});
}