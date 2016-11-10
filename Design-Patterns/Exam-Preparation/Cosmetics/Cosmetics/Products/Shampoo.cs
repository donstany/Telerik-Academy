﻿namespace Cosmetics.Products
{
    using System.Text;

    using Cosmetics.Common;
    using Cosmetics.Contracts;

    internal class Shampoo : Product, IShampoo, IProduct
    {
        public Shampoo(string name, string brand, decimal price, GenderType gender, uint milliliters, UsageType usage)
            : base(name, brand, price, gender)
        {
            this.Milliliters = milliliters;
            this.Usage = usage;
            this.Price *= this.Milliliters;
        }

        public uint Milliliters { get; private set; }

        public UsageType Usage { get; private set; }

        public override string Print()
        {
            var result = new StringBuilder();
            result.AppendLine(base.Print());
            result.AppendLine($"  * Quantity: {this.Milliliters} ml");
            result.Append($"  * Usage: {this.Usage}");
            return result.ToString();
        }
    }
}
