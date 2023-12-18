package org.example;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DataServlet extends HttpServlet {
    private DataCollection dataCollection;

    @Override
    public void init() throws ServletException {
        // Создание экземпляра коллекции при инициализации сервлета
        dataCollection = new DataCollection();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Получение параметров из запроса
        String action = request.getParameter("action");
        String key = request.getParameter("key");
        String newValue = request.getParameter("newValue");

        if (action != null && key != null) {
            if (action.equals("search")) {
                // Поиск значения по ключу и отправка результата в формате JSON
                String value = dataCollection.searchByKey(key);
                String jsonResponse = "{\"key\": \"" + key + "\", \"value\": \"" + value + "\"}";
                response.setContentType("application/json");
                response.getWriter().write(jsonResponse);
            } else if (action.equals("replace") && newValue != null) {
                // Замена значения по ключу
                dataCollection.replaceValue(key, newValue);
                response.getWriter().write("success");
            } else {
                response.getWriter().write("invalid action");
            }
        } else {
            response.getWriter().write("missing parameters");
        }
    }
}
