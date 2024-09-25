class Carousel {
    constructor(carouselElement) {
        this.items = carouselElement.querySelectorAll('.carousel-item');
        this.currentIndex = 0;
        this.totalItems = this.items.length;
        this.showSlide(this.currentIndex);
        
        window[`moveSlide_${carouselElement.id}`] = this.moveSlide.bind(this);
    }

    showSlide(index) {
        this.items.forEach((item, i) => {
            item.style.display = (i === index) ? 'block' : 'none';
        });
    }

    moveSlide(direction) {
        this.currentIndex = (this.currentIndex + direction + this.totalItems) % this.totalItems;
        this.showSlide(this.currentIndex);
    }
}

document.querySelectorAll('.carousel').forEach(carouselElement => {
    const carousel = new Carousel(carouselElement);
    window[`moveSlide_${carouselElement.id}`] = (direction) => carousel.moveSlide(direction);
});