function changePlaceholder() {
    // When selected option is changed, alter placeholder text in search box
    let selectedOption = document.getElementById("SearchOptions").value;
    let dummyTextBox = document.getElementById("DummyTextBox");
    let searchBox = document.getElementById("SearchTextBox");
    let placeholderText = "";

    if (selectedOption == "id")
        placeholderText = "Enter student ID";
    else if (selectedOption == "name")
        placeholderText = "Enter student name";
    else if (selectedOption == "honours")
        placeholderText = "Enter honours category";
    else if (selectedOption == "programme")
        placeholderText = "Enter programme name";

    // dummyTextBox is just a dummy element used for keeping the most recent placeholder text
    dummyTextBox.value = placeholderText;
    searchBox.placeholder = placeholderText;
}

//--------- Student modal popup handlers ----------
let body = document.querySelector("body")
let modalWindow = document.getElementById("ModalWindow");
let closeButton = document.getElementById("CloseButton");
let isModalOpened = modalWindow.style.display == "none" ? false : true;

//add open-on-click events to all StudentContainers
let studentCtn = document.querySelectorAll(".StudentContainer");
studentCtn.forEach(function(ctn) {
    ctn.addEventListener("click", function () {
        //edit details of student card
        redrawCard(this);
        //show student card
        modalWindow.style.opacity = "1";
        modalWindow.style.visibility = "visible";
        //prevent scrolling
        body.style.overflowY = "hidden";
        body.style.marginRight = "15px";
    })
});

function redrawCard(student) {
    //Extract student details
    let studentId = student.getElementsByClassName("TextColumn1")[0].innerText;
    let honours = student.getElementsByClassName("TextColumn3")[0].innerText;
    let bookPrize = student.getElementsByClassName("TextColumn4")[0].innerText;
    let programme = student.getElementsByClassName("TextColumn5")[0].innerText;
    //Student name has "CLICK TO OPEN PROFILE" included so need to substring it out
    let rawStudentName = student.getElementsByClassName("TextColumn2")[0].innerText;
    let studentName = rawStudentName.substring(0, rawStudentName.length - 20);

    //Get modal window components for changing
    let lblId = modalWindow.querySelector("p");
    let lblName = modalWindow.querySelector("h1");
    let lblProgramme = modalWindow.querySelectorAll(".detailLabelCtn p:nth-child(2)")[0];
    let lblHonours = modalWindow.querySelectorAll(".detailLabelCtn p:nth-child(2)")[1];
    let bookPrizeStatement = document.getElementById("BookPrizeStatementCtn");
    let studentPhoto = document.getElementById("StudentPhoto");

    //Assign values to respective fields
    if (honours.toLowerCase() == "first class")
        lblId.innerHTML = "Honor student - <b>" + studentId + "</b>";
    else
        lblId.innerHTML = "Graduate - <b>" + studentId + "</b>";
    lblName.innerText = studentName;
    lblProgramme.innerText = programme;
    lblHonours.innerText = honours;
    if (bookPrize == "✔")
        bookPrizeStatement.style.display = "block";
    else
        bookPrizeStatement.style.display = "none";
    studentPhoto.src = "Images/students/" + studentId + ".png";
}

//close modal when close btn / modal window is clicked
window.addEventListener("click", (ev) => {
    if (ev.target == modalWindow) {
        //close modal
        modalWindow.style.opacity = "0";
        modalWindow.style.visibility = "hidden";
        //enable scrolling
        body.style.overflowY = "auto";
        body.style.marginRight = "0px";
    }
});

closeBtn.addEventListener("click", () => {
    //close modal
    modalWindow.style.opacity = "0";
    modalWindow.style.visibility = "hidden";
    //enable scrolling
    body.style.overflowY = "auto";
    body.style.marginRight = "0px";
});