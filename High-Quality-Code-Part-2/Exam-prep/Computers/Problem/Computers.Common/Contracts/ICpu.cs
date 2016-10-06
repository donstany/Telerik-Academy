﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Computers.Common.Contracts
{
    public interface ICpu
    {
        byte NumberOfCores { get; }

        void AttachToMotherboard(IMotherboard motherboard);

        void GenerateRandom(int maxValue, int minValue);

        void SquareNumber();
    }
}
