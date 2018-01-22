using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Сводное описание для HashGenerator
/// </summary>
public static class HashGenerator
{
    public static string GetHash(string str)
    {
        byte[] strBytes = Encoding.ASCII.GetBytes(str);
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] hash = md5.ComputeHash(strBytes);
        string res = "";
        hash.ToList().ForEach(b => res+=b.ToString("x2"));
        return res;
    }
}