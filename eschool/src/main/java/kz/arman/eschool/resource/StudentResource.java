package kz.arman.eschool.resource;

import kz.arman.eschool.mapper.StudentMapper;
import kz.arman.eschool.model.Student;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/student")
public class StudentResource {

    private final StudentMapper studentMapper;



    public StudentResource( StudentMapper studentMapper) {

        this.studentMapper = studentMapper;
    }

    @GetMapping("/all")
    public List<Student> getAllStudents () {
        return studentMapper.findAll();
    }


    @PostMapping("/add")
    public List<Student> addStudent(@RequestBody Student student) {
        studentMapper.insert(student);

        return studentMapper.findAll();
    }

    @DeleteMapping("/delete/{id}")
    public List<?> deleteStudent(@PathVariable("id") Long id) {

        studentMapper.delete(id);
        return studentMapper.findAll();
    }

}
