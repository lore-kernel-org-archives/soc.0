Return-Path: <SRS0=eHLg=SY=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647DCC433F5
	for <soc@archiver.kernel.org>; Wed,  9 Feb 2022 09:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1BA17C340EE; Wed,  9 Feb 2022 09:39:59 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BDF19C340E7;
	Wed,  9 Feb 2022 09:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BDF19C340E7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mdvua-1nrLO12x6s-00azRu; Wed, 09 Feb 2022 10:39:55 +0100
Received: by mail-wr1-f42.google.com with SMTP id k18so2919332wrg.11;
        Wed, 09 Feb 2022 01:39:55 -0800 (PST)
X-Gm-Message-State: AOAM533FhSGBMUoL4lyG5gD4gMX4ZFTeRfO9fHB1nTHn3ijlgpXAjNqx
	+7TNjt9bVxaDK74A/ASn9LQey2ea3wC3CrT82rY=
X-Google-Smtp-Source: ABdhPJz3KHEWzLUGUXQRVUVhG7tdvGJxnqkmHAQWCi8BoxyHdHPDE5k/78Mr9En5Xk713UBFNQeWBwjQLBOzv8A4Rqg=
X-Received: by 2002:a5d:500c:: with SMTP id e12mr1335451wrt.219.1644399595263;
 Wed, 09 Feb 2022 01:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20220113080017.30155-1-kavyasree.kotagiri@microchip.com>
 <f8b83cf0-7ebf-1ecd-b544-f0d0079d9dde@microchip.com> <CAK8P3a2kRhCOoXnvcMyqS-zK2WDZjtUq4aqOzE5VV=VMg=pVOA@mail.gmail.com>
 <CO1PR11MB48651C0D73189AF010407F9B922E9@CO1PR11MB4865.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB48651C0D73189AF010407F9B922E9@CO1PR11MB4865.namprd11.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 9 Feb 2022 10:39:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1swyDBvSTg9a6tUnd2V2Zi=ANpJWhJpWwfvp7ArZpwVg@mail.gmail.com>
Message-ID: <CAK8P3a1swyDBvSTg9a6tUnd2V2Zi=ANpJWhJpWwfvp7ArZpwVg@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: add DT for lan966x SoC and 2-port board pcb8291
To: Kavyasree.Kotagiri@microchip.com
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Ferre <Nicolas.Ferre@microchip.com>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:5VIWq0Cc8IvEeOGUt8BWU5pbBX0k9kdn+2W6602QNZKJQw0UouD
 DznhdzmNd0MEIkAC3NbB2NPJmYNFRVRaQFOjiw2qMh3/UPmpCVgSiHlr3xAMFbcTphoQqli
 8sfgaqDTWt6jIzSUSa5ONJduXUfi4EzU9oUMv47GFojiJEacCOF7tjjy3x0u1qXCAe6GEbw
 sW8XX03nvwrEPdALkjBow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XumT2HNkvHc=:ajddl7lMtLjZioYDN7JGDA
 9ygDoYugKPidd309Nf0GvlSTpHWx/oAJXMpVdGF6kekEGtQJA/9FFsDvNz+CGxcnpDs+vLov5
 Q5doKWQNpJzuH8VTAXJh9XL2AwQlAsvAO5sXZX1F4+WCiYPdZJXDLIWyZEd1i3qQcBY7uZyYV
 Dh0hEt06M8bOUk7PF01Aassa7mRipcOB0VsVy6tGx7Rs2dw/FUTe5X192XrmgJbdF5/BUse17
 ynxnhh+Cv9H8LK+Fma/H+0hwohjD6rFoCnu9LfjeYlwH5vFJHnh971xv4PRmLyra3MVQCQDuJ
 Xs+NudxRsHPn+sIG5hejftltuA/HksQsF3wXj5TdGEmnfvkwoHQCRlwelO34zowfu/fjsOvTh
 d0L7PObJLxw+zwsu5NClfZdy92z7r7csSmML3FvxTJQH+NKK7r74C/3I7dEia6FXc7Ckv+4oC
 S5pcW5DcQZj4WTLb4F31h+AD0SdIDGZV2Do66IjZcbb1PsuIQniVj3fVVu1qHptciGKtgpFuo
 YnL+iobhW4V/oLCCbJcabH22cMel0WMGYS9NEAjYJiZ2x5oYZ4n2PMgbJ1sYjaaYtsCLXWZWG
 KrBQ2sP1qsfEZq6ToJnd2yL3lzTe/M2PeoB/1yKmJEkY5DAbXIsMUNRgio7nir0lhFm3bC+Cm
 PIlSPT+xNxUzTz6YN0dcwfqHrn48NFWKjp3qPr/bPwrshgWfJKCz95VaJcSA5sKPDv2M=

On Wed, Feb 9, 2022 at 10:02 AM <Kavyasree.Kotagiri@microchip.com> wrote:
> > > On 13/01/2022 at 09:00, Kavyasree Kotagiri wrote:

> > > > +&gpio {
> > > > +     fc_shrd7_pins: fc_shrd7-pins {
> > > > +             pins = "GPIO_49";
> > > > +             function = "fc_shrd7";
> > > > +     };
> >
> > These properties don't look like most pinctrl nodes, has the binding
> > been reviewed?
> > I don't see it in Documentation/devicetree/bindings/pinctrl/
> >
> This is similar to the ones used in Microchip Ocelot and Sparx5 pinctrl.
> For example, see usart_pins of gpio nodes in below links:
> https://sbexr.rabexc.org/latest/sources//84/d39b543790ff25.jhtml
> https://searchcode.com/file/333750634/arch/mips/boot/dts/mscc/ocelot.dtsi/

Ok, I see, so this was reviewed by both Rob and LinusW, I assume it's fine
then, though the use of strings with capital letters, with all pins
named "GPIO_*"
still looks odd.

For my understanding, would you describe the lan966x family as
a follow-up to Ocelot, with the CPU cores replaced and flexcom added,
or should I think of it as a SAMA7 based SoC design that incorporates
the Vitesse switch IP?

        Arnd
