## Observable

```ts
//🚗Definition
new Observable((subs)=>{})
fromEvent(ele,'click')
of(...args)
form([])
interval(1000)
//🚗Execution
obs.subscribe(observer)
obs.unsubscribe(observer)
//🚗Pipe
obs.pipe(map(),filter())
```

## Observer

```ts
//🚗Constructor
next()
error() => complete()
```