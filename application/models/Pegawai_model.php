<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * 
 */
class Pegawai_model extends CI_Model
{

	private $_table = "pegawai";

	public $id_pegawai;
	public $nik;
	public $nama;
	public $username;
	public $password;
	public $alamat;
	public $nohp;
	public $jabatan;
	public $hak_akses;

	public function rules()
	{
		return [
			[
				'field' => 'nik',
				'label' => 'nik',
				'rules' => 'required'
			],

			[
				'field' => 'nama',
				'label' => 'nama',
				'rules' => 'required'
			],

			[
				'field' => 'username',
				'label' => 'username',
				'rules' => 'required'
			],

			[
				'field' => 'password',
				'label' => 'password',
				'rules' => 'required'
			],

			[
				'field' => 'alamat',
				'label' => 'alamat',
				'rules' => 'required'
			],

			[
				'field' => 'nohp',
				'label' => 'nohp',
				'rules' => 'required|numeric|max_length[15]'
			],

			[
				'field' => 'jabatan',
				'label' => 'jabatan',
				'rules' => 'required'
			],

			[
				'field' => 'hak_akses',
				'label' => 'hak_akses',
				'rules' => 'required'
			]
		];
	}

	public function getALL()
	{
		return $this->db->get($this->_table)->result();
	}

	public function getById($id)
	{
		return $this->db->get_where($this->_table, ["id_pegawai" => $id])->row();
	}

	public function save()
	{

		$post = $this->input->post();
		$this->id_pegawai = uniqid();
		$this->nik = $post["nik"];
		$this->nama = $post["nama"];
		$this->username = $post["username"];
		$this->password = $post["password"];
		$this->alamat = $post["alamat"];
		$this->nohp = $post["nohp"];
		$this->jabatan = $post["jabatan"];
		$this->hak_akses = $post["hak_akses"];
		$this->db->insert($this->_table, $this);
	}

	public function update($id)
	{
		$data = array(
			"nik" => $this->input->post('nik'),
			"nama" => $this->input->post('nama'),
			"username" => $this->input->post('username'),
			"password" => md5($this->input->post('password')),
			"alamat" => $this->input->post('alamat'),
			"nohp" => $this->input->post('nohp'),
			"jabatan" => $this->input->post('jabatan'),
			"hak_akses" => $this->input->post('hak_akses')
		);

		$this->db->where('id_pegawai', $id);
		$this->db->update('pegawai', $data); // Untuk mengeksekusi perintah update data
	}

	// Fungsi untuk melakukan menghapus data siswa berdasarkan NIS siswa
	public function delete($id)
	{
		$this->db->where('id_pegawai', $id);
		$this->db->delete('pegawai'); // Untuk mengeksekusi perintah delete data
	}

	// Fungsi untuk melakukan proses upload file
	public function upload_file($filename)
	{
		$this->load->library('upload'); // Load librari upload

		$config['upload_path'] = './excel/';
		$config['allowed_types'] = 'xlsx';
		$config['max_size']  = '2048';
		$config['overwrite'] = true;
		$config['file_name'] = $filename;

		$this->upload->initialize($config); // Load konfigurasi uploadnya
		if ($this->upload->do_upload('file')) { // Lakukan upload dan Cek jika proses upload berhasil
			// Jika berhasil :
			$return = array('result' => 'success', 'file' => $this->upload->data(), 'error' => '');
			return $return;
		} else {
			// Jika gagal :
			$return = array('result' => 'failed', 'file' => '', 'error' => $this->upload->display_errors());
			return $return;
		}
	}

	// Buat sebuah fungsi untuk melakukan insert lebih dari 1 data
	public function insert_multiple($data)
	{
		$this->db->insert_batch('pegawai', $data);
	}
}
