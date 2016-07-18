﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem3
{
    public class Dog : Animal
    {
        public Dog(string name, string sex, int age)
            : base(name, sex, age)
        {

        }
        public override void ProduceSound() {
            Console.WriteLine("Bay bay");
        }
    }
}
