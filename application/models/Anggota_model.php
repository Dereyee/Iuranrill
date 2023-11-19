<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * 
 */
class Anggota_model extends CI_Model
{

	private $_table = "anggota";

	public $id_anggota;
	public $nia;
	public $nama;
	public $kk;
	public $jenis_kelamin;
	public $alamat;
	public $srt_pengantar;

	public function rules()
	{
		return [
			[
				'field' => 'nia',
				'label' => 'nia',
				'rules' => 'required'
			],

			[
				'field' => 'nama',
				'label' => 'nama',
				'rules' => 'required'
			],

			[
				'field' => 'kk',
				'label' => 'kk',
				'rules' => 'required'
			],

			[
				'field' => 'jenis_kelamin',
				'label' => 'jenis_kelamin',
				'rules' => 'required'
			],

			[
				'field' => 'alamat',
				'label' => 'alamat',
				'rules' => 'required'
			],

			[
				'field' => 'srt_pengantar',
				'label' => 'srt_pengantar',
				'rules' => 'required'
			]
		];
	}

	public function getALL()
	{
		return $this->db->get($this->_table)->result();
	}

	public function detail_anak($id)
	{
		$this->db->select('*');
		$this->db->from('anak');
		$this->db->join('anggota', 'anak.id_anggota = anggota.id_anggota');
		$this->db->where('anggota.id_anggota', $id);
		$query = $this->db->get();
		return $query->result();
	}

	public function detail_pasangan($id)
	{
		$this->db->select('*');
		$this->db->from('pasangan');
		$this->db->join('anggota', 'pasangan.id_anggota = anggota.id_anggota');
		$this->db->where('anggota.id_anggota', $id);
		$query = $this->db->get();
		return $query->result();
	}

	public function getById($id)
	{
		return $this->db->get_where($this->_table, ["id_anggota" => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		$this->id_anggota = uniqid();
		$this->nia = $post["nia"];
		$this->nama = $post["nama"];
		$this->kk = $post["kk"];
		$this->jenis_kelamin = $post["jenis_kelamin"];
		$this->alamat = $post["alamat"];
		$this->srt_pengantar = $post["srt_pengantar"];
		$this->db->insert($this->_table, $this);
	}

	public function update($id)
	{
		$data = array(
			"nia" => $this->input->post('nia'),
			"nama" => $this->input->post('nama'),
			"kk" => $this->input->post('kk'),
			"jenis_kelamin" => $this->input->post('jenis_kelamin'),
			"alamat" => $this->input->post('alamat'),
			"srt_pengantar" => $this->input->post('srt_pengantar')
		);

		$this->db->where('id_anggota', $id);
		$this->db->update('anggota', $data); // Untuk mengeksekusi perintah update data
	}

	public function hide($id)
	{
		$this->db->where('id_anggota', $id);
		$this->_table->update('set_aktif == False');
	}

	// Fungsi untuk melakukan menghapus data siswa berdasarkan NIS siswa
	public function delete($id)
	{
		$this->db->where('id_anggota', $id);
		$this->db->delete('anggota'); // Untuk mengeksekusi perintah delete data
	}
}
