namespace OnlineLpk12.Data.Entities
{
    public class ResultObject
    {
        public int Status { get; set; }
        public Dictionary<string,string> Errors { get; set; }
        public string Title { get; set; }
    }
}
