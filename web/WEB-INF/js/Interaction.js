function HttpPost(url, data, whenDone, whenErr) {
    var xhr = new XMLHttpRequest();
    // xhr.open("POST", "/manage/engineer/new", true);
    // xhr.open("POST", "/manage/engineer/update", true);
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            console.log('status code: ' + xhr.status);
            if (xhr.status == 200) {
                console.log('POST succeeded!!!')
                layer.close(layer.index)
                whenDone();
            }
            else if (xhr.status == 500) {
                console.log('POST failed!!! Server Internal Error');
                whenErr('server_internal_err');
            }
            else if (xhr.status != 148) {
                console.log('POST failed!!! Data Format Error');
                whenErr('data_format_err');
            }
            else {
                whenErr('unknown_err');
            }
        }
    };
    xhr.send((JSON.stringify(data.field)));
    console.log((JSON.stringify(data.field)));
    console.log(encodeURI(JSON.stringify(data.field)));
}

function HttpGet(url, whenDone, whenErr) {
    console.log("Now in HTTPGet!!")
    var xhr = new XMLHttpRequest();
    xhr.open("GET", url);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            console.log('status code: ' + xhr.status);
            if (xhr.status == 200) {
                console.log('GET succeeded!!!')
                whenDone();
            }
            else if (xhr.status == 500) {
                console.log('GET failed!!! Server Internal Error');
                whenErr('server_internal_err');
            }
            else if (xhr.status == 148) {
                console.log('GET failed!!! Data Format Error');
                whenErr('data_format_err');
            }
            else {
                whenErr('unknown_err');
            }
        }
    };
    xhr.send(null);
}
