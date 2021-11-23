package com.ujiansb2.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ujiansb2.model.Penumpang;


public interface PenumpangRepository extends JpaRepository <Penumpang, Long>{
	@Query(value="Select * from penumpang where nik=?1",nativeQuery=true)
	List<Penumpang> findByNik(String nik);

	

}



