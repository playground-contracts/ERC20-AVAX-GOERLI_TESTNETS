import './App.css';
import CreateERC20 from './artifacts/contracts/CreateERC20.sol/CreateERC20.json'
import 'bootstrap/dist/css/bootstrap.min.css'
import { Container, Row, Col } from 'react-bootstrap'
import Faucet from './components/Faucet.js'
import TokenSend from './components/TokenSend.js'

function App() {

  const Token = CreateERC20;

  return (
    <div className="App">
    <Container>
    <Row className="justify-content-md-center">
      <Col>
        <Faucet  tokenContract={Token}/>
      </Col>
      <Col>
      <TokenSend tokenContract={Token}/>
      </Col>
    </Row>
    </Container>
</div>
  );
}

export default App;