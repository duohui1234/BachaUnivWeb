<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="py-5">
<!-- Section: Team v.3 -->
<section class="container">

	<h4 class="mb-4 text-center">Our alumni</h4>

	<!-- Section heading -->

	<!-- Grid row-->
	<div class="row text-center text-md-left mx-auto">
		<c:forEach var="alumnus" items="${list}">
			<!-- Grid column -->
			<div
				class="col-lg-5 col-md-12 mb-5 d-md-flex border border-light mx-auto "
				style="padding: 20px !important">
				<div class="col-6 mb-md-0 mb-4 mx-auto">
					<img
						src="${root}student/avatar?studentNumber=${alumnus.studentNumber}"
						class="rounded z-depth-1 avatar-midium">
				</div>
				
				<div class="col-6 mx-auto">

					<h4 class="font-weight-bold mb-3">
						 ${alumnus.studentName}
					</h4>
					<h6 class="font-weight-bold grey-text mb-3">${alumnus.major}/
						${alumnus.studentNumber}</h6>

					<p>${alumnus.introduction}</p>

					<div class="contact_icon">

						<!--email -->
						<a class="p-2 fa-sm"
							href="contact_form?email=${alumnus.email}"> 
                        <i class="fa fa-envelope"></i>
						</a>

						<!-- Facebook-->
						<a class="p-2 fa-lg" >
						 <i class="fa fa-facebook "> </i>
						</a>
						<!-- Twitter -->
						<a class="p-2 fa-lg" > 
						 <i class="fa fa-twitter">
						</i>
						</a>
						<!--instagram -->
						<a class="p-2 fa-lg">
						 <i class="fa fa-instagram"></i>
						</a>

					</div>



				</div>
			</div>
			<!-- Grid column -->
		</c:forEach>
	</div>

</section>
<!-- Section: Team v.3 -->

<!-- page block -->
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
<iot:pagination pagination="${pagination}" link="list"></iot:pagination>
</div>


