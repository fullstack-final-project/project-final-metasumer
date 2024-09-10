$(document).ready(function() {
    $.ajax({
        url: '/admin/showStatistics',
        method: 'GET',
        dataType: 'json',
        success: function(response) {
            // 로그인을 포함한 차트 데이터 처리
            if (response.topList) {
                var labels = [];
                var loginData = [];
                var postData = [];
                var commentData = [];
                var recordData = [];
                var activityData = [];

                $.each(response.topList, function(index, item) {
                    labels.push(item.memId);
                    loginData.push(item.loginCount || 0);
                    postData.push(item.postCount || 0);
                    commentData.push(item.commentCount || 0);
                    recordData.push(item.recordCount || 0);
                    activityData.push(item.totalActivity || 0);
                });
                var ctxLoginTop = document.getElementById('loginTop');
                if (ctxLoginTop) {
                    var ctxLoginTop2d = ctxLoginTop.getContext('2d');
                    new Chart(ctxLoginTop2d, {
                        type: 'bar',
                        data: {
                            labels: labels,
                            datasets: [
									    {
									        label: '총 활동량',
									        data: activityData,
									        backgroundColor: 'rgba(135, 196, 255, 0.5)',
                                    		borderColor: 'rgba(57, 167, 255, 1)',
									        borderWidth: 1
									    },
									    {
									        label: '로그인 횟수',
									        data: loginData,
									        backgroundColor: 'rgba(75, 192, 192, 0.5)',
									        borderColor: 'rgba(75, 192, 192, 1)',
									        borderWidth: 1
									    },
									    {
									        label: '게시물 작성',
									        data: postData,
									        backgroundColor: 'rgba(255, 159, 64, 0.5)',
									        borderColor: 'rgba(255, 159, 64, 1)',
									        borderWidth: 1
									    },
									    {
									        label: '댓글 작성',
									        data: commentData,
									        backgroundColor: 'rgba(153, 102, 255, 0.5)',
									        borderColor: 'rgba(153, 102, 255, 1)',
									        borderWidth: 1
									    },
									    {
									        label: '낚시갤러리 기록',
									        data: recordData,
									        backgroundColor: 'rgba(255, 99, 132, 0.5)',
									        borderColor: 'rgba(255, 99, 132, 1)',
									        borderWidth: 1
									    }
									]
                        },
                        options: {
                            scales: {
                                x: {
                                    stacked: true,
                                    barPercentage: 0.8,
                                    categoryPercentage: 1.0
                                },
                                y: {
                                    beginAtZero: true,
                                    stacked: true
                                }
                            }
                        }
                    });
                } else {
                    console.error('로그인 TOP5 차트 캔버스 요소를 찾을 수 없습니다.');
                }
            } else {
                console.error('로그인 및 활동량 데이터 포맷이 예상과 다릅니다:', response);
            }

            // 게시물 및 댓글 통계 차트 데이터 처리
            if (response.postList) {
                var postLabels = [];
                var postCounts = [];
                var commentCounts = [];

                $.each(response.postList, function(index, item) {
                    postLabels.push(item.boardCtgName);
                    postCounts.push(item.postCount);
                    commentCounts.push(item.commentCount);
                });

                var ctxPostStats = document.getElementById('postStats');
                if (ctxPostStats) {
                    var ctxPostStats2d = ctxPostStats.getContext('2d');
                    new Chart(ctxPostStats2d, {
                        type: 'bar',
                        data: {
                            labels: postLabels,
                            datasets: [
                                {
                                    label: '게시물 수',
                                    data: postCounts,
                                    backgroundColor: 'rgba(135, 196, 255, 0.5)',
                                    borderColor: 'rgba(57, 167, 255, 1)',
                                    borderWidth: 1
                                },
                                {
                                    label: '댓글 수',
                                    data: commentCounts,
                                    backgroundColor: 'rgba(255, 159, 64, 0.5)',
                                    borderColor: 'rgba(255, 159, 64, 1)',
                                    borderWidth: 1
                                }
                            ]
                        },
                        options: {
                            scales: {
                                x: {
                                    stacked: true
                                },
                                y: {
                                    beginAtZero: true,
                                    stacked: true
                                }
                            }
                        }
                    });
                } else {
                    console.error('게시물 및 댓글 통계 차트 캔버스 요소를 찾을 수 없습니다.');
                }
            } else {
                console.error('게시물 및 댓글 통계 데이터 포맷이 예상과 다릅니다:', response);
            }

            // 게시물 및 낚시 갤러리 통계 차트 데이터 처리
            if (response.topPostList) {
                var topPostLabels = [];
                var topPostViews = [];
                var topPostComments = [];
                var topPostTypes = [];

                $.each(response.topPostList, function(index, item) {
                    topPostLabels.push(item.categoryName + " : "+ item.title);
                    topPostViews.push(item.views);
                    topPostComments.push(item.commentCount);
                    topPostTypes.push(item.type);
                });

                var ctxMergedStats = document.getElementById('mergedStats');
                if (ctxMergedStats) {
                    var ctxMergedStats2d = ctxMergedStats.getContext('2d');
                    new Chart(ctxMergedStats2d, {
                        type: 'bar',
                        data: {
                            labels: topPostLabels,
                            datasets: [
                                {
                                    label: '조회수',
                                    data: topPostViews,
                                    backgroundColor: 'rgba(135, 196, 255, 0.5)',
                                    borderColor: 'rgba(57, 167, 255, 1)',
                                    borderWidth: 1
                                },
                                {
                                    label: '댓글 수',
                                    data: topPostComments,
                                    backgroundColor: 'rgba(255, 159, 64, 0.5)',
                                    borderColor: 'rgba(255, 159, 64, 1)',
                                    borderWidth: 1
                                }
                            ]
                        },
                        options: {
                            scales: {
                                x: {
                                    stacked: true
                                },
                                y: {
                                    beginAtZero: true,
                                    stacked: true
                                }
                            }
                        }
                    });
                } else {
                    console.error('게시물 및 낚시 갤러리 통계 차트 캔버스 요소를 찾을 수 없습니다.');
                }
            } else {
                console.error('게시물 및 낚시 갤러리 통계 데이터 포맷이 예상과 다릅니다:', response);
            }
        },
        error: function(xhr, status, error) {
            console.error('데이터를 가져오는 데 실패했습니다:', error);
        }
    });
});
