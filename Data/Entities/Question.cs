namespace OnlineLpk12.Data.Entities
{
    public class Question
    {
        public int Id { get; set; }
        public string QuestionDescription { get; set; }
        public int QuestionOrder { get; set; }
        //public Dictionary<int, string> Options { get; set; } = new Dictionary<int, string>();
        public List<Object> Options { get; set; } = new List<object>();
        public int? SelectedOption { get; set; }
        public int? AnswerOption { get; set; }
    }
}
