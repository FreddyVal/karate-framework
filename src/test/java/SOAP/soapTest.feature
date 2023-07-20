Feature: Validaciones soap

  #Las consultas tipo Soap solo funcionan bajo el verbo tipo POST
   Scenario: Cambiar de numero a texto
    Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
    When header Content-Type = 'text/xml'
    And request
    """
    <?xml version="1.0" encoding="utf-8"?>
      <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
        <soap:Body>
          <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
            <ubiNum>500</ubiNum>
          </NumberToWords>
        </soap:Body>
      </soap:Envelope>
    """
    And method POST
    And match  response/Envelope/Body/NumberToWordsResponse/NumberToWordsResult == 'five hundred '
    Then status 200
