using System;
using System.Security.Cryptography;

namespace StudentPortal
{
    public static class PasswordHelper
    {
        private const int SaltSize = 16;       // bytes
        private const int HashSize = 32;       // bytes
        private const int Iterations = 10000;

        public static string CreateSalt()
        {
            byte[] salt = new byte[SaltSize];
            using (RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider())
            {
                rng.GetBytes(salt);
            }
            return Convert.ToBase64String(salt);
        }

        public static string HashPassword(string password, string salt)
        {
            byte[] saltBytes = Convert.FromBase64String(salt);
            using (Rfc2898DeriveBytes pbkdf2 = new Rfc2898DeriveBytes(password, saltBytes, Iterations))
            {
                return Convert.ToBase64String(pbkdf2.GetBytes(HashSize));
            }
        }

        public static bool VerifyPassword(string password, string salt, string storedHash)
        {
            byte[] computed = Convert.FromBase64String(HashPassword(password, salt));
            byte[] stored = Convert.FromBase64String(storedHash);

            if (computed.Length != stored.Length)
            {
                return false;
            }

            int difference = 0;
            for (int i = 0; i < computed.Length; i++)
            {
                difference |= computed[i] ^ stored[i];
            }
            return difference == 0;
        }
    }
}
