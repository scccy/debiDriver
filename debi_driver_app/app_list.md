# 后端接口清单

## 1. 用户认证相关

- `POST /api/auth/login`  
  用户登录

- `POST /api/auth/register`  
  用户注册

- `POST /api/auth/forgot-password`  
  忘记密码/重置密码

---

## 2. 车牌管理

- `POST /api/plate/add`  
  添加车牌

- `GET /api/plate/list?userId=xxx`  
  获取用户车牌列表

- `DELETE /api/plate/delete`  
  删除车牌

---

## 3. 阶段/打卡/提醒

- `GET /api/stage/list?userId=xxx`  
  获取阶段列表

- `POST /api/mark`  
  阶段打卡

- `GET /api/mark/history?userId=xxx`  
  获取打卡历史

- `POST /api/remind`  
  设置提醒

- `GET /api/remind/list?userId=xxx`  
  获取提醒列表

---

## 4. 聊天/语音

- `GET /api/chat/history?userId=xxx`  
  获取聊天记录

- `POST /api/chat/send`  
  发送消息

---

## 5. 用户设置

- `GET /api/user/info?userId=xxx`  
  获取用户信息

- `POST /api/user/update`  
  修改用户信息 