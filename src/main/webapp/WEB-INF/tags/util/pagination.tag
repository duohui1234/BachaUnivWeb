<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="pagination" required="true" type="com.worldfriends.bacha.model.Pagination"%>
<%@ attribute name="link" required="true" type="String"%>
<%@ attribute name="params" required="false" type="String"%>

 
<!-- mdb style -->
<script>

$(function(){
   if(${pagination.page} == 1){
       $('#first').addClass('disabled');
   }else{
      $('#first').removeClass('disabled');
   }
   if(${pagination.page} == ${pagination.totalPage}){
       $('#end').addClass('disabled');
   }else{
      $('#end').removeClass('disabled');
   }
   
   if(${pagination.currentBlock} == 1){ 
       $('#firstArrow').addClass('disabled');
   }else{
      $('#firstArrow').removeClass('disabled');
   }
   
   if(${pagination.currentBlock} == ${pagination.totalBlock}){
       $('#endArrow').addClass('disabled');
   }else{
      $('#endArrow').removeClass('disabled');
   }

});
</script>

<!--Pagination -->
<nav aria-label="pagination example">
    <ul class="pagination pagination-circle pg-red mb-0 justify-content-center mt-5">

        <!--First-->
        <li id="first" class="page-item">
           <a class="page-link" href="${link}?page=1${params}">First</a>
        </li>

        <!--Arrow left-->
        <li id="firstArrow" class="page-item">
            <a class="page-link" aria-label="Previous" href="${link}?page=${pagination.prevBlockPage}${params}">
                <span aria-hidden="true">&laquo;</span>
                <span class="sr-only">Previous</span>
            </a>
        </li>
   
      
       <!--Numbers-->
      <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}"
         var="i">
         <c:if test="${i == pagination.page}">
            <li class="page-item active">
               <a href="${link}?page=${i}${params}" class="page-link">${i}</a>
            </li>
          </c:if>
         <c:if test="${i != pagination.page}">
            <li class="page-item">
               <a href="${link}?page=${i}${params}" class="page-link">${i}</a>
            </li>
         </c:if>
      </c:forEach>
   
        <!--Arrow right-->
        <li id="endArrow" class="page-item">
            <a class="page-link" aria-label="Next" href="${link}?page=${pagination.nextBlockPage}${params}">
                <span aria-hidden="true">&raquo;</span>
                <span class="sr-only">Next</span>
            </a>
        </li>

        <!--Last-->
        <li id="end" class="page-item">
           <a class="page-link" href="${link}?page=${pagination.totalPage}${params}">Last</a>
        </li>

    </ul>
</nav>