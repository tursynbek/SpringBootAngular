import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Student } from './student';
import { StudentService } from './student.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  public students: Student[] = [];
  public deleteStudent!: Student | null;


  

  constructor(private studentService: StudentService) { } 

  ngOnInit() {
    this.getStudents();
  }

  public getStudents():void {
    this.studentService.getStudents().subscribe(
      (response: Student[]) => {
        this.students = response; 
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

 public onAddStudent(addForm: NgForm): void {
   document.getElementById('add-student-form')?.click();
   this.studentService.addStudents(addForm.value).subscribe(
     (response: Student) => {
       console.log(response);
       this.getStudents();
       addForm.reset();
     },
     (error: HttpErrorResponse) => {
       alert(error.message);
       addForm.reset();
     }
   );
 }

 public onDeleteStudent(studentId: number): void {
  
  this.studentService.deleteStudents(studentId).subscribe(
    (response: void) => {
      console.log(response);
      this.getStudents();
      
    },
    (error: HttpErrorResponse) => {
      alert(error.message);
      
    }
  );
}



 public onOpenModal(student: Student | null, mode: string): void {
   const container = document.getElementById('main-container')
   const button = document.createElement('button');
   button.type = 'button';
   button.style.display = 'none';
   button.setAttribute('data-toggle', 'modal');
   if(mode === 'add') {
    button.setAttribute('data-target', '#addStudentModal');
   }

   if(mode === 'delete') {
    this.deleteStudent = student;
    button.setAttribute('data-target', '#deleteStudentModal');
   }

   container?.appendChild(button);
   button.click();
 }



}
