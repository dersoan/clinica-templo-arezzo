const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware para servir arquivos estáticos
app.use(express.static(path.join(__dirname, 'dist')));

// Middleware para parsing JSON
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// Importar e configurar as rotas da API
const { registerRoutes } = require('./dist-server/routes.js');
registerRoutes(app);

// Fallback para servir o index.html para rotas do React
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'dist', 'index.html'));
});

app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});