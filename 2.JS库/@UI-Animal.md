## Motion

```ts
// npm: motion
import { motion } from "motion/react"
```

#### EnterLeave

```jsx
<motion.button 
  initial={{ scale: 0 }} 
  animate={{ scale: 1 }} 
/>
```

#### Gesture

```jsx
<motion.button
  whileHover={{ scale: 1.1 }}
  whileTap={{ scale: 0.95 }}
  onHoverStart={() => console.log('hover started!')}
/>
```

#### Scroll

```jsx
<motion.div
  initial={{ backgroundColor: "rgb(0, 255, 0)", opacity: 0 }}
  whileInView={{ backgroundColor: "rgb(255, 0, 0)", opacity: 1 }}
/>
```

#### Layout



