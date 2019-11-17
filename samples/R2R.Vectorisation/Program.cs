using System;
using System.Numerics;

namespace R2R.Vectorisation
{
    static class Program
    {
        static void Main()
        {
            var v = new Vector<long>(0b0110) & new Vector<long>(0b1100);
        }
    }
}
