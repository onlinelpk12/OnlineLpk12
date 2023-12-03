namespace OnlineLpk12.Data.Entities
{
    public class Response<T> where T : class
    {
        public List<string> Errors { get; set; } = new List<string>();
        public string Message { get; set; }
        public T Content { get; set; }
    }
}
