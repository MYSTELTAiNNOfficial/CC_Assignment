<?php

use Restserver\Libraries\REST_Controller;

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Mahasiswa extends REST_Controller
{
    function __construct($config = 'rest')
    {
        parent::__construct($config);
        $this->load->model("MahasiswaModel", "model");
    }

    public function index_get()
    {
        $data = $this->model->getMahasiswa();
        $this->set_response([
            'status' => TRUE,
            'code' => 200,
            'message' => 'Data has been successfully retrieved.',
            'data' => $data
        ], REST_Controller::HTTP_OK);
    }

    public function sendmail_post()
    {
        $to_email = $this->post('email');
        $user = implode("", (explode("@", $to_email, -1)));
		$data = array('user' => $user);

        $this->load->library('email');
        $this->email->from('noreply@mysteltainn.com', 'Noreply');
        $this->email->to($to_email);
        $this->email->subject('News');
        $this->email->message($this->load->view('email_welcome', $data, true));

        if ($this->email->send()) {
            $this->set_response([
                'status' => TRUE,
                'code'   => 200,
                'message' => 'Email has been successfully send, please check your email.'
            ], REST_Controller::HTTP_OK);
        } else {
            $this->set_response([
                'status' => FALSE,
                'code'   => 404,
                'message' => 'Failed to send email!'
            ], REST_Controller::HTTP_OK);
        }
    }
}
