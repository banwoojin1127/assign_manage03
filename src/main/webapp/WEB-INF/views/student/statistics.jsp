<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_student.jsp" %>
<!-- content field start -->
			<div style="padding: 80px 130px; text-align: center; width: 1664px;">
            	<h3 style="text-align: left; width: 500px;">
                	<div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    	<div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                        <b>통계</b>
                   	</div>
             	</h3>
            	<br>
            <div class="container">
                <div class="row my-3">
                        <div class="col">
                            <h4>강의별 과제 제출 정보 </h4>
                        </div>

                        <div class="row py-2">
                            <div class="col-md-4 py-1">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title text-center">과목 A</h5>
                                        <canvas id="chDonut1"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 py-1">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title text-center">과목 B</h5>
                                        <canvas id="chDonut2"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 py-1">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title text-center">과목C </h5>
                                        <canvas id="chDonut3"></canvas>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <!-- 부트스트랩 -->
                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                        crossorigin="anonymous"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                        crossorigin="anonymous"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                        crossorigin="anonymous"></script>
                    <!-- 차트 -->
                    <script>
                        // chart colors
                        var colors = ['skyblue', 'yellowgreen', 'yellowgreen', '#c3e6cb', '#dc3545', '#6c757d'];

                        /* 3 donut charts */
                        var donutOptions = {
                            cutoutPercentage: 30, //도넛두께 : 값이 클수록 얇아짐
                            legend: { position: 'bottom', padding: 5, labels: { pointStyle: 'circle', usePointStyle: true } }
                        };

                        // donut 1
                        var chDonutData1 = {
                            labels: ['제출', '미제출'],
                            datasets: [
                                {
                                    backgroundColor: colors.slice(0, 3),
                                    borderWidth: 0,
                                    data: [17, 4]
                                }
                            ]
                        };

                        var chDonut1 = document.getElementById("chDonut1");
                        if (chDonut1) {
                            new Chart(chDonut1, {
                                type: 'pie',
                                data: chDonutData1,
                                options: donutOptions
                            });
                        }

                        // donut 2
                        var chDonutData2 = {
                            labels: ['제출', '미제출'],
                            datasets: [
                                {
                                    backgroundColor: colors.slice(0, 3),
                                    borderWidth: 0,
                                    data: [24, 6]
                                }
                            ]
                        };
                        var chDonut2 = document.getElementById("chDonut2");
                        if (chDonut2) {
                            new Chart(chDonut2, {
                                type: 'pie',
                                data: chDonutData2,
                                options: donutOptions
                            });
                        }
                        // donut 3
                        var chDonutData3 = {
                            labels: ['제출', '미제출'],
                            datasets: [
                                {
                                    backgroundColor: colors.slice(0, 3),
                                    borderWidth: 0,
                                    data: [15, 6]
                                }
                            ]
                        };
                        var chDonut3 = document.getElementById("chDonut3");
                        if (chDonut2) {
                            new Chart(chDonut3, {
                                type: 'pie',
                                data: chDonutData3,
                                options: donutOptions
                            });
                        }
                    </script>



                    <div class="container" style="padding-left: 110px;">
                        <div class="col-lg-11 mb-4">
                            <canvas id="myChart" style="width: 300px; height: 100px;"></canvas>



                            <!-- 부트스트랩 -->
                            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                                crossorigin="anonymous"></script>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                                crossorigin="anonymous"></script>
                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                                crossorigin="anonymous"></script>
                            <!-- 차트 -->
                            <script>
                                var ctx = document.getElementById('myChart');
                                var myChart = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: ['감귤학', '포도학', '사과학', '딸기학',],
                                        datasets: [{
                                            label: '강의별 평균점수',
                                            data: [8, 10, 7, 5],
                                            backgroundColor: [
                                                'rgba(255, 99, 132, 0.2)',
                                                'rgba(54, 162, 235, 0.2)',
                                                'rgba(255, 206, 86, 0.2)',
                                                'rgba(75, 192, 192, 0.2)',
                                            ],
                                            borderColor: [
                                                'rgba(255, 99, 132, 1)',
                                                'rgba(54, 162, 235, 1)',
                                                'rgba(255, 206, 86, 1)',
                                                'rgba(75, 192, 192, 1)',
                                            ],
                                            borderWidth: 1
                                        }]
                                    },
                                    options: {
                                        scales: {
                                            yAxes: [{
                                                ticks: {
                                                    beginAtZero: true
                                                }
                                            }]
                                        }
                                    }
                                });

                            </script>
                        </div>
                    </div>
                </div>
            </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>