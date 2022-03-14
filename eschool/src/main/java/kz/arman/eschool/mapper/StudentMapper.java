package kz.arman.eschool.mapper;

import kz.arman.eschool.model.Student;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface StudentMapper {

    @Select("select * from student")
    List<Student> findAll();

    @Insert("insert into student(name, email, grade) values(#{name}, #{email}, #{grade})")
    void insert(Student student);

    @Delete("delete from student where id=#{id}")
    void delete(Long id);
}
