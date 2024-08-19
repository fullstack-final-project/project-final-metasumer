/**
 * index.js
 */
 
 $(function() {
 
 	let slideIndex = 1;
	showSlides(slideIndex);
	
	// Next/previous controls
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	// Thumbnail image controls
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
		let i;
		let slides = document.getElementsByClassName("mySlides");
		let dots = document.getElementsByClassName("demo");
		let captionText = document.getElementById("caption");
		
		if (n > slides.length) {
			slideIndex = 1; 
		}
		
		if (n < 1) {
			slideIndex = slides.length
		}
		
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		
		slides[slideIndex-1].style.display = "block";
		dots[slideIndex-1].className += " active";
		captionText.innerHTML = dots[slideIndex-1].alt;
	}

	// 센터모드 슬릭
	$('.menber_slick2').slick({
        slidesToShow: 5,
        SlidesToScroll: 1,
        dots: false,
        arrows: true,
        infinite: true,
        speed: 2000,
        autoplay: true,
        autoplaySpeed: 3000,
        centerMode: true,
        centerPadding: '5px'
    });
 
 });