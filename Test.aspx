<%@ Page language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

  void CustomersGridView_RowCommand(Object sender, GridViewCommandEventArgs e)
  {
  
    // If multiple ButtonField column fields are used, use the
    // CommandName property to determine which button was clicked.
    if(e.CommandName=="Select")
    {
    
      // Convert the row index stored in the CommandArgument
      // property to an Integer.
      int index = Convert.ToInt32(e.CommandArgument);    
    
      // Get the last name of the selected author from the appropriate
      // cell in the GridView control.
      GridViewRow selectedRow = CustomersGridView.Rows[index];
      TableCell contactName = selectedRow.Cells[1];
      string contact = contactName.Text;  
    
      // Display the selected author.
      Message.Text = "You selected " + contact + ".";
      
    }
    
  }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
  <head runat="server">
    <title>ButtonField Example</title>
</head>
<body>
    <form id="form1" runat="server">
        
      <h3>ButtonField Example</h3>
      
      <asp:label id="Message"
        forecolor="Red"
        runat="server"
        AssociatedControlID="CustomersGridView"/>
                    
      <!-- Populate the Columns collection declaratively. -->
      <asp:gridview id="CustomersGridView" 
        datasourceid="CustomersSqlDataSource" 
        autogeneratecolumns="false"
        onrowcommand="CustomersGridView_RowCommand"
        runat="server">
                
        <columns>
                
          <asp:buttonfield buttontype="Button" 
            commandname="Select"
            headertext="Select Customer" 
            text="Select"/>
          <asp:boundfield datafield="CompanyName" 
            headertext="Company Name"/>
          <asp:boundfield datafield="ContactName" 
            headertext="Contact Name"/>
                
        </columns>
                
      </asp:gridview>
            
        <!-- This example uses Microsoft SQL Server and connects -->
        <!-- to the Northwind sample database.                   -->
        <asp:sqldatasource id="CustomersSqlDataSource"  
          selectcommand="Select [Atencion_dia], [Inicio_AM], [Fin_AM], [Inicio_PM] From [jorn12891927]"
          connectionstring="<%$ Data Source:23.239.201.115,1533;Initial Catalog:emitin;User ID:emitinc1;Password:emitinc1%>"
          runat="server">
        </asp:sqldatasource>
            
    </form>
                                <table id="Calendario2" class="centrado" cellspacing="0" cellpadding="2" rules="all" title="Calendario" border="1" style="color: #000000; background-color: White; border-width: 1px; border-style: solid; font-family: Verdana; font-size: 10pt; width: 342px;">  <%--border-collapse: collapse; display: block--%>
                                    <tr>
                                        <td colspan="7" style="background-color: #337AB7; border-color: #000000; height: 35px;">
                                            <table class="centrado" cellspacing="0" border="0" style="color: White; font-family: Verdana; font-size: 10pt; font-weight: bold; width: 100%; border-collapse: collapse;">
                                                <tr>
                                                    <td valign="top" style="color: White; font-weight: bold; width: 15%;"><a style="color: White" title="Ir al mes anterior">&lt;</a></td>
                                                    <td align="center" style="width: 70%;">abril de 2024</td>
                                                    <td align="right" valign="top" style="color: White; font-weight: bold; width: 15%;"><a style="color: White" title="Ir al mes siguiente.">&gt;</a></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th align="center" scope="col" style="background-color: LightGrey; border-color: #000000; font-size: 9pt; font-weight: bold;" abbr="lunes">lun</th>
                                        <th align="center" scope="col" style="background-color: LightGrey; border-color: #000000; font-size: 9pt; font-weight: bold;" abbr="martes">mar</th>
                                        <th align="center" scope="col" style="background-color: LightGrey; border-color: #000000; font-size: 9pt; font-weight: bold;" abbr="miércoles">mié</th>
                                        <th align="center" scope="col" style="background-color: LightGrey; border-color: #000000; font-size: 9pt; font-weight: bold;" abbr="jueves">jue</th>
                                        <th align="center" scope="col" style="background-color: LightGrey; border-color: #000000; font-size: 9pt; font-weight: bold;" abbr="viernes">vie</th>
                                        <th align="center" scope="col" style="background-color: LightGrey; border-color: #000000; font-size: 9pt; font-weight: bold;" abbr="sábado">sáb</th>
                                        <th align="center" scope="col" style="background-color: LightGrey; border-color: #000000; font-size: 9pt; font-weight: bold;" abbr="domingo">dom</th>
                                    </tr>
                                    <tr>
                                        <td align="center" style="background-color: #F4F0EC; color: #CCCCCC; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Gray" title="25 marzo">25</a></td>
                                        <td align="center" style="background-color: #F4F0EC; color: #CCCCCC; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Gray" title="26 marzo">26</a></td>
                                        <td align="center" style="background-color: #F4F0EC; color: #CCCCCC; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Gray" title="27 marzo">27</a></td>
                                        <td align="center" style="background-color: #F4F0EC; color: #CCCCCC; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Gray" title="28 marzo">28</a></td>
                                        <td align="center" style="background-color: #F4F0EC; color: #CCCCCC; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Gray" title="29 marzo">29</a></td>
                                        <td align="center" style="background-color: #F4F0EC; color: #D57D14; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Gray" title="30 marzo">30</a></td>
                                        <td align="center" style="background-color: #F4F0EC; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Gray" title="31 marzo">31</a></td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="01 abril">1</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="02 abril">2</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="03 abril">3</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="04 abril">4</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="05 abril">5</a></td>
                                        <td align="center" style="background-color: #337AB7; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: #FFFFFF" title="06 abril">6</a></td>
                                        <td align="center" style="background-color: #D57D14; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: #FFFFFF" title="07 abril">7</a></td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="08 abril">8</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="09 abril">9</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="10 abril">10</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="11 abril">11</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="12 abril">12</a></td>
                                        <td align="center" style="background-color: #337AB7; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: #FFFFFF" title="13 abril">13</a></td>
                                        <td align="center" style="background-color: #D57D14; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: #FFFFFF" title="14 abril">14</a></td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="15 abril">15</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="16 abril">16</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="17 abril">17</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="18 abril">18</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="19 abril">19</a></td>
                                        <td align="center" style="background-color: #337AB7; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: #FFFFFF" title="20 abril">20</a></td>
                                        <td align="center" style="background-color: #D57D14; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: #FFFFFF" title="21 abril">21</a></td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="22 abril">22</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="23 abril">23</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="24 abril">24</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="25 abril">25</a></td>
                                        <td align="center" style="border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="26 abril">26</a></td>
                                        <td align="center" style="background-color: #337AB7; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: #FFFFFF" title="27 abril">27</a></td>
                                        <td align="center" style="background-color: #D57D14; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: #FFFFFF" title="28 abril">28</a></td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="color: #808080; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="29 abril">29</a></td>
                                        <td align="center" style="color: #808080; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Black" title="30 abril">30</a></td>
                                        <td align="center" style="background-color: #F4F0EC; color: #CCCCCC; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Gray" title="01 mayo">1</a></td>
                                        <td align="center" style="background-color: #F4F0EC; color: #CCCCCC; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Gray" title="02 mayo">2</a></td>
                                        <td align="center" style="background-color: #F4F0EC; color: #CCCCCC; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Gray" title="03 mayo">3</a></td>
                                        <td align="center" style="background-color: #F4F0EC; color: #CCCCCC; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Gray" title="04 mayo">4</a></td>
                                        <td align="center" style="background-color: #F4F0EC; color: #CCCCCC; border-color: #000000; font-weight: bold; height: 35px; width: 14%;"><a style="color: Gray" title="05 mayo">5</a></td>
                                    </tr>
                                </table>
  </body>
</html>

