a<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_teacher.jsp" %>

        <!-- content field start -->
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const table = document.getElementById('user-list');
                let openedDetailRow = null; // 열려있는 상세보기 행

                table.querySelectorAll('tbody > tr').forEach(row => {
                    row.addEventListener('click', function() {
                        // 이미 상세보기 행이 있고, 클릭한 행 아래면 상세보기 제거
                        if (openedDetailRow && openedDetailRow.previousElementSibling === this) {
                            openedDetailRow.remove();
                            openedDetailRow = null;
                            return;
                        }

                        // 다른 상세보기 행이 열려있으면 닫기
                        if (openedDetailRow) {
                            openedDetailRow.remove();
                            openedDetailRow = null;
                        }

                        // 상세보기 내용 구성 (여기서 필요에 따라 내용 바꾸면 됨)
                        const detailContent = `
                            <td colspan="8" style="background-color: #f0f0f0; font-style: italic;">
                                수강과목: 수강과목1, 수강광목2 등...
                            </td>
                        `;

                        // 상세보기 행 생성
                        const detailRow = document.createElement('tr');
                        detailRow.innerHTML = detailContent;

                        // 클릭한 행 바로 아래에 삽입
                        this.parentNode.insertBefore(detailRow, this.nextSibling);

                        openedDetailRow = detailRow;
                    });
                });
            });
        </script>
        <div style="padding: 80px 130px; text-align: center;">
            <h3 style="text-align: left; width: 500px;">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                    <b>학생 관리</b>
            </h3>
            <br>
            <div class="d-flex mb-3" style="width: 1410px;"> 
                <div class="me-auto p-2">    
                    <form class="row row-cols-lg-auto g-3 align-items-center" style="margin-left: -15px;"">
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
                        <th scope="col">번호</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>성별</th>
                        <th>생년월일</th>
                        <th>전화번호</th>
                        <th>이메일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>milk123</td>
                        <td>김우유</td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>jok1235</td>
                        <td>김족발</td>
                        <td>남</td>
                        <td>1996.7.24</td>
                        <td>010-2468-2185</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>mina5782</td>
                        <td>김미나</td>
                        <td>여</td>
                        <td>2002.4.24</td>
                        <td>010-9424-2777</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">4</th>
                        <td>milk123</td>
                        <td>김우유</td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">5</th>
                        <td>milk123</td>
                        <td>김우유</td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">6</th>
                        <td>milk123</td>
                        <td>김우유</td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">7</th>
                        <td>milk123</td>
                        <td>김우유</td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>
                    <tr>
                        <th scope="row">8</th>
                        <td>milk123</td>
                        <td>김우유</td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>                                                           
                    <tr>
                        <th scope="row">9</th>
                        <td>milk123</td>
                        <td>김우유</td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
                    </tr>                    
                    <tr>
                        <th scope="row">10</th>
                        <td>milk123</td>
                        <td>김우유</td>
                        <td>여</td>
                        <td>1997.4.24</td>
                        <td>010-5555-4544</td>
                        <td>kin@naver.com</td>
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