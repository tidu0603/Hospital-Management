import { Helper } from "./helper.js";
import { AdminPanel } from "./adminPanel.js";
export class DataTable {
  headers: string[];
  static table: HTMLElement = <HTMLElement>(
    document.getElementsByClassName("dataTable")[0]
  );
  datas: {}[];

  constructor(datas: {}[]) {
    this.datas = datas;
    this.headers = Object.keys(datas[0]);
    this.reset();
    this.display();
  }

  display() {
    this.displayHeaders();
    this.displayContentWithPagination();
  }

  displayHeaders() {
    let thead: HTMLElement = document.createElement("thead");
    DataTable.table.appendChild(thead);
    let row: HTMLElement = document.createElement("tr");
    thead.appendChild(row);
    this.fillOneRow(this.headers, row, "th");
    this.queryFunctions();
    if (Helper.isAdmin()) {
      let operationHeader = document.createElement("th");
      row.appendChild(operationHeader);
      operationHeader.innerText = "Operations";
    }
  }

  manipFunctions() {
    let tbody = DataTable.table.children[1];
    for (let i = 0; i < tbody.childElementCount; i++) {
      let row = tbody.children[i];
      let manipCol = document.createElement("td");
      row.appendChild(manipCol);
      let rootDiv = document.createElement("div");
      rootDiv.classList.add("manip-col");
      manipCol.appendChild(rootDiv);
      let firstBtnDiv = document.createElement("div");
      let secondBtnDiv = document.createElement("div");
      rootDiv.appendChild(firstBtnDiv);
      rootDiv.appendChild(secondBtnDiv);
      let edit = document.createElement("button");
      let del = document.createElement("button");
      let save = document.createElement("button");
      let undo = document.createElement("button");
      del.innerHTML = 'DELETE <i class="fas fa-trash-alt"></i>';
      edit.innerHTML = 'EDIT <i class="fas fa-edit"></i>';
      save.innerHTML = "SAVE " + '<i class="far fa-check-circle"></i>';
      undo.innerHTML = "UNDO " + '<i class="fas fa-undo"></i>';

      firstBtnDiv.appendChild(edit);
      secondBtnDiv.appendChild(del);

      let id: string = row.children[0].innerHTML;
      edit.onclick = () => {
        firstBtnDiv.removeChild(edit);
        firstBtnDiv.appendChild(save);
        (<HTMLElement>row).contentEditable = "true";
        (<HTMLElement>row.children[0]).contentEditable = "false";
        if (!AdminPanel.editingIDs.includes(parseInt(id))) {
          AdminPanel.editingIDs.push(parseInt(id));
          if (AdminPanel.getSavedIDs().includes(parseInt(id))) {
            AdminPanel.editedContent = AdminPanel.editedContent.filter(
              (content) => content.id != id
            );
          }
          AdminPanel.refresh();
          AdminPanel.supervise();
        }
      };
      save.onclick = () => {
        firstBtnDiv.removeChild(save);
        firstBtnDiv.appendChild(edit);
        (<HTMLElement>row).contentEditable = "false";
        let index = AdminPanel.editingIDs.indexOf(parseInt(id));
        if (index >= 0) {
          AdminPanel.editingIDs.splice(index, 1);
          let newContent: { [key: string]: any } = Helper.tableToJSON(
            DataTable.table,
            i,
            1
          )[0];
          delete newContent["Operations"];
          AdminPanel.addEditedContent(
            Helper.keepDiffereces(
              <{ [key: string]: any }>this.datas.find((data) => {
                if (data["id"] == id) return data;
              }),
              newContent
            )
          );
          AdminPanel.refresh();
          AdminPanel.supervise();
        }
      };
      del.onclick = () => {
        secondBtnDiv.removeChild(del);
        secondBtnDiv.appendChild(undo);
        if (!AdminPanel.deletedIDs.includes(parseInt(id))) {
          AdminPanel.deletedIDs.push(parseInt(id));
          AdminPanel.refresh();
          AdminPanel.supervise();
        }
      };
      undo.onclick = () => {
        secondBtnDiv.removeChild(undo);
        secondBtnDiv.appendChild(del);
        let index = AdminPanel.deletedIDs.indexOf(parseInt(id));
        if (index >= 0) {
          AdminPanel.deletedIDs.splice(index, 1);
          AdminPanel.refresh();
          AdminPanel.supervise();
        }
      };
    }
  }

  queryFunctions() {
    let headerRow = DataTable.table.children[0].children[0];
    Array.from(headerRow.children).forEach((child) => {
      child.innerHTML = "";
      let rootDiv = document.createElement("div");
      rootDiv.classList.add("rootDiv");
      let sortUpBtn = document.createElement("button");
      sortUpBtn.innerHTML = '<i class="fas fa-sort-up"></i>';
      let sortDownBtn = document.createElement("button");
      sortDownBtn.innerHTML = '<i class="fas fa-sort-down"></i>';
      let sortDiv = document.createElement("div");
      sortDiv.classList.add("innerDiv");
      let searchBtn = document.createElement("button");
      searchBtn.innerHTML = '<i class="fab fa-searchengin"></i>';
      let searchDiv = document.createElement("div");
      searchDiv.classList.add("innerDiv");
      searchDiv.innerHTML = this.headers[
        Array.from(headerRow.children).indexOf(child)
      ];
      let searchBtnDiv = document.createElement("div");
      searchBtnDiv.appendChild(searchBtn);
      searchDiv.appendChild(searchBtnDiv);
      sortDiv.appendChild(sortUpBtn);
      sortDiv.appendChild(sortDownBtn);

      rootDiv.appendChild(searchDiv);
      rootDiv.appendChild(sortDiv);
      child.appendChild(rootDiv);

      sortUpBtn.onclick = () => {
        sortDownBtn.disabled = true;
      };

      sortDownBtn.onclick = () => {
        sortUpBtn.disabled = true;
      };

      let searchInput = document.createElement("input");
      searchInput.type = "text";
      searchInput.onblur = () => {
        if (
          Array.from(searchBtnDiv.children).includes(searchInput) &&
          searchInput.value === ""
        ) {
          searchBtnDiv.removeChild(searchInput);
          searchBtnDiv.appendChild(searchBtn);
        }
      };

      searchBtn.onclick = () => {
        if (Array.from(searchBtnDiv.children).includes(searchBtn)) {
          searchBtnDiv.removeChild(searchBtn);
          searchBtnDiv.appendChild(searchInput);
          searchInput.focus();
        }
      };
    });
  }

  displayContent(datas: {}[], start: number, end: number) {
    let tbody: HTMLElement = <HTMLElement>DataTable.table.children[1];
    if (tbody == null) {
      tbody = document.createElement("tbody");
      DataTable.table.appendChild(tbody);
    }
    let num = end - start + 1;

    Helper.dynamicResize(num, tbody, "tr");

    for (let i = 0; i < num; i++) {
      let dataContent: string[] = Object.values(datas[i + start]);
      this.fillOneRow(dataContent, <HTMLElement>tbody.children[i]);
    }
  }

  displayContentWithPagination() {
    let recordsPerPage: number = parseInt(
      (<HTMLInputElement>document.getElementById("pagination-input")).value
    );
    if (isNaN(recordsPerPage) || recordsPerPage <= 0) {
      recordsPerPage = this.datas.length;
    }
    let num_of_paginations: number = Math.ceil(
      this.datas.length / recordsPerPage
    );
    let pagination: HTMLElement = <HTMLElement>(
      document.getElementById("pagination")
    );

    Helper.dynamicResize(num_of_paginations, pagination, "button");

    for (let i = 0; i < num_of_paginations; i++) {
      (<HTMLElement>pagination.children[i]).innerText = "" + i;
      (<HTMLElement>pagination.children[i]).onclick = () => {
        let end =
          (i + 1) * recordsPerPage - 1 > this.datas.length - 1
            ? this.datas.length - 1
            : (i + 1) * recordsPerPage - 1;
        this.displayContent(this.datas, i * recordsPerPage, end);
        if (Helper.isAdmin()) {
          this.manipFunctions();
          AdminPanel.supervise();
        }
      };
    }
    (<HTMLElement>pagination.children[0]).click();
    this.responsiveHeaders();
  }

  responsiveHeaders() {
    let style: HTMLStyleElement = <HTMLStyleElement>(
      document.getElementById("responsive-header")
    );
    let styleSheet: CSSStyleSheet = <CSSStyleSheet>style.sheet;
    for (let i = 0; i < styleSheet.cssRules.length; i++) {
      styleSheet.deleteRule(i);
    }
    let rule =
      "@media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px)  {";
    for (let i = 0; i < this.headers.length; i++) {
      rule += `.dataTable td:nth-of-type(${i + 1}):before { content: "${
        this.headers[i]
      }"; }\n`;
    }
    if (Helper.isAdmin())
      rule += `.dataTable td:nth-of-type(${
        this.headers.length + 1
      }):before { content: "Operations"; }\n`;
    rule += "}";
    styleSheet.insertRule(rule);
  }

  fillOneRow(content: string[], row: HTMLElement, type: string = "td") {
    Helper.dynamicResize(content.length, row, type);

    for (let i = 0; i < content.length; i++) {
      let col: HTMLElement = <HTMLElement>row.children[i];
      col.innerHTML = content[i];
    }
  }

  reset() {
    for (let i = 0; i < DataTable.table.childElementCount; i++) {
      DataTable.table.children[i].remove();
    }
  }
}
