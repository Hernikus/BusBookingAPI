package com.ujiansb2.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name ="booking")

public class Booking {
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private long id;
	private long id_keberangkatan;
	private String nik;
	private String tanggal;
    private Long id_jurusan;
    private String no_polisi;
}
