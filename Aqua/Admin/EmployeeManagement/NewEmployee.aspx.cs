using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessObject.Collections;
using AquaLibrary.BusinessLayer;
using AquaLibrary.Enums;


namespace Aqua.Employees
{
    public partial class NewEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["employeeToView"] != null)
                {
                    //this must be an edit
                    //set formview as edit mode only

                    // display the account to be edited
                    Employee employeeToBeEdited = Session["employeeToView"] as Employee;
                    EmployeeList employeeList = new EmployeeList();
                    employeeList.Add(employeeToBeEdited);
                    fViewEmployee.ChangeMode(FormViewMode.Edit);
                    fViewEmployee.DataSource = employeeList;
                    fViewEmployee.DataBind();

                    //clear the session["accountToView"]
                    Session["employeeToView"] = null;
                }

                else
                {
                    //create a new employee
                }

            }
        }

        protected void btnSave_Command(object sender, CommandEventArgs e)
        {
            // Save the new employee
            Employee employee = GetEmployeeDetailsFromForm();
            employee.EmployeeID = EmployeeManager.Save(employee);

            //Save the home address
            Address myHomeAddress = null;
            myHomeAddress = GetHomeAddressDetailsFromForm();
            myHomeAddress.AddressID = AddressManager.Save(myHomeAddress);

            //Save the Home address and the new employee on the EmployeeAddress table
            EmployeeAddress newEmployeeAddress = new EmployeeAddress();
            newEmployeeAddress.EmployeeID = employee.EmployeeID;
            newEmployeeAddress.AddressID = myHomeAddress.AddressID;
            newEmployeeAddress.AddressType = Convert.ToInt32(AddressType.Home);
            EmployeeAddressManager.AddEmployeeAddress(newEmployeeAddress);

            Session["employeeID"] = null;
            Session["employeeID"] = employee.EmployeeID;
            Response.Redirect("~/Admin/EmployeeManagement/ViewEmployee.aspx");

        }

        private Employee GetEmployeeDetailsFromForm()
        {
            Employee employee = new Employee();
            employee.Firstname = (fViewEmployee.FindControl("txtFirstname") as TextBox).Text.Trim();
            employee.Lastname = (fViewEmployee.FindControl("txtLastname") as TextBox).Text.Trim();
            employee.Gender = (fViewEmployee.FindControl("ddlGender") as DropDownList).SelectedValue;
            employee.Email = (fViewEmployee.FindControl("txtEmail") as TextBox).Text.Trim();
            employee.Homephone = (fViewEmployee.FindControl("txtHomephone") as TextBox).Text.Trim();
            employee.Mobilephone = (fViewEmployee.FindControl("txtMobilephone") as TextBox).Text.Trim();
            employee.EmergencyContact = (fViewEmployee.FindControl("txtEmergencyContact") as TextBox).Text.Trim();
            employee.EmergencyPhone1 = (fViewEmployee.FindControl("txtEmergencyPhone1") as TextBox).Text.Trim();
            employee.EmergencyPhone2 = (fViewEmployee.FindControl("txtEmergencyPhone2") as TextBox).Text.Trim();
            employee.IsEmployed = true; 
            employee.HireDate = Convert.ToDateTime((fViewEmployee.FindControl("txtHireDate") as TextBox).Text);
            employee.Notes = (fViewEmployee.FindControl("txtNotes") as TextBox).Text;
            employee.JobPositionID = Convert.ToInt32((fViewEmployee.FindControl("ddlJobTitle") as DropDownList).SelectedValue);
            return employee;
        }

        private Address GetHomeAddressDetailsFromForm()
        {
            Address homeAddress = new Address();
            homeAddress.AddressLine1 = (fViewHomeAddress.FindControl("txtAddressLine1") as TextBox).Text.Trim();
            homeAddress.AddressLine2 = (fViewHomeAddress.FindControl("txtAddressLine2") as TextBox).Text.Trim();
            homeAddress.CityTown = (fViewHomeAddress.FindControl("txtCityTown") as TextBox).Text.Trim();
            homeAddress.Province = (fViewHomeAddress.FindControl("ddlProvince") as DropDownList).SelectedValue;
            homeAddress.PostalCode = ((fViewHomeAddress.FindControl("txtPostalCode_segment1") as TextBox).Text.Trim()
                                + (fViewHomeAddress.FindControl("txtPostalCode_segment2") as TextBox).Text).Trim().ToUpper();
            return homeAddress;
        }

        protected void ddlProvince_DataBound(object sender, EventArgs e)
        {
            DropDownList ddlProvince = fViewHomeAddress.FindControl("ddlProvince") as DropDownList;
            ddlProvince.SelectedIndex = 8; //default to ontario
        }



    }
}