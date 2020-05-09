
<%@page import="doctorsearch.connect"%>
<%
String c=request.getParameter("id");
String y="";

%>
<Select name="t2" class="form-control">
                              <option value="0">-select-</option>
                            <%
                  connect c01=new connect();
                        c01.read("select * from subcat where cid='"+c+"'");
                        while(c01.rs.next())
                        {
                            %>
                            <option value="<%=c01.rs.getString(1)%>" ><%=c01.rs.getString(3)%></option>
                         <%
                         }
                         %>
                               </Select>
 
