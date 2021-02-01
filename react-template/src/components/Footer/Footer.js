import * as React from 'react';
import { Layout, Row, Col } from 'antd';
import logos from '../../assets/img/logos.jpg';
import { green, red } from '@material-ui/core/colors';
const { Footer } = Layout;




export const FooterC = () => {
  return (
    <div className='footer'>
      <Footer>
        <div className='container'>
          <Row justify={"space-between"}>
            <Col>
              <img src={logos} alt="" />
            </Col>
            <Col className="footer__content">
              <div className="col-menu">
                Nosotros
                </div>
              <div className="col-menu">
                Servicios
                </div>
              <div className="col-menu">
                Actividades
                </div>
              <div className="col-menu">
                Contactos
                </div>
            </Col>
            <Col className="footer__content">
              <div className="col-menu">
                Nosotros
                </div>
              <div className="col-menu">
                Servicios
                </div>
              <div className="col-menu">
                Actividades
                </div>
              <div className="col-menu">
                Contactos
                </div>
            </Col>
            <div className="col-menu" style={{ color: 'white' }}>
              © 2021 CRIA
            </div>
          </Row>

        </div>
      </Footer>

    </div>
  )
}