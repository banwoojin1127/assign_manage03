<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_admin.jsp" %>
<!-- content field start -->
        <div id="body">
            <h3 id="title">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                <b>사용자 관리</b>
            </h3>
            <div class="d-flex mb-3" style="width: 1410px; text-align: right;">
                
                <button type="button" class="btn btn-primary ms-auto" style="width:95x; margin-right: 10px ;"
                    onclick="location.href='teacher-signup.jsp'">
                    교사 등록
                </button>
            </div>
            <div class="d-flex mb-3" style="width: 1410px;"> 
                <div class="me-auto p-2">    
                    <form class="row row-cols-lg-auto g-3 align-items-center" style="margin-left: -15px;">
                        <div class="col-12" style="width: 115px;">
                            <select class="form-select" aria-label="Small select example">
                                <option selected>전체</option>
                                <option value="1">등급</option>
                                <option value="2">아이디</option>
                                <option value="3">이름</option>
                                <option value="3">성별</option>                      
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
                                <option>등급순(높은순)</option>
                                <option>등급순(낮은순)</option>
                                <option>생년월일(오름차순)</option>
                                <option>생년월일(내림차순)</option>
                                <option>이름(오름차순)</option>
                                <option>이름(내림차순)</option>
                                <option>아이디(오름차순)</option>
                                <option>아이디(내림차순)</option>
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
                <thead  class="table-light">
                    <tr>
                        <th scope="col" class="">번호</th>
                        <th class="">등급</th>
                        <th class="">아이디</th>
                        <th class="">이름</th>
                        <th class="">성별</th>
                        <th class="">생년월일</th>
                        <th class="">전화번호</th>
                        <th class="">이메일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>관리자</td>
                        <td>Master</td>
                        <td><a href="../admin/user-view.jsp" class="view">김우유</a></td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>교사</td>
                        <td>jok444</td>
                        <td><a href="../admin/user-view.jsp" class="view">김족발</a></td>
                        <td>남</td>
                        <td>1996.7.24</td>
                        <td>010-2468-2185</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>교사</td>
                        <td>mini444</td>
                        <td><a href="../admin/user-view.jsp" class="view">김미나</a></td>
                        <td>여</td>
                        <td>2002.4.24</td>
                        <td>010-9424-2777</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">4</th>
                        <td>교사</td>
                        <td>milk123</td>
                        <td><a href="../admin/user-view.jsp" class="view">김우유</a></td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">5</th>
                        <td>학생</td>
                        <td>milk578</td>
                        <td><a href="../admin/user-view.jsp" class="view">김우유</a></td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">6</th>
                        <td>학생</td>
                        <td>milk777</td>
                        <td><a href="../admin/user-view.jsp" class="view">김우유</a></td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">7</th>
                        <td>학생</td>
                        <td>milk447</td>
                        <td><a href="../admin/user-view.jsp" class="view">김우유</a></td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">8</th>
                        <td>학생</td>
                        <td>milk447</td>
                        <td><a href="../admin/user-view.jsp" class="view">김우유</a></td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>                                                           
                    <tr>
                        <th scope="row">9</th>
                        <td>학생</td>
                        <td>milk447</td>
                        <td><a href="../admin/user-view.jsp" class="view">김우유</a></td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>                    
                    <tr>
                        <th scope="row">10</th>
                        <td>학생</td>
                        <td>milk447</td>
                        <td><a href="../admin/user-view.jsp" class="view">김우유</a></td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>                    
                </tbody>
            </table>
        </div>
        <nav aria-label="Page navigation example" id="page">
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