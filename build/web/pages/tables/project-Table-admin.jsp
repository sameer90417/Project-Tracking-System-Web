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
  <style>table th, .table td {
    vertical-align: middle;
    line-height: 1;
    white-space: nowrap;
   
   
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

.card .card-body {
    padding: 1rem;
    padding-right: 200px;
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
          <a class="navbar-brand brand-logo" href="../../home.html">
           <h5>Project Tracker</h5>
          </a>
          <a class="navbar-brand brand-logo-mini" href="../../home.html">
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
                <img class="img-md rounded-circle" src="../../images/faces/face8.png" alt="Profile image">
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
                <li class="nav-item"> <a class="nav-link" href="#" id="myBtn55" >Assign Employee</a></li>
                <li class="nav-item"> <a class="nav-link" href="#" id="myBtn66"  >Assign Task</a></li>
                <li class="nav-item"> <a class="nav-link" href="#" id="myBtn77">Project Progress</a></li>
              </ul>
            </div>
          </li>
         
          
        </ul>
      </nav>
     
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-description">
                   <!--Add Project Form-->
                   <button  class="btn btn-primary btn-rounded btn-fw" id="myBtn111"  >Add Project </button>

                    <button type="button" class="btn btn-danger btn-rounded btn-fw" id="myBtn3">Delete Project</button>
                    <button type="button" class="btn btn-dark btn-rounded btn-fw" id="myBtn44">Update Project</button>
                   </p>












                   <!--Add Employee Form-->




                  <div id="myModal111" class="modal">

                    <!-- Modal content -->
                   <div class="modal-content">
      
                    <form  action="../../AddProjectServlet" class="forms-sample">
                         <a style="text-decoration: none; font-size: 50px" href="./project-Table-admin.jsp" class="close">&times;</a>
        <h5>Enter Project Details</h5>
        <div class="form-group">
          <label for="employeename">Name</label>
          <input name="project_name" type="Text" class="form-control" id="pname" placeholder="Enter Project Name">
        </div>
        <div class="form-group">
          <label for="employeename">Description</label>
          <input name="project_description" type="Text" class="form-control" id="pDiscription" placeholder="Enter Project Description">
        </div>
        
        <div class="form-group">
         
          
          <table class="table table-striped">
            <thead>
              <tr>
                <th>
                 No. of Designers
                </th>
                <th>
                  No. of Coders
                </th>
                
                <th>
                  No. of Testers
                </th>
               
              </tr>
            </thead>
            <tbody>
              <tr>
                <td >
                  <input name="designer" type="number" class="form-control" id="Designerno" placeholder="Designers">
                </td>
                <td>
                    <input name="coder" type="number" class="form-control" id="Codersno" placeholder="Coders">
                </td>
                
                <td>
                    <input name="tester" type="number" class="form-control" id="Testersno" placeholder="Testers">
                </td>
                
              </tr>
              </tbody>
              </table>
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>
                      Assign Date
                    </th>
                    <th>
                      End Date
                    </th>
                    
                 
                   
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td >
                        <input name="assigndate" type="Date" class="form-control" id="Designerno" placeholder="Designers">
                    </td>
                    <td>
                        <input name="enddate" type="Date" class="form-control" id="Codersno" placeholder="Coders">
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
                      
                        <form action="../../UpdateProjectServlet" class="forms-sample">
                          <a style="text-decoration: none; font-size: 50px" href="./project-Table-admin.jsp" class="close">&times;</a>
                        <h5>Update Project Details</h5>
                        <div class="form-group">
                          <label for="Project-no">Project No.</label>
                          <input name="project_id" type="number" class="form-control" id="Project-no" placeholder=" Enter Project No.">
                        </div>
                        <div class="form-group">
                          <label for="employeename">Name</label>
                          <input name="project_name" type="Text" class="form-control" id="pName" placeholder="Enter Project Name">
                        </div>
                        <div class="form-group">
                          <label for="employeename">Description</label>
                          <input name="project_description" type="Text" class="form-control" id="pDiscription" placeholder="Enter Project Description">
                        </div>
                        <div class="form-group">
                         
                          
                          <table class="table table-striped">
                            <thead>
                              <tr>
                                <th>
                                 No. of Designers
                                </th>
                                <th>
                                  No. of Coders
                                </th>
                                
                                <th>
                                  No. of Testers
                                </th>
                               
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td >
                                    <input name="designer" type="number" class="form-control" id="Designerno" placeholder="Designers">
                                </td>
                                <td>
                                    <input name="coder" type="number" class="form-control" id="Codersno" placeholder="Coders">
                                </td>
                                
                                <td>
                                    <input name="tester" type="number" class="form-control" id="Testersno" placeholder="Testers">
                                </td>
                                
                              </tr>
                              </tbody>
                              </table>
                              <table class="table table-striped">
                                <thead>
                                  <tr>
                                    <th>
                                      Assign Date
                                    </th>
                                    <th>
                                      End Date
                                    </th>
                                    
                                 
                                   
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td >
                                        <input name="assigndate" type="Date" class="form-control" id="Designerno" placeholder="Designers">
                                    </td>
                                    <td>
                                        <input name="enddate" type="Date" class="form-control" id="Codersno" placeholder="Coders">
                                    </td>
                                    
                                    
                                    
                                  </tr>
                                  </tbody>
                                  </table>
                        </div>
                       
                       
                        
                        <button type="submit" class="btn btn-primary me-2">Update</button>
                        
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
                      
                        <form action="../../DeleteProjectServlet" class="forms-sample">
                          <a style="text-decoration: none; font-size: 50px" href="./project-Table-admin.jsp" class="close">&times;</a>
                        <h5>Delete Project </h5>
                        <div class="form-group">
                          <label for="exampleInputUsername1">Project No.</label>
                          <input name="project_id" type="number" class="form-control" id="Project-no" placeholder="Enter Project No.">
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

















<!-- Assgin Employee  Form-->
                     

<div id="myModal55" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    
      <form action="../../AssignEmployeeServlet" class="forms-sample">
          <a style="text-decoration: none; font-size: 50px" href="./project-Table-admin.jsp" class="close">&times;</a>
      <h5>Assign Employee  </h5>
      <div class="form-group">
        <label for="exampleInputUsername1">Project ID</label>
        <input name="project_id" type="number" class="form-control" id="Project-no" placeholder="Enter Project ID.">
      </div>
      <div class="form-group">
        <label for="exampleInputUsername1">Employee ID</label>
        <input name="employee_id" type="number" class="form-control" id="Project-no" placeholder="Enter Employee ID">
      </div>
      
      
     
     
      
      <button type="submit" class="btn btn-primary me-2">Save</button>
    </form>
  </div>

</div>

<script>
// Get the modal
var modal55 = document.getElementById("myModal55");

// Get the button that opens the modal
var btn55 = document.getElementById("myBtn55");

// Get the <span> element that closes the modal
var span55 = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn55.onclick = function() {
  modal55.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span55.onclick = function() {
  modal55.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal55.style.display = "none";
  }
}







</script>



                    



<!-- Assign Task  Form-->
                     

<div id="myModal66" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    
      <form action="../../AssignTaskServlet" class="forms-sample">
      
      <a style="text-decoration: none; font-size: 50px" href="./project-Table-admin.jsp" class="close">&times;</a>
      <h5>Assign Task </h5>
      <div class="form-group">
        <label for="exampleInputUsername1">Project ID</label>
        <input name="p_id" type="number" class="form-control" id="Project-no" placeholder="Enter Project ID.">
      </div>
      <div class="form-group">
        <label for="exampleInputUsername1">Enter Total Number of Designing Task</label>
        <input name="designertask" type="number" class="form-control" id="Project-no" placeholder="Enter Employee ID">
      </div>
      
      <div class="form-group">
        <label for="exampleInputUsername1">Enter Total Number of Coding Task</label>
        <input name="codertask" type="number" class="form-control" id="Project-no" placeholder="Enter Employee ID">
      </div>
      
      <div class="form-group">
        <label for="exampleInputUsername1">Enter Total Number of Testing Task</label>
        <input name="testerTask" type="number" class="form-control" id="Project-no" placeholder="Enter Employee ID">
      </div>
     
     
      
      <button type="submit" class="btn btn-primary me-2">Save</button>
    </form>
  </div>

</div>

<script>
// Get the modal
var modal66 = document.getElementById("myModal66");

// Get the button that opens the modal
var btn66 = document.getElementById("myBtn66");

// Get the <span> element that closes the modal
var span66 = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn66.onclick = function() {
  modal66.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span66.onclick = function() {
  modal66.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal66.style.display = "none";
  }
}







</script>














<!-- Progress Admin  Form-->
                     

<div id="myModal77" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    
      <form action="../../ProgressAdmin" class="forms-sample">
      
      <a style="text-decoration: none; font-size: 50px" href="./project-Table-admin.jsp" class="close">&times;</a>
      <h5>Enter Project Id </h5>
      <div class="form-group">
        <label for="exampleInputUsername1">Project ID</label>
        <input name="p_id" type="number" class="form-control" id="Project-no" placeholder="Enter Project ID.">
      </div>
     
     
      
      <button type="submit" class="btn btn-primary me-2">Next</button>
    </form>
  </div>

</div>

<script>
// Get the modal
var modal77 = document.getElementById("myModal77");

// Get the button that opens the modal
var btn77 = document.getElementById("myBtn77");

// Get the <span> element that closes the modal
var span77 = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn77.onclick = function() {
  modal77.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span66.onclick = function() {
  modal77.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal77.style.display = "none";
  }
}







</script>



                    






                 






                  <h4 class="card-title">Employee Details</h4>
                
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>
                            Project No.
                          </th>
                          <th>
                            Name
                          </th>
                          
                          <th>
                            Discription
                          </th>
                          <th>
                            Designer
                          </th>
                          <th>
                            Coder
                          </th>
                          <th>
                           Tester
                          </th>
                          <th>
                            Assign Date
                          </th>
                          <th>
                            End Date
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                          <%
                              Connection con = ConnectionProvider.getConncection();
                              Statement stmt = con.createStatement();
                              ResultSet set = stmt.executeQuery("SELECT * from pts_project;");
                              
                              while(set.next()){
                              %>
                        <tr>
                          <td >
                            <%= set.getInt("pid") %>
                          </td>
                          <td>
                           <%= set.getString("pname") %>
                          </td>
                          
                          <td>
                            <%= set.getString("pdescription") %>

                          </td>
                          <td>
                            <%= set.getString("designer") %>
                          </td>
                          <td>
                            <%= set.getString("coder") %>
                          </td>
                          <td>
                            <%= set.getString("tester") %>
                          </td>
                          <td>
                            <%= set.getString("assigndate") %>
                          </td>
                          <td>
                            <%= set.getString("enddate") %>
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
