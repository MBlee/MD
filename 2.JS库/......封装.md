#### 获取鼠标位置

```js
function getMouse(ele){
    var mouse = {x:0,y:0}
    addEvent(ele,"mousemove",e=>{
        mouse.x = e.clientX + document.body.scrollLeft -ele.offsetLeft
        mouse.y = e.clientY + document.body.scrollTop -ele.offsetTop
    })
    return mouse
}
```

#### 获取键盘

```js
function getKey(){
	var key = {}
    window.addEventListener('keydown',(e=>{
        e.keyCode
    },false)
	return key
}
```

#### 随机色

```js
function getRandomColor(){
    return '#'+
    (function(c){
		return c+='123abc'[Math.floor(Math.random()*16)] && c.length<6?
            arguments.callee(c):
        	c
    }
    )('')
}
```

