let tag_slideIndex = 0;
const tag_intervalTime = 3000;
let tag_interval;

function tag_showSlides() {
    const tag_slides = document.querySelector('.tag_slides');
    const tag_slideCount = document.querySelectorAll('.tag_slide').length;
    if (tag_slideCount > 0) {
        tag_slides.style.transform = `translateX(${-tag_slideIndex * 100}%)`;
    }
}

function tag_moveSlide(n) {
    const tag_slides = document.querySelectorAll('.tag_slide').length;
    tag_slideIndex = (tag_slideIndex + n + tag_slides) % tag_slides;
    tag_showSlides();
}

function tag_startAutoSlide() {
    tag_interval = setInterval(() => {
        tag_moveSlide(1);
    }, tag_intervalTime);
}

document.addEventListener('DOMContentLoaded', () => {
    tag_showSlides();
    tag_startAutoSlide();
});

document.querySelector('.tag_slider').addEventListener('mouseenter', () => {
    clearInterval(tag_interval);
});

document.querySelector('.tag_slider').addEventListener('mouseleave', () => {
    tag_startAutoSlide();
});

function handleClick(url) {
    var sid = document.getElementById('sessionSid').value;
    if (!sid) {
        window.location.href = '/member/loginForm';
    } else {
        window.location.href = url;
    }
}