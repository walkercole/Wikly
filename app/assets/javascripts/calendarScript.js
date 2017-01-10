$(document).ready(function(){
	function dayTop(col){
		return col.parentElement.offsetTop;
	};

	function dayBottom(col){
		return dayTop(col) + col.offsetHeight;
	};

	function dayPercent(e,col) {
		return ((e.pageY - dayTop(col)) / (dayBottom(col) - dayTop(col)));
	};

	function hoursAndMinutes(e,col) {
		var am = dayPercent(e,col) < .5;
		var h = Math.floor((dayPercent(e,col)*24)%12);
		var m = Math.floor(((24*dayPercent(e,col))%1)*60);
		return ((h > 0 ? h : "12") + ":" +
			(m > 0 ? (m < 10 ? "0" : "") + m : "00") + 
			(dayPercent(e,col) < .5 ? "AM" : "PM"));
	}

	function clockSlider(e,col) {
		slideLocation = (dayPercent(e,col) * col.offsetHeight) - 40;

		if(slideLocation < -25){
			return "-25px";
		} else {
			return slideLocation + "px";
		}
	}

	for (col of document.querySelectorAll('#main-grid .column')) {
		console.log("adding evt listener to", col);
		attachListener(col);
	}

	function attachListener(col) {
		var display = col.children[0];
		console.log("this col's display is", display);
		col.addEventListener('mousemove',function(e){
			display.className = 'ui red ribbon label visible';
			display.style.top = clockSlider(e,col);
			console.log((dayPercent(e,col)*100)-5)
			console.log(clockSlider(e,col));
			display.innerText = hoursAndMinutes(e,col);
		}, false);
		col.addEventListener('mouseleave', function(e){
			display.className = 'invisible';
		})
	}
})