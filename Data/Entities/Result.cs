namespace OnlineLpk12.Data.Entities
{
    public class Result<T>
    {
        public bool Success { get; set; }
        public string Message { get; set; }
        public T Content { get; set; }
    }
}
