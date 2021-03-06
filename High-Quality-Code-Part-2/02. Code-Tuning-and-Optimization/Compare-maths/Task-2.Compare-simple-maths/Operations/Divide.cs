﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Task_2.Compare_simple_maths.Utils;

namespace Task_2.Compare_simple_maths.Operations
{
    public static class Divide
    {
        public static void DisplayAll()
        {
            Console.WriteLine("Time for Divideing integers:");
            Helper.DisplayExecutionTime(DivideIntegers);

            Console.WriteLine("Time for Divideing long:");
            Helper.DisplayExecutionTime(DivideLong);

            Console.WriteLine("Time for Divideing float:");
            Helper.DisplayExecutionTime(DivideFloat);

            Console.WriteLine("Time for Divideing double:");
            Helper.DisplayExecutionTime(DivideDouble);

            Console.WriteLine("Time for Divideing decimal:");
            Helper.DisplayExecutionTime(DivideDecimal);
        }

        public static void DivideIntegers()
        {
            int result = 1;
            for (int i = 1; i < Helper.ActionExecutionTimesCount; i++)
            {
                result /= 1;
            }
        }

        public static void DivideLong()
        {
            var result = 1L;
            for (var i = 1L; i < Helper.ActionExecutionTimesCount; i++)
            {
                result /= 1;
            }
        }

        public static void DivideFloat()
        {
            var result = 1f;
            for (var i = 1f; i < Helper.ActionExecutionTimesCount; i++)
            {
                result /= 1;
            }
        }

        public static void DivideDouble()
        {
            var result = 1.0;
            for (var i = 1.0; i < Helper.ActionExecutionTimesCount; i++)
            {
                result /= 1;
            }
        }

        public static void DivideDecimal()
        {
            var result = 1m;
            for (var i = 1m; i < Helper.ActionExecutionTimesCount; i++)
            {
                result /= 1;
            }
        }
    }
}
