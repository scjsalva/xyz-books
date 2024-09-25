import { Controller } from "@hotwired/stimulus";
import { convertIsbn } from "../helpers/isbn";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "results", "resultsContainer"];

  connect() {
    console.log("Search controller connected");
  }

  initializeData() {
    this.fetchResults(0);
  }

  fetchResults() {
    clearTimeout(this.debounceTimeout);

    let query = this.inputTarget.value, isbn_query;
    if (!query.trim()) {
      this.hideResultsContainer();
      return;
    }

    this.showResultsContainer();
    
    try {
      isbn_query = convertIsbn(query, "ISBN-13");
    } catch (error) {
      this.formatError("Invalid ISBN format. Please check your input and try again.")
    }

    if(isbn_query)
      fetch(`/books/${encodeURIComponent(isbn_query)}.json`)
        .then(response => response.json())
        .then(data => {
          if(data.error)
            this.formatError(data.error)
          else
            this.formatResult(data)
        })
  }

  showResultsContainer() {
    this.resultsContainerTarget.classList.remove("hidden");
  }

  hideResultsContainer() {
    this.resultsContainerTarget.classList.add("hidden");
    this.clearResultsContainer();
  }

  clearResultsContainer() {
    this.resultsTarget.innerHTML = '';
  }

  formatError(error) {
    this.resultsTarget.innerHTML = `
      <li class="p-4 bg-white rounded-0">
        ${error}
      </li>
    `;
  }

  formatResult(book) {
    this.clearResultsContainer();
    this.resultsTarget.innerHTML = `
      <li class="flex flex-col md:flex-row justify-center items-center p-4 bg-white hover:bg-indigo-50 rounded-0 cursor-pointer" data-action="click->search#redirect" data-isbn="${book.isbn_13}">
        <img src="/book-covers/${book.cover_url || 'default.png'}" class="h-48 md:h-24">
        <div class="flex-1 p-3">
          <h1 class="font-bold text-xl text-indigo-500">${book.title}, ${book.publication_year}</h1>
          <h3 class="font-[500] text-lg">${book.isbn_13}</h3>
          <p class="text-slate-500">${book.authors}</p>
        </div>
      </li>
    `;
  }

  redirect(event) {
    const isbn = event.currentTarget.dataset.isbn;
    if (isbn) {
        window.location.href = `/books/${isbn}`;
    }
  }
}
