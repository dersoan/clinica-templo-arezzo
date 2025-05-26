# 🚀 HOSTINGER - Passos Práticos

## 📥 **Arquivos para Download**

Baixe estes arquivos do Replit (botão "Download" no explorador de arquivos):

### **Essenciais:**
1. **`package-hostinger.json`** → renomear para `package.json`
2. **`.env.example`** → configurar e renomear para `.env`
3. **`HOSTINGER_DEPLOY.md`** → instruções completas
4. **Pasta `dist/`** (quando o build terminar)

### **Configuração:**
- **`drizzle.config.ts`** → para migrações do banco

## 🔧 **Hostinger - Passo a Passo**

### **1. Login no cPanel Hostinger**
- Acesse sua conta
- Vá em "Node.js Selector"

### **2. Criar Aplicação Node.js**
- **Create Application**
- **Node Version:** 18.x ou 20.x
- **Application root:** `/public_html/clinica_app`
- **Startup file:** `dist/index.js`

### **3. Upload dos Arquivos**
Via File Manager:
- Upload `dist/` → `/public_html/clinica_app/`
- Upload `package.json` 
- Upload `.env` (configurado)

### **4. Terminal Node.js**
No cPanel, abra terminal da aplicação:
```bash
npm install
npm run db:push
```

### **5. Configurar PostgreSQL**
- cPanel → PostgreSQL Databases
- Criar: `clinica_arezzo`
- Usuário com todas permissões
- Copiar credenciais para .env

### **6. Iniciar Aplicação**
- Node.js Selector → Restart
- Testar: `https://seudominio.com`

## ⚙️ **Configuração .env**

```env
DATABASE_URL=postgresql://user:pass@localhost:5432/clinica_arezzo
SESSION_SECRET=sua_chave_aleatoria_muito_longa
NODE_ENV=production
```

## ✅ **Teste Final**
- Login funciona: AdminMaster / AdminMaster123
- Vouchers: TESTE001, TESTE002
- Ranking aparece

**Tempo estimado: 30-45 minutos**