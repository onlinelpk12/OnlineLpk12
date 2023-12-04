using System.ComponentModel;

namespace OnlineLpk12.Data.Entities
{
    public enum QuizStatus
    {
        [Description("Not Started")]
        NotStarted = 1,
        [Description("Pass")]
        Pass = 2,
        [Description("Fail")]
        Fail = 3
    }
}
