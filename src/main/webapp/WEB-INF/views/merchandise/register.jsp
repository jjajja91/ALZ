<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Merchandise Register</title>
</head>
<body>
<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">상품 등록</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading"></div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/merchandise/register" method="post">
          <div class="form-group">
            <label>상품명</label> <input class="form-control" name='name'>
          </div>

          <div class="form-group">
            <label>상품 유형</label>
			<label><input type="radio" name="codeType" value="클래스"> 클래스</label>
      		<label><input type="radio" name="codeType" value="준비물"> 준비물</label>
          </div>
          
          <div class="form-group">
            <label>상품 설명</label>
            <textarea class="form-control" rows="3" name='description'></textarea>
          </div>

          <div class="form-group">
            <label>마감일</label> 
            <input  name='closedAt' />
          </div>
          
          <div class="form-group">
            <label>상품금액</label> <input class="form-control" name='originPrice'>
          </div>
          
          <div class="form-group">
            <label>할인금액</label> <input class="form-control" name='salePrice'>
          </div>
          
          <div class="form-group">
            <label>할인률</label> <input class="form-control" name='discountRate'>
          </div>
          
          <div class="form-group">
            <label>할인 마감일</label> 
            <input  name='discountDeadline' />
          </div>
          
          <div class="form-group">
            <label>진열 상태</label>
            <label><input type="radio" name="displayState" value="1"> 진열</label>
      		<label><input type="radio" name="displayState" value="0"> 미진열</label>
          </div>
          
          <div class="form-group">
            <label>상품 대상 식별자</label> <input class="form-control" name='refId'>
          </div>
          
          <div class="form-group">
            <label>상품 식별자</label> <input class="form-control" name='merchandiseId'>
          </div>
          
          
          <button type="submit" class="btn btn-default">Submit
            Button</button>
          <button type="reset" class="btn btn-default">Reset Button</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
</body>
</html>