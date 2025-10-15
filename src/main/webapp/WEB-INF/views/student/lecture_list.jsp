<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_student.jsp" %>
<!-- content field start -->
        <div style="padding: 80px 130px; text-align: center;">
            <h3 style="text-align: left; width: 500px;">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                <b>강의 조회</b>
            </h3>
            <br>
            <div class="d-flex mb-3" style="width: 1410px;"> 
                <div class="me-auto p-2">    
                    <form class="row row-cols-lg-auto g-3 align-items-center" style="margin-left: -15px;">
                        <div class="col-12" style="width: 115px;">
                            <select class="form-select" aria-label="Small select example">
                                <option selected>전체</option>
                                <option value="2">아이디</option>
                                <option value="3">이름</option>                    
                            </select>
                        </div>
                        <div class="col-12" style="width: 220px;">
                            <label class="visually-hidden" for="inlineFormInputGroupUsername">Username</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="inlineFormInputGroupUsername"
                                    placeholder="Username">
                            </div>
                        </div>
                        <div class="col-12" style="width: 75px;">
                            <button type="submit" class="btn btn-primary">검색</button>
                        </div>
                    </form>
                </div>
                <div class="p-2">
                    <form> 
                        <div class="col-12">
                            <select class="form-select form-select-sm" aria-label="Small select example">
                                <option selected>번호(오름차순)</option>
                                <option>번호(내림차순)</option>
                                <option>시작일(오름차순)</option>
                                <option>시작일(내림차순)</option>
                                <option>종료일(오름차순)</option>
                                <option>종료일(내림차순)</option>
                            </select>
                        </div>
                    </form>
                </div>    
                <div class="p-2">
                    <div class="col-12">
                        <select class="form-select form-select-sm" aria-label="Small select example">
                            <option selected>10개씩</option>
                            <option value="1">20개씩</option>
                            <option value="2">30개씩</option>
                        </select>
                    </div>
                </div>
            </div>

            <table id="user-list" class="table table-bordered table-hover" style="width: 1405px;">
                <thead class="table-light">
                    <tr>
                        <th scope="col" class="table-primary">번호</th>
                        <th class="table-primary">강의명</th>
                        <th class="table-primary">교사명</th>
                        <th class="table-primary">시작일</th>
                        <th class="table-primary">종료일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>자바의 정석</td>
                        <td>홍길동</td>
                        <td>2025.9.22</td>
                        <td>2025.9.22</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>양식의탐구</td>
                        <td>돌멩이</td>
                        <td>2025.9.22</td>
                        <td>2025.9.22</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>하늘에서 음식이 내린다면</td>
                        <td>김밥</td>
                        <td>2025.9.22</td>
                        <td>2025.9.22</td>
                    </tr>
                    <tr>
                        <th scope="row">4</th>
                        <td>floccinaucinihilipilificastically</td>
                        <td>james</td>
                        <td>2025.9.22</td>
                        <td>2025.9.22</td>
                    </tr>
                    <tr>
                        <th scope="row">5</th>
                        <td>주말이 짧은 과학적 이유</td>
                        <td>박과학</td>
                        <td>2025.9.22</td>
                        <td>2025.9.22</td>
                    </tr>
                    <tr>
                        <th scope="row">6</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">7</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">8</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>                                                           
                    <tr>
                        <th scope="row">9</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>                    
                    <tr>
                        <th scope="row">10</th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>                    
                </tbody>
            </table>
        </div>
        <nav aria-label="Page navigation example" style="margin-top: -40px; width: 1600px;">
            <ul class="pagination justify-content-center ">
                <li class="page-item disabled">
                    <a class="page-link">&lt;</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">&gt;</a>
                </li>
            </ul>
        </nav>
        <br><br>
        <!-- content field end -->
<%@ include file="../include/tail.jsp" %>