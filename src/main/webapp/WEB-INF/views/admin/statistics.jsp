<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_admin.jsp" %>
<!-- content field start -->
        <body>

            <div class="container">
                <div class="row my-3">

                    <div style="padding: 80px 130px; text-align: center; width: 1664px;">
                        <h3 style="text-align: left; width: 500px;">
                            <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3"
                                style="width: 100%;">
                                <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                                <b>통계</b>
                        </h3>





                        <!-- Content Row -->
                        <div class="row">

            

                       <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">

                                            <div class="col mr-2">
                                                       <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    교사</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">20명</div>
                                            </div>
                                            </div>
                            
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>






                       <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">

                                            <div class="col mr-2">
                                                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    학생</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">150명</div>
                                            </div>
                                            </div>
                            
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>



                            

                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">

                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    강의</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">18개</div>

                                            </div>
                                            </div>
                            
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>






                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">과제
                                            </div>
                                                 <div class="h5 mb-0 font-weight-bold text-gray-800">120개</div>
                                            </div>
                            
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>



                        </div>


                        <div class="container">
                            <div class="row my-3">
                                <div class="col">
                                    <h4>월별 과제수</h4>
                                </div>
                            </div>
                            <canvas id="myChart"></canvas>
                        </div>

                        <div class="row my-2">
                            <div class="col">
                                <div class="card">
                                    <div class="card-body">
                                        <!-- 부트스트랩 -->
                                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                                            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                                            crossorigin="anonymous"></script>
                                        <script
                                            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                                            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                                            crossorigin="anonymous"></script>
                                        <script
                                            src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                                            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                                            crossorigin="anonymous"></script>
                                        <!-- 차트 -->
                                        <script>
                                            var ctx = document.getElementById('myChart').getContext('2d');
                                            var chart = new Chart(ctx, {
                                                // 챠트 종류를 선택
                                                type: 'line',

                                                // 챠트를 그릴 데이타
                                                data: {
                                                    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                                                    datasets: [{
                                                        label: '과제',
                                                        backgroundColor: 'transparent',
                                                        borderColor: 'skyblue',
                                                        data: [0, 10, 5, 2, 20, 10, 15]
                                                    }]
                                                },
                                                // 옵션
                                                options: {}
                                            });
                                        </script>





                                        <table class="table caption-top">
                                            <caption>과제를 가장 많이 낸 교수님</caption>
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">교수명</th>
                                                    <th scope="col">강의수</th>
                                                    <th scope="col">과제수</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>일크</td>
                                                    <td>5</td>
                                                    <td>10</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">2</th>
                                                    <td>이투</td>
                                                    <td>4</td>
                                                    <td>8</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">3</th>
                                                    <td>삼투</td>
                                                    <td>4</td>
                                                    <td>7</td>
                                                </tr>
                                            </tbody>
                                        </table>




                                        <!-- content field end -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        </body>