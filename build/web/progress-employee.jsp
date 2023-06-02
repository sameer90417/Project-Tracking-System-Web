<%@page import="project.tracking.system.database.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="project.tracking.system.dao.Projectdao"%>
<%@page import="project.tracking.system.daoimpl.ProjectDaoImpl"%>
<%@page import="project.tracking.system.entity.Project"%>
<%@page import="project.tracking.system.entity.IdName"%>
<%@page import="project.tracking.system.dao.ProjectTrackerdao"%>
<%@page import="project.tracking.system.daoimpl.ProjectTrackerDaoImpl"%>
<%@page import="project.tracking.system.entity.ProjectTracker"%>
<%@page import="project.tracking.system.database.*"%>
<%@page import="project.tracking.system.dao.Employeedao"%>
<%@page import="project.tracking.system.daoimpl.EmployeeDaoImpl"%>
<%@page import="project.tracking.system.entity.Employee"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Project Tracker</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/typicons/typicons.css">
  <link rel="stylesheet" href="vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="face8.png" />
  
  <style>
      
      .ankit:hover{
          background-color: white;
          color:blue;
      }
      
      
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1000000; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */



}


.modal111 {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1000000; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */

}


/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
   
  </style>
</head>
<body>
  
    <%
        int pid = Integer.parseInt(request.getParameter("pid"));
        int eid = Integer.parseInt(request.getParameter("eid"));
        Projectdao dao = new ProjectDaoImpl();
        Project project = dao.selectProject(pid);
        
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        
        ProjectTracker tracker = new ProjectTracker();
        ProjectTrackerdao trackerdao = new ProjectTrackerDaoImpl();
        tracker = trackerdao.getTrackingDetails(pid);
    
        Employeedao empdao = new EmployeeDaoImpl();
        Employee emp = empdao.selectEmployee(eid);
        
        %>

  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
        <div class="me-3">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
            <span class="icon-menu"></span>
          </button>
        </div>
        <div>
          <a class="navbar-brand brand-logo" href="home.html">
           <h5>Project Tracker</h5>
          </a>
          <a class="navbar-brand brand-logo-mini" href="home.html">
            <img src="images/logo-mini.svg" alt="logo" />
          </a>
        </div>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-top"> 
        <ul class="navbar-nav">
          <li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
            <h1 class="welcome-text">View Progress of <span class="text-black fw-bold"><%=project.getName()%></span></h1>
           

            
          </li>
          
        </ul>
        <ul class="navbar-nav ms-auto">
          
          <button type="button" class="btn btn-primary btn-rounded btn-fw ankit"  id="myBtn3">Today's Task </button>
          <li class="nav-item">
            <form class="search-form" action="#">
              <i class="icon-search"></i>
              <input type="search" class="form-control" placeholder="Search Here" title="Search here">
            </form>
          </li>
          
      
          <li class="nav-item dropdown d-none d-lg-block user-dropdown">
            <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
              <img class="img-xs rounded-circle" src="images/faces/face8.png" alt="Profile image"> </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
              <div class="dropdown-header text-center">
                <img class="img-md rounded-circle" src="images/faces/face8.png" alt="Profile image" >
                <p class="mb-1 mt-3 font-weight-semibold"><%=emp.getName()%></p>
                <p class="fw-light text-muted mb-0"><%=emp.getProfile()%></p>
              </div>
             
              
              
              <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-help-circle-outline text-primary me-2"></i> FAQ</a>
              <a href="index.jsp" class="dropdown-item"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Sign Out</a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-bs-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
       

                  <div id="myModal3" class="modal">

                    <!-- Modal content -->
                    <div class="modal-content">
                      
                      <form action="TodayTask" class="forms-sample">
                           <a style="text-decoration: none; font-size: 50px" href="" class="close">&times;</a>
                        <h5>Task</h5>
                        <div class="form-group">
                          <label for="exampleInputUsername1">How many Task completed assigned for your profile</label>
                          <input name="numbertask" type="number" class="form-control" id="exampleInputUsername1" placeholder="Enter here...">
                          <input name="eid" value="<%=eid%>" type="number" class="form-control" id="exampleInputUsername1" placeholder="Employee id" hidden="true">
                          <input name="pid" value="<%=pid%>" type="number" class="form-control" id="exampleInputUsername1" placeholder="Employee id" hidden="true">
                        </div>
                        
                        
                       
                       
                        
                        <button type="submit" class="btn btn-primary me-2">Done</button>
                        
                      </form>
                    </div>
                  
                  </div>
                  
                  <script>
                  // Get the modal
                  var modal3 = document.getElementById("myModal3");
                  
                  // Get the button that opens the modal
                  var btn3 = document.getElementById("myBtn3");
                  
                  // Get the <span> element that closes the modal
                  var span3 = document.getElementsByClassName("close")[0];
                  
                  // When the user clicks the button, open the modal 
                  btn3.onclick = function() {
                    modal3.style.display = "block";
                  }
                  
                  // When the user clicks on <span> (x), close the modal
                  span3.onclick = function() {
                    modal3.style.display = "none";
                  }
                  
                  // When the user clicks anywhere outside of the modal, close it
                  window.onclick = function(event) {
                    if (event.target == modal) {
                      modal3.style.display = "none";
                    }
                  }





                  
                  
                  </script>

    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_settings-panel.html -->
      
      
      <!-- partial -->
      <!-- partial:../../partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
                    
      
          <li class="nav-item">
            <a class="nav-link" href="javascript:window.history.back();">
              <i class="menu-icon mdi mdi-file-document"></i>
              <span class="menu-title">My Projects</span>
            </a>
          </li>
          
          
        </ul>
      </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-sm-12">
              <div class="home-tab">
                
                <div class="tab-content tab-content-basic">
                  <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview"> 
                    <div class="row" style="margin-top: -25px;">
                      <div class="col-sm-12">
                        <div class="statistics-details d-flex align-items-center justify-content-between">
                          
                          <div>
                            <h6 style="font-weight: 600; font-size: 15px; color: blue;">Assign Date</h6>
                            <h4 class="rate-percentage" style="font-weight: 600; font-size: 20px;"><%=project.getAssignDate()%></h4>
                            
                          </div>
                          <div>
                            <h6  style="font-weight: 600; font-size: 15px; color: green;" >Current Date </h6>
                            <h4 class="rate-percentage" style="font-weight: 600; font-size: 20px;"><%=date%></h4>
                            
                          </div>
                          <div>
                            <h6  style="font-weight: 600; font-size: 15px; color: red;">End Date</h6>
                            <h4 class="rate-percentage" style="font-weight: 600; font-size: 20px;"><%=project.getEndDate()%></h4>
                            
                          </div>
                          <div>
                           
                          </div>
                          <div>
                          
                            
                          </div>
                          
                        </div>
                      </div>
                    </div> 
                    <div class="row">
                      <div class="col-lg-8 d-flex flex-column">
                        <div class="row flex-grow">
                          <div class="col-12 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body" >
                                <div class="d-sm-flex justify-content-between align-items-start">
                                  <div>
                                    <h4 class="card-title card-title-dash">Task Overview</h4>
                                    <p class="card-subtitle card-subtitle-dash">Here is Details About Total Project Team and Task: </p></div>
                                    <div class="badge badge-opacity-success" style="font-size: 15px; font-weight: 600;">Designers: <span style="color: rgb(255, 0, 0);  "><%=project.getNumberOfDesigner()%></span></div>
                                    <div class="badge badge-opacity-success" style="font-size: 15px; font-weight: 600;">Coders: <span style="color: rgb(255, 0, 0);  "><%=project.getNumberOfCoder()%></span></div>
                                    <div class="badge badge-opacity-success" style="font-size: 15px; font-weight: 600;">Testers: <span style="color: rgb(255, 0, 0);  "><%=project.getNumberOfTester()%></span></div>
                                  
                                  
                                
                                </div>
                                
                                
                                    <div class="table-responsive">
                                        <table class="table">
                                          <thead>
                                            <tr>
                                              <th></th>
                                              <th>Designing Task</th>
                                              <th>Coding Task</th>
                                              <th>Testing Task</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            <tr>
                                                <td><b>Total</b></td>
                                              <td><%=tracker.getDesignersTask()%></td>
                                              <td><%=tracker.getCoderesTask()%></td>
                                              <td><%=tracker.getTestersTask()%></td>
                                            </tr>
                                            <tr>
                                                <td><b>Completed</b></td>
                                              <td><%=tracker.getCompletedDesignersTask()%></td>
                                              <td><%=tracker.getCompletedCodersTask()%></td>
                                              <td><%=tracker.getCompletedTestersTask()%></td>
                                            </tr>
                                            
                                           
                                            
                                          </tbody>
                                        </table>
                                      </div>
                                
                              </div>
                            </div>
                          </div>
                        </div>
                      
                        <div class="row flex-grow">
                          <div class="col-md-6 col-lg-6 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body card-rounded">
                                <h4 class="card-title  card-title-dash">Designers Details :</h4>
                              
                                    <div class="table-responsive">
                                        <table class="table">
                                          <thead>
                                            <tr>
                                              
                                              <th>Designer ID</th>
                                              <th>Designer Name</th>
                                            
                                            </tr>
                                          </thead>
                                          <tbody>
                                              
                                              <%
                                                  ExtractProjectIdNameEmp extractProjectIdNameEmp = new ExtractProjectIdNameEmp();
                                                  List<IdName> list = extractProjectIdNameEmp.getAllIdName(pid, "designer");
                                                          
                                                  for(IdName idname : list){
                                              %>
                                              
                                            <tr>
                                            
                                              
                                              <td><%=idname.getId()%></td>
                                              <td><%=idname.getName()%></td>
                                            </tr>
                                           
                                            <%
                                                }
                                            %>
                                          </tbody>
                                        </table>
                                      </div>
                                
                                
                                
                                
                                
                              </div>
                            </div>
                          </div>
                          <div class="col-md-6 col-lg-6 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body">
                                <div >
                                  <h4 class="card-title card-title-dash">Coders Details :</h4>
                                 
                                </div>
                                <div class="table-responsive">
                                        <table class="table">
                                          <thead>
                                            <tr>
                                              
                                              <th>Coder ID</th>
                                              <th>Coder Name</th>
                                            
                                            </tr>
                                          </thead>
                                          <tbody>
                                            
                                            <%
                                                  ExtractProjectIdNameEmp extractProjectIdNameEmp2 = new ExtractProjectIdNameEmp();
                                                  List<IdName> list2 = extractProjectIdNameEmp2.getAllIdName(pid, "coder");
                                                          
                                                  for(IdName idname : list2){
                                              %>
                                              
                                            <tr>
                                            
                                              
                                              <td><%=idname.getId()%></td>
                                              <td><%=idname.getName()%></td>
                                            </tr>
                                           
                                            <%
                                                }
                                            %>
                                           
                                            
                                          </tbody>
                                        </table>
                                      </div>
                                
                                
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4 d-flex flex-column">
                        <div class="row flex-grow">
                          <div class="col-12 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body" style="height: 260px;">
                                <div class="row">
                                  <div class="col-lg-12">
                                    <div class="d-flex justify-content-between align-items-center">
                                      <h4 class="card-title card-title-dash">Announcement</h4>
                                      
                                    </div>
                                    <div class="list-wrapper">
                                       

                                        <textarea name=""
                                                  rows="8" cols="30" style="border-radius: 20px; border-color: rgba(0, 0, 0, 0.147); margin-top: 5px;">
                                        
                                        </textarea>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      
                        <div class="row flex-grow" style="margin-top: 10px;">
                          <div class="col-12 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body" >
                                <div class="row">
                                  <div class="col-lg-12">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                      <div>
                                        <h4 class="card-title card-title-dash">Testers Details :</h4>
                                        <div class="table-responsive">
                                            <table class="table">
                                              <thead>
                                                <tr>
                                                  
                                                  <th>Tester ID</th>
                                                  <th>Tester Name</th>
                                                
                                                </tr>
                                              </thead>
                                              <tbody>
                                                <%
                                                  ExtractProjectIdNameEmp extractProjectIdNameEmp3 = new ExtractProjectIdNameEmp();
                                                  List<IdName> list3 = extractProjectIdNameEmp3.getAllIdName(pid, "tester");
                                                          
                                                  for(IdName idname : list3){
                                              %>
                                              
                                            <tr>
                                            
                                              
                                              <td><%=idname.getId()%></td>
                                              <td><%=idname.getName()%></td>
                                            </tr>
                                           
                                            <%
                                                }
                                            %>
                                               
                                                
                                              </tbody>
                                            </table>
                                          </div>

                                      </div>
                                    </div>
                                    
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>





        </div>

        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Project Tracker  <a href="#" target="_blank">BY CSE 6th Sem.</a> from S60</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Copyright © 2023. All rights reserved.</span>
            </div>
          </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="vendors/chart.js/Chart.min.js"></script>
  <script src="vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <script src="vendors/progressbar.js/progressbar.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="js/jquery.cookie.js" type="text/javascript"></script>
  <script src="js/dashboard.js"></script>
  <script src="js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
</body>

</html>

