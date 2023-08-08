> npm i antd -S

~~~js
import {Table} from 'antd'
import 'antd/dist/antd.css'
~~~

## 组件

#### Table

~~~js
<Table
	dataSource
	columns	//{title,dataIndex,key}
	rowKey
><Table>
// 页码
pagination:
  defaultCurrent
  pageSize
  total
  onChange(current,pageSize)
~~~

