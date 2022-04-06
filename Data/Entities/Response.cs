namespace OnlineLpk12.Data.Entities
{
    public class Response
    {
        public int Status { get; set; }
        public List<string> Errors { get; set; } = new List<string>();
        public string Message { get; set; }
    }
}
