-- 11. Primeiros Inserts

db.incricoes.insertMany([
  {
    aluno: { nome: "Carlos Andrade", email: "carlos.a@email.com" },
    curso: { nome: "Análise de Dados com Python", instrutor: "Prof. Silva" },
    data_inscricao: new Date("2024-10-25"),
    status: "ativa"
  },
  {
    aluno: { nome: "Mariana Costa", email: "mari.c@email.com" },
    curso: { nome: "Banco de Dados para Big Data", instrutor: "Prof. Silva" },
    data_inscricao: new Date("2024-11-05"),
    status: "ativa"
  },
  {
    aluno: { nome: "Ana Beatriz", email: "ana.b@email.com" },
    curso: { nome: "Introdução a Algoritmos", instrutor: "Prof. Souza" },
    data_inscricao: new Date("2025-02-15"),
    status: "ativa"
  },
  {
    aluno: { nome: "Pedro Martins", email: "pedro.m@email.com" },
    curso: { nome: "Machine Learning", instrutor: "Prof. Souza" },
    data_inscricao: new Date("2025-03-01"),
    status: "ativa"
  },
  {
    aluno: { nome: "Juliana Lima", email: "ju.lima@email.com" },
    curso: { nome: "Desenvolvimento Web Fullstack", instrutor: "Prof. Gladimir" },
    data_inscricao: new Date("2025-01-20"),
    status: "concluída"
  },
  {
    aluno: { nome: "Amanda Gomes", email: "amanda.g@email.com" },
    curso: { nome: "Engenharia de Software", instrutor: "Prof. Carla" },
    data_inscricao: new Date("2025-04-10"),
    status: "ativa"
  },
  {
    aluno: { nome: "Lucas Pereira", email: "lucas.p@email.com", matricula: "BR25001" },
    curso: { nome: "Cibersegurança Essencial", instrutor: "Prof. Carla" },
    data_inscricao: new Date("2025-03-20"),
    status: "ativa",
    bolsa: { tipo: "Mérito Acadêmico", percentual: 100 }
  },
  {
    aluno: { nome: "Fernanda Dias", email: "fernanda.d@email.com" },
    curso: { nome: "Gestão de Projetos Ágeis", instrutor: "Prof. Gladimir" },
    data_inscricao: new Date("2025-05-01"),
    status: "concluída",
    nota_final: 9.5,
    empresa_contratante: "Tech Solutions Inc."
  },
  {
    aluno: { nome: "Ricardo Neves" },
    curso: { nome: "Tópicos Avançados em Banco de Dados" },
    data_inscricao: new Date("2025-05-10"),
    tags: ["SQL", "NoSQL", "Performance"]
  },
  {
    aluno: { nome: "Vitor Hugo", email: "vitor.h@email.com" },
    curso: { nome: "Lógica de Programação (Legacy)", instrutor: "Prof. Antigo" },
    data_inscricao: new Date("2024-03-15"),
    status: "arquivada"
  }
])

-- 11. Mais inserts para dar 15

db.incricoes.insertMany([
  {
    aluno: { nome: "Marcos Vinicius", email: "marcos.v@email.com" },
    curso: { nome: "Análise de Dados com Python", instrutor: "Prof. Silva" },
    data_inscricao: new Date("2025-06-11"),
    status: "ativa"
  },
  {
    aluno: { nome: "Sofia Almeida", email: "sofia.a@email.com" },
    curso: { nome: "Banco de Dados para Big Data", instrutor: "Prof. Silva" },
    data_inscricao: new Date("2025-06-12"),
    status: "ativa"
  },
  {
    aluno: { nome: "Rafael Souza", email: "rafael.s@email.com" },
    curso: { nome: "Introdução a Algoritmos", instrutor: "Prof. Souza" },
    data_inscricao: new Date("2025-06-13"),
    status: "ativa"
  },
  {
    aluno: { nome: "Laura Mendes", email: "laura.m@email.com" },
    curso: { nome: "Machine Learning", instrutor: "Prof. Souza" },
    data_inscricao: new Date("2025-06-14"),
    status: "ativa"
  },
  {
    aluno: { nome: "Thiago Lima", email: "thiago.l@email.com" },
    curso: { nome: "Desenvolvimento Web Fullstack", instrutor: "Prof. Gladimir" },
    data_inscricao: new Date("2025-06-15"),
    status: "ativa"
  },
  {
    aluno: { nome: "Isabela Torres", email: "isabela.t@email.com" },
    curso: { nome: "Engenharia de Software", instrutor: "Prof. Carla" },
    data_inscricao: new Date("2025-06-16"),
    status: "ativa"
  }
])

-- 12. 
-- A )
db.incricoes.find({
  "curso.nome": { $regex: /Dados/i }
})


-- B )
db.incricoes.find({
  "aluno.nome": { $regex: /^A/i }
})

-- 13 )
db.incricoes.updateMany(
  { "curso.instrutor": "Prof. Souza" },
  { $set: { status: "em espera" } }
)

-- 14 )

db.incricoes.find({ "curso.instrutor": "Prof. Silva" }).forEach(doc => {
  db.incricoes.replaceOne(
    { _id: doc._id },
    {
      inscricao_arquivada: true,
      aviso: "Curso migrado para sistema legado."
    }
  );
});

-- 15 )

db.incricoes.deleteMany({ status: "em espera" })

-- 16 )

db.incricoes.aggregate([
  {
    $group: {
      _id: "$curso.instrutor",
      total_inscricoes: { $sum: 1 }
    }
  },
  {
    $project: {
      _id: 0,
      instrutor: "$_id",
      total_inscricoes: 1
    }
  }
])

-- 17 )
db.incricoes.createIndex({ "aluno.email": 1 })



