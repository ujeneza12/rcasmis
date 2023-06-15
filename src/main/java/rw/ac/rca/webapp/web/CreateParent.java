package rw.ac.rca.webapp.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rw.ac.rca.webapp.dao.ParentDAO;
import rw.ac.rca.webapp.dao.StudentDAO;
import rw.ac.rca.webapp.dao.impl.ParentDAOImpl;
import rw.ac.rca.webapp.dao.impl.StudentDAOImpl;
import rw.ac.rca.webapp.orm.Address;
import rw.ac.rca.webapp.orm.Parent;
import rw.ac.rca.webapp.orm.Student;
import rw.ac.rca.webapp.util.UserRole;

public class CreateParent extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ParentDAO parentDAO = ParentDAOImpl.getInstance();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateParent() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageRedirect = request.getParameter("page");
        HttpSession httpSession = request.getSession();
        if (pageRedirect != null) {
            if (pageRedirect.equals("createparent")) {
                if (request.getParameter("savePrt") != null) {
                    Parent parent = new Parent();
                    String firstname = request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String prtDOB = request.getParameter("dob");
                    String email = request.getParameter("email");
                    int prtStudent = Integer.parseInt(request.getParameter("student"));

                    long phonenumber = Long.parseLong(request.getParameter("phonenumber"));
                    String gender = request.getParameter("gender");
                    int address = Integer.parseInt(request.getParameter("address"));

                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
                    Date parentdob = null;
                    try{
                        parentdob = simpleDateFormat.parse(prtDOB);
                    } catch (ParseException e) {
                        throw new RuntimeException(e);
                    }

                    Address parentaddress = new Address(address);
                    Student studentaddress = new Student(prtStudent);

                    try {

                        parent.setFirstName(firstname);
                        parent.setLastName(lastname);
                        parent.setDateOfBirth(parentdob);
                        parent.setEmail(email);
                        parent.setPhoneNumber(String.valueOf(phonenumber));
                        parent.setGender(gender);
                        parent.setAddress(parentaddress);
                        parent.setStudent(studentaddress);

                        parentDAO.saveOrUpdateParent(parent);

                        httpSession.setAttribute("message", "Created successfully");
                    } catch (Exception e) {
                        httpSession.setAttribute("message", "Can't Create Student");
                    }

                }

            }
            UserRole[] userRoles = UserRole.values();
            httpSession.setAttribute("userRoles", userRoles);
            request.getRequestDispatcher("WEB-INF/createparent.jsp").forward(
                    request, response);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}