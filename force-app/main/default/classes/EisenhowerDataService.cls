public with sharing class EisenhowerDataService {
    @AuraEnabled(cacheable=true)
    public static List<Eisenhower_Matrix__c> getMatrixItems(String matrixTypeId) {
      String query =
        'SELECT Name, Is_Done__c, Label__c, Type__c FROM Eisenhower_Matrix__c ';
      if (String.isNotBlank(matrixTypeId)) {
        query += ' WHERE Type__c = :matrixTypeId';
      }
      query += ' WITH SECURITY_ENFORCED ';
      return Database.query(query);
    }

    @AuraEnabled(cacheable=true)
    public static List<Matrix_Types__c> getMatrixTypes() {
        return [
            SELECT Name, Id
            FROM Matrix_Types__c
            WITH SECURITY_ENFORCED
            ORDER BY Name
        ];
    }
}
