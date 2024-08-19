/**
 * productList.js
 */
 
 $(document).ready(function() {
    const itemsToShow = 5;

    function initializeSlider(sliderId, prevButtonId, nextButtonId) {
        let currentIndex = 0;
        const productCards = $(sliderId + ' .product-card');
        const totalItems = productCards.length;

        function showProducts() {
            productCards.hide();
            productCards.slice(currentIndex, currentIndex + itemsToShow).show();
        }

        $(nextButtonId).click(function() {
            if (currentIndex + itemsToShow < totalItems) {
                currentIndex++;
                showProducts();
            }
        });

        $(prevButtonId).click(function() {
            if (currentIndex > 0) {
                currentIndex--;
                showProducts();
            }
        });

        showProducts();
    }

    initializeSlider('#bestProductsSlider', '#prevButtonBest', '#nextButtonBest');
    initializeSlider('#newProductsSlider', '#prevButtonNew', '#nextButtonNew');
});

document.addEventListener('DOMContentLoaded', function() {
    // 카테고리 탭 클릭 시 해당 카테고리의 상품만 표시
    const tabs = document.querySelectorAll('#categoryTabs li');
    const containers = document.querySelectorAll('.category-container');

    tabs.forEach(tab => {
        tab.addEventListener('click', function() {
            const category = this.getAttribute('data-category');
            
            containers.forEach(container => {
                if (container.getAttribute('data-category') === category) {
                    container.style.display = 'flex'; // Flex로 변경하여 카드가 줄바꿈되게 설정
                } else {
                    container.style.display = 'none';
                }
            });

            tabs.forEach(li => li.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // 기본적으로 첫 번째 탭 활성화
    if (tabs.length > 0) {
        tabs[0].click();
    }

    // 필터링 기능
    const filterSelect = document.getElementById('filterSelect');
    
    if (filterSelect) {
        filterSelect.addEventListener('change', function() {
            const category = document.querySelector('#categoryTabs li.active').getAttribute('data-category');
            const sortBy = this.value;
            const container = document.querySelector(`.category-container[data-category="${category}"]`);

            if (container) {
                const products = Array.from(container.querySelectorAll('.product-card'));
                products.sort((a, b) => {
                    const priceA = parseFloat(a.querySelector('.price').textContent.replace('원', '').trim());
                    const priceB = parseFloat(b.querySelector('.price').textContent.replace('원', '').trim());
                    const nameA = a.querySelector('h3').textContent.toLowerCase();
                    const nameB = b.querySelector('h3').textContent.toLowerCase();

                    if (sortBy === 'priceAsc') {
                        return priceA - priceB;
                    } else if (sortBy === 'priceDesc') {
                        return priceB - priceA;
                    } else if (sortBy === 'nameAsc') {
                        return nameA.localeCompare(nameB);
                    } else if (sortBy === 'nameDesc') {
                        return nameB.localeCompare(nameA);
                    }
                    return 0;
                });

                // 카드 재정렬
                products.forEach(product => container.appendChild(product));
            }
        });
    }
});