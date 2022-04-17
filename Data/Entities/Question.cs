namespace OnlineLpk12.Data.Entities
{
    public class Question
    {
        public int Id { get; set; }
        public string QuestionDescription { get; set; }
        public int QuestionOrder { get; set; }
        public List<Option> Options { get; set; } = new List<Option>();
        public int? SelectedOption { get; set; }
        public int? AnswerOption { get; set; }
    }
}
