public with sharing class VotingService {

    // Método para obtener la lista de candidatos
    @AuraEnabled(cacheable=true)
    public static List<Candidato__c> getCandidates() {
        try {
            // Consultamos todos los candidatos disponibles
            List<Candidato__c> candidatos = [SELECT Id, Name FROM Candidato__c];
            return candidatos;  // Retornamos la lista de candidatos
        } catch (Exception e) {
            throw new AuraHandledException('Error al obtener los candidatos: ' + e.getMessage());
        }
    }

    // Método para registrar un voto
    @AuraEnabled
    public static String registerVote(Id votanteId, Id candidatoId) {
        try {
            // Verifica si el votante ya ha votado
            Voto__c existingVote = [SELECT Id FROM Voto__c WHERE Votante__c = :votanteId LIMIT 1];
            
            if (existingVote != null) {
                return 'Ya has votado';  // Mensaje si el votante ya ha votado
            }

            // Si no ha votado, se crea el nuevo registro de voto
            Voto__c newVote = new Voto__c(Votante__c = votanteId, Candidato__c = candidatoId);
            insert newVote;  // Insertamos el nuevo voto

            // Incrementamos el número de votos del candidato
            Candidato__c candidato = [SELECT Id, Cantidad_de_Votos__c FROM Candidato__c WHERE Id = :candidatoId LIMIT 1];
            candidato.Cantidad_de_Votos__c += 1;  // Incrementamos el contador de votos
            update candidato;  // Actualizamos el registro del candidato

            return 'Voto registrado exitosamente';  // Mensaje de éxito
        } catch (Exception e) {
            throw new AuraHandledException('Error al registrar el voto: ' + e.getMessage());
        }
    }
}
