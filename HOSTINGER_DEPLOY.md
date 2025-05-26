# 🚀 Deploy Hostinger - Sistema Clínica Templo x Arezzo

## 📋 Hostinger Business Plan Requirements

### Você precisa do plano:
- **Business** ou superior (Node.js support)
- **Premium** não funciona (só PHP/HTML estático)

## 🔧 Preparação dos Arquivos

### 1. Gerar build de produção:
```bash
npm run build
```

### 2. Criar estrutura de pastas no Hostinger:
```
public_html/
├── index.html (redirect)
├── assets/ (CSS/JS compilados)
└── api/ (não usado - Node.js roda separado)

Node.js App (pasta separada):
├── dist/
├── package.json
├── node_modules/
```

## 📁 Arquivos para Upload

### Fazer download destes arquivos do projeto:
1. **Pasta `dist/`** (frontend + backend compilados)
2. **`package.json`**
3. **`.env` file** (criar localmente)

## ⚙️ Configuração Hostinger

### 1. Ativar Node.js no cPanel:
- Entre no cPanel da Hostinger
- Procure "Node.js Selector" ou "Node.js App"
- Clique "Create Application"

### 2. Configurações da App:
- **Node.js Version:** 18.x ou 20.x
- **Application root:** `/public_html/node_app`
- **Application URL:** Seu domínio
- **Application startup file:** `dist/index.js`

### 3. Upload dos arquivos:
- Via File Manager do cPanel
- Ou FTP: `ftp.yourdomain.com`
- Upload para: `/public_html/node_app/`

## 🗄️ Banco de Dados PostgreSQL

### Hostinger Business inclui PostgreSQL:

1. **Criar database no cPanel:**
   - PostgreSQL Databases
   - Nome: `clinica_arezzo`
   - User: criar usuário com todas permissões

2. **Configurar DATABASE_URL:**
```
postgresql://username:password@localhost:5432/clinica_arezzo
```

### 3. Executar migrações:
No terminal Node.js do Hostinger:
```bash
npm install
npm run db:push
```

## 🔑 Variáveis de Ambiente

### Criar arquivo `.env` na pasta da aplicação:
```env
# Banco PostgreSQL (pegar do cPanel)
DATABASE_URL=postgresql://seu_user:sua_senha@localhost:5432/clinica_arezzo

# Session Secret (gerar chave aleatória)
SESSION_SECRET=sua_chave_muito_longa_e_aleatoria_123456789

# Ambiente
NODE_ENV=production
PORT=3000

# Hostinger específico
PGHOST=localhost
PGPORT=5432
PGDATABASE=clinica_arezzo
PGUSER=seu_user_postgres
PGPASSWORD=sua_senha_postgres
```

## 🚀 Deploy Step-by-Step

### Passo 1: Preparar localmente
```bash
# No seu computador
npm run build
zip -r clinica-arezzo.zip dist/ package.json
```

### Passo 2: Hostinger cPanel
1. Login no cPanel
2. Node.js Selector → Create Application
3. File Manager → Upload `clinica-arezzo.zip`
4. Extract na pasta `/public_html/node_app/`

### Passo 3: Instalar dependências
```bash
# Terminal do Node.js no cPanel
cd /public_html/node_app
npm install --production
```

### Passo 4: Configurar database
1. PostgreSQL Databases → Create
2. Criar usuário e dar permissões
3. Anotar credenciais para .env

### Passo 5: Setup inicial
```bash
# Executar migrações
npm run db:push

# Restart aplicação
# No cPanel: Node.js → Restart
```

## 🌐 Configuração DNS/Domínio

### Se usar subdomínio:
- `sistema.seudominio.com` → Node.js app
- Configurar no cPanel DNS Zone Editor

### Se usar domínio principal:
- Apontar root domain para Node.js app
- Configurar SSL/HTTPS automático

## 🔒 SSL Certificate

Hostinger fornece SSL gratuito:
1. SSL/TLS → Let's Encrypt
2. Ativar para seu domínio
3. Force HTTPS redirect

## ✅ Teste Pós-Deploy

### URLs para testar:
- `https://seudominio.com` → Tela de login
- `https://seudominio.com/api/public/ranking` → JSON do ranking

### Login inicial:
- **Usuário:** AdminMaster
- **Senha:** AdminMaster123

## 🔧 Monitoramento Hostinger

### Logs da aplicação:
- cPanel → Node.js → View Logs
- Errors aparecem no Error Logs

### Performance:
- cPanel → Metrics → Node.js usage
- CPU/Memory monitoring

## 💰 Custos Estimados

### Hostinger Business:
- **R$ 15-25/mês** (promoções variam)
- Inclui: Node.js + PostgreSQL + SSL + domínio

## 🆘 Problemas Comuns

### 1. "Application failed to start"
- Verificar `dist/index.js` existe
- Conferir dependências no package.json
- Ver logs no cPanel

### 2. Database connection error
- Testar credenciais PostgreSQL
- Verificar DATABASE_URL no .env
- Confirmar permissões do usuário DB

### 3. 502 Bad Gateway
- Aplicação crashou
- Ver logs de erro
- Restart no cPanel

### 4. Static files not loading
- Assets devem estar em `dist/`
- Verificar caminhos no HTML

## 📞 Suporte Hostinger

Se precisar de ajuda:
1. **Chat 24/7** disponível
2. **Knowledge Base** em português
3. **Ticket system** para problemas técnicos

---

## 🎯 Arquivo de Deploy Rápido

Para facilitar, vou criar um script que prepara tudo:

```bash
# deploy-hostinger.sh
npm run build
echo "DATABASE_URL=postgresql://user:pass@localhost:5432/clinica_arezzo" > .env
echo "SESSION_SECRET=$(openssl rand -base64 32)" >> .env
echo "NODE_ENV=production" >> .env
zip -r hostinger-deploy.zip dist/ package.json .env
echo "✅ Arquivo hostinger-deploy.zip pronto para upload!"
```

**Status:** ✅ Pronto para Hostinger Business Plan