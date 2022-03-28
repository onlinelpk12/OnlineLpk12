namespace OnlineLpk12.Data.Entities
{
    public class Question
    {
        public int Id { get; set; }
        public string Questn { get; set; }
        public List<string> Options { get; set; }
        public string SelectedOption { get; set; }
    }
}
