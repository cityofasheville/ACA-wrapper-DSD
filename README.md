# ACA-wrapper-DSD

## mmazanec22 2018
Changed files to make Accela Citizen Access more usable.

### Other files changed on server (not in this repo)
File,Change
AMCA/Loginm.aspx, Line 12 from placeholder="Username" to <input type="text" class="form-control txtlogin" id="userName" placeholder="Email Address" runat="server" />
ACMA/Asset/js/Controllers/SelectDateController, add $scope.selectedTime = data[0].Item1; to line 141 in getTimes function
AMCA/SelectDateTime.aspx, delete "to see a time" from "choose a date" header


## bitslayer42 2023
Google Analytics GA4 format

C:\inetpub\wwwroot\CitizenAccess\Default.master

jw- When I compared files July 2023, PROD files taken from the server matched the files marked "modified". I moved everything to older_versions dir.
Now the latest production files Asheville.aspx and Default.master are in the root of this repo.
