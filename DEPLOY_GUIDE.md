# 🚀 Guia de Deploy - Sistema Clínica Templo x Arezzo

## 📋 Pré-requisitos

### Hospedagem Necessária:
- **Servidor Node.js** (versão 18+ recomendada)
- **Banco PostgreSQL** (pode ser na mesma hospedagem ou separado)
- **Suporte a variáveis de ambiente**

### Provedores Recomendados:
- **Vercel** (gratuito para projetos pequenos)
- **Railway** (PostgreSQL integrado)
- **DigitalOcean App Platform**
- **Heroku** (com addon PostgreSQL)
- **VPS próprio** (Ubuntu/CentOS)

## 🔧 Preparação para Deploy

### 1. Gerar os arquivos de produção
```bash
npm run build
```

### 2. Arquivos que você precisa enviar:
- `dist/` (frontend compilado)
- `dist/index.js` (servidor compilado) 
- `package.json`
- `node_modules/` (ou instalar no servidor)

## ⚙️ Configuração de Variáveis de Ambiente

### Variáveis obrigatórias no servidor:
```env
# Banco de dados
DATABASE_URL=postgresql://usuario:senha@host:porta/database

# Sessão (gere uma chave aleatória)
SESSION_SECRET=sua_chave_secreta_muito_longa_e_aleatoria_aqui

# Ambiente
NODE_ENV=production
PORT=3000
```

## 🗄️ Configuração do Banco PostgreSQL

### 1. Criar banco de dados:
```sql
CREATE DATABASE clinica_arezzo;
```

### 2. Executar migrações:
```bash
npm run db:push
```

### 3. Criar usuário admin inicial:
Execute no banco ou use a interface de registro da aplicação:
```sql
INSERT INTO users (username, password, name, email, cpf, store, "isAdmin", "totalPoints") 
VALUES ('admin', 'hash_da_senha', 'Administrador', 'admin@clinicatemplo.com', '00000000000', 'Arezzo', true, 0);
```

## 🚀 Deploy por Tipo de Hospedagem

### VERCEL (Recomendado)
1. Conecte seu repositório GitHub
2. Configure as variáveis de ambiente no painel
3. Build Command: `npm run build`
4. Start Command: `npm start`

### RAILWAY
1. Conecte GitHub e adicione addon PostgreSQL
2. Configure variáveis de ambiente
3. Deploy automático

### VPS/Servidor Próprio
```bash
# 1. Instalar Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# 2. Instalar PM2 (gerenciador de processos)
npm install -g pm2

# 3. Enviar arquivos para servidor
scp -r dist/ package.json usuario@servidor:/var/www/clinica-arezzo/

# 4. No servidor
cd /var/www/clinica-arezzo
npm install --production
npm run db:push

# 5. Iniciar com PM2
pm2 start dist/index.js --name "clinica-arezzo"
pm2 save
pm2 startup
```

### NGINX (se usando VPS)
```nginx
server {
    listen 80;
    server_name seudominio.com;
    
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

## 🔒 SSL/HTTPS
- **Vercel/Railway**: SSL automático
- **VPS**: Use Certbot para Let's Encrypt
```bash
sudo certbot --nginx -d seudominio.com
```

## 📱 Teste Pós-Deploy

### Verificações importantes:
1. ✅ Página de login carrega
2. ✅ Registro de novos usuários funciona  
3. ✅ Login funciona
4. ✅ Ativação de vouchers funciona
5. ✅ Ranking aparece corretamente
6. ✅ Painel admin acessível

### URLs para testar:
- `https://seudominio.com` - Página principal
- `https://seudominio.com/api/public/ranking` - API pública

## 🎯 Usuários de Teste

### Admin Master:
- **Login:** AdminMaster
- **Senha:** AdminMaster123

### Vouchers para teste:
- TESTE001 (50 pontos)
- TESTE002 (100 pontos)
- VCH-2024-001 (75 pontos)

## 🔧 Monitoramento

### Logs importantes:
```bash
# Ver logs da aplicação (se usando PM2)
pm2 logs clinica-arezzo

# Ver status
pm2 status
```

## 🆘 Solução de Problemas Comuns

### 1. Erro de conexão com banco:
- Verifique DATABASE_URL
- Teste conexão: `psql $DATABASE_URL`

### 2. Erro 500:
- Verifique logs do servidor
- Confirme variáveis de ambiente

### 3. Arquivos estáticos não carregam:
- Verifique se pasta `dist/` foi enviada
- Confirme permissões de arquivo

### 4. Sessões não funcionam:
- Defina SESSION_SECRET válido
- Use HTTPS em produção

## 📞 Suporte

Se encontrar problemas:
1. Verifique logs do servidor
2. Teste API endpoints individualmente
3. Confirme todas variáveis de ambiente
4. Verifique conectividade com banco de dados

---

**Status do Sistema:** ✅ Pronto para produção
**Última atualização:** Maio 2025