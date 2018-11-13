let img;
let url;
let listo =0;

function preload() {

	$.ajax({
		url: "https://random.dog/woof.json",
		type: 'GET',
		dataType: 'json',
		error: function(data){
			console.log("We got problems");
			console.log(data.status);
		},
		success: function(data){
			url = data.url.toString();
			console.log(url);
			listo = 1;
		}	
	});
}

function setup() {
  createCanvas(400, 400);
	background(220);
}

function draw() {
	if(listo==1){
		img = loadImage(url);
		listo= 2;
	}else if (listo==2){
	image(img, 0, 0, 400, 400);
	}
}