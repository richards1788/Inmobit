import * as React from 'react';
import { FooterC } from '../../components/Footer/Footer';
import { HeaderC } from '../../components/Header/Header'
import { Start } from '../../components/Home/Start';
import { Activity } from '../../components/Activities/Activities';
import { Paragraph } from '../../components/Us/Us';
import { Certificate } from '../../components/Certificate/Certificate';
import { Contribution } from '../../components/Contributions/Contributions';
import { Social } from '../../components/Social/Social'

export const Home = () => {
  return (
    <>
      <main className="container-main__content" >

        <HeaderC />
        <Start />
        <Paragraph />
        <Activity />
        <Contribution />
        <Certificate />
        <Social />
        <FooterC />
      </main>

    </>
  )
}