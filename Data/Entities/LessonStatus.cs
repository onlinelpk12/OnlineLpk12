using System.ComponentModel;

namespace OnlineLpk12.Data.Entities
{
    public enum LessonStatus
    {
        [Description("Not Started")]
        NotStarted = 1,
        [Description("In Progress")]
        InProgress = 2,
        [Description("Completed")]
        Completed=3
    }
}
