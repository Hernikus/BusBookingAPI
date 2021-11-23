package com.ujiansb2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ujiansb2.Repository.BookingRepository;
import com.ujiansb2.Repository.KeberangkatanBus;
import com.ujiansb2.Repository.PenumpangRepository;
import com.ujiansb2.model.Booking;
import com.ujiansb2.model.Penumpang;

@RestController
@RequestMapping("/busbookingsystem")
public class BusController {

	@Autowired
	PenumpangRepository penumpangRepo;
	
	@Autowired
	BookingRepository bookingRepo;
	
	@PostMapping("/insertPenumpang")
	public String postData(@RequestBody Penumpang penumpang)	{
		penumpangRepo.save(penumpang);
		return "Data penumpang berhasil ditambahkan";
	}

		
	@GetMapping("/getPenumpang/{nik}")
    public String getAllDataByNik(@PathVariable(value="nik") String nik) {
		List<Penumpang> hasil = penumpangRepo.findByNik(nik);
		if(hasil.size() == 0)	{
			return "Penumpang belum terdaftar,silakan buat akun.";
		}
		return "Penumpang telah terdaftar.";
	}
	@GetMapping("/findKeberangkatan")
	public List<KeberangkatanBus> getAllDataNative(@RequestParam(value = "terminal_awal") String terminal_awal, 
			@RequestParam(value="tanggal") String tanggal){
		return bookingRepo.findKeberangkatan(terminal_awal,tanggal);
	}
	@PostMapping("/booking")
	public String postData(@RequestBody Booking booking)	{
		bookingRepo.save(booking);
		return "Pemesanan bus berhasil";
	}
	@DeleteMapping("/cancel")
	public String deletebyId(@RequestParam(value = "id", defaultValue = "{id}") long id)	{
		bookingRepo.deleteById(id);
		return "Pemesanan dengan nomor id "+id+" telah dibatalkan";
	}

	

		

	

	
}
