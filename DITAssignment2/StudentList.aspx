<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="StudentList.aspx.cs" Inherits="DITAssignment2.StudentList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Graduation List</title>
    <!-- CSS Stylesheet links -->
    <link rel="stylesheet" type="text/css" href="css/navbar-and-footer.css" />
    <link rel="stylesheet" type="text/css" href="css/section1.css" />
    <link rel="stylesheet" type="text/css" href="css/section2.css" />
    <link rel="stylesheet" type="text/css" href="css/student-card.css" />
    <link rel="stylesheet" type="text/css" href="css/Footer.css" />
    <!-- Font Awesome link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!-- Google Fonts links -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;700;900&family=Roboto:wght@100;300;400;500;700;900&display=swap" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <!----------------- Navigation bar ----------------->
    <nav>
        <a id="SiteLogo" href="#">
            <img id="SiteLogo__Img" src="Images/UOW-KDU-Logo-cropped.png" alt="Site Logo"/>
        </a>
        <ul id="NavList">
            <li class="NavList__Link"><a target="_blank" href="https://www.uowmkdu.edu.my/enquiry-form/">ENQUIRIES</a></li>
            <li class="NavList__Link"><a target="_blank" href="https://www.uowmkdu.edu.my/programmes/find-your-program/">PROGRAMMES</a></li>
            <li class="NavList__Link"><a target="_blank" href="https://www.uowmkdu.edu.my/">OFFICIAL WEBSITE</a></li>
        </ul>
    </nav>
    <!----------------- Section 1: Header (with search bar) ----------------->
    <section id="Section1">
        <div id="SearchFormContainer">
            <div id="SearchForm__Text">
                <h1>Student Graduation List</h1>
                <p>
                    GGWP. Congratulations to the madlads who made it,
                    <br />
                    welcome to society!
                </p>
            </div>
            <form id="SearchForm" runat="server">
                <div id="SearchForm__Settings">
                    <div id="SearchForm__Settings__Filter">
                        <p>Filter:</p>
                        <input type="checkbox" id="BookPrize" runat="server" value="bookprize" />
                        <label for="BookPrize">Received Book Prize</label>
                    </div>
                    <div>
                        <label for="SearchOptions">Search by:</label>
                        <select name="SearchOptions" id="SearchOptions" runat="server" onchange="changePlaceholder()">
                            <option value="id">Student ID</option>
                            <option value="name" selected="selected">Student Name</option>
                            <option value="honours">Honours</option>
                            <option value="programme">Programme</option>
                        </select>
                    </div>
                </div>
                <br />
                <div id="SearchBoxDiv">
                    <!-- Submitting the form resets the SearchTextBox placeholder,
                         so DummyTextBox is used for keeping the most recent placeholder text -->
                    <asp:TextBox ID="DummyTextBox" runat="server" style="display: none;" value="Enter student name" />
                    <asp:TextBox ID="SearchTextBox" runat="server" placeholder="Enter student name" autocomplete="off" />
                    <button id="SearchButton" runat="server" onserverclick="SearchButton_Click"><i class="fa fa-search fa-lg"></i></button>
                </div>
                <asp:Button ID="ResetButton" runat="server" Text="RESET" OnClick="ResetButton_Click" />
            </form>
        </div>
    </section>
    <!----------------- Section 2: Students List ----------------->
    <section id="Section2">
        <div id="StudentsTable" runat="server">
            <div id="ColumnsContainer">
                <p class="TextColumn1">ID</p>
                <p id="NameColumn">Name</p>
                <p class="TextColumn3">Honours</p>
                <p class="TextColumn4">Book Prize</p>
                <p class="TextColumn5">Programme</p>
            </div>
            <div id="StudentsList" runat="server"></div>
        </div>
    </section>
    <!----------------- Hidden Students Card ----------------->
    <div id="ModalWindow">
       <div id="StudentCard">
           <i id="closeBtn" class="fa fa-close"></i>
           <img id="StudentPhoto" src="Images/thing.png" alt="Student Photo"/>
           <div id="StudentDetails">
               <p>Honor student - x</p>
               <h1>XXX</h1>
               <div id="DetailsSubCtn">
                   <div class="detailSubCtnItem">
                       <img src="Images/programme.png" alt="Programme"/>
                       <div class="detailLabelCtn">
                           <p>Programme</p>
                           <p>Comp. Science</p>
                       </div>
                   </div>               
                   <div class="detailSubCtnItem">
                       <img src="Images/honours.png" alt="Honours"/>
                       <div class="detailLabelCtn">
                           <p>Honours</p>
                           <p>First class</p>
                       </div>
                   </div>
               </div>
               <div id="BookPrizeStatementCtn">
                   <img src="Images/bookPrize.png" alt="Book Prize"/>
                   <span>This student is a book prize winner</span>
               </div>
           </div>
       </div>
    </div>
<div>
<footer>
        <div class="footer-content">
            <h3>UOW KDU Malaysia</h3>
            <p>Congratulations on your graduations and best wishes for your next adventure.</p>
            <ul class="socials">
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                <li><a href="#"><i class="fa fa-linkedin-square"></i></a></li>
            </ul>
        </div>
        <div class="footer-bottom">
            <p>copyright &copy; <a href="#">UOW KDU Malaysia</a></p>
        </div>

    </footer>
    </div>
  <!-- End -->
    <!-- Javascript -->
    <script src="javascript/searchform.js"></script>
</body>
</html>
