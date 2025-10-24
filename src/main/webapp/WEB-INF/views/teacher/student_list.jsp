<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/head_teacher.jsp" %>
<!-- content field start -->
<script>
let openedDetailRow;
let table;
let detailContent;

    document.addEventListener('DOMContentLoaded', function () {
        openedDetailRow = null; // 열려있는 상세보기 행
        table = document.getElementById('user-list');
        detailContent = "";
        table.querySelectorAll('tbody > tr').forEach(row => {
        row.addEventListener('click', function () {
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
            LoadTheyLecture($(this), $(this).children("td").eq(0).text());
        });
    });
});

function LoadTheyLecture(from, idValue)
{
    $.ajax({
        url : "studnet_theylecure?id=" + encodeURIComponent(idValue),
        type : "get",
        dataType : "html",
        success : function(res)
        {
            res = (res || '').toString().trim();

            console.log('LoadTheyLecture response:', res);

            // 상세보기 행 생성 (colspan은 테이블 컬럼 수에 맞게 설정)
            const detailRow = document.createElement('tr');
            detailRow.innerHTML = '<td colspan="7" style="background-color: #f0f0f0; font-style: italic;">' + res + '</td>';

            // 클릭한 행 바로 아래에 삽입. 'from'은 호출 시에 전달된 jQuery 객체임.
            try {
                if (from && typeof from.after === 'function') {
                    from.after(detailRow);
                } else if (from && from.nodeType === 1) {
                    from.parentNode.insertBefore(detailRow, from.nextSibling);
                }
                openedDetailRow = detailRow;
            } catch (e) {
                console.error('Failed to insert detail row:', e);
            }
        },
        error: function(xhr, status, err) {
            console.error('LoadTheyLecture AJAX error:', status, err);
        }
    })
}
</script>
<div style="padding: 80px 130px; text-align: center;">
    <h3 style="text-align: left; width: 500px;">
        <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
            <div id="" class="decoWideTitle" style="width: 12px;"></div>
            &nbsp;&nbsp;
            <b>학생 관리</b>
        </div>
    </h3>
    <br>
    <div class="d-flex mb-3" style="width: 1410px;">
        <button type="button" class="btn btn-primary ms-auto" style="text-align: right; width:105px; margin-right: 10px; visibility:hidden; pointer-events:none;" tabindex="-1" aria-hidden="true" aria-label="fake button">
            <!-- hidden spacer button to preserve layout; not interactive -->
        </button>
    </div>
    <div class="d-flex mb-3">
        <form  role="search" aria-label="학생 검색 폼">
            <div class="d-flex align-items-center gap-2">
                <div style="width: 115px;">
                    <select class="form-select" name="filter" aria-label="검색 필터">
                        <option value="all" selected>전체</option>
                        <option value="id">아이디</option>
                        <option value="user_name">이름</option>
                        <option value="gender">성별</option>
                    </select>
                </div>
                <div style="width: 220px;">
                    <label class="visually-hidden" for="inlineFormInputGroupUsername">검색어</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="inlineFormInputGroupUsername" name="q" aria-label="검색어 입력" placeholder="검색어를 입력해주세요.">
                    </div>
                </div>
                <div style="width: 75px;">
                    <button type="submit" class="btn btn-primary">검색</button>
                </div>
            </div>
            <div class="d-flex mb-3 align-items-center gap-2">
                <div>
                    <!-- avoid nested form: keep select outside of another form element -->
                    <select class="form-select form-select-sm right-align1" name="sort" aria-label="정렬 방식">
                        <option selected>번호(오름차순)</option>
                        <option>번호(내림차순)</option>
                        <option>생년월일(오름차순)</option>
                        <option>생년월일(내림차순)</option>
                        <option>이름(오름차순)</option>
                        <option>이름(내림차순)</option>
                        <option>아이디(오름차순)</option>
                        <option>아이디(내림차순)</option>
                    </select>
                </div>    
                <div>
                    <select class="form-select form-select-sm right-align2" style="visibility : hidden;" name="pageSize" aria-label="페이지 크기">
                        <option value="10" selected>10개씩</option>
                        <option value="20">20개씩</option>
                        <option value="50">50개씩</option>
                    </select>
                </div>
            </div>
        </form>
	</div>
    <div style="vertical-align:middle;">
        <table id="user-list" class="table table-bordered table-hover" style="width: 1405px;">
            <thead class="table-light">
                <tr>
                    <th scope="col" class="" style="vertical-align:middle;">번호</th>
                    <th class="">아이디</th>
                    <th class="">이름</th>
                    <th class="">성별</th>
                    <th class="">생년월일</th>
                    <th class="">전화번호</th>
                    <th class="">이메일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${userList}" varStatus="status">
                    <tr>
                        <th scope="row">${status.count}</th>
                        <td id="${user.id}" class="idValue">${user.id}</td>
                        <td>${user.user_name}</td>
                        <td>${user.gender}</td>
                        <td>${user.birth}</td>
                        <td>${user.tel}</td>
                        <td>${user.email}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <nav aria-label="Page navigation example" id="page">
    </nav>
    <br><br>
</div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>