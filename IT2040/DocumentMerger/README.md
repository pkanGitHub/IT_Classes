_Project Name: Document Merger_

_Programming Language: C#_

_Target Platform: Console_

**Description**: Merge text documents provided by the user into a new file.

before you run the program: you need to create 2 .txt files.

When the program runs:

1. Display “Document Merger” followed by a blank line.
2. Prompt the user for the name of the first text file.
3. Verify that the first file exists. If not, give the user feedback and let them re-enter the first filename.
4. Prompt the user for the name of the second document.
5. Verify that the second file exists. If not, give the user feedback and let them re-enter the second filename.
6. Merge the two file names and append .txt to the end (this includes removing the existing .txt extensions from the names).
7. Read and merge the text of the two files.
8. Save the content to a file in the current directory.
9. If an exception occurs, output the exception message and exit.
10. If an exception does not occur, output “[filename] was successfully saved. The document contains [count] characters.” and exit. [filename] and [count] are placeholders for the filename of the document and the number of characters it contains.
11. After the program does or does not fail to merge the files, ask the user if they would like to merge two more files. If they do, prompt them again for input. If not, exit the program.

## **Optional Requirements:** 

**The following requirements are not required, but you should try to implement them if you can.**

* Instead of always using the merged names of the files for the new file name, prompt the user for a filename and present them with the default of the merged names if they don’t enter a name (e.g. they choose the default by just hitting enter). Also, if they don’t supply an extension of .txt, append .txt on the end.

  * Example: Enter new filename (default: File1File2.txt):

* Allow the user to merge more than two files. Prompt the user for the names of files to merge until they don’t supply any more files. So, at the first prompt the user enters a filename, at the second prompt they enter a filename, and at a third prompt they enter a filename. Then, at the fourth prompt, they hit enter indicating they are done entering filenames. So, repeatedly ask for filenames and put them in a list of files to merge until the user signals no more files by supplying no filename at a prompt and just hitting enter. Remember, if a file doesn’t exist, give the user feedback that the file doesn’t exist and prompt them for another filename immediately after they enter the filename.

