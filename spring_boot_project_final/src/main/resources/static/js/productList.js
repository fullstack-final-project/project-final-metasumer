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

$(document).ready(function() {
    // 카테고리 탭 클릭 이벤트
    const tabs = document.querySelectorAll('#categoryTabs li');
    const containers = document.querySelectorAll('.category-container');
    const filterSelect = document.getElementById('filterSelect');
    
    tabs.forEach(tab => {
        tab.addEventListener('click', function() {
            const category = this.getAttribute('data-category');
            
            // 모든 카테고리 숨기고 선택된 카테고리만 표시
            containers.forEach(container => {
                if (container.getAttribute('data-category') === category) {
                    container.style.display = 'flex'; // 해당 카테고리 표시
                    applyFilter(container); // 필터 적용
                } else {
                    container.style.display = 'none';
                }
            });

            // 활성화된 탭 스타일 설정
            tabs.forEach(li => li.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // 필터링 기능
    filterSelect.addEventListener('change', function() {
        const activeTab = document.querySelector('#categoryTabs li.active');
        const activeCategory = activeTab ? activeTab.getAttribute('data-category') : null;
        const container = document.querySelector(`.category-container[data-category="${activeCategory}"]`);
        
        if (container) {
            applyFilter(container);
        }
    });

    // 필터 적용 함수
    function applyFilter(container) {
        const sortBy = filterSelect.value;
        const products = Array.from(container.querySelectorAll('.product-card'));

        products.sort((a, b) => {
            const priceA = parseInt(a.querySelector('.product-info p:nth-child(2)').textContent.replace(/[^0-9]/g, ''));
            const priceB = parseInt(b.querySelector('.product-info p:nth-child(2)').textContent.replace(/[^0-9]/g, ''));
            
            // 기본 정렬은 prdNo 기준으로
            const prdNoA = parseInt(a.getAttribute('data-prdNo'));
        	const prdNoB = parseInt(b.getAttribute('data-prdNo'));
            
            if (sortBy === 'priceAsc') {
                return priceA - priceB; // 오름차순
            } else if (sortBy === 'priceDesc') {
                return priceB - priceA; // 내림차순
            } else {
                return prdNoA - prdNoB; // 기본 정렬
            }
        });

        // 정렬된 상품을 다시 DOM에 추가
        products.forEach(product => container.appendChild(product));
    }
});
