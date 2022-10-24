<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MahasiswaModel extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function getMahasiswa()
    {
        $result = $this->db->get('mahasiswa');
        return $result->result_array();
    }
}