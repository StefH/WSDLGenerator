using System;

namespace WSDLGeneratorBusiness
{
    internal static class TypeExtensions
    {
        /// <summary>
        /// Get a GetCustomAttribute
        /// </summary>
        /// <typeparam name="T">Generic Type</typeparam>
        /// <returns>Attribute</returns>
        public static T GetCustomAttribute<T>(this Type type) where T : Attribute
        {
            var attr = Attribute.GetCustomAttribute(type, typeof(T));

            return (T)attr;
        }
    }
}