[](#Swagger-PHP-的基本语法 "Swagger-PHP 的基本语法")Swagger-PHP 的基本语法
-----------------------------------------------------------

#### [](#参考文档 "参考文档")参考文档

*   [Swagger-Annotations](http://zircote.com/swagger-php/1.x/index.html)
*   [Swagger-Explained](http://bfanger.nl/swagger-explained/)

#### [](#常用属性 "常用属性")常用属性

红色为必写的字段，蓝色为封装的字段。

*   @SWG\\Swagger  
    \- swagger  
    \- info: @SWG\\Info  
    \- host - 接口域名  
    \- basePath - 接口前缀路径  
    \- schemes: \[“http”, “https”, “ws”, “wss”\]  
    \- consumes - 请求 Mime Types  
    \- produces - 响应 Mime Types  
    \- paths: @SWG\\Path
*   @SWG\\Info
    *   title - 文档标题
    *   description - 文档描述
    *   termsOfService - 所属团队
    *   contact: @SWG\\Contact - 联系方式
*   @SWG\\Contact
    *   url - 联系链接
    *   name - 联系名称
    *   email - 联系邮箱
*   @SWG\\License
    *   name - 开源许可证
    *   url - 许可证地址
*   @SWG\\Path
    *   get: @SWG\\Get - HTTP Get 请求
    *   put: @SWG\\Put - HTTP Put 请求
    *   post: @SWG\\Post - HTTP Post 请求
    *   delete: @SWG\\Delete - HTTP Delete 请求
    *   options: @SWG\\Options - HTTP Options 请求
*   @SWG\\GET
    *   tags - 请求分类
    *   summary - 请求简介
    *   description - 请求描述
    *   operationId - 请求编号，要求唯一
    *   consumes - 请求 Mime Types
    *   produces - 响应 Mime Types
    *   parameters: @SWG\\Parameter - 请求参数
    *   responses: @SWG\\Response - 请求响应
    *   schemes: \[“http”,”https”,”ws”,”wss”\] - 请求协议
    *   deprecated - 是否弃用
*   @SWG\\Parameter
    *   name - 请求参数名称
    *   in: \[“query”,”header”,”path”,”formData”,”body”\] - 请求参数存放方式
    *   description - 请求参数描述
    *   required - 是否要求
    *   schema - 当 `in` 为 `body` 时可以使用，用于描述参数
    *   type: \[“string”, “number”, “integer”, “boolean”, “array”, “file”\] - 请求参数类型
    *   format: \[“int32”, “int64”, “float”, “double”, “byte”, “date”, “date-time”\] - 请求参数格式
    *   allowEmptyValue - 是否允许空值
    *   items - 当 `type` 为 `array`,`items` 为 `required`，描述参数数组
    *   collectionFormat
    *   default - 请求参数默认值
*   @SWG\\Response  
    \- default  
    \- response object  
    \- description - 响应描述  
    \- schema: @SWG\\Schema  
    \- headers: @SWG\\Header - 响应头部  
    \- example: @SWG\\Example - 响应数据例子  
    \- reference object  
    \- $ref  
    \- HTTP Status Code  
    \- response object  
    \- description  
    \- schema: @SWG\\Schema  
    \- headers: @SWG\\Header  
    \- example: @SWG\\Example  
    \- reference object  
    \- $ref
*   @SWG\\Definition  
    \- definition  
    \- required  
    \- @SWG\\Property
*   @SWG\\Property
    *   property - 模型成员属性
    *   type: \[“string”, “number”, “integer”, “boolean”, “array”, “file”\] - 模型参数类型
    *   format: \[“int32”, “int64”, “float”, “double”, “byte”, “date”, “date-time”\] - 模型参数格式
*   @SWG\\Header
    *   header - 头部名称
    *   type - 头部数值类型
    *   description - 头部简介

[](#模块文件上使用 "模块文件上使用")模块文件上使用
-----------------------------

打开文件 `api/modules/v1/module.php`，添加代码如下：  


```


  v1 module definition class

 

  @SWG\\Swagger(

    swagger="2.0",

    @SWG\\Info(

       title="安乐窝商品库 API(标题)",

       description="安乐窝商品库 API(描述)",

       termsOfService="安乐窝开发团队",

       version="1.0.0(版本号)",

       @SWG\\Contact(

           email="2794408425@qq.com(邮件)",

           name="安乐窝(联系称呼)",

           url="http://api.app/v1/swagger-ui/dist/index.html"

       ),

       @SWG\\License(

           name="MIT",

           url="http://github.com/gruntjs/grunt/blob/master/LICENSE-MIT"

       ),

   ),

   host="api.app/",

   basePath="v1/",

   schemes={"http"},

   produces={"application/json"},

   consumes={"application/json"},

       @SWG\\Definition(

           definition="ErrorModel",

           required={"code", "message"},

           @SWG\\Property(

               property="code",

               type="integer",

               format="int32"

           ),

           @SWG\\Property(

               property="message",

               type="string"

           )

       ),

  )

```  

上述代码生成文档时的效果如下图：

[![](http://o93kt6djh.bkt.clouddn.com/swagger-php-module.png)](http://o93kt6djh.bkt.clouddn.com/swagger-php-module.png)

[](#控制器文件上使用 "控制器文件上使用")控制器文件上使用
--------------------------------

打开文件 `api/modules/v1/controllers/MenuController.php`  


```   

  @SWG\\Get(

      path="/menu",

      tags={"菜单接口"},

      description="获取菜单列表",

      operationId="menu/index",

      @SWG\\Parameter(

          name="access-token",

          in="query",

          description="Access Token",

          required=true,

          type="string",

          default="HelloWorld"

      ),

      @SWG\\Response(

           response=200,

           description="Success Response",

           @SWG\\Header(header="x-pagination-per-page", type="string", description="Per Page"),

           @SWG\\Header(header="x-pagination-page-count", type="string", description="Page Count"),

           @SWG\\Header(header="x-pagination-total-count", type="string", description="Total Count"),

           @SWG\\Header(header="x-pagination-current-page", type="string", description="Current Page"),

           @SWG\\Schema(

               @SWG\\Property(

                   property="items",

                   type="array",

                   @SWG\\Items(

                       type="object",

                       @SWG\\Property(property="id", type="integer", example=1),

                       @SWG\\Property(property="name", type="string", example="权限管理"),

                       @SWG\\Property(property="route", type="string", example="/admin/permission/index")

                   )

               ),

               @SWG\\Property(

                   property="\_links",

                   type="object",

                   @SWG\\Property(

                       property="self",

                       type="object",

                       @SWG\\Property(

                           property="href", type="string", example="http://api.app/v1/menu?access-token=HelloWorld&page=1"

                       )

                   ),

               ),

               @SWG\\Property(

                   property="\_meta",

                   type="object",

                   @SWG\\Property(property="totalCount", type="integer", example=20),

                   @SWG\\Property(property="pageCount", type="integer", example=1),

                   @SWG\\Property(property="currentPage", type="integer", example=1),

                   @SWG\\Property(property="perPage", type="integer", example=20),

               )

           )

       ),

       @SWG\\Response(

          response="404",

          description="HTTP 404 Error",

          @SWG\\Schema(ref="#/definitions/ErrorModel")

       ),

      @SWG\\Response(

          response="500",

          description="HTTP 500 Error",

          @SWG\\Schema(ref="#/definitions/ErrorModel")

      )

  )

 



  @SWG\\Post(

      path="/menu",

      tags={"菜单接口"},

      operationId="menu/create",

      description="新增菜单",

      @SWG\\Parameter(

          name="body",

          in="body",

          description="新增菜单所需的参数",

          required=true,

          @SWG\\Schema(ref="#/definitions/MenuModel")

      ),

      @SWG\\Parameter(

          in="query",

          name="access-token",

          default="HelloWorld",

          description="Access-Token",

          required=true,

          type="string",

          format="string"

      ),

      @SWG\\Response(

           response=201,

           description="pet response",

           @SWG\\Schema(

               type="object",

               @SWG\\Property(property="id", type="integer", example=1),

               @SWG\\Property(property="name", type="string", example="歪理兔"),

               @SWG\\Property(property="route", type="string", example="/admin/very/too"),

           )

      ),

      @SWG\\Response(

          response="default",

          description="unexpected error",

          @SWG\\Schema(ref="#/definitions/ErrorModel")

      )

  )

```

上述代码生成文档时的效果如下图：

[![](http://o93kt6djh.bkt.clouddn.com/swagger-php-controller1.png)](http://o93kt6djh.bkt.clouddn.com/swagger-php-controller1.png)

[](#模型文件上使用 "模型文件上使用")模型文件上使用
-----------------------------

```

  @SWG\\Definition(

       definition="MenuModel",

       required={"id", "name", "route"},

       @SWG\\Property(

           property="id",

           type="integer",

           format="int32"

       ),

       @SWG\\Property(

           property="name",

           type="string"

       ),

       @SWG\\Property(

           property="route",

           type="string"

       ),

       @SWG\\Property(

           property="parent",

           type="integer"

       ),

       @SWG\\Property(

           property="order",

           type="integer"

       ),

       @SWG\\Property(

           property="data",

           type="string"

       )

  )

```