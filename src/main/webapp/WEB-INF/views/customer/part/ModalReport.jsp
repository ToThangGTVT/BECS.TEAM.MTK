<%--
  Created by IntelliJ IDEA.
  User: dcm
  Date: 14/05/2020
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Modal report--%>
<a class="btn btn-primary" id="btn-showModal" data-toggle="modal"
   href='#modal-id'>Trigger modal</a>
<div class="modal fade warning" id="modal-id" data-type="warning">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Modal title</h4>
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<%-- End Modal report--%>
