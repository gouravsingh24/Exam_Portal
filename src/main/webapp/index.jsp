<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GRE - Home</title>

<%@include file="components/common_css_js.jsp" %>
<style>
.carousel .slide .carousel-fade{
	display : fixed !important;
}
</style>
</head>
<body>

<%@include file="components/navbar.jsp" %>



<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">

  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="image/exam2.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="image/exam1.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="image/exam3.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


</body>
</html>