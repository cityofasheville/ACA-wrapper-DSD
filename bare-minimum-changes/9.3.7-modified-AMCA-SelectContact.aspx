<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AMCA/MobileACA.master" CodeBehind="SelectContact.aspx.cs" Inherits="Accela.AMCA.Web.AMCA.SelectContact" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="Content1">
    <div ng-controller="SelectContactController" ng-init="init({ contactJson: '<%= ContactJson%>', comments: '<%= Comments%>', requestUrl: '<%=Request.Url.Query%>' })">
        <h4 class="page-title">Schedule Inspection</h4>
        <!--Record Detail-->
        <div class="panel panel-default panel-top">
            <div class="panel-body">
                <div class="form-group">
                    <label>Record Number</label>
                    <div>
                        <span><%=RecordId %></span>
                    </div>
                </div>
                <div class="form-group">
                    <label>Inspection Type</label>
                    <div>
                        <span><%=InspectionType %></span>
                    </div>
                </div>

                <% if (!string.IsNullOrWhiteSpace(Address))
                   { %>
                <div class="form-group">
                    <label>Location</label>
                    <div>
                        <span><%=Address %></span>
                    </div>
                </div>
                <% } %>

                <hr />

                <div class="form-group">
                    <label>Date</label>
                    <div>
                        <span><%=Date %></span>
                    </div>
                </div>
                <div class="form-group">
                    <label>Time</label>
                    <div>
                        <span><%=Time %></span>
                    </div>
                </div>
            </div>
        </div>
        <!--Contact Info-->
        <div class="panel panel-default" id="inspection-contact">
            <div class="panel-body">
                <label>Contact Information <span class="hint-text">Required</span></label>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="First Name" ng-model="contact.firstName" />
                </div>
                <div class="form-group hidden">
                    <input type="text" class="form-control" placeholder="Middle Name" ng-model="contact.middleName" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Last Name" ng-model="contact.lastName" />
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-5">
                            <input type="text" id="phoneAreaCode" class="form-control" placeholder="Area Code" ng-model="contact.phoneAreaCode" />
                        </div>
                        <div class="col-xs-7">
                            <input type="text" id="phoneNumber" class="form-control" placeholder="Phone Number" ng-model="contact.phoneNumber" />
                        </div>
                    </div>
                </div>                                
                <div ng-show="updateContactResult.show" class="alert updatecontactresult-msg" ng-class="{'alert-success': updateContactResult.isSuccess == true , 'alert-danger': updateContactResult.isSuccess == false}" ><i ng-class="{'ico-checkmark-circle2': updateContactResult.isSuccess == true , 'ico-warning2': updateContactResult.isSuccess == false}"></i>&nbsp;<span class="msg">{{updateContactResult.text}}</span></div>
            </div>
            <div class="panel-footer">
                <div class="rec-row">
                    <div class="col-cell">
                        <a href="javascript:void(0);" ng-click="saveContact()">Update</a>
                    </div>
                    <div class="col-cell">
                        
                    </div>
                </div>
            </div>
        </div>
        <!--Comments-->
        <div class="panel panel-default">
            <div class="panel-body">
                <label>Comments <span class="hint-text">Optional</span></label>
                <div class="form-group">
                    <textarea class="form-control" placeholder="Tap to add" ng-model="comments"></textarea>
                </div>
            </div>
        </div>

        <div class="page-footer">
            <div id="add-contact-info" style="padding: 1em; color: red;">Please add contact information before scheduling inspection.</div>
            <button class="btn btn-primary btn-lg" ng-click="saveInspection()">Schedule Inspection</button>
            <script>
                function areInputsFilledOut(inputsToCheck) {
                    for (var i = 0; i < inputsToCheck.length; i++) {
                        if (inputsToCheck[i].value.length < 1) {
                            return false;
                        }
                    }
                    return true;
                }
                function toggleButton(inputsAreFilled, button, reminder) {
                    if (!inputsAreFilled) {
                        // disable the button by adding attribute "disabled"
                        button.disabled = true;
                        reminder.className = '';
                    } else {
                        button.disabled = false;
                        reminder.className = 'hidden';
                    }
                }
                document.addEventListener("DOMContentLoaded", function() {
                    var pageFooterSubmitButton = document.querySelector('.page-footer button.btn')
                    var contactInputs = Array.from(document
                        .getElementById('inspection-contact')
                        .getElementsByTagName('input')
                        ).filter(function(thisInput) {
                            // all inputs except ones with class hidden (because who needs a middle name)
                            return thisInput.parentNode.className.indexOf('hidden') === -1;
                        })
                    var addInfoReminder = document.getElementById('add-contact-info');

                    // on initial load, deactivate button until all inputs have text
                    var initialFilledInputs = areInputsFilledOut(contactInputs);
                    toggleButton(initialFilledInputs, pageFooterSubmitButton, addInfoReminder)


                    for (var contactIndex = 0; contactIndex < contactInputs.length; contactIndex++) {
                        var thisInput = contactInputs[contactIndex];
                        thisInput.addEventListener('keyup', function() {
                            var filledInputs = areInputsFilledOut(contactInputs);
                            toggleButton(filledInputs, pageFooterSubmitButton, addInfoReminder)
                        })
                    }
                })
            </script>
        </div>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="JavascriptContentPlaceHolder" runat="server" ID="Content2">
    <script src="Asset/js/Controllers/SelectContactController.js" type="text/javascript"></script>
</asp:Content>
