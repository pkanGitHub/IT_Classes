_Project Name: Document_

_Target Platform: Console_

_Programming Language: C#_

**Description**: Save a text document to disk based on a name and content provided by the user.




## When the program runs:

* Display “Document” followed by a blank line.
* Prompt the user for the name of the document.
* Prompt the user for the content that is to be in the document.
* Append .txt to the name and use it as the file name.
* Save the content to a file in the current directory.
* If an exception occurs, output the exception message and exit.

* If an exception does not occur, output “[filename] was successfully saved. 
The document contains [count] characters.” and exit. [filename] and [count] are placeholders for 
the filename of the document and the number of characters it contains.

## **Optional Requirements:** 

**The following requirements are not required, but you should try to implement them if you can.**

* If the name provided by the user already ends in “.txt”, do not append “.txt” to the name to create the filename. If it already has “.txt” on the end, use it as-is.

* Close the stream that is opened in the finally block of a try-catch-finally. Caution: test the variable holding the reference to the stream to make sure it is not null before calling the Close method on it. Calling a method on a null reference will crash the application.

* After the document is saved or fails to save, prompt the user if they want to save another document. If they do, prompt them again for input. If not, exit the program.