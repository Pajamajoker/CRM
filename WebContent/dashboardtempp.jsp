<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="navbar.jsp" %>
    <%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// to not cache the secure pages
 %>

<%String sql = "SELECT employees.FirstName,COUNT(*) as count FROM loans inner JOIN employees on loans.EmpID=employees.EmpID GROUP BY loans.EmpID ORDER BY COUNT(*) DESC LIMIT 1";
ps= con.prepareStatement(sql);
rs = ps.executeQuery();

PreparedStatement ps1 = null;
ResultSet rs1 = null;
String sql5="SELECT loandetails.Type,COUNT(*) as count FROM loans inner join loandetails on loans.TypeID=loandetails.TypeID GROUP BY loans.TypeID ORDER By COUNT(*) DESC LIMIT 1";
ps1= con.prepareStatement(sql5);
rs1 = ps1.executeQuery(); 

PreparedStatement ps2 = null;
ResultSet rs2 = null;
String sql6 = "SELECT EmpID,COUNT(EmpID)  as count FROM loans WHERE EmpID=?";
ps2 = con.prepareStatement(sql6);
int employeeID=(Integer)(session.getAttribute("EmpID"));
ps2.setInt(1,employeeID);
rs2 = ps2.executeQuery();

PreparedStatement ps3 = null;
ResultSet rs3 = null;
String sql7 = "SELECT employees.FirstName,employees.LastName,COUNT(*) as COUNT FROM loans inner JOIN employees on loans.EmpID=employees.EmpID GROUP BY loans.EmpID ORDER BY COUNT(*) DESC LIMIT 5";
ps3 = con.prepareStatement(sql7);
rs3 = ps3.executeQuery();

PreparedStatement ps4 = null;
ResultSet rs4 = null;
String sql8 = "SELECT COUNT(*) as count FROM loans where EmpID=? GROUP BY TypeID";
ps4 = con.prepareStatement(sql8);
ps4.setInt(1,(Integer)session.getAttribute("EmpID"));
rs4= ps4.executeQuery();


int arr[],i=0;
arr = new int[20]; 

PreparedStatement ps5 = null;
ResultSet rs5 = null;
String sql9 = "SELECT MONTH(Commencement),COUNT(*) as COUNT FROM loans where EmpID=? GROUP By MONTH(Commencement)";
ps5 = con.prepareStatement(sql9);
ps5.setInt(1,(Integer)session.getAttribute("EmpID"));
rs5= ps5.executeQuery();


int arr1[],i1=0;
arr1 = new int[20]; 


PreparedStatement ps6 = null;
ResultSet rs6 = null;
String sql10 = "SELECT Nature,COUNT(*) as count from leads where EmpID=? GROUP By Nature";
ps6 = con.prepareStatement(sql10);
ps6.setInt(1,(Integer)session.getAttribute("EmpID"));
rs6= ps6.executeQuery();


int arr2[],i2=0;
arr2 = new int[20]; 


PreparedStatement ps7 = null;
ResultSet rs7 = null;
String sql11 = "SELECT COUNT(*) as COUNT FROM loans";
ps7 = con.prepareStatement(sql11);
rs7= ps7.executeQuery();


int arr3[],i3=0;
arr3 = new int[20]; 
while(rs7.next())
{
	arr3[i3]=rs7.getInt("COUNT");
	System.out.println(arr3[i3]);
	i3++;
	}

PreparedStatement ps8 = null;
ResultSet rs8 = null;
String sql12 = "SELECT loandetails.Type,COUNT(*) as count FROM loans inner join loandetails on loans.TypeID=loandetails.TypeID where EmpID=? Group By loans.TypeID order by count desc limit 1";
ps8 = con.prepareStatement(sql12);
ps8.setInt(1,(Integer)session.getAttribute("EmpID"));
rs8= ps8.executeQuery();


PreparedStatement ps9 = null;
ResultSet rs9 = null;
String sql13 = "SELECT COUNT(*) as count FROM loans GROUP BY TypeID";
ps9 = con.prepareStatement(sql13);
rs9= ps9.executeQuery();


int arr4[],i4=0;
arr4 = new int[20]; 
while(rs9.next())
{
	arr4[i4]=rs9.getInt("count");
	System.out.println(arr4[i4]);
	i4++;
	}

PreparedStatement ps10 = null;
ResultSet rs10 = null;
String sql14 = "SELECT Nature,COUNT(*) as count from leads GROUP By Nature";
ps10 = con.prepareStatement(sql14);
rs10= ps10.executeQuery();


int arr5[],i5=0;
arr5 = new int[20]; 
while(rs10.next())
{
	arr5[i5]=rs10.getInt("count");
	i5++;
	}

PreparedStatement ps11 = null;
ResultSet rs11 = null;
String sql15 = "SELECT MONTH(Commencement),COUNT(*) as COUNT FROM loans  GROUP By MONTH(Commencement)";
/* ps11.setInt(1,(Integer)session.getAttribute("EmpID")); */
ps11 = con.prepareStatement(sql15);
rs11= ps11.executeQuery();


int arr6[],i6=0;
arr6 = new int[20]; 
while(rs11.next())
{
	arr6[i6]=rs11.getInt("COUNT");
	i6++;
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
  	Dashboard
  </title>
  <!-- Favicon -->
  <link href="./assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="./assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="resources/css/navbar.css">
	
	
	 <link rel="icon" type="image/png" href="resources/dashboard/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/dashboard/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/dashboard/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/dashboard/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/dashboard/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/dashboard/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/dashboard/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/dashboard/css/main.css">

</head>

<body class="">
<!-- 	<div class="topnav">
 <a href="dashboardtemp.jsp" id="dashboard" >DashBoard</a>
  <a href="leads.jsp" id="leads">My Leads</a>
  <a href="Customers.jsp" id="customers">Customers</a>
  <a href="AllSales.jsp" id="allsales">All Sales</a>
  <a href="Products.jsp" id="products">Products</a>
  <a href="tasks.jsp" id="tasks">Tasks</a>
  <a href="logout.jsp" class="logout" id="log out">Log out</a>

            </div> -->
         
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
            <div class=" dropdown-header noti-title">
              <h6 class="text-overflow m-0">Welcome!</h6>
            </div>
            <a href="./examples/profile.html" class="dropdown-item">
              <i class="ni ni-single-02"></i>
              <span>My profile</span>
            </a>
            <a href="./examples/profile.html" class="dropdown-item">
              <i class="ni ni-settings-gear-65"></i>
              <span>Settings</span>
            </a>
            <a href="./examples/profile.html" class="dropdown-item">
              <i class="ni ni-calendar-grid-58"></i>
              <span>Activity</span>
            </a>
            <a href="./examples/profile.html" class="dropdown-item">
              <i class="ni ni-support-16"></i>
              <span>Support</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#!" class="dropdown-item">
              <i class="ni ni-user-run"></i>
              <span>Logout</span>
            </a>
          </div>
        </li>
      </ul>
      
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Dashboard</a>
        	
        <!-- User -->
      </div>
    </nav>
    <!-- End Navbar -->
    <!-- Header -->
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
      <div class="container-fluid">
        <div class="header-body">
          <!-- Card stats -->
          <div class="row">
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h4 class="card-title text-uppercase text-muted mb-0">Top Salesman </h4>
                      <%while(rs.next())
						{%>
                      <span class="h2 font-weight-bold mb-0"><%=rs.getString("FirstName") %></span>                      
	
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
                        <i class="fas fa-chart-bar"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> <%=rs.getInt("count") %></span>
                   <%}%>
                    <span class="text-nowrap">No of sales</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Most Product Sold</h5>
                      <%while(rs1.next())
						{%>
                      <span class="h2 font-weight-bold mb-0"><%=rs1.getString("Type") %></span>    
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                        <i class="fas fa-chart-pie"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"> <i class="fa fa-arrow-up"></i> <%=rs1.getInt("count") %></span><%}%>
                    <span class="text-nowrap">Sold</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Your Total Sales</h5>
                       <%while(rs2.next())
						{%>
                      <span class="h2 font-weight-bold mb-0"><%=rs2.getInt("count") %></span><%}%>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
                        <i class="fas fa-users"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"><i class="fas fa-arrow-up"></i></span>
                    <span class="text-nowrap">Good Work!</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Most Product Sold By You</h5>
                      <%while(rs8.next())
						{%>
                      <span class="h2 font-weight-bold mb-0"><%=rs8.getString("Type") %></span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                        <i class="fas fa-percent"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> <%=rs8.getInt("count") %></span><%}%>
                    <span class="text-nowrap">Since last month</span>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid mt--7">
      <div class="row">
     <!--  <h3>Your sales statistics</h3> -->
        <div class="col-xl-8 mb-5 mb-xl-0">
          <div class="card bg-gradient-default shadow">
            <div class="card-header bg-transparent">
              <div class="row align-items-center">
                <div class="col">
                  <h6 class="text-uppercase text-light ls-1 mb-1">Overview</h6>
                  <h2 class="text-white mb-0">Sales value</h2>
                </div>
                <div class="col">
                  <ul class="nav nav-pills justify-content-end">
                    <li class="nav-item mr-2 mr-md-0" data-toggle="chart" data-target="#chart-sales" data-update='{"data":{"datasets":[{"data":[0, 20, 10, 30, 15, 40, 20, 60, 60]}]}}' data-prefix="$" data-suffix="k">
                      <a href="#" class="nav-link py-2 px-3 active" data-toggle="tab">
                        <span class="d-none d-md-block">Month</span>
                        <span class="d-md-none">M</span>
                      </a>
                    </li>
                    <li class="nav-item" data-toggle="chart" data-target="#chart-sales" data-update='{"data":{"datasets":[{"data":[0, 20, 5, 25, 10, 30, 15, 40, 40]}]}}' data-prefix="$" data-suffix="k">
                      <a href="#" class="nav-link py-2 px-3" data-toggle="tab">
                        <span class="d-none d-md-block">Week</span>
                        <span class="d-md-none">W</span>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="card-body">
            	<canvas id="bar-chart" width="800" height="450"></canvas>
            	<!-- <canvas id="line-chart" width="800" height="450"></canvas> -->
            	 <!-- <canvas id="doughnut-chart" width="800" height="450"></canvas>  -->
              <!-- Chart -->
              <!-- <div class="chart">
                Chart wrapper
             
                <canvas id="chart-sales" class="chart-canvas"></canvas>
              </div> -->
            </div>
          </div>
        </div>
        <div class="col-xl-4">
<!--         <br>
        <br><br><br> -->
        	
         <div class="card shadow">
            <!-- <div class="card-header bg-transparent"> -->
              <div class="row align-items-center">
               <!--  <div class="col">
                  <h6 class="text-uppercase text-muted ls-1 mb-1">Performance</h6>
                  <h2 class="mb-0">Total orders</h2>
                </div> -->
              </div>
          <!--   </div> -->
            <div class="card-body">
              <canvas id="pie-chart" style="width:2px;height:1px"></canvas>
              <br><br>
              <canvas id="doughnut-chart" width="800" height="450"></canvas>  
             <!--  <div class="chart">
                <canvas id="chart-orders" class="chart-canvas"></canvas>
              </div> -->
            </div>
          </div>
        </div>
      </div>
      
      
      
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      
            <div class="row">
        <div class="col-xl-8 mb-5 mb-xl-0">
          <div class="card bg-gradient-default shadow">
            <div class="card-header bg-transparent">
              <div class="row align-items-center">
                <div class="col">
                  <h6 class="text-uppercase text-light ls-1 mb-1">Overview</h6>
                  <h2 class="text-white mb-0">Sales value</h2>
                </div>
                <div class="col">
                  <ul class="nav nav-pills justify-content-end">
                    <li class="nav-item mr-2 mr-md-0" data-toggle="chart" data-target="#chart-sales" data-update='{"data":{"datasets":[{"data":[0, 20, 10, 30, 15, 40, 20, 60, 60]}]}}' data-prefix="$" data-suffix="k">
                      <a href="#" class="nav-link py-2 px-3 active" data-toggle="tab">
                        <span class="d-none d-md-block">Month</span>
                        <span class="d-md-none">M</span>
                      </a>
                    </li>
                    <li class="nav-item" data-toggle="chart" data-target="#chart-sales" data-update='{"data":{"datasets":[{"data":[0, 20, 5, 25, 10, 30, 15, 40, 40]}]}}' data-prefix="$" data-suffix="k">
                      <a href="#" class="nav-link py-2 px-3" data-toggle="tab">
                        <span class="d-none d-md-block">Week</span>
                        <span class="d-md-none">W</span>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="card-body">
            	<canvas id="bar-chart-2" width="800" height="450"></canvas>
            	<!-- <canvas id="line-chart" width="800" height="450"></canvas> -->
            	 <!-- <canvas id="doughnut-chart" width="800" height="450"></canvas>  -->
              <!-- Chart -->
              <!-- <div class="chart">
                Chart wrapper
             
                <canvas id="chart-sales" class="chart-canvas"></canvas>
              </div> -->
            </div>
          </div>
        </div>
        <div class="col-xl-4">
<!--         <br>
        <br><br><br> -->
        	
         <div class="card shadow">
            <!-- <div class="card-header bg-transparent"> -->
              <div class="row align-items-center">
               <!--  <div class="col">
                  <h6 class="text-uppercase text-muted ls-1 mb-1">Performance</h6>
                  <h2 class="mb-0">Total orders</h2>
                </div> -->
              </div>
          <!--   </div> -->
            <div class="card-body">
              <canvas id="pie-chart-2" style="width:2px;height:1px"></canvas>
              <br><br>
              <canvas id="doughnut-chart-2" width="800" height="450"></canvas>  
             <!--  <div class="chart">
                <canvas id="chart-orders" class="chart-canvas"></canvas>
              </div> -->
            </div>
          </div>
        </div>
      </div>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      <div class="row mt-5">
        <!--  <div class="col-12 mb-5 mb-xl-0">
          <div class="card shadow">
            <div class="card-header border-0">
              <div class="row align-items-center">
                <div class="col">
                  <h3 class="mb-0">Status of Leads</h3>
                </div>
                <div class="col text-right">
                  <a href="#!" class="btn btn-sm btn-primary">See all</a>
                </div>
              </div>
            </div>
            <div class="table-responsive">
              Projects table
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">Page name</th>
                    <th scope="col">Visitors</th>
                    <th scope="col">Unique users</th>
                    <th scope="col">Bounce rate</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">
                      /argon/
                    </th>
                    <td>
                      4,569
                    </td>
                    <td>
                      340
                    </td>
                    <td>
                      <i class="fas fa-arrow-up text-success mr-3"></i> 46,53%
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">
                      /argon/index.html
                    </th>
                    <td>
                      3,985
                    </td>
                    <td>
                      319
                    </td>
                    <td>
                      <i class="fas fa-arrow-down text-warning mr-3"></i> 46,53%
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">
                      /argon/charts.html
                    </th>
                    <td>
                      3,513
                    </td>
                    <td>
                      294
                    </td>
                    <td>
                      <i class="fas fa-arrow-down text-warning mr-3"></i> 36,49%
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">
                      /argon/tables.html
                    </th>
                    <td>
                      2,050
                    </td>
                    <td>
                      147
                    </td>
                    <td>
                      <i class="fas fa-arrow-up text-success mr-3"></i> 50,87%
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">
                      /argon/profile.html
                    </th>
                    <td>
                      1,795
                    </td>
                    <td>
                      190
                    </td>
                    <td>
                      <i class="fas fa-arrow-down text-danger mr-3"></i> 46,53%
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div> -->
        <div class="col-12">
          <div class="card shadow">
            <div class="card-header border-0">
              <div class="row align-items-center">
                <div class="col">
                  <h1 class="mb-0">Leader Board</h1>
                </div>
                <div class="col text-right">
                  <!-- <a href="#!" class="btn btn-sm btn-primary">See all</a> -->
                </div>
              </div>
            </div>
            <div class="table-responsive">
              <!-- Projects table -->
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col" >Employee</th>
                    <th scope="col" ></th>
                    <th scope="col">No of sales</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                <%while(rs3.next())
				{%>
                  <tr>
                    <th scope="row" ">
                      <%=rs3.getString("FirstName") %>
                    </th>
                    <td ">
                      <%=rs3.getString("LastName") %>
                    </td>
                    <td>
                      <%=rs3.getInt("count") %>
                    </td>
                    <td>
                      <div class="d-flex align-items-center">
                        <span class="mr-2" ><%=rs3.getInt("count") %></span>
                        <div>
                          <div class="progress">
                            <div class="progress-bar bg-gradient-danger" role="progressbar" aria-valuenow="<%=rs3.getInt("count") %>" aria-valuemin="0" aria-valuemax="<%=arr3[0]%>" style="width: 10%;"></div>
                          </div>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <%}%>
                  
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <!-- Footer -->
      <footer class="footer">
        <div class="row align-items-center justify-content-xl-between">
          <div class="col-xl-6">
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core   -->
  <script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <script src="./assets/js/plugins/chart.js/dist/Chart.min.js"></script>
  <script src="./assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
  <!--   Argon JS   -->
  <script src="./assets/js/argon-dashboard.min.js?v=1.1.0"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
      });
  </script>
</body>



<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script >
document.getElementById("dashboard").setAttribute("class","active");
<%while(rs4.next())
{
	arr[i]=rs4.getInt("count");
	System.out.println(arr[i]);
	i++;
	}%>
	
<%while(rs5.next())
	{
		arr1[i1]=rs5.getInt("COUNT");
		System.out.println(arr1[i1]);
		i1++;
		}%>
		
<%while(rs6.next())
		{
			arr2[i2]=rs6.getInt("count");
			System.out.println(arr2[i2]);
			i2++;
			}%>
		
  new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["House Loan", "Vehicle loan", "Education loan"],
      datasets: [{
        label: "Sales",
        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
        data: [<%=arr[0]%>,<%=arr[1]%>,<%=arr[2]%>]
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Total sales'
      }
    }
});
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  new Chart(document.getElementById("pie-chart-2"), {
	    type: 'pie',
	    data: {
	      labels: ["House Loan", "Vehicle loan", "Education loan"],
	      datasets: [{
	        label: "Sales",
	        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
	        data: [<%=arr4[0]%>,<%=arr4[1]%>,<%=arr4[2]%>]
	      }]
	    },
	    options: {
	      title: {
	        display: true,
	        text: 'Total sales'
	      }
	    }
	});
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  new Chart(document.getElementById("bar-chart"), {
	    type: 'bar',
	    data: {
	      labels: ["August", "September", "October", "November", "December"],
	      datasets: [
	        {
	          label: "No of sales",
	          backgroundColor: ["#0040ff", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
	          data:[<%=arr1[0]%>,<%=arr1[1]%>,<%=arr1[2]%>,<%=arr1[3]%>,<%=arr1[4]%>]	        }
	      ]
	    },
	    options: {
	      legend: { display: false },
	      title: {
	        display: true,
	        text: 'Sales'
	      }
	    }
	});
  
  
  
  
  
  
  
  
  
  
  
  
  new Chart(document.getElementById("bar-chart-2"), {
	    type: 'bar',
	    data: {
	      labels: ["August", "September", "October", "November", "December"],
	      datasets: [
	        {
	          label: "No of sales",
	          backgroundColor: ["#0040ff", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
	          data:[<%=arr6[0]%>,<%=arr6[1]%>,<%=arr6[2]%>,<%=arr6[3]%>,<%=arr6[4]%>]	        }
	      ]
	    },
	    options: {
	      legend: { display: false },
	      title: {
	        display: true,
	        text: 'Sales'
	      }
	    }
	});
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  new Chart(document.getElementById("doughnut-chart"), {
	    type: 'doughnut',
	    data: {
	      labels: ["Hot", "Warm", "Cold"],
	      datasets: [
	        {
	          label: "Nature of Leads",
	          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
	          data: [<%=arr2[0]%>,<%=arr2[1]%>,<%=arr2[2]%>]
	        }
	      ]
	    },
	    options: {
	      title: {
	        display: true,
	        text: 'Nature of Leads'
	      }
	    }
	});
  
  
  
  
  
  
  
  new Chart(document.getElementById("doughnut-chart-2"), {
	    type: 'doughnut',
	    data: {
	      labels: ["Hot", "Warm", "Cold"],
	      datasets: [
	        {
	          label: "Nature of Leads",
	          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
	          data: [<%=arr5[0]%>,<%=arr5[1]%>,<%=arr5[2]%>]
	        }
	      ]
	    },
	    options: {
	      title: {
	        display: true,
	        text: 'Nature of Leads'
	      }
	    }
	});

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  new Chart(document.getElementById("line-chart"), {
	  type: 'line',
	  data: {
	    labels: [1500,1600,1700,1750,1800,1850,1900,1950,1999,2050],
	    datasets: [{ 
	        data: [86,114,106,106,107,111,133,221,783,2478],
	        label: "Africa",
	        borderColor: "#3e95cd",
	        fill: false
	      }, { 
	        data: [282,350,411,502,635,809,947,1402,3700,5267],
	        label: "Asia",
	        borderColor: "#8e5ea2",
	        fill: false
	      }, { 
	        data: [168,170,178,190,203,276,408,547,675,734],
	        label: "Europe",
	        borderColor: "#3cba9f",
	        fill: false
	      }, { 
	        data: [40,20,10,16,24,38,74,167,508,784],
	        label: "Latin America",
	        borderColor: "#e8c3b9",
	        fill: false
	      }, { 
	        data: [6,3,2,2,7,26,82,172,312,433],
	        label: "North America",
	        borderColor: "#c45850",
	        fill: false
	      }
	    ]
	  },
	  options: {
	    title: {
	      display: true,
	      text: 'World population per region (in millions)'
	    }
	  }
	});
  
 
  </script>
</html>