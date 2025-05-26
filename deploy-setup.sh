#!/bin/bash

echo "🚀 Configurando deploy do Sistema Clínica Templo x Arezzo"
echo ""

# Verificar se git está instalado
if ! command -v git &> /dev/null; then
    echo "❌ Git não está instalado. Instale primeiro: https://git-scm.com/"
    exit 1
fi

echo "📝 Configurando repositório Git..."

# Inicializar repositório se não existir
if [ ! -d ".git" ]; then
    git init
    echo "✅ Repositório Git inicializado"
fi

# Adicionar todos os arquivos
git add .

# Fazer commit
git commit -m "🎯 Sistema Clínica Templo x Arezzo - Deploy Vercel

✨ Funcionalidades:
- Sistema de autenticação completo
- Ativação de vouchers via QR Code
- Ranking visual com pódio
- Painel administrativo
- Relatórios e estatísticas

🚀 Deploy: Vercel + Neon (gratuito)
👤 Login inicial: AdminMaster / AdminMaster123
🎫 Vouchers teste: TESTE001, TESTE002"

echo ""
echo "✅ Commit criado com sucesso!"
echo ""
echo "🔗 Próximos passos:"
echo "1. Criar repositório no GitHub: https://github.com/new"
echo "2. Nomear: clinica-templo-arezzo"
echo "3. Executar os comandos que o GitHub mostrar"
echo ""
echo "🎯 Ou use estes comandos (substitua SEU_USERNAME):"
echo "git remote add origin https://github.com/SEU_USERNAME/clinica-templo-arezzo.git"
echo "git branch -M main"
echo "git push -u origin main"
echo ""
echo "🌟 Depois do GitHub, configure no Vercel!"