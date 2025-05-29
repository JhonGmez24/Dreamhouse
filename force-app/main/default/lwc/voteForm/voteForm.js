import { LightningElement, wire } from 'lwc';
import getCandidates from '@salesforce/apex/VotingService.getCandidates'; // Importación del método Apex
import registerVote from '@salesforce/apex/VotingService.registerVote'; // Importación del método Apex

export default class VoteForm extends LightningElement {
    candidateOptions = [];
    selectedCandidate = '';
    message = '';

    // Obtener los candidatos desde Apex
    @wire(getCandidates)
    wiredCandidates({ error, data }) {
        if (data) {
            this.candidateOptions = data.map(candidato => ({
                label: candidato.Name,
                value: candidato.Id
            }));
        } else if (error) {
            this.message = 'Error al obtener candidatos';  // Mensaje de error en español
        }
    }

    handleCandidateChange(event) {
        this.selectedCandidate = event.target.value;
    }

    handleVote() {
        const votanteId = 'votanteId';  // Obtén el ID del votante de manera dinámica

        registerVote({ votanteId: votanteId, candidatoId: this.selectedCandidate })
            .then(result => {
                this.message = result;  // Mensaje de éxito en español
            })
            .catch(error => {
                this.message = 'Hubo un error al registrar el voto';  // Mensaje de error en español
            });
    }
}
