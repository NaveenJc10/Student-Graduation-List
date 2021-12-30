using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace DITAssignment2
{
    public partial class StudentList : System.Web.UI.Page
    {
        XmlDocument xmlDoc = new XmlDocument();
        String fullList = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load xml file into xmlDoc object
            xmlDoc.Load(Server.MapPath("studentlist.xml"));

            XmlNodeList students = xmlDoc.DocumentElement.GetElementsByTagName("student");

            // Render list of students into html
            for (int i = 0; i < students.Count; i++)
            {
                XmlNode student = students[i];
                Boolean hasBookPrize = student.SelectSingleNode("book_prize").InnerText == "Yes" ? true : false;
                String bookPrizeString = (hasBookPrize == true) ? "✔" : "";

                fullList += "<div class='StudentContainer'>";
                fullList += "<div class='TextColumn1'>" + student.SelectSingleNode("id").InnerText + "</div>";
                fullList += "<div class='TextColumn2'>" + student.SelectSingleNode("name").InnerText
                            + "<span class='TextColumn2__SmallText'>CLICK TO SEE PROFILE</span>" + "</div>";
                fullList += "<div class='TextColumn3'>" + student.SelectSingleNode("honours").InnerText + "</div>";
                fullList += "<div class='TextColumn4'>" + bookPrizeString + "</div>";
                fullList += "<div class='TextColumn5'>" + student.SelectSingleNode("programme").InnerText + "</div></div>";
            }
            StudentsList.InnerHtml = fullList;
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Get selected search option, book prize option, and searck key
            String searchOption = SearchOptions.Value;
            Boolean bookPrizeChecked = BookPrize.Checked;
            String searchKey = SearchTextBox.Text.Trim();

            StudentsList.InnerHtml = searchKey;

            /*
             Input cases
             1. No search string, checkbox checked
             2. No search string, checkbox unchecked
             3. Has search string, checkbox checked
             4. Has search string, checkbox unchecked
            */

            // Search for entered key in student list
            // Ref: XPath using multiple conditions: https://stackoverflow.com/questions/10247978/xpath-with-multiple-conditions
            //      case insensitive 'contains()' filter: https://stackoverflow.com/questions/31674093/find-an-element-by-xpath-which-contains-text/31674126
            XmlNodeList students;
            // if Case 1 & Case 3 (only checking checkbox is checked or not)
            if (bookPrizeChecked)
                students = xmlDoc.SelectNodes("//student[contains(translate(" + searchOption +
                    ",'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '" + searchKey.ToLower() + "') " +
                    "and book_prize='Yes']");
            // else Case 2 & 4
            else
                students = xmlDoc.SelectNodes("//student[contains(translate(" + searchOption +
                    ", 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '" + searchKey.ToLower() + "')]");

            String htmlString = "";
            if (students[0] != null)
            {
                // if there are valid search results, display them
                for (int i = 0; i < students.Count; i++)
                {
                    XmlNode student = students[i];
                    Boolean hasBookPrize = (student.SelectSingleNode("book_prize").InnerText == "Yes") ? true : false;
                    String bookPrizeString = (hasBookPrize == true) ? "✔" : "";

                    htmlString += "<div class='StudentContainer'>";
                    htmlString += "<div class='TextColumn1'>" + student.SelectSingleNode("id").InnerText + "</div>";
                    htmlString += "<div class='TextColumn2'>" + student.SelectSingleNode("name").InnerText
                                + "<span class='TextColumn2__SmallText'>CLICK TO SEE PROFILE</span>" + "</div>";
                    htmlString += "<div class='TextColumn3'>" + student.SelectSingleNode("honours").InnerText + "</div>";
                    htmlString += "<div class='TextColumn4'>" + bookPrizeString + "</div>";
                    htmlString += "<div class='TextColumn5'>" + student.SelectSingleNode("programme").InnerText + "</div></div>";
                }
            }
            else
            {
                // else notify user that no match is found
                htmlString += "<div id='ErrorMessage'><h1>NO MATCH FOUND</h1>"
                            + "<p>Your input does not match any data in the system,<br />please try different inputs and search settings</p></div>";
            }
            StudentsList.InnerHtml = htmlString;

            /* Submitting the form resets the SearchTextBox placeholder,
             * so this forces its placeholder to remain the same */
            SearchTextBox.Attributes["placeholder"] = DummyTextBox.Text;
        }

        protected void ResetButton_Click(object sender, EventArgs e)
        {
            // Reset students list
            StudentsList.InnerHtml = fullList;
            // Clear all input controls
            SearchTextBox.Text = "";
            BookPrize.Checked = false;
            // Prevent SearchTextBox placeholder from resetting
            SearchTextBox.Attributes["placeholder"] = DummyTextBox.Text;
        }
    }
}