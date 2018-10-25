﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProJeto_Banco_de_Dados.Classes
{
    class Bairros
    {
        public int ID { get; set; }
        public String Nome { get; set; }
        public Cidades Cidade { get; set; }

        public Bairros(int ID, string Nome, Cidades Cidade)
        {
            this.ID = ID;
            this.Nome = Nome;
            this.Cidade = Cidade;
        }

        
    }
}