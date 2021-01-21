<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * KUISKU
 * name
 * email
 * Computer Based-Test
 */
class Cbt_topik_model extends CI_Model
{
    public $table = 'cbt_topik';

    function __construct()
    {
        parent::__construct();
    }

    function save($data)
    {
        $this->db->insert($this->table, $data);
    }

    function delete($kolom, $isi)
    {
        $this->db->where($kolom, $isi)
            ->delete($this->table);
    }

    function update($kolom, $isi, $data)
    {
        $this->db->where($kolom, $isi)
            ->update($this->table, $data);
    }

    function count_all()
    {
        $this->db->select('COUNT(*) AS hasil')
            ->from($this->table);
        return $this->db->get();
    }

    function count_by_kolom($kolom, $isi)
    {
        $this->db->select('COUNT(*) AS hasil')
            ->where($kolom, $isi)
            ->from($this->table);
        return $this->db->get();
    }

    function count_by_topik_modul($topik, $modul)
    {
        $this->db->select('COUNT(*) AS hasil')
            ->where('(topik_modul_id=' . $modul . ' AND topik_nama="' . $topik . '")')
            ->from($this->table);
        return $this->db->get();
    }

    function get_by_kolom($kolom, $isi)
    {
        $this->db->where($kolom, $isi)
            ->from($this->table);
        return $this->db->get();
    }

    function get_by_kolom_join_modul($kolom, $isi, $userId = 0)
    {
        $this->db->select('cbt_topik.*, cbt_modul.*')
            ->join('cbt_modul', 'cbt_topik.topik_modul_id = cbt_modul.modul_id')
            ->from($this->table)
            ->where($kolom, $isi);

        if($userId != 1) {
            $this->db->where('cbt_topik.topik_create_by', $userId);
        }
        return $this->db->get();
    }

    function get_all()
    {
        $this->db->from($this->table)
            ->order_by('topik_id', 'ASC');
        return $this->db->get();
    }

    function get_by_kolom_limit($kolom, $isi, $limit)
    {
        $this->db->where($kolom, $isi)
            ->from($this->table)
            ->limit($limit);
        return $this->db->get();
    }

    function get_datatable($start, $rows, $kolom, $isi, $modul, $userId = 0)
    {
        $this->db->where('(' . $kolom . ' LIKE "%' . $isi . '%" AND topik_modul_id=' . $modul . ')');

        if ($userId != 1) {
            $this->db->where('topik_create_by', $userId);
        }
        $this->db->from($this->table)
            ->order_by($kolom, 'ASC')
            ->limit($rows, $start);
        return $this->db->get();
    }

    function get_datatable_count($kolom, $isi, $modul, $userId = 0)
    {
        $this->db->select('COUNT(*) AS hasil')
            ->where('(' . $kolom . ' LIKE "%' . $isi . '%" AND topik_modul_id=' . $modul . ')');

        if ($userId != 1) {
            $this->db->where('topik_create_by', $userId);
        }
        $this->db->from($this->table);
        return $this->db->get();
    }
}
