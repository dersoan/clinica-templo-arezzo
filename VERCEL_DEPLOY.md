# 🚀 Deploy GRATUITO - Vercel + Neon

## 🎯 **Por que Vercel?**
- ✅ **100% Gratuito**
- ✅ **Deploy automático via GitHub** 
- ✅ **SSL/HTTPS incluído**
- ✅ **Domínio personalizado grátis**
- ✅ **Zero configuração de servidor**

## 📋 **Passo a Passo Completo**

### **1. Criar Conta GitHub (se não tiver)**
- Acesse: https://github.com
- Criar conta gratuita

### **2. Criar Repositório**
- GitHub → "New Repository"
- Nome: `clinica-templo-arezzo`
- Public (para plano gratuito)
- Create Repository

### **3. Upload dos Arquivos**
- Baixe todos arquivos do Replit
- Upload no GitHub via drag & drop:
  - `dist/` (pasta completa)
  - `package.json`
  - `vercel.json`
  - `drizzle.config.ts`

### **4. Banco PostgreSQL Grátis - Neon**
- Acesse: https://neon.tech
- Sign up with GitHub
- Create Project: `clinica-arezzo`
- Copie a **DATABASE_URL**

### **5. Deploy no Vercel**
- Acesse: https://vercel.com
- Login with GitHub
- Import Project → escolha seu repositório
- Configure Environment Variables:
  ```
  DATABASE_URL = sua_url_do_neon
  SESSION_SECRET = chave_aleatoria_longa
  NODE_ENV = production
  ```

### **6. Executar Migrações**
No terminal Vercel (ou localmente):
```bash
npm run db:push
```

## 🔧 **Configuração Detalhada**

### **Environment Variables no Vercel:**
```env
DATABASE_URL=postgresql://usuario:senha@host.neon.tech/dbname?sslmode=require
SESSION_SECRET=sua_chave_muito_longa_e_aleatoria_123456789
NODE_ENV=production
```

### **Comandos Build Vercel:**
- **Build Command:** `npm run build`
- **Output Directory:** `dist`
- **Install Command:** `npm install`

## 🌐 **Depois do Deploy**

### **Seu site estará em:**
- `https://clinica-templo-arezzo.vercel.app`
- Ou domínio personalizado que você configurar

### **Teste imediato:**
- Login: AdminMaster / AdminMaster123
- Vouchers: TESTE001, TESTE002
- Ranking deve aparecer

## 🎨 **Domínio Personalizado (Opcional)**

### **Se você tem um domínio:**
- Vercel → Project → Settings → Domains
- Add: `sistema.seudominio.com`
- Configure CNAME no seu provedor:
  ```
  sistema CNAME clinica-templo-arezzo.vercel.app
  ```

## 🔄 **Updates Automáticos**

### **Qualquer mudança no GitHub = Deploy automático!**
- Edite arquivos no GitHub
- Push automático para produção
- Zero downtime

## 💰 **Custos**
- **Vercel:** Gratuito (até 100GB bandwidth)
- **Neon:** Gratuito (500MB PostgreSQL)
- **GitHub:** Gratuito (repositórios públicos)
- **Total:** R$ 0,00/mês

## 🆘 **Problemas Comuns**

### **1. Build Error:**
- Verificar se todos arquivos foram enviados
- Conferir package.json

### **2. Database Error:**
- Verificar DATABASE_URL no Neon
- Executar migrações

### **3. 404 em rotas:**
- Verificar vercel.json
- Conferir estrutura de pastas

## ⚡ **Deploy em 15 minutos!**

1. **GitHub** (5 min) → Upload arquivos
2. **Neon** (3 min) → Criar banco
3. **Vercel** (5 min) → Deploy
4. **Configurar** (2 min) → Variables
5. **Testar** → Sistema no ar! 🎉

---

**Resultado:** Sistema profissional no ar, grátis, com SSL e domínio personalizado!