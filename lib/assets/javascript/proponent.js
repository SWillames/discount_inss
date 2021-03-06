$(document).ready(function() {

  function limpa_formulário_cep() {
      // Limpa valores do formulário de cep.
      $("#proponent_address_attributes_public_place").val("");
      $("#proponent_address_attributes_district").val("");
      $("#proponent_address_attributes_city").val("");
      $("#proponent_address_attributes_uf").val("");
      
  }

  //Quando o campo cep perde o foco.
  $("#proponent_address_attributes_zip_code").blur(function() {

      //Nova variável "cep" somente com dígitos.
      var cep = $(this).val().replace(/\D/g, '');

      //Verifica se campo cep possui valor informado.
      if (cep != "") {

          //Expressão regular para validar o CEP.
          var validacep = /^[0-9]{8}$/;

          //Valida o formato do CEP.
          if(validacep.test(cep)) {

              //Preenche os campos com "..." enquanto consulta webservice.
              $("#proponent_address_attributes_public_place").val("...");
              $("#proponent_address_attributes_district").val("...");
              $("#proponent_address_attributes_city").val("...");
              $("#proponent_address_attributes_uf").val("...");
              

              //Consulta o webservice viacep.com.br/
              $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/unicode/?callback=?", function(dados) {

                  if (!("erro" in dados)) {
                      //Atualiza os campos com os valores da consulta.
                      $("#proponent_address_attributes_public_place").val(dados.logradouro);
                      $("#proponent_address_attributes_district").val(dados.bairro);
                      $("#proponent_address_attributes_city").val(dados.localidade);
                      $("#proponent_address_attributes_uf").val(dados.uf);
                      
                  } //end if.
                  else {
                      //CEP pesquisado não foi encontrado.
                      limpa_formulário_cep();
                      alert("CEP não encontrado.");
                  }
              });
          } //end if.
          else {
              //cep é inválido.
              limpa_formulário_cep();
              alert("Formato de CEP inválido.");
          }
      } //end if.
      else {
          //cep sem valor, limpa formulário.
          limpa_formulário_cep();
      }
  });
});