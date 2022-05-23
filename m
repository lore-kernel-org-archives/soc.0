Return-Path: <SRS0=08VO=V7=gmail.com=tmaimon77@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1845C433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 14:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB31DC34100; Mon, 23 May 2022 14:03:36 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42475C385A9;
	Mon, 23 May 2022 14:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42475C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id q135so25578753ybg.10;
        Mon, 23 May 2022 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O90ohhie27d4nsRVO1889296fM+qYxnl0MoZNM5YMmI=;
        b=k++/jsOBDZIn4JHOwElLzj+LcTuR4+/O69MIk9vnCfBE7IhXVgIbpXQq9cpDAuJEMY
         2JjN5i9lz01D0U1uaQUJ1Oi80rDsl9y58+lMaxo8F0llCWUFcgiKNirZ/INEj4YruOW6
         ApcLH6EwHkl0PYqCIvWeRLxEWeMK+sa7qSzpMaRb2j9mQ/OOVYW/f9zgGI809i5JZBuS
         RoCX93PSclUBJFXAP3F2wKLKlrixbbSxtttj3Ew8HQbP2cXbZ1Z4bsXYGuAwAWIQaQu3
         ClYvogouQmnCJA+AjGn9utRYNUH/L7qgPp2MHI37ayVMC9h0XFOemXJRzUol5iqojnuU
         HUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O90ohhie27d4nsRVO1889296fM+qYxnl0MoZNM5YMmI=;
        b=l8qsnb7+IGXKd+uWjs8HmxzgksIms4vB0zho6N51X3bf7wUePKYSZ4nZCfhJrTSSt7
         ueI4yVz8p9T5hiZFESxiav9tdkRS03Nmq8U18rwZJtwG4Z+iTrHOjJls7vFBoOerXXSY
         4RzQnshL24eS0GgK50YiEqTbQGg3sGdOE/GSoYBCcN6FuovPptzLPrj147fZOR7pXvxl
         30ifxvmIkjR+n8RajZoTNWwONlH/tlfH2mBDliS3yzS3wLG/qBKz4nF9t70Rdz9Gh0TM
         NwMJ0sNKzmMr/2haO9ARHOvEvEKC1lbQ4thy/ib3NqJPqDOeF9DMT0zGimHS37edQJQv
         O/rw==
X-Gm-Message-State: AOAM5333XpcUN79GQP2KaqfZpwJ1FxbANCxgznZJQtCANWO68jmahzK1
	POzzGkuCQovLrrbF2taB/eaEITCx/AhZiVuPp8c=
X-Google-Smtp-Source: ABdhPJzwXULST9U+Vw2XdebHSP+a3/h2knRk5rYXu/QsChOWvEH7qdAElOdS60vawDJF+RQOQVisyGeDKziGReLYWQM=
X-Received: by 2002:a05:6902:70c:b0:64f:4e29:a858 with SMTP id
 k12-20020a056902070c00b0064f4e29a858mr18821677ybt.462.1653314614190; Mon, 23
 May 2022 07:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-12-tmaimon77@gmail.com>
 <86cd6a37-70ad-3a90-bc8a-dcd8b41f1175@linaro.org>
In-Reply-To: <86cd6a37-70ad-3a90-bc8a-dcd8b41f1175@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 23 May 2022 17:03:23 +0300
Message-ID: <CAP6Zq1i2Wj4FCA4-eseVoJyMof5=ocFCUcitVquJqYJ4Z3JTYQ@mail.gmail.com>
Subject: Re: [PATCH v1 11/19] dt-bindings: reset: npcm: Add support for NPCM8XX
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh+dt@kernel.org>, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greg KH <gregkh@linuxfoundation.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, catalin.marinas@arm.com, 
	will@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, jirislaby@kernel.org, 
	shawnguo@kernel.org, bjorn.andersson@linaro.org, geert+renesas@glider.be, 
	marcel.ziswiler@toradex.com, Vinod Koul <vkoul@kernel.org>, biju.das.jz@bp.renesas.com, 
	nobuhiro1.iwamatsu@toshiba.co.jp, robert.hancock@calian.com, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, lkundrak@v3.sk, 
	soc@kernel.org, devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/alternative; boundary="00000000000047e8b705dfae4eb7"

--00000000000047e8b705dfae4eb7
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your comments.


On Mon, 23 May 2022 at 12:01, Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 22/05/2022 17:50, Tomer Maimon wrote:
> > Add binding document and device tree binding
> > constants for Nuvoton BMC NPCM8XX reset controller.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/reset/nuvoton,npcm-reset.txt     |  17 ++-
> >  .../dt-bindings/reset/nuvoton,npcm8xx-reset.h | 124 ++++++++++++++++++
> >  2 files changed, 139 insertions(+), 2 deletions(-)
> >  create mode 100644 include/dt-bindings/reset/nuvoton,npcm8xx-reset.h
> >
> > diff --git
> a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> > index cb1613092ee7..b7eb8615b68b 100644
> > --- a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> > +++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> > @@ -1,14 +1,15 @@
> >  Nuvoton NPCM Reset controller
> >
> >  Required properties:
> > -- compatible : "nuvoton,npcm750-reset" for NPCM7XX BMC
> > +- compatible : "nuvoton,npcm750-reset" for Poleg NPCM7XX BMC.
> > +               "nuvoton,npcm845-reset" for Arbel NPCM8XX BMC.
> >  - reg : specifies physical base address and size of the register.
> >  - #reset-cells: must be set to 2
> >  - syscon: a phandle to access GCR registers.
> >
> >  Optional property:
> >  - nuvoton,sw-reset-number - Contains the software reset number to
> restart the SoC.
> > -  NPCM7xx contain four software reset that represent numbers 1 to 4.
> > +  NPCM7xx and NPCM8xx contain four software reset that represent
> numbers 1 to 4.
> >
> >    If 'nuvoton,sw-reset-number' is not specified software reset is
> disabled.
> >
> > @@ -32,3 +33,15 @@ example:
> >          };
> >
> >  The index could be found in <dt-bindings/reset/nuvoton,npcm7xx-reset.h>.
> > +
> > +Specifying reset lines connected to IP NPCM8XX modules
> > +======================================================
>
> we prefer to use the same explanation as the NPCM7XX reset explanation in
the reset binding document.

> No need to document consumers. Just mention the header.
>
> > +example:
> > +
> > +        spi0: spi@..... {
> > +                ...
> > +                resets = <&rstc NPCM8XX_RESET_IPSRST2
> NPCM8XX_RESET_PSPI1>;
> > +                ...
> > +        };
> > +
> > +The index could be found in <dt-bindings/reset/nuvoton,npcm8xx-reset.h>.
> > diff --git a/include/dt-bindings/reset/nuvoton,npcm8xx-reset.h
> b/include/dt-bindings/reset/nuvoton,npcm8xx-reset.h
> > new file mode 100644
> > index 000000000000..4b832a0fd1dd
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/nuvoton,npcm8xx-reset.h
> > @@ -0,0 +1,124 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
>
> Dual license.
>
O.K.

>
> > +// Copyright (c) 2022 Nuvoton Technology corporation.
> > +
> > +#ifndef _DT_BINDINGS_NPCM8XX_RESET_H
> > +#define _DT_BINDINGS_NPCM8XX_RESET_H
> > +
> > +#define NPCM8XX_RESET_IPSRST1                0x20
> > +#define NPCM8XX_RESET_IPSRST2                0x24
> > +#define NPCM8XX_RESET_IPSRST3                0x34
> > +#define NPCM8XX_RESET_IPSRST4                0x74
>
> What are these? All IDs should be incremental, decimal and start from 0.
>
Register offset, we use the same method in NPCM7xx. please refer
https://elixir.bootlin.com/linux/v5.18/source/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h

and the driver asserts the reset according to the reset include definitions

>
> > +
> > +/* Reset lines on IP1 reset module (NPCM8XX_RESET_IPSRST1) */
> > +#define NPCM8XX_RESET_GDMA0          3
>
> IDs start from 0 and do not have holes.
>
This represents the reset BIT in the reset register.

>
>
> > +#define NPCM8XX_RESET_UDC1           5
> > +#define NPCM8XX_RESET_GMAC3          6
> > +#define NPCM8XX_RESET_UART_2_3               7
> > +#define NPCM8XX_RESET_UDC2           8
> > +#define NPCM8XX_RESET_PECI           9
> > +#define NPCM8XX_RESET_AES            10
> > +#define NPCM8XX_RESET_UART_0_1               11
> > +#define NPCM8XX_RESET_MC             12
> > +#define NPCM8XX_RESET_SMB2           13
> > +#define NPCM8XX_RESET_SMB3           14
> > +#define NPCM8XX_RESET_SMB4           15
> > +#define NPCM8XX_RESET_SMB5           16
> > +#define NPCM8XX_RESET_PWM_M0         18
> > +#define NPCM8XX_RESET_TIMER_0_4              19
> > +#define NPCM8XX_RESET_TIMER_5_9              20
> > +#define NPCM8XX_RESET_GMAC4          21
> > +#define NPCM8XX_RESET_UDC4           22
> > +#define NPCM8XX_RESET_UDC5           23
> > +#define NPCM8XX_RESET_UDC6           24
> > +#define NPCM8XX_RESET_UDC3           25
> > +#define NPCM8XX_RESET_ADC            27
> > +#define NPCM8XX_RESET_SMB6           28
> > +#define NPCM8XX_RESET_SMB7           29
> > +#define NPCM8XX_RESET_SMB0           30
> > +#define NPCM8XX_RESET_SMB1           31
> > +
> > +/* Reset lines on IP2 reset module (NPCM8XX_RESET_IPSRST2) */
> > +#define NPCM8XX_RESET_MFT0           0
> > +#define NPCM8XX_RESET_MFT1           1
> > +#define NPCM8XX_RESET_MFT2           2
> > +#define NPCM8XX_RESET_MFT3           3
> > +#define NPCM8XX_RESET_MFT4           4
> > +#define NPCM8XX_RESET_MFT5           5
> > +#define NPCM8XX_RESET_MFT6           6
> > +#define NPCM8XX_RESET_MFT7           7
> > +#define NPCM8XX_RESET_MMC            8
> > +#define NPCM8XX_RESET_GFX_SYS                10
> > +#define NPCM8XX_RESET_AHB_PCIBRG     11
> > +#define NPCM8XX_RESET_VDMA           12
> > +#define NPCM8XX_RESET_ECE            13
> > +#define NPCM8XX_RESET_VCD            14
> > +#define NPCM8XX_RESET_VIRUART1               16
> > +#define NPCM8XX_RESET_VIRUART2               17
> > +#define NPCM8XX_RESET_SIOX1          18
> > +#define NPCM8XX_RESET_SIOX2          19
> > +#define NPCM8XX_RESET_BT             20
> > +#define NPCM8XX_RESET_3DES           21
> > +#define NPCM8XX_RESET_PSPI2          23
> > +#define NPCM8XX_RESET_GMAC2          25
> > +#define NPCM8XX_RESET_USBH1          26
> > +#define NPCM8XX_RESET_GMAC1          28
> > +#define NPCM8XX_RESET_CP1            31
> > +
> > +/* Reset lines on IP3 reset module (NPCM8XX_RESET_IPSRST3) */
> > +#define NPCM8XX_RESET_PWM_M1         0
> > +#define NPCM8XX_RESET_SMB12          1
> > +#define NPCM8XX_RESET_SPIX           2
> > +#define NPCM8XX_RESET_SMB13          3
> > +#define NPCM8XX_RESET_UDC0           4
> > +#define NPCM8XX_RESET_UDC7           5
> > +#define NPCM8XX_RESET_UDC8           6
> > +#define NPCM8XX_RESET_UDC9           7
> > +#define NPCM8XX_RESET_USBHUB         8
> > +#define NPCM8XX_RESET_PCI_MAILBOX    9
> > +#define NPCM8XX_RESET_GDMA1          10
> > +#define NPCM8XX_RESET_GDMA2          11
> > +#define NPCM8XX_RESET_SMB14          12
> > +#define NPCM8XX_RESET_SHA            13
> > +#define NPCM8XX_RESET_SEC_ECC                14
> > +#define NPCM8XX_RESET_PCIE_RC                15
> > +#define NPCM8XX_RESET_TIMER_10_14    16
> > +#define NPCM8XX_RESET_RNG            17
> > +#define NPCM8XX_RESET_SMB15          18
> > +#define NPCM8XX_RESET_SMB8           19
> > +#define NPCM8XX_RESET_SMB9           20
> > +#define NPCM8XX_RESET_SMB10          21
> > +#define NPCM8XX_RESET_SMB11          22
> > +#define NPCM8XX_RESET_ESPI           23
> > +#define NPCM8XX_RESET_USB_PHY_1              24
> > +#define NPCM8XX_RESET_USB_PHY_2              25
> > +
>
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer

--00000000000047e8b705dfae4eb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Krzysztof,</div>=
<div dir=3D"ltr"><br></div><div dir=3D"ltr">Thanks for your comments.</div>=
<div dir=3D"ltr"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, 23 May 2022 at 12:01, Krzysztof Kozlowsk=
i &lt;<a href=3D"mailto:krzysztof.kozlowski@linaro.org">krzysztof.kozlowski=
@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 22/05/2022 17:50, Tomer Maimon wrote:<br>
&gt; Add binding document and device tree binding<br>
&gt; constants for Nuvoton BMC NPCM8XX reset controller.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/reset/nuvoton,npcm-reset.txt=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 17 ++-<br>
&gt;=C2=A0 .../dt-bindings/reset/nuvoton,npcm8xx-reset.h | 124 ++++++++++++=
++++++<br>
&gt;=C2=A0 2 files changed, 139 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 include/dt-bindings/reset/nuvoton,npcm8xx-res=
et.h<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/reset/nuvoton,npcm-rese=
t.txt b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt<br>
&gt; index cb1613092ee7..b7eb8615b68b 100644<br>
&gt; --- a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt<b=
r>
&gt; +++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt<b=
r>
&gt; @@ -1,14 +1,15 @@<br>
&gt;=C2=A0 Nuvoton NPCM Reset controller<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Required properties:<br>
&gt; -- compatible : &quot;nuvoton,npcm750-reset&quot; for NPCM7XX BMC<br>
&gt; +- compatible : &quot;nuvoton,npcm750-reset&quot; for Poleg NPCM7XX BM=
C.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nuvoton,=
npcm845-reset&quot; for Arbel NPCM8XX BMC.<br>
&gt;=C2=A0 - reg : specifies physical base address and size of the register=
.<br>
&gt;=C2=A0 - #reset-cells: must be set to 2<br>
&gt;=C2=A0 - syscon: a phandle to access GCR registers.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Optional property:<br>
&gt;=C2=A0 - nuvoton,sw-reset-number - Contains the software reset number t=
o restart the SoC.<br>
&gt; -=C2=A0 NPCM7xx contain four software reset that represent numbers 1 t=
o 4.<br>
&gt; +=C2=A0 NPCM7xx and NPCM8xx contain four software reset that represent=
 numbers 1 to 4.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 If &#39;nuvoton,sw-reset-number&#39; is not specified sof=
tware reset is disabled.<br>
&gt;=C2=A0 <br>
&gt; @@ -32,3 +33,15 @@ example:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 The index could be found in &lt;dt-bindings/reset/nuvoton,npcm7x=
x-reset.h&gt;.<br>
&gt; +<br>
&gt; +Specifying reset lines connected to IP NPCM8XX modules<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br>
<br></blockquote><div>we prefer=C2=A0to=C2=A0use the same explanation as th=
e NPCM7XX reset explanation in the reset binding document.</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
No need to document consumers. Just mention the header.<br>
<br>
&gt; +example:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 spi0: spi@..... {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resets =3D &l=
t;&amp;rstc NPCM8XX_RESET_IPSRST2 NPCM8XX_RESET_PSPI1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; +The index could be found in &lt;dt-bindings/reset/nuvoton,npcm8xx-res=
et.h&gt;.<br>
&gt; diff --git a/include/dt-bindings/reset/nuvoton,npcm8xx-reset.h b/inclu=
de/dt-bindings/reset/nuvoton,npcm8xx-reset.h<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..4b832a0fd1dd<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/dt-bindings/reset/nuvoton,npcm8xx-reset.h<br>
&gt; @@ -0,0 +1,124 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
<br>
Dual license.<br></blockquote><div>O.K.=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
&gt; +// Copyright (c) 2022 Nuvoton Technology corporation.<br>
&gt; +<br>
&gt; +#ifndef _DT_BINDINGS_NPCM8XX_RESET_H<br>
&gt; +#define _DT_BINDINGS_NPCM8XX_RESET_H<br>
&gt; +<br>
&gt; +#define NPCM8XX_RESET_IPSRST1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x20<br>
&gt; +#define NPCM8XX_RESET_IPSRST2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x24<br>
&gt; +#define NPCM8XX_RESET_IPSRST3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x34<br>
&gt; +#define NPCM8XX_RESET_IPSRST4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x74<br>
<br>
What are these? All IDs should be incremental, decimal and start from 0.<br=
></blockquote><div>Register offset, we use the same method in NPCM7xx. plea=
se refer</div><div><a href=3D"https://elixir.bootlin.com/linux/v5.18/source=
/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h">https://elixir.bootlin.=
com/linux/v5.18/source/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h</a=
><br></div><div><br></div><div>and the driver asserts the reset according t=
o the reset include definitions=C2=A0<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
&gt; +<br>
&gt; +/* Reset lines on IP1 reset module (NPCM8XX_RESET_IPSRST1) */<br>
&gt; +#define NPCM8XX_RESET_GDMA0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3<br>
<br>
IDs start from 0 and do not have holes.<br></blockquote><div>This represent=
s=C2=A0the reset BIT in the reset register.=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
<br>
&gt; +#define NPCM8XX_RESET_UDC1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05<=
br>
&gt; +#define NPCM8XX_RESET_GMAC3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6<br>
&gt; +#define NPCM8XX_RESET_UART_2_3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A07<br>
&gt; +#define NPCM8XX_RESET_UDC2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08<=
br>
&gt; +#define NPCM8XX_RESET_PECI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A09<=
br>
&gt; +#define NPCM8XX_RESET_AES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10=
<br>
&gt; +#define NPCM8XX_RESET_UART_0_1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A011<br>
&gt; +#define NPCM8XX_RESET_MC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A012<br>
&gt; +#define NPCM8XX_RESET_SMB2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013=
<br>
&gt; +#define NPCM8XX_RESET_SMB3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014=
<br>
&gt; +#define NPCM8XX_RESET_SMB4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A015=
<br>
&gt; +#define NPCM8XX_RESET_SMB5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016=
<br>
&gt; +#define NPCM8XX_RESET_PWM_M0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A018<br>
&gt; +#define NPCM8XX_RESET_TIMER_0_4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 19<br>
&gt; +#define NPCM8XX_RESET_TIMER_5_9=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 20<br>
&gt; +#define NPCM8XX_RESET_GMAC4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 21<br>
&gt; +#define NPCM8XX_RESET_UDC4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A022=
<br>
&gt; +#define NPCM8XX_RESET_UDC5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A023=
<br>
&gt; +#define NPCM8XX_RESET_UDC6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A024=
<br>
&gt; +#define NPCM8XX_RESET_UDC3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A025=
<br>
&gt; +#define NPCM8XX_RESET_ADC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 27=
<br>
&gt; +#define NPCM8XX_RESET_SMB6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A028=
<br>
&gt; +#define NPCM8XX_RESET_SMB7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A029=
<br>
&gt; +#define NPCM8XX_RESET_SMB0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A030=
<br>
&gt; +#define NPCM8XX_RESET_SMB1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A031=
<br>
&gt; +<br>
&gt; +/* Reset lines on IP2 reset module (NPCM8XX_RESET_IPSRST2) */<br>
&gt; +#define NPCM8XX_RESET_MFT0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<=
br>
&gt; +#define NPCM8XX_RESET_MFT1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<=
br>
&gt; +#define NPCM8XX_RESET_MFT2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02<=
br>
&gt; +#define NPCM8XX_RESET_MFT3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03<=
br>
&gt; +#define NPCM8XX_RESET_MFT4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<=
br>
&gt; +#define NPCM8XX_RESET_MFT5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05<=
br>
&gt; +#define NPCM8XX_RESET_MFT6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06<=
br>
&gt; +#define NPCM8XX_RESET_MFT7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07<=
br>
&gt; +#define NPCM8XX_RESET_MMC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8<=
br>
&gt; +#define NPCM8XX_RESET_GFX_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 10<br>
&gt; +#define NPCM8XX_RESET_AHB_PCIBRG=C2=A0 =C2=A0 =C2=A011<br>
&gt; +#define NPCM8XX_RESET_VDMA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012=
<br>
&gt; +#define NPCM8XX_RESET_ECE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 13=
<br>
&gt; +#define NPCM8XX_RESET_VCD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 14=
<br>
&gt; +#define NPCM8XX_RESET_VIRUART1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A016<br>
&gt; +#define NPCM8XX_RESET_VIRUART2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A017<br>
&gt; +#define NPCM8XX_RESET_SIOX1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 18<br>
&gt; +#define NPCM8XX_RESET_SIOX2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 19<br>
&gt; +#define NPCM8XX_RESET_BT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A020<br>
&gt; +#define NPCM8XX_RESET_3DES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A021=
<br>
&gt; +#define NPCM8XX_RESET_PSPI2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 23<br>
&gt; +#define NPCM8XX_RESET_GMAC2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 25<br>
&gt; +#define NPCM8XX_RESET_USBH1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 26<br>
&gt; +#define NPCM8XX_RESET_GMAC1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 28<br>
&gt; +#define NPCM8XX_RESET_CP1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 31=
<br>
&gt; +<br>
&gt; +/* Reset lines on IP3 reset module (NPCM8XX_RESET_IPSRST3) */<br>
&gt; +#define NPCM8XX_RESET_PWM_M1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt; +#define NPCM8XX_RESET_SMB12=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt; +#define NPCM8XX_RESET_SPIX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02<=
br>
&gt; +#define NPCM8XX_RESET_SMB13=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3<br>
&gt; +#define NPCM8XX_RESET_UDC0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<=
br>
&gt; +#define NPCM8XX_RESET_UDC7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05<=
br>
&gt; +#define NPCM8XX_RESET_UDC8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06<=
br>
&gt; +#define NPCM8XX_RESET_UDC9=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07<=
br>
&gt; +#define NPCM8XX_RESET_USBHUB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
&gt; +#define NPCM8XX_RESET_PCI_MAILBOX=C2=A0 =C2=A0 9<br>
&gt; +#define NPCM8XX_RESET_GDMA1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10<br>
&gt; +#define NPCM8XX_RESET_GDMA2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 11<br>
&gt; +#define NPCM8XX_RESET_SMB14=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12<br>
&gt; +#define NPCM8XX_RESET_SHA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 13=
<br>
&gt; +#define NPCM8XX_RESET_SEC_ECC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 14<br>
&gt; +#define NPCM8XX_RESET_PCIE_RC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 15<br>
&gt; +#define NPCM8XX_RESET_TIMER_10_14=C2=A0 =C2=A0 16<br>
&gt; +#define NPCM8XX_RESET_RNG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 17=
<br>
&gt; +#define NPCM8XX_RESET_SMB15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 18<br>
&gt; +#define NPCM8XX_RESET_SMB8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A019=
<br>
&gt; +#define NPCM8XX_RESET_SMB9=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A020=
<br>
&gt; +#define NPCM8XX_RESET_SMB10=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 21<br>
&gt; +#define NPCM8XX_RESET_SMB11=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 22<br>
&gt; +#define NPCM8XX_RESET_ESPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A023=
<br>
&gt; +#define NPCM8XX_RESET_USB_PHY_1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 24<br>
&gt; +#define NPCM8XX_RESET_USB_PHY_2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 25<br>
&gt; +<br>
<br>
<br>
Best regards,<br>
Krzysztof<br></blockquote><div><br></div><div>Best regards,</div><div><br><=
/div><div>Tomer=C2=A0</div></div></div>

--00000000000047e8b705dfae4eb7--
