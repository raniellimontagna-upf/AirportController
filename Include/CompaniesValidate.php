<?php

class CompaniesValidate {
    public static function testarCNPJ($paramCNPJ) {
        if (strlen($paramCNPJ) < 14 || strlen($paramCNPJ) > 14) {
            return false;
        } else {
            return true;
        }
    }

    public static function testarRazaoSocial($paramRazaoSocial) {

        $searchEireli = 'Eireli';
        $searchLtda = 'Ltda';

        if(preg_match("/{$searchEireli}/i", $paramRazaoSocial)) {
            return true;
        } else if (preg_match("/{$searchLtda}/i", $paramRazaoSocial)) {
            return true;
        } else {
            return false;
        }
    }
}
?>