package com.ujiansb2.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ujiansb2.model.Booking;
import com.ujiansb2.Repository.KeberangkatanBus;

public interface BookingRepository extends JpaRepository <Booking, Long>{
	@Query(value="SELECT keberangkatan.id, bus.nama_perusahaan as perusahaan, keberangkatan.kelas, keberangkatan.harga, "
			+ "keberangkatan.tanggal as waktu, jurusan.deskripsi FROM keberangkatan INNER JOIN bus ON "
			+ "keberangkatan.no_polisi = bus.nomor_polisi INNER JOIN jurusan ON keberangkatan.id_jurusan = "
			+ "jurusan.id WHERE jurusan.terminal_awal =?1 AND keberangkatan.tanggal LIKE ?2% AND bus.kapasitas>"
			+ "(SELECT COUNT(no_polisi) FROM booking where booking.id_keberangkatan = keberangkatan.id)"
			,nativeQuery = true)
	List<KeberangkatanBus> findKeberangkatan(String terminal_awal, String tanggal);
}

