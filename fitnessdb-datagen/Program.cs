namespace fitnessdb_datagen
{
    using Bogus;
    using Bogus.Extensions;
    using CountryData.Bogus;
    using CsvHelper;
    using FastMember;
    using System;
    using System.Data.SqlClient;
    using System.Globalization;
    using System.IO;

    class Program
    {
        static void Main(string[] args)
        {
            var testFaker = new Faker();
            var fakeRecords = new Faker<FitnessRecord>()
                            .StrictMode(true)
            .RuleFor(x => x.Id, f => f.Random.Int())
            .RuleFor(x => x.RecordedOn, f => f.Date.Past())
            .RuleFor(x => x.Type, f => f.Random.String2(50))
            .RuleFor(x => x.Steps, f => f.Random.Int())
            .RuleFor(x => x.Distance, f => f.Random.Int())
            .RuleFor(x => x.Duration, f => f.Random.Int())
            .RuleFor(x => x.Calories, f => f.Random.Int())
            .RuleFor(x => x.PostProcessedOn, f => f.Date.Past())
            .RuleFor(x => x.AdjustedSteps, f => f.Random.Int())
            .RuleFor(x => x.AdjustedDistance, f => f.Random.Int())
            ;

            var output = fakeRecords.GenerateBetween(10, 20);
            using (var writer = new StreamWriter(Console.OpenStandardOutput()))
            using (var csv = new CsvWriter(writer, CultureInfo.InvariantCulture))
            {
                csv.WriteRecords(output);
            }
        }
    }

    public class FitnessRecord
    {
        public int Id { get; set; } // [Id] [int] NOT NULL,
        public DateTime RecordedOn { get; set; } // [RecordedOn] [datetimeoffset](7) NOT NULL,
        public string Type { get; set; } // [Type] [varchar](50) NOT NULL,
        public int Steps { get; set; } // [Steps] [int] NOT NULL,
        public int Distance { get; set; } // [Distance] [int] NOT NULL,
        public int Duration { get; set; } // [Duration] [int] NOT NULL,
        public int Calories { get; set; } // [Calories] [int] NOT NULL,
        public DateTime PostProcessedOn { get; set; } // [PostProcessedOn] [datetimeoffset](7) NULL,
        public int AdjustedSteps { get; set; } // [AdjustedSteps] [int] NULL,
        public int AdjustedDistance { get; set; } // [AdjustedDistance] [decimal](9, 6) NULL,
    }
}
