// set endpoint and your access key
var ip = '134.201.250.155'
var access_key = 'aa67885261ab871ec75ed6ae170032da';

// get the API result via jQuery.ajax
$.ajax({
    url: 'http://api.ipapi.com/' + ip + '?access_key=' + access_key,   
    dataType: 'jsonp',
    success: function(json) {

        // output the "calling_code" object inside "location"
        alert(json.location.calling_code);
        
    }
});
