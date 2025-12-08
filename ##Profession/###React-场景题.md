## 场景题

1. React如何优雅处理CS

2. React动画方案有哪些
3. 在React中组件间过渡动画如何实现？
4. ReactHookForm相比传统表单优势
5. 如何实现一个受保护的路由（Protected Route）？
6. 什么是错误边界（Error Boundaries）？如何实现？
7. 说说你在React项目是如何捕获错误的？
8. 如何用 useContext + useReducer实现一个轻量级的状态管理器？
9. 如何在 React 中实现状态的持久化存储？
10. 你用过哪些工具来定位 React 应用的性能瓶颈？
11. 如何优化一个长列表的渲染性能？（虚拟列表）
12. 谈谈代码分割在 React 中的实现方式
13. 用户如何根据不同的权限，查看不同的页面
14. 如果不使⽤脚⼿架， 如果⽤ webpack 构建⼀个⾃⼰的 react 应⽤

## 原理题

1. 从0到1实现 React Fiber

   ```shell
   # requestAnimationFrame + requestIdleCallback + linkedList
   ```

2. 手写Render

3. 为什么需要Fiber


1. Fiber的可中断数据结构

2. React HOC详解

3. HOC实现方式——属性代理

4. HOC实现方式——反向继承

5. 属性代理和反向继承对比

6. Redux 工作原理

7. React-Router 工作原理

8. Fiber 更新机制

9. React 渲染流程

10. 如何实现专场动画？

11. Next Rendering

    ```shell
    # Static Render
    - Build/Revalidate
    # Dynamic Render
    - Request
    # Partial PreRendering
    - Static + Streaming
    ```

12. Next Partial Rendering

    ```shell
    HTML+StreamingHTML
    ```

13. Next Streaming

    ```shell
    # SingleHTTP
    Generate => Parallel 
    ```

14. Next SPAs

    ```shell
    # SPAs
    - CSR (HeavyJS > Single HTML)
    - SingleHTML (No Refresh)
    # Next SPAs
    - CSR (MultiJS > Multi HTML)
    - MultiHTML (Prefetch)
    ```

15. Next ClientCpt

    ```shell
    # ClientCpt
    - Html (server)
    - JS (client)
    ```

## API

1. react-router 和 原⽣路由区别
2. React Hooks
3. 数据如何在 React 组件中流动
4. Fragments
5. React 的设计思想
6. JSX是什么，它和 JS 有什么区别？
7. React组件为什么不能返回多个元素
8. 简述React的生命周期
9. React 的常用组件
10. 说说对React的理解？有哪些特性？
11. state 和 props 有什么区别
12. super（）和super（props）有什么区别
13. 说说对React中类组件和函数组件的理解？有什么区别？
14. 说说对受控组件和非受控组件的理解？应用场景？
15. 说说React的事件机制？
16. React事件绑定的方式有哪些？区别？
17. React构建组件的方式有哪些？区别？
18. 说说React中引入CSS的方式有哪几种？区别？
19. 说说React生命周期有哪些不同阶段？每个阶段对应的方法是？
20. React中组件之间如何通信？
21. 说说对高阶组件的理解？应用场景？
22. 受控组件和非受控组
23. 什么是UI = f(state)
24. 虚拟DOM（Virtual DOM）到底是什么？它解决了哪些问题
25. Vite 相比 Webpack 快在哪里？为什么它正成为新项目的首选
26. 函数组件和类组件的本质区别是什么
27. React 为什么强调 Props 的不可变性
28. useState 的函数式更新有什么好处
29. useEffect 的执行时机是什么？和 useLayoutEffect 有何区别
30. 深入剖析 `useEffect` 依赖项：从原理到面试实战
31. 如何在 useEffect 中正确处理异步请求和避免竞态条件
32. 如何优化 `useContext` 导致的性能问题
33. `useReducer` 和 `useState` 相比，优势在哪里？应该如何选型
34. 什么时候应该使用 `useCallback` 和 `useMemo`？滥用有什么后果
35. `useRef` 有哪些常见用途？它和 `useState` 的根本区别是
36. `forwardRef` 和 `useImperativeHandle` 是用来解决什么问题的？
37. 讲讲 React 18 的 `useId` 如何解决 SSR 和可访问性问题。
38. 如何解释 React 18 的并发特性（Concurrency）？
39. `useTransition` 和 `useDeferredValue` 如何优化用户体验？区别是？
40. 你如何理解组件的“单一职责原则”？
41. 容器组件 vs. 展示组件模式在 Hooks 时代还有意义吗？
42. 为什么说在React中应该“组合优于继承”
43. 如果让你设计一个组件库，你会考虑哪些方面？
44. 谈谈你对原子设计（Atomic Design）的理解
45. React 项目中，你是如何做状态管理选型的？
46. “状态提升”的优缺点是什么？它的边界在哪里？
47. Redux Toolkit (RTK) 相比传统 Redux 解决了哪些痛点？
48. 讲讲 RTK Query 如何简化数据获取和缓存逻辑。
49. 你了解 Zustand、Jotai 这类新兴状态管理库吗？它们有什么特点？
50. 为什么 Immer.js 在 Redux 生态中如此重要？
51. 服务端状态和客户端状态有什么区别？为什么需要 SWR、React Query？
52. Redux 的中间件（Middleware）机制是如何工作的？
53. 你还知道哪些 React 性能优化的具体手段？
54. 解释一下服务端渲染（SSR）的工作流程和优缺点
55. Next.js 的 SSR, SSG, ISR 有什么区别？
56. 什么是 Hydration（注水）？React 18 对它做了哪些优化？
57. 你是如何理解 React Testing Library 的测试理念的？
58. 如何测试一个自定义 Hook？
59. 如何 Mock 一个 API 请求来进行前端测试？
60. 说说对React refs 的理解？应用场景？
61. 说说React中的setState执行机制
62. 说说React render方法的原理？在什么时候会被触发？
63. 说说Real DOM和Virtual DOM的区别？优缺点？
64. 说说React Jsx转换成真实DOM过程？
65. React.createClass VS extends Component
66. React 事件 与普通的HTML事件有什么区别
67. 受挫组件和非受挫组件
68. useState要使用数组而非对象？
69. React refs
70. 为什么要使用Hooks
71. 如何避免不必要的渲染?
72. 从 React 层⾯上， 能做的性能优化有哪些？