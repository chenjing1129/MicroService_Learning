const express = require("express");
const { NacosNamingClient } = require("nacos");

// 创建 Express 应用
const app = express();
const port = 3000;

// 创建 Nacos 客户端
const client = new NacosNamingClient({
  serverList: "127.0.0.1:8848", // Nacos 服务地址
  namespace: "public", // 命名空间，如果有
  username: "nacos", // 用户名，可选
  password: "nacos", // 密码，可选
  logger: console, // 日志输出
});

// 允许解析 JSON 请求体
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// 创建一个接口，接收用户输入并返回用户输入的内容
app.get("/greeting", (req, res) => {
  const userInput = req.query.user; // 获取导航栏输入的内容
  if (!userInput) {
    return res.status(400).send("No input provided");
  }
  res.send(`调用Node.js服务，问好：Hello，${userInput}`);
});

// 启动 HTTP 服务
app.listen(port, async () => {
  console.log(`[Node.js] 服务已启动，监听端口: ${port}`);

  try {
    await client.ready(); // 等待 Nacos 客户端初始化完成
    const serviceName = "node-service"; // 服务名称
    const ip = "127.0.0.1"; // 服务实例 IP，实际部署时可以使用动态获取

    // 注册服务实例到 Nacos
    await client.registerInstance(serviceName, {
      ip,
      port,
      metadata: {
        componentName: "nodejs-app",
        address: `${ip}:${port}`,
      },
    });

    console.log(`[Nacos] 服务实例注册成功: ${ip}:${port}`);
  } catch (err) {
    console.error("[Nacos] 服务实例注册失败:", err);
  }
});
