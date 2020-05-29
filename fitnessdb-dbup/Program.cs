using System;
using DbUp;

namespace database_migration
{
    class Program
    {
        static int Main(string[] args)
        {
            var connectionString = Environment.GetEnvironmentVariable("ConnectionString");

            var upgrader =
                DeployChanges.To
                    .SqlDatabase(connectionString)
                    .WithScriptsFromFileSystem("./sql")
                    .WithVariable("sqlPassword", Environment.GetEnvironmentVariable("SQLPassword"))
                    .LogToConsole()
                    .Build();

            var result = upgrader.PerformUpgrade();

            if (!result.Successful)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(result.Error);
                Console.ResetColor();
#if DEBUG
                Console.ReadLine();
#endif
                return -1;
            }

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Success!");
            Console.ResetColor();
            return 0;
        }
    }
}
