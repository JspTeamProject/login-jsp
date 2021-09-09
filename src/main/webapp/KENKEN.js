const idInput = document.querySelector("#id");
const submit = document.querySelector("#submit");

const idchk = () => {
    const idInput = document.querySelector("#id").value;
    if (idInput === "") {
        Swal.fire("id를 입력해주세요.");
        return false;
    } else {
        window.open("idchk.jsp?id=" + idInput, "아이디 중복검사 팝업창", "width=500,height=600");
    }
};

function IdDenied(newId) {
    const idInput = document.querySelector("#id");
    idInput.value = newId;
};

function IdConfirmed(){
    idInput.readOnly = true;
    idInput.style.color = "#CD1039"
    submit.disabled = false;
    submit.style.backgroundColor = "#63CC63"
}