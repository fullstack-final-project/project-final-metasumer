/**
 * myPageChart.js
 */
 
$(function(){
     $.ajax({
          url: '/member/myPageData', 
          method: 'get',
          dataType: 'json',
          success: function(data) {
              
              let fishNames = data.fishNames;
              let fishSizes = data.fishSizes;

              let ctx1 = document.getElementById('myChart1').getContext('2d');
              new Chart(ctx1, {
                  type: 'bar',
                  data: {
                      labels: fishNames, // x축
                      datasets: [{
                          label: '물고기 크기(cm)', 
                          backgroundColor: '#87C4FF', 
                          data: fishSizes // y축 데이터
                      }]
                  },
                  options: {
                      responsive: true,
                      scales: {
                          x: {
                              beginAtZero: true 
                          },
                          y: {
                              beginAtZero: true, 
                          }
                      },
                      plugins: {
                        title: {
                            display: true,
                            text: '최근에 잡은 물고기 크기',
                            font: {
                                size: 18
                            }
                        }
                    }
                  }
              });
              
              // 물고기 수 그래프
              let monthFish = data.monthFishCnt;    
                       
              let ctx2 = document.getElementById('myChart2').getContext('2d');
              new Chart(ctx2, {
                type: 'bar',
                data: {
                    labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                    datasets: [{
                        label: '잡은 고기 수',
                        backgroundColor: '#87C4FF',
                        data: monthFish
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            beginAtZero: true
                        },
                        y: {
                            beginAtZero: true
                        }
                    },
                    plugins: {
                        title: {
                            display: true,
                            text: '월간 낚시 총합',
                            font: {
                                size: 18
                            }
                        }
                    }
                }
            });
            
            // 디폴트 : 월간 낚시 종합 그래프
            document.getElementById('myChart1').style.display = 'none';
            document.getElementById('myChart2').style.display = 'block';
            $("#countGraph").addClass('selectedItem'); 

            // 버튼 클릭 이벤트 처리
            document.getElementById('sizeGraph').addEventListener('click', function() {
                $("#countGraph").removeClass('selectedItem'); 
                $(this).addClass('selectedItem'); 
                document.getElementById('myChart1').style.display = 'block';
                document.getElementById('myChart2').style.display = 'none';
            });

            document.getElementById('countGraph').addEventListener('click', function() {
                $("#sizeGraph").removeClass('selectedItem'); 
                $(this).addClass('selectedItem'); 
                document.getElementById('myChart1').style.display = 'none';
                document.getElementById('myChart2').style.display = 'block';
            });
          },
          error: function() {
              alert("실패");
          }
      });
});