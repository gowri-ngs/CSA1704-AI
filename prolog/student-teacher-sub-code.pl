% --- How to run this Prolog code on Fedora Kinoite with gprolog ---
%  Now you can run queries, for example:
%      ?- teacher_of_student(rahul, Teacher).
%      ?- subject_code_for_student(meena, Code).
%      ?- full_info(sneha, Subject, Code, Teacher).

% --- Facts --- 

% subject(SubjectName, SubjectCode)
subject(maths,     sub101).
subject(science,   sub102).
subject(english,   sub103).
subject(history,   sub104).
subject(computers, sub105).

% teacher(TeacherName, SubjectName)
teacher(mr_sharma, maths).
teacher(mrs_verma, science).
teacher(ms_das,    english).
teacher(mr_rao,    history).
teacher(mrs_gupta, computers).

% student(StudentName, SubjectName)
student(rahul, maths).
student(rahul, english).
student(sneha, science).
student(sneha, computers).
student(amit, history).
student(amit, english).
student(meena, maths).
student(meena, computers).

% --- Rules ---

% Find teacher of a student's subject
teacher_of_student(Student, Teacher) :-
    student(Student, Subject),
    teacher(Teacher, Subject).

% Find subject code from subject
subject_code_for_student(Student, Code) :-
    student(Student, Subject),
    subject(Subject, Code).

% Find full relation: student -> subject -> code and teacher
full_info(Student, Subject, Code, Teacher) :-
    student(Student, Subject),
    subject(Subject, Code),
    teacher(Teacher, Subject).
