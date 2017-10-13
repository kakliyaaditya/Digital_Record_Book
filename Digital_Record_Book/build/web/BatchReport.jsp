<%-- 
    Document   : BatchReport
    Created on : 6 Oct, 2017, 11:51:23 AM
    Author     : sameer
--%>

<%@page import="com.pict.dao.GetAssignment"%>
<%@page import="com.pict.dao.BatchRecordDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Total Batch Report</title>
    </head>
    <body>
        <%
            String username = (String) session.getAttribute("username");
            String grpname = request.getParameter("grpname");
        %>
        <form action="Assign.jsp" method="POST">
            <input type="hidden" name="grpname" value="<%=grpname%>">
            <input type="submit" value ="Back">

        </form>
        <br><br>
        <%

            GetAssignment ga = new GetAssignment();
            int num = ga.assignmentCount(username, grpname);
            System.out.println("number is " + num);
            String tableName[] = new String[num];
            ga.assignmentList(username, grpname, tableName);

            int report1[][] = new int[22][num];

            int i = 0;

            BatchRecordDao brd = new BatchRecordDao();
            int roll[] = new int[2];

            brd.StudRollNo(username, grpname, roll);
            brd.report(username, grpname, report1);
        %>
        <table>
            <th>Roll Number</th>    
                <%
                    while (i < num) {
                        String[] parts = tableName[i].split("(?<=A)");
                %> 
            <th>Assignment <%out.println(parts[1]);%></th>
                <% i++;
                    }

                    int j = 0;
                    while (roll[0] < roll[1]) {
                        int k = 0;
                      //  System.out.println("k is " + k);

                %>
            <tr><td><%=roll[0]%></td>
                <%
                    i = 0;
                    
                    while (i < num) {
                %>
                <td><%=report1[j][k]%></td><%
                        k++;
                        System.out.println("k is " + k);
                        i++;
                    }
                %></tr><%
                          j++;
                          System.out.println("j is "+j);
                          roll[0]++;

                      }
                %>
        </table>


        <input type="submit" value="Download PDF" name="download" onclick="window.print()" /> 
    </body>
</html>