## 场景题

- React如何优雅处理CSS


- React动画方案有哪些
- 在React中组件间过渡动画如何实现？
- ReactHookForm相比传统表单优势
- 如何实现一个受保护的路由（Protected Route）？
- 什么是错误边界（Error Boundaries）？如何实现？
- 说说你在React项目是如何捕获错误的？
- 如何用 useContext + useReducer实现一个轻量级的状态管理器？
- 如何在 React 中实现状态的持久化存储？
- 你用过哪些工具来定位 React 应用的性能瓶颈？
- 如何优化一个长列表的渲染性能？（虚拟列表）
- 谈谈代码分割在 React 中的实现方式
- 用户如何根据不同的权限，查看不同的页面
- 如果不使⽤脚⼿架， 如果⽤ webpack 构建⼀个⾃⼰的 react 应⽤

## 原理题

1. 从0到1实现 React Fiber

2. 手写Render

3. 为什么需要Fiber

4. Fiber的可中断数据结构

5. React HOC详解

6. HOC实现方式——属性代理

7. HOC实现方式——反向继承

8. 属性代理和反向继承对比

9. Redux 工作原理

10. React-Router 工作原理

11. Fiber 更新机制

12. React 渲染流程

13. 如何实现专场动画？

14. Next Rendering

    ```shell
    # Static Render
    - Build/Revalidate
    # Dynamic Render
    - Request
    # Partial PreRendering
    - Static + Streaming
    ```

15. Next Partial Rendering

    ```shell
    HTML+StreamingHTML
    ```

16. Next Streaming

    ```shell
    # SingleHTTP
    Generate => Parallel
    ```

## API

- react-router 和 原⽣路由区别
- React Hooks
- 数据如何在 React 组件中流动
- Fragments
- React 的设计思想
- JSX是什么，它和 JS 有什么区别？
- React组件为什么不能返回多个元素
- 简述React的生命周期
- React 的常用组件
- 说说对React的理解？有哪些特性？
- state 和 props 有什么区别
- super（）和super（props）有什么区别
- 说说对React中类组件和函数组件的理解？有什么区别？
- 说说对受控组件和非受控组件的理解？应用场景？
- 说说React的事件机制？
- React事件绑定的方式有哪些？区别？
- React构建组件的方式有哪些？区别？
- 说说React中引入CSS的方式有哪几种？区别？
- 说说React生命周期有哪些不同阶段？每个阶段对应的方法是？
- React中组件之间如何通信？
- 说说对高阶组件的理解？应用场景？
- 受控组件和非受控组
- 什么是UI = f(state)
- 虚拟DOM（Virtual DOM）到底是什么？它解决了哪些问题
- Vite 相比 Webpack 快在哪里？为什么它正成为新项目的首选
- 函数组件和类组件的本质区别是什么
- React 为什么强调 Props 的不可变性
- useState 的函数式更新有什么好处
- useEffect 的执行时机是什么？和 useLayoutEffect 有何区别
- 深入剖析 `useEffect` 依赖项：从原理到面试实战
- 如何在 useEffect 中正确处理异步请求和避免竞态条件
- 如何优化 `useContext` 导致的性能问题
- `useReducer` 和 `useState` 相比，优势在哪里？应该如何选型
- 什么时候应该使用 `useCallback` 和 `useMemo`？滥用有什么后果
- `useRef` 有哪些常见用途？它和 `useState` 的根本区别是
- `forwardRef` 和 `useImperativeHandle` 是用来解决什么问题的？
- 讲讲 React 18 的 `useId` 如何解决 SSR 和可访问性问题。
- 如何解释 React 18 的并发特性（Concurrency）？
- `useTransition` 和 `useDeferredValue` 如何优化用户体验？区别是？
- 你如何理解组件的“单一职责原则”？
- 容器组件 vs. 展示组件模式在 Hooks 时代还有意义吗？
- 为什么说在React中应该“组合优于继承”
- 如果让你设计一个组件库，你会考虑哪些方面？
- 谈谈你对原子设计（Atomic Design）的理解
- React 项目中，你是如何做状态管理选型的？
- “状态提升”的优缺点是什么？它的边界在哪里？
- Redux Toolkit (RTK) 相比传统 Redux 解决了哪些痛点？
- 讲讲 RTK Query 如何简化数据获取和缓存逻辑。
- 你了解 Zustand、Jotai 这类新兴状态管理库吗？它们有什么特点？
- 为什么 Immer.js 在 Redux 生态中如此重要？
- 服务端状态和客户端状态有什么区别？为什么需要 SWR、React Query？
- Redux 的中间件（Middleware）机制是如何工作的？
- 你还知道哪些 React 性能优化的具体手段？
- 解释一下服务端渲染（SSR）的工作流程和优缺点
- Next.js 的 SSR, SSG, ISR 有什么区别？
- 什么是 Hydration（注水）？React 18 对它做了哪些优化？
- 你是如何理解 React Testing Library 的测试理念的？
- 如何测试一个自定义 Hook？
- 如何 Mock 一个 API 请求来进行前端测试？
- 说说对React refs 的理解？应用场景？
- 说说React中的setState执行机制
- 说说React render方法的原理？在什么时候会被触发？
- 说说Real DOM和Virtual DOM的区别？优缺点？
- 说说React Jsx转换成真实DOM过程？
- React.createClass VS extends Component
- React 事件 与普通的HTML事件有什么区别
- 受挫组件和非受挫组件
- useState要使用数组而非对象？
- React refs
- 为什么要使用Hooks
- 如何避免不必要的渲染?
- 从 React 层⾯上， 能做的性能优化有哪些？