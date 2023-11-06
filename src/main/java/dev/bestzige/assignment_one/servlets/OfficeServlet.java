/* Watchara Santawee 65130500073 */
package dev.bestzige.assignment_one.servlets;

import dev.bestzige.assignment_one.entities.Office;
import dev.bestzige.assignment_one.repositories.OfficeRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "officeServlet", value = "/offices")
public class OfficeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OfficeRepository officeRepository = new OfficeRepository();

        /* Get parameters */
        String action = getParameterWithDefault(req, "action", "index");
        int pageInt = parseIntWithDefault(req.getParameter("page"), 1);
        int limitInt = parseBoundedInt(req.getParameter("limit"), officeRepository.getDefaultLimit(), officeRepository.getMaxLimit());
        String officeCode = getParameterWithDefault(req, "officeCode", null);
        String search = getParameterWithDefault(req, "search", null);

        /* Set attributes */
        if (action.equals("index")) {
            /* Get offices */
            List<Office> offices = officeRepository.findAll(search, pageInt, limitInt);
            int count = officeRepository.count();
            int totalPage = (int) Math.ceil((double) count / limitInt);

            req.setAttribute("offices", offices);
            req.setAttribute("currentPage", pageInt);
            req.setAttribute("limit", limitInt);
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("search", search);
        }

        req.setAttribute("action", action);

        if (officeCode != null) {
            Office office = officeRepository.findByOfficeCode(officeCode);
            if (office != null) {
                req.setAttribute("office", office);
            } else {
                resp.sendRedirect(req.getContextPath() + "/offices");
                return;
            }
        }

        /* Forward request */
        switch (action) {
            case "add":
            case "update":
                getServletContext().getRequestDispatcher("/office-form.jsp").forward(req, resp);
                break;
            default:
                getServletContext().getRequestDispatcher("/offices.jsp").forward(req, resp);
                break;
        }

        officeRepository.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OfficeRepository officeRepository = new OfficeRepository();

        /* Get parameters */
        String action = getParameterWithDefault(req, "action", "index");
        String officeCode = getParameterWithDefault(req, "officeCode", null);

        req.setAttribute("action", action);
        req.setAttribute("officeCode", officeCode);

        /* Action */
        switch (action) {
            case "add":
            case "update":
                String addressLine1 = getParameterWithDefault(req, "addressLine1", null);
                String addressLine2 = getParameterWithDefault(req, "addressLine2", null);
                String city = getParameterWithDefault(req, "city", null);
                String state = getParameterWithDefault(req, "state", null);
                String country = getParameterWithDefault(req, "country", null);
                String postalCode = getParameterWithDefault(req, "postalCode", null);
                String phone = getParameterWithDefault(req, "phone", null);
                String territory = getParameterWithDefault(req, "territory", null);

                Office office = new Office(officeCode, addressLine1, addressLine2, city, state, country, postalCode, phone, territory);
                if (officeCode == null || addressLine1 == null || city == null || country == null || phone == null || territory == null) {
                    forwardWithError(req, resp, "Please fill all required fields");
                    return;
                }

                String addedOrUpdated = "add".equals(action) ? officeRepository.create(office) : officeRepository.update(office);
                if (addedOrUpdated == null) {
                    resp.sendRedirect(req.getContextPath() + "/offices");
                    return;
                }

                forwardWithError(req, resp, addedOrUpdated);
                break;
            case "delete":
                String deleted = officeRepository.delete(officeCode);
                if (deleted == null) {
                    resp.sendRedirect(req.getContextPath() + "/offices");
                } else {
                    forwardWithError(req, resp, deleted);
                }
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/offices");
                break;
        }
    }

    private void forwardWithError(HttpServletRequest req, HttpServletResponse resp, String errorMessage) throws ServletException, IOException {
        req.setAttribute("error", errorMessage);
        getServletContext().getRequestDispatcher("/office-form.jsp").forward(req, resp);
    }

    private String getParameterWithDefault(HttpServletRequest request, String param, String defaultValue) {
        String value = request.getParameter(param);
        return value == null || value.trim().isEmpty() ? defaultValue : value.trim();
    }

    private int parseIntWithDefault(String value, int defaultValue) {
        try {
            return value != null ? Integer.parseInt(value) : defaultValue;
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    private int parseBoundedInt(String value, int defaultVal, int maxVal) {
        int result = parseIntWithDefault(value, defaultVal);
        return Math.min(result, maxVal);
    }
}
