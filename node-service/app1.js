const express = require('express');
const mysql = require('mysql2');
const { NacosNamingClient } = require("nacos");

const app = express();
const port = 3000;
app.use(express.json());

// MySQL 连接配置
const db = mysql.createConnection({
    host: '127.0.0.1',
    port: 3300,
    user: 'root',
    password: 'chen1129',
    database: 'testdb'
});

db.connect((err) => {
    if (err) throw err;
    console.log('MySQL connected...');
});

// Nacos 注册
const client = new NacosNamingClient({
  serverList: "127.0.0.1:8848", // Nacos 服务地址
  namespace: "public", // 命名空间，如果有
  username: "nacos", // 用户名，可选
  password: "nacos", // 密码，可选
  logger: console, // 日志输出
});


// 获取所有用户
app.get('/user', (req, res) => {
    const sql = 'SELECT * FROM t_user';
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// 获取单个用户
app.get('/user/:id', (req, res) => {
    const sql = 'SELECT * FROM t_user WHERE id = ?';
    db.query(sql, [req.params.id], (err, result) => {
        if (err) throw err;
        res.json(result[0]);
    });
});

// 创建用户
app.post('/user', (req, res) => {
    const { name, email } = req.body;
    const sql = 'INSERT INTO t_user (name, email) VALUES (?, ?)';
    db.query(sql, [name, email], (err, result) => {
        if (err) throw err;
        res.json({ id: result.insertId, name, email });
    });
});

// 更新用户
app.put('/user/:id', (req, res) => {
    const { name, email } = req.body;
    const sql = 'UPDATE t_user SET name = ?, email = ? WHERE id = ?';
    db.query(sql, [name, email, req.params.id], (err, result) => {
        if (err) throw err;
        res.json({ id: req.params.id, name, email });
    });
});

// 删除用户
app.delete('/user/:id', (req, res) => {
    const sql = 'DELETE FROM t_user WHERE id = ?';
    db.query(sql, [req.params.id], (err, result) => {
        if (err) throw err;
        res.json({ message: '删除成功' });
    });
});

// 启动服务
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
  