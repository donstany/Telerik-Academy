﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Passwords
{
    public class Startup
    {
        private static readonly List<string> Passwords = new List<string>();

        private static int n;
        private static int k;
        private static string relations;

        private static readonly int[] numbers = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 };

        public static void Main(string[] args)
        {
            n = int.Parse(Console.ReadLine());
            relations = Console.ReadLine();
            k = int.Parse(Console.ReadLine());

            foreach (var number in numbers)
            {
                Generate(number.ToString());
            }

            Passwords.Sort();
            Console.WriteLine(Passwords[k - 1]);
        }

        public static void Generate(string result)
        {
            var builder = new StringBuilder(result);
            while (true)
            {
                var index = builder.Length;
                if (index >= n)
                {
                    if (!Passwords.Contains(result))
                    {
                        Passwords.Add(result);
                    }

                    return;
                }

                if (relations[index - 1] == '=')
                {
                    builder.Append(result[index - 1]);
                    result = builder.ToString();
                    continue;
                }
                else if (relations[index - 1] == '<')
                {
                    var lastNum = result[index - 1] - '0';
                    lastNum = lastNum == 0 ? 10 : lastNum;

                    if (lastNum == 1)
                    {
                        return;
                    }

                    for (var i = 1; i < lastNum; i++)
                    {
                        builder.Append(numbers[i - 1]);
                        Generate(builder.ToString());
                        builder.Remove(result.Length, 1);
                    }
                }
                else if (relations[index - 1] == '>')
                {
                    var lastNum = result[index - 1] - '0';
                    if (lastNum == 0)
                    {
                        return;
                    }

                    for (var i = lastNum + 1; i < 11; i++)
                    {
                        builder.Append(numbers[i - 1]);
                        Generate(builder.ToString());
                        builder.Remove(result.Length, 1);
                    }
                }

                break;
            }
        }
    }
}
