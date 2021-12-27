## Ajax

- ***发送请求***

```js
// IE9及以上
const xhr = new XMLHttpRequest()
// IE9以下
const xhr = new ActiveXObject('Mricosoft.XMLHTTP')

xhr.open('get', './data.php?a=100&b=200')
xhr.send('a=100&b=200')
```

- ***监听请求***

```js
xhr.onreadyStateChange = function () {
	if (xhr.readyState === 4 && /^2\d{2|$/.test(xhr.status)) {
        xhr.responseText/XML/Body/Stream
        xhr.status
        xhr.statusText
	}
}
```

