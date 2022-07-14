Return-Path: <SRS0=QacK=XT=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152B2C43334
	for <soc@archiver.kernel.org>; Thu, 14 Jul 2022 20:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CADAEC341C6; Thu, 14 Jul 2022 20:15:37 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31F6DC3411C;
	Thu, 14 Jul 2022 20:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31F6DC3411C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f179.google.com ([209.85.219.179]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MsJXG-1nO6E32tb8-00tj3g; Thu, 14 Jul 2022 22:15:33 +0200
Received: by mail-yb1-f179.google.com with SMTP id y195so5232397yby.0;
        Thu, 14 Jul 2022 13:15:33 -0700 (PDT)
X-Gm-Message-State: AJIora8pmRGGCAO3yZfai3X5WVhD4GHMzmajti3CzBRdX+FlT9T+EvVF
	xtX4IZnoEamn/zcUkGHTGFzmcJy6edzk/YvJMDE=
X-Google-Smtp-Source: AGRyM1ufLR1tXyfyrelM5ysCbbKNSHqOWqFASMdGq5/rYwOY4jOjwUqmCRVpkzIQCCqnubMWRWU8c8ZFrp1nxf+t2A0=
X-Received: by 2002:a05:6902:120f:b0:668:2228:9627 with SMTP id
 s15-20020a056902120f00b0066822289627mr11089451ybu.134.1657829732313; Thu, 14
 Jul 2022 13:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220707132054.GA10610@logan-ThinkPad-T14-Gen-1>
 <CAK8P3a0P2u+LdXcU7As=dfNbg_J2eWfhgB9TT1-xVyH0v6OM5Q@mail.gmail.com> <YtBazSo/uJzFeF+L@pdel-mbp>
In-Reply-To: <YtBazSo/uJzFeF+L@pdel-mbp>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 Jul 2022 22:15:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1juHV6N2QtXaEcobWs6kQHBqqUn9MynvobyJtFFyOsfg@mail.gmail.com>
Message-ID: <CAK8P3a1juHV6N2QtXaEcobWs6kQHBqqUn9MynvobyJtFFyOsfg@mail.gmail.com>
Subject: Re: [PATCH v3] The Yosemite V3.5 is a facebook multi-node server
 platform that host four OCP server. The BMC in the Yosemite V3.5 platform
 based on AST2600 SoC.
To: peter@pjd.dev
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Logananth Sundararaj <logananth13.hcl@gmail.com>, 
	DTML <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, naveen.mosess@hcl.com, thangavel.k@hcl.com, 
	SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Olof Johansson <olof@lixom.net>, garnermic@gmail.com, velumanit@hcl.com, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:TeQY4NWa/y5sgLhwdrY07O+SB1sqrkHvyAFBdi1KLy+F/Q8bHEg
 kkmk3u2cCS58iR5t/zzTwZ9jVX5oRQ2z3Eu0LqEFo0AGBKji+o3iefIqlm9NQolYTFiweG1
 f4jzXI+s5r80LDahIQE6V/ACANTnwmPbx6oXWAU2bZLfdXs6R+H6bBW4DsJZp1le/YGMAUj
 0LPkU/I3cGxVAB4twi0Ag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gl5Hmc9xV0U=:VeqMC36YuBmCA0q4yFPhEb
 XnhRb+17eUExMc2IreRDbwKyTWEcJDS5PdNeQsL6O0UQjaoQ9kMTydw4f7Gi7/te1z+q6vtNk
 444ZwoQvAg4VAyDSd/iVjtPB2Wl/uRF5Gy0x57i3Y6kJlrJQLSaPu/m0Gu5/QBOaJgvuQIlct
 mSVxcwCdr31ioj2mKxZUqCLNRBXSikV8ylTy6eovO26eclKYmbKz55oEj5ctnAALFbupgn4d9
 iewpyAs8Yp+pqF1A0Ig6g8Y74SfcB/Y9lPgj6nfilBr0D4hgHYvVGQbJsKP0t2D8nW6FEdswv
 kejh1o/Zgldb8SrosqGK3dFguE0occjT/Oy/v9B76izdoNGxSSy/9qYI7FRZGGsP/Qkciier5
 29FI3jkLfcEJEpsIj1lIoE6yaL3CHnyYkDB6Tu9LXAsIjvnLEhDvEeQwyTaW3JSgpPAoUtAv8
 OuwZte6UMyTsTNuSve+nlYwT1l1cjWPKed5cCBV/i162oVz3kWh+O0dQjrHoKB43TapDbZvMP
 sdIgwaxtCXL3Rf7p0kJr6YB/+IQSfu7IsIV6vXxmpTeZXoWnyS69VhX9Xpk0DfHDoFJNalQcT
 taU8N8SXq91IhJjuvf79eaihB28LcEN5tH0ZYVozkkE3pcWl/9gNCkZ9YFbmmzUpT0/bggWoR
 Fagz8m+83ECtT6E779wdzIj3sTgJbSzR/QcY4VLcOBLTBdTaXla7A4YZ3ot4CuxeRHzcPSz+f
 1XC5XlZ7ElXlQ8zBYrMe64WQdeRFnKCSKvMiz0mkv96y1fTkyZp2tIBsV3U6EaUDDo982Nmvi
 ucvxf+2qWqnE4fKnfTnEENGd7qmyvE/LOMdp6IwsOczHeNo6N8yNimJxFcwUpvo9Plbh7vMYW
 5cyLH4Bbc5jC40wZcYzA==

On Thu, Jul 14, 2022 at 8:05 PM Peter Delevoryas <peter@pjd.dev> wrote:
> On Thu, Jul 07, 2022 at 03:33:48PM +0200, Arnd Bergmann wrote:
> > > +       model = "Facebook fby35";
> > > +       compatible = "facebook,fby35", "aspeed,ast2600";
> > > +
> > > +       aliases {
> > > +               serial4 = &uart5;
> > > +       };
> >
> > Why not start at serial0 here?
>
> Hey, Facebook person jumping in here (using a personal email):
>
> I think you're right, it should be like this:
>
>         aliases {
>                 serial0 = &uart5;
>                 serial1 = &uart1;
>                 serial2 = &uart2;
>                 serial3 = &uart3;
>                 serial4 = &uart4;
>         };

Are you actually using all five uarts though?

> > > +       chosen {
> > > +               stdout-path = &uart5;
> > > +               bootargs = "console=ttyS4,57600n8 root=/dev/ram rw vmalloc=384M";
> > > +       };
>
> Also: if we do serial0 = &uart5, it should be console=ttyS0, not ttyS4.
>
> >
> > The bootargs should really come from the boot loader.
>
> What if we want to boot the kernel by itself with QEMU? It's kinda annoying to
> have to specify '-append "console=ttyS0,57600n8...' everytime, or to have to use
> a wrapper script. But, it's also a source of bugs: I realized yesterday the
> dts we were using here:
>
> https://github.com/facebook/openbmc-linux/blob/e26c76992e0761d9e440ff514538009384c094b4/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
>
> Has the wrong console setting.

You can encode the uart settings like

           stdout-path = "serial0:115200n8"

the rest really should be passed on the command line, not in
the DT shipped with the kernel.

        Arnd
