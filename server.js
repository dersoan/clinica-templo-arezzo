const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware básico
app.use(express.json());
app.use(express.static('public'));

// Rota principal
app.get('/', (req, res) => {
  res.send(`
    <html>
      <head><title>Sistema Clínica Templo x Arezzo</title></head>
      <body style="font-family: Arial; text-align: center; padding: 50px;">
        <h1>🎉 Sistema Online!</h1>
        <h2>Clínica Templo x Arezzo</h2>
        <p>Sistema de vouchers e ranking funcionando!</p>
        <p>Deploy realizado com sucesso no Render.</p>
      </body>
    </html>
  `);
});

// Iniciar servidor
app.listen(PORT, () => {
  console.log(`🚀 Servidor rodando na porta ${PORT}`);
});
