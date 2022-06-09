using System.Linq;
using System.Text;

namespace OnlineLpk12.Helpers
{
    public static class SparcFileSystemHelper
    {
        public static string GetTree(List<string> folders, List<string> files)
        {
            string root = string.Empty;
            List<File> filesObj = new();
            List<Folder> foldersObj = new();

            string folderTagTemplate = "<li data-value='{0}' class='dir-item'>{1} <ul>{2}</ul> </li> ";

            //Add files to files object
            foreach (var item in files)
            {
                filesObj.Add(new File
                {
                    FileName = item.Split('/').Last().ToLower(),
                    FileUrl = item.ToLower(),
                    FolderUrl = item.LastIndexOf('/') == -1 ? String.Empty : item.Substring(0, item.LastIndexOf('/')).ToLower(),
                    FileTag = $"<li data-value='{item.ToLower()}' class='dir-item'>{item.Split('/').Last().ToLower()}</li> "
                });
            }

            //Add Folders to folders object
            foreach (var item in folders)
            {
                foldersObj.Add(new Folder
                {
                    FolderName = item.Split('/').Last().ToLower(),
                    FolderUrl = item.ToLower(),
                    ParentUrl = item.LastIndexOf('/') == -1 ? String.Empty : item.Substring(0, item.LastIndexOf('/')).ToLower(),
                    FolderTag = String.Empty
                });
            }

            //Order files and folders objects by descending
            filesObj = filesObj.OrderByDescending(x => x.FileUrl).ToList();
            foldersObj = foldersObj.OrderByDescending(x => x.FolderUrl).ToList();

            //iterate through folders object
            foreach (var item in foldersObj)
            {
                StringBuilder fileTag = new();
                StringBuilder folderTag = new();

                //Get all the child files for the current folder
                var childfiles = filesObj.Where(x => x.FolderUrl == item.FolderUrl && !x.IsVisited).ToList();
                if (childfiles != null && childfiles.Any())
                {
                    childfiles.ForEach(x =>
                    {
                        fileTag.Append(x.FileTag);
                        x.IsVisited = true;
                    });
                }

                //Get all the child folders for the current folder
                var childfolders = foldersObj.Where(x => x.ParentUrl == item.FolderUrl && !x.IsVisited).ToList();
                if (childfolders != null && childfolders.Any())
                {
                    childfolders.ForEach(x =>
                    {
                        folderTag.Append(x.FolderTag);
                        x.IsVisited = true;
                    });
                }

                //Append the child folders and files to current folder
                item.FolderTag = string.Format(folderTagTemplate, item.FolderUrl, item.FolderName, $"{fileTag} {folderTag}");

                //If the folder is root folder, get the html
                if (string.IsNullOrWhiteSpace(item.ParentUrl))
                {
                    root = item.FolderTag;
                }
            }
            return root;
        }

        //public static Folder GetFolderStructure(List<string> folders, List<string> files)
        //{
        //    Folder root = null;
        //    //Add folders to tree
        //    foreach (string item in folders)
        //    {
        //        string folderName = item.Split('/').Last().ToLower();
        //        string folderUrl = item.ToLower();
        //        int lastIndex = item.LastIndexOf('/');
        //        string parentUrl = lastIndex == -1 ? String.Empty : item.Substring(0, lastIndex).ToLower();
        //        Folder folder = new Folder()
        //        {
        //            FolderName = folderName,
        //            FolderUrl = folderUrl
        //        };
        //        if (root == null)
        //        {
        //            root = folder;
        //        }
        //        else
        //        {
        //            var current = root;
        //            while (true)
        //            {
        //                if (current.FolderUrl == parentUrl)
        //                {
        //                    current.ChildFolders.Add(folder);
        //                    break;
        //                }
        //                var next = current.ChildFolders.FirstOrDefault(x => parentUrl.StartsWith(x.FolderUrl));
        //                if (next == null)
        //                {
        //                    break;
        //                }
        //                current = next;
        //            }
        //        }
        //    }
        //    //Add Files to tree
        //    foreach (string item in files)
        //    {
        //        string fileName = item.Split('/').Last().ToLower();
        //        string fileUrl = item.ToLower();
        //        int lastIndex = item.LastIndexOf('/');
        //        string folderUrl = lastIndex == -1 ? String.Empty : item.Substring(0, lastIndex).ToLower();
        //        File file = new File()
        //        {
        //            FileName = fileName,
        //            FileUrl = fileUrl
        //        };
        //        if (root == null)
        //        {
        //            break;
        //        }
        //        var current = root;
        //        while (true)
        //        {
        //            if (current.FolderUrl == folderUrl)
        //            {
        //                current.ChildFiles.Add(file);
        //                break;
        //            }
        //            var next = current.ChildFolders.FirstOrDefault(x => folderUrl.StartsWith(x.FolderUrl));
        //            if (next == null)
        //                break;
        //            current = next;
        //        }
        //    }

        //    return root;
        //}

        //public static string GetTreeFolderFileStructure(Folder folder)
        //{
        //    string fileTag = string.Empty;
        //    string folderTag = string.Empty;
        //    foreach (var item in folder.ChildFiles)
        //    {
        //        string fileName = item.FileName;
        //        string fileUrl = item.FileUrl;
        //        fileTag += $"<li data-value='{fileUrl}' class='dir-item'>{fileName}</li> ";
        //    }

        //    foreach (var item in folder.ChildFolders)
        //    {
        //        string folderName = item.FolderName;
        //        string folderUrl = item.FolderUrl;
        //        folderTag += $"<li data-value='{folderUrl}' class='dir-item'>{folderName} <ul>{fileTag}</ul> </li> ";
        //    }

        //    if (folder.ChildFolders.Count > 0)
        //    {
        //        foreach (var child in folder.ChildFolders)
        //        {
        //            return GetTreeFolderFileStructure(child);
        //        }
        //    }
        //    return folderTag;
        //}

    }

    public class File
    {
        public string FileName { get; set; }
        public string FileUrl { get; set; }
        public string FolderUrl { get; set; }
        public string FileTag { get; set; }
        public bool IsVisited { get; set; }
    }

    public class Folder
    {
        public string FolderName { get; set; }
        public string FolderUrl { get; set; }
        public string ParentUrl { get; set; }
        public string FolderTag { get; set; }
        public bool IsVisited { get; set; }
    }


    //public class File
    //{
    //    public string FileName { get; set; }
    //    public string FileUrl { get; set; }

    //}
    //public class Folder
    //{
    //    public string FolderName { get; set; }
    //    public string FolderUrl { get; set; }
    //    public List<Folder> ChildFolders { get; set; } = new List<Folder>();
    //    public List<File> ChildFiles { get; set; } = new List<File>();
    //}
}
