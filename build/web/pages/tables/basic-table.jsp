<%@page import="project.tracking.system.database.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Star Admin2 </title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../../vendors/feather/feather.css">
  <link rel="stylesheet" href="../../vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="../../vendors/typicons/typicons.css">
  <link rel="stylesheet" href="../../vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">

  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/favicon.png" />
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
  <script  src="functiontab.js"></script>
  <style>table th, .table td {
    vertical-align: middle;
    line-height: 1;
    white-space: nowrap;}



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
          <a class="navbar-brand brand-logo" href="../../index.html">
           <h5>Project Tracker</h5>
          </a>
          <a class="navbar-brand brand-logo-mini" href="../../index.html">
            <img src="../../images/logo-mini.svg" alt="logo" />
          </a>
        </div>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-top"> 
        
        <ul class="navbar-nav ms-auto">
          
          
          <li class="nav-item">
            <form class="search-form" action="#">
              <i class="icon-search"></i>
              <input type="search" class="form-control" placeholder="Search Here" title="Search here">
            </form>
          </li>
          
          </li>
          <li class="nav-item dropdown"> 
            <a class="nav-link count-indicator" id="countDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="icon-bell"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="countDropdown">
              <a class="dropdown-item py-3">
                <p class="mb-0 font-weight-medium float-left">You have 7 unread mails </p>
                <span class="badge badge-pill badge-primary float-right">View all</span>
              </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <img src="../../images/faces/face10.jpg" alt="image" class="img-sm profile-pic">
                </div>
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">Marian Garner </p>
                  <p class="fw-light small-text mb-0"> The meeting is cancelled </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <img src="../../images/faces/face12.jpg" alt="image" class="img-sm profile-pic">
                </div>
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">David Grey </p>
                  <p class="fw-light small-text mb-0"> The meeting is cancelled </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <img src="../../images/faces/face1.jpg" alt="image" class="img-sm profile-pic">
                </div>
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">Travis Jenkins </p>
                  <p class="fw-light small-text mb-0"> The meeting is cancelled </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item dropdown d-none d-lg-block user-dropdown">
            <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
              <img class="img-xs rounded-circle" src="../../images/faces/face8.png" alt="Profile image"> </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
              <div class="dropdown-header text-center">
                <img class="img-md rounded-circle" src="../../images/faces/face8.png" alt="Profile image" >
                <p class="mb-1 mt-3 font-weight-semibold">Admin</p>
                <p class="fw-light text-muted mb-0">Admin@gmail.com</p>
              </div>
             
              
              
              <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-help-circle-outline text-primary me-2"></i> FAQ</a>
              <a href="../../index.jsp" class="dropdown-item"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Sign Out</a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-bs-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_settings-panel.html -->
      
      
      <!-- partial -->
      <!-- partial:../../partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="../../home.html">
              <i class="mdi mdi-grid-large menu-icon"></i>
              <span class="menu-title">Home</span>
            </a>
          </li>
          
          <li class="nav-item nav-category">Employee Area</li> 
          <li class="nav-item">
            <a class="nav-link" href="../../pages/tables/basic-table.jsp">
              <i class="menu-icon mdi mdi-account-circle-outline"></i>
              <span class="menu-title">Employee</span>
            </a>
          </li>
          <li class="nav-item nav-category">Project Area</li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="menu-icon mdi mdi-file-document"></i>
              <span class="menu-title">Project </span>
              <i class="menu-arrow"></i> 
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../../pages/tables/project-Table-admin.jsp">projects</a></li>
                
               
              </ul>
            </div>
          </li>
         
          
        </ul>
      </nav>
     
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-description">
                    <button type="button" class="btn btn-primary btn-rounded btn-fw" id="myBtn111">Add Employee</button>



                    
                 



                    <button type="button" class="btn btn-danger btn-rounded btn-fw" id="myBtn3">Delete  Employee</button>
                    <button type="button" class="btn btn-dark btn-rounded btn-fw" id="myBtn44">Update Employee</button>
                  </p>






                  <!--Add Employee Form-->




                  <div id="myModal111" class="modal">
                    
                    <!-- Modal content -->
                   <div class="modal-content">

                    <form action="../../AddEmployeeServlet" class="forms-sample">
                        <a style="text-decoration: none; font-size: 50px" href="./basic-table.jsp" class="close">&times;</a>
        <h5>Enter Employee Details</h5>
       
        <div class="form-group">
          <table class="table table-striped">
            <thead>
              <tr>
                
                <th>
                  Name
                </th>
                
                <th>
                  Profile
                </th>
               
              </tr>
            </thead>
            <tbody>
              <tr>
                
                <td>
                  <input name="emp_name" type="Text" class="form-control" id="empname" placeholder="Employee Name">
                </td>
                
                <td>
                  <input name="emp_profile" type="Text" class="form-control" id="empprofile" placeholder="Employee Profile">
                </td>
                
              </tr>
              </tbody>
              </table>
          
        </div>
        <div class="form-group">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>
                  Email address
                </th>
               
                
             
               
              </tr>
            </thead>
            <tbody>
              <tr>
                <td >
                  <input name="emp_email" type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                </td>
               
                
                
                
              </tr>
              </tbody>
              </table>
          
          
        </div>
        <div class="form-group">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>
                  Password
                </th>
                <th>
                  Confirm Password
                </th>
                
             
               
              </tr>
            </thead>
            <tbody>
              <tr>
                <td >
                  <input name="emp_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </td>
                <td>
                  <input name="emp_cpassword" type="password" class="form-control" id="exampleInputConfirmPassword1" placeholder="Password">
                </td>
                
                
                
              </tr>
              </tbody>
              </table>
          
        </div>
        
        
       
        
        <button type="submit" class="btn btn-primary me-2">Add Now</button>
      </form>
    </div>
  
  </div>




  <script>
    // Get the modal
    var modal111 = document.getElementById("myModal111");
    
    // Get the button that opens the modal
    var btn111 = document.getElementById("myBtn111");
    
    // Get the <span> element that closes the modal
    var span111 = document.getElementsByClassName("close")[0];
    
    // When the user clicks the button, open the modal 
    btn111.onclick = function() {
      modal111.style.display = "block";
    }
    
    // When the user clicks on <span> (x), close the modal
    span111.onclick = function() {
      modal111.style.display = "none";
    }
    
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal111.style.display = "none";
      }
    }





    
    
    </script>
























                  <!-- Update Form-->
                     

                  <div id="myModal4" class="modal">

                    <!-- Modal content -->
                    <div class="modal-content">
                      
                        <form action="../../UpdateEmployeeServlet" class="forms-sample">
                             <a style="text-decoration: none; font-size: 50px" href="./basic-table.jsp" class="close">&times;</a>
                        <h5>Update Employee Details</h5>
                        <div class="form-group">
                          <label for="exampleInputUsername1">Employee ID</label>
                          <input name="emp_id" type="number" class="form-control" id="exampleInputUsername1" placeholder="Employee id">
                        </div>
                        <div class="form-group">
                          <label for="employeename">Name</label>
                          <input name="emp_name" type="Text" class="form-control" id="empname" placeholder="Employee Name">
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">Email address</label>
                          <input name="emp_email" type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                        </div>
                        <div class="form-group">
                          <label for="EmployeeProfile">Profile</label>
                          <input name="emp_profile" type="Text" class="form-control" id="empprofile" placeholder="Employee Profile">
                        </div>
                       
                        
                        <button type="submit" class="btn btn-primary me-2">Submit</button>
                       
                      </form>
                    </div>
                  
                  </div>
                  
                  <script>
                  // Get the modal
                  var modal = document.getElementById("myModal4");
                  
                  // Get the button that opens the modal
                  var btn = document.getElementById("myBtn44");
                  
                  // Get the <span> element that closes the modal
                  var span = document.getElementsByClassName("close")[0];
                  
                  // When the user clicks the button, open the modal 
                  btn.onclick = function() {
                    modal.style.display = "block";
                  }
                  
                  // When the user clicks on <span> (x), close the modal
                  span.onclick = function() {
                    modal.style.display = "none";
                  }
                  
                  // When the user clicks anywhere outside of the modal, close it
                  window.onclick = function(event) {
                    if (event.target == modal) {
                      modal.style.display = "none";
                    }
                  }





                  
                  
                  </script>









                  <!-- Delete Form-->
                     

                  <div id="myModal3" class="modal">

                    <!-- Modal content -->
                    <div class="modal-content">
                      
                      <form action="../../DeleteServlet" class="forms-sample">
                           <a style="text-decoration: none; font-size: 50px" href="./basic-table.jsp" class="close">&times;</a>
                        <h5>Delete Employee </h5>
                        <div class="form-group">
                          <label for="exampleInputUsername1">Employee ID</label>
                          <input name="eid" type="number" class="form-control" id="exampleInputUsername1" placeholder="Employee id">
                        </div>
                        
                        
                       
                       
                        
                        <button type="submit" class="btn btn-primary me-2">Delete</button>
                        
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

















                   

                










                  
                 













                  <h4 class="card-title">Employee Details</h4>
                
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>
                            Emp ID
                          </th>
                          <th>
                            Name
                          </th>
                          
                          <th>
                             Email
                          </th>
                          <th>
                            Profile
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                          
                          <%
                              Connection con = ConnectionProvider.getConncection();
                              Statement stmt = con.createStatement();
                              ResultSet set = stmt.executeQuery("SELECT eid,emp_name,email,profile FROM pts_employee e inner join pts_credential c on e.cid = c.cid;");
                              
                              while(set.next()){
                              %>
                          
                        <tr>
                          <td >
                              <%= set.getInt("eid") %>
                          </td>
                          <td>
                            <%= set.getString("emp_name") %>
                          </td>
                          
                          <td>
                            <%= set.getString("email") %>
                          </td>
                          <td>
                            <%= set.getString("profile") %>
                          </td>
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
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
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
  <script src="../../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="../../vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <script src="../../js/settings.js"></script>
  <script src="../../js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
 
</body>

</html>
