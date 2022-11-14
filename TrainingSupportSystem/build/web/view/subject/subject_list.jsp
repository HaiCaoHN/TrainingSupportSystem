<%-- 
    Document   : subject_list
    Created on : Sep 21, 2022, 10:53:52 PM
    Author     : HAICAO
--%>
<a href="nbproject/project.xml"></a>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>TSS - Training Support System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="assets/images/logo.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <link href="assets/css/newcss.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/sortcolumn.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/toggle_switch.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="assets/css/custom_attend.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/modal.css" rel="stylesheet" type="text/css"/>
        <!-- JS -->
        <script src="assets/js/confirm_subject.js" type="text/javascript"></script>
        <script src="assets/js/pagger_subject.js" type="text/javascript"></script>
    </head>

    <body>

        <div id="demo-modal" class="modal">
            <div class="modal__content" id="model_content">
                <h2>Confirm</h2>

                <p>
                    Do you want to change subject status ? 
                </p>

                <div class="modal__footer">
                    <button type="button" onclick="modal_close()" class="button-10">Cancel</button>
                    <button type="button" onclick="modal_change()" class="button-10">Confirm</button>
                </div>

                <a href="#" class="modal__close">&times;</a>
            </div>
        </div>

        <!-- Loader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->

        <div class="page-wrapper doctris-theme toggled">

            <!-- sidebar-wrapper  -->
            <jsp:include page="../navbar.jsp"/>
            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="assets/images/logo-icon.png" height="30" class="small" alt="">
                                <span class="big">
                                    <img src="assets/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                                    <img src="assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                                </span>
                            </a>
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>
                            <!-- OLD SEARCH BAR -->

                            <!-- OLD SEARCH BAR -->
                        </div>

                        <!-- USER PROFILE -->
                        <ul class="list-unstyled mb-0">
                            <jsp:include page="../profilelogo.jsp"/>
                        </ul>
                        <!-- USER PROFILE -->
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0"><a href="subject_list">Subject List</a></h5>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html">TSS</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Subjects</li>
                                </ul>
                            </nav>
                        </div>

                        <!-- SEARCH BAR -->
                        <form action="subject" role="search" method="get" id="searchform" class="searchform">
                            <input type="hidden" name="action" value="view"/>
                            <br/>
                            <!-- FILTER BAR -->
                            <select style="margin-right: 1px;margin-left: -3px;" class="s_filter select-1" name="filter_manager">
                                <option value="-1">All Manager</option>
                                <c:forEach items="${managers}" var="m">
                                    <option <c:if test="${m.user_id == f_manager}">selected=""</c:if> 
                                                                                   value="${m.user_id}">${m.full_name}</option>
                                </c:forEach>
                            </select>
                            <select style="margin-right: 1px;" class="s_filter select-1" name="filter_expert">
                                <option value="-1">All Expert</option>
                                <c:forEach items="${experts}" var="e">
                                    <option <c:if test="${e.user_id == f_expert}">selected=""</c:if>  
                                                                                  value="${e.user_id}">${e.full_name}</option>
                                </c:forEach>
                            </select>

                            <select style="margin-right: 13px;" class="s_filter select-1" name="filter_status">
                                <option value="-1">All Status</option>
                                <option <c:if test="${f_status eq 1}">selected=""</c:if>  
                                                                      value="1">Active</option>
                                    <option <c:if test="${f_status eq 0}">selected=""</c:if>  
                                                                          value="0">Inactive</option>
                                </select>                                
                                <input type="text" value="${txtsearch}" style="height: 33px ;width: 250px;display: inline-block;border-radius: 5px;border: 1px solid;margin-right: 30px;" name="txtsearch" id="s" placeholder="Search Keywords...">                                             
                            <button type="submit" class="button-10">Search</button> 
                            <c:if test="${sessionScope.role == 11}">
                                <button class="button-10" onclick="location.href = 'subject?action=add'" type="button">ADD</button>  
                            </c:if>


                            <!-- FILTER BAR -->
                        </form>   
                        <!-- SEARCH BAR -->
                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive shadow rounded">
                                    <table class="table table-center bg-white mb-0 table-sortable">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px;">Id</th>
                                                <th class="border-bottom p-3" style="min-width: 180px;">Name</th>
                                                <th class="border-bottom p-3">Code</th>
                                                <th class="border-bottom p-3">Manager</th>
                                                <th class="border-bottom p-3">Expert</th>
                                                <th class="border-bottom p-3">Status</th>
                                                    <c:if test="${sessionScope.role == 11}">
                                                    <th class="border-bottom p-3" style="min-width: 100px;">Action</th>
                                                    </c:if>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${subs}" var="s">
                                                <tr>
                                                    <td class="p-3 form-label">${s.subject_id}</td>
                                                    <td class="py-3 form-label">
                                                        <a href="#" class="text-dark">
                                                            <div class="d-flex align-items-center">
                                                                <img src="images/${s.img_url}" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                <span class="ms-2 form-label">${s.subject_name}</span>
                                                            </div>
                                                        </a>
                                                    </td>
                                                    <td class="p-3 form-label">${s.subject_code}</td>
                                                    <td class="p-3 form-label">${s.manager.full_name}</td>
                                                    <td class="p-3 form-label">${s.expert.full_name}</td>

                                            <form id="status_form_${s.subject_id}" action="subject">
                                                <input type="hidden" name="action" value="view">
                                                <input name="page" type="hidden" value="${page_index}">
                                                <input name="txtsearch" type="hidden" value="${txtsearch}">



                                                <input type="hidden" name="change_status" value="${s.subject_id}_${s.status}"/>
                                                <c:if test="${s.status eq 1}">
                                                    <td class="p-3">
                                                        <span class="badge bg-soft-success">Active</span>
                                                        <label 
                                                            <c:if test="${sessionScope.role > 11}">style="display: none;"</c:if>
                                                                class="switch-wrap">
                                                                <input type="checkbox" class="open-model" id="status_check_${s.subject_id}" checked onChange="modal_open(${s.subject_id})"/>

                                                            <div class="switch"></div>
                                                        </label>    
                                                    </td>
                                                </c:if>

                                                <c:if test="${s.status eq 0}">
                                                    <td class="p-3">
                                                        <span class="badge bg-soft-success">Inactive</span>
                                                        <label 
                                                            <c:if test="${sessionScope.role > 11}">style="display: none;"</c:if>
                                                                class="switch-wrap">
                                                                <input type="checkbox" id="status_check_${s.subject_id}" onChange="modal_open(${s.subject_id})"/>
                                                            <div class="switch"></div>
                                                        </label>
                                                    </td>
                                                </c:if>
                                            </form>
                                            <td class="text-end p-3">
                                                <a 
                                                    <c:if test="${sessionScope.role > 11}">style="display:none;"</c:if>
                                                    href="subject?action=edit&id=${s.subject_id}" class="btn btn-icon btn-pills btn-soft-success" ><i class="uil uil-pen"></i></a>
                                            </td>
                                            </tr> 
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div><!--end row-->



                        <div class="row text-center">
                            <!-- PAGINATION START -->
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
                                    <ul id="only-pagger" class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                        <script>
                                            render("only-pagger",${page_index},${total_page}, 2, "${txtsearch}",${filter_manager},${filter_expert},${filter_status});
                                        </script>
                                    </ul>
                                </div>
                            </div><!--end col-->
                            <!-- PAGINATION END -->
                        </div><!--end row-->

                    </div>
                </div><!--end container-->

                <!-- Footer Start -->
                <jsp:include page="../footer.jsp"/>
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->


        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>
        <script src="assets/js/sortcolumn.js" type="text/javascript"></script>

    </body>




</html>
