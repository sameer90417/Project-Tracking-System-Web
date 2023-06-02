<%@page import="project.tracking.system.entity.Employee"%>
<%@page import="project.tracking.system.database.*"%>
<%@page import="project.tracking.system.dao.Employeedao"%>
<%@page import="project.tracking.system.daoimpl.EmployeeDaoImpl"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>My Projects - Project Tracker</title>
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




<%
    int eid=Integer.parseInt(request.getParameter("eid"));
    int cid=Integer.parseInt(request.getParameter("cid"));
    String email_id = request.getParameter("email").toString();
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
          <a class="navbar-brand brand-logo" href="../../index.html">
           <h5>Project Tracker</h5>
          </a>
          <a class="navbar-brand brand-logo-mini" href="../../index.html">
            <img src="../../images/logo-mini.svg" alt="logo" />
          </a>
        </div>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-top"> 
        <ul class="navbar-nav">
          <li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
              <h1 class="welcome-text">Welcome Back, <span class="text-black fw-bold" style="text-transform: capitalize"><%=emp.getName()%></span></h1>
            
          </li>
        </ul>
        <ul class="navbar-nav ms-auto">
          
          
          <li class="nav-item">
            <form class="search-form" action="#">
              <i class="icon-search"></i>
              <input type="search" class="form-control" placeholder="Search Here" title="Search here">
            </form>
          </li>
          
          </li>
          
          <li class="nav-item dropdown d-none d-lg-block user-dropdown">
            <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
              <img class="img-xs rounded-circle" src="../../images/faces/face8.png" alt="Profile image"> </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
              <div class="dropdown-header text-center">
                <img class="img-md rounded-circle" src="../../images/faces/face8.png" alt="Profile image" >
                <p class="mb-1 mt-3 font-weight-semibold"><%=emp.getName()%></p>
                <p class="fw-light text-muted mb-0"><%=email_id%></p>
                <p class="fw-light text-muted mb-0"><b><%=emp.getProfile()%></b></p>
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
            <a class="nav-link" href="Employee-Table.jsp?eid=<%=eid%>&cid=<%=cid%>&email=<%=email_id%>">
              <i class="menu-icon mdi mdi-file-document"></i>
              <span class="menu-title">My Projects</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="menu-icon mdi mdi-chart-line"></i>
              <span class="menu-title" id="myBtn77">Project Progress</span>
            </a>
          </li>
          
          
          
         
          
        </ul>
      </nav>
              
              
              
              
<div id="myModal77" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    
      <form action="../../ProgressEmployee" class="forms-sample">
      
      <a style="text-decoration: none; font-size: 50px" href="Employee-Table.jsp?eid=<%=eid%>&cid=<%=cid%>&email=<%=email_id%>" class="close">&times;</a>
      <h5>Enter Project Id </h5>
      <div class="form-group">
        <label for="exampleInputUsername1">Project ID</label>
        <input name="p_id" type="number" class="form-control" id="Project-no" placeholder="Enter Project ID.">
        <input name="eid" value="<%=eid%>" type="number" class="form-control" id="Project-no" placeholder="Enter Project ID." hidden="true">

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




              
              
              
              
              
     
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-description">
                    
                  </p>






  



    



                  <h4 class="card-title">My Projects</h4>
                
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>
                            Project No
                          </th>
                          <th>
                            Name
                          </th>
                          
                          <th>
                             Description
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
            Connection con1 = ConnectionProvider.getConncection();
            Employeedao dao = new EmployeeDaoImpl();
            String query = "SELECT pid, pname, pdescription, assigndate, enddate from pts_project WHERE pid=";
            
            List<Integer> list =  dao.selectPidByEid(emp);
            
            int i = 0;
            for (Integer integer : list) {
                if(i == 0) {
                    query += integer;
                    i++;
                    continue;
                } 
                query = query +" or pid="+ integer;
            }
            
            PreparedStatement insert = con1.prepareStatement(query);
            ResultSet Rs = insert.executeQuery();
            while(Rs.next()){
                          %>
                        <tr>
                          <td >
                            <%=Rs.getString("pid")%>
                          </td>
                          <td>
                            <%=Rs.getString("pname")%>
                          </td>
                          
                          <td>
                            <%=Rs.getString("pdescription")%>
                          </td>
                          <td>
                            <%=Rs.getString("assigndate")%>
                          </td>
                          <td>
                            <%=Rs.getString("enddate")%>
                          </td>
                        </tr>
                       
                        <%
                            }
                          con1.close();
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
