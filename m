Return-Path: <SRS0=08VO=V7=gmail.com=tmaimon77@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F39C433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 13:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1112C385A9; Mon, 23 May 2022 13:35:18 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3A72C34100;
	Mon, 23 May 2022 13:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3A72C34100
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2fed823dd32so147727297b3.12;
        Mon, 23 May 2022 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OUEVpnpJFmIeKdRuBqfKnI++a1N6bdV1TQCL/qEjIWk=;
        b=KcNPzRCH9BL5Rav9Rhc4EO61ugz7xxB5KSCBM/pcNzcd4xnffwXMvnKgGRJCgJU1lR
         Qj4QkfX1KLcbWSVVm4n+XAUBJ1Ou6IyiFbKCSnovswH9j0Ki4PKy1zgBnNpJ4EuipvoD
         H2VYX5HBDS+M/1JETBQrwu7wBxdsKPOz7FklyoPWPjwygD5jdjnC48xjPyeYB7v1lYoL
         CjVoOILlvhEmu+up/32UIzG4pm/EQzNWnNgt01ToTixJKkZt1xOGBwOmmdObjNnLLfBm
         HFEfn4gHsCB/3yb45AUxunAavCe01mE9Pxws7Il6k7KDKj3UuZh34zD1BZu7Kd6fvLkT
         Rc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OUEVpnpJFmIeKdRuBqfKnI++a1N6bdV1TQCL/qEjIWk=;
        b=SKm2GvRHfTju4e0P+ivOu5joN715sDcT9b2dY1CHiPLeifjU9Zf4C/4So+LUhbHaDP
         x35nCGUdFAMj3DoZXSKLVMYJOvysvFbz/VCY6b4JfGXu15XvP/v5WbYDsDmzUCBFVui0
         GjfH1ldj0AH8EjvGPA1NeOhKY8N3Dmmd7ApNW9DWgdE3npAqM8Zu0v71jWV9R1Js6lnO
         oXiaGQ4MdYfPgb6q2MXWKwI91F336fnGmiGZvhRtitB7EUlrRRT52po+FF8+L6Hf8sZV
         KmK6uqaYjM48JIAtyQQDZLT4tDD3+jEC3wLKJ7SHLKVXQ59gVHCiVhq0Df9XqVDbmY6q
         H4Fw==
X-Gm-Message-State: AOAM533Us7Tcs9sF6DOCzQH9MC4kP7ZGjvNG3A8sqOP2AEsKw+hnh4Ok
	TGLY7INdSWMXfVHBj13YoZcT9OGG8hni1y1UXlU=
X-Google-Smtp-Source: ABdhPJxuZzjE6VkDrCf3OREZo1EGLY74MRjjsUXzsWa+BasV38mzTxIfn6lN1PTKFCt/nJJ3mvQasfWfygWktdcvOyw=
X-Received: by 2002:a0d:eb86:0:b0:2fe:d5ab:96c5 with SMTP id
 u128-20020a0deb86000000b002fed5ab96c5mr23034826ywe.253.1653312916742; Mon, 23
 May 2022 06:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-8-tmaimon77@gmail.com>
 <edf1faf3-178c-bc89-148d-892f41492d26@linaro.org>
In-Reply-To: <edf1faf3-178c-bc89-148d-892f41492d26@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 23 May 2022 16:35:05 +0300
Message-ID: <CAP6Zq1gXEqqquKzxTHoxYnvh2LCGt-ES+k=aX61FKyHW5WB62w@mail.gmail.com>
Subject: Re: [PATCH v1 07/19] dt-binding: clk: npcm845: Add binding for
 Nuvoton NPCM8XX Clock
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
Content-Type: multipart/alternative; boundary="0000000000001ae8c005dfade9f8"

--0000000000001ae8c005dfade9f8
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your comments.

the patch will modify according to your comments and will be sent in the
next kernel revision 5.19.rc1

On Mon, 23 May 2022 at 10:36, Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 22/05/2022 17:50, Tomer Maimon wrote:
> > Nuvoton Arbel BMC NPCM7XX contains an integrated clock controller, which
> > generates and supplies clocks to all modules within the BMC.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/clock/nuvoton,npcm845-clk.yaml   | 68 +++++++++++++++++++
> >  .../dt-bindings/clock/nuvoton,npcm8xx-clock.h | 50 ++++++++++++++
> >  2 files changed, 118 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> >  create mode 100644 include/dt-bindings/clock/nuvoton,npcm8xx-clock.h
> >
> > diff --git
> a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> > new file mode 100644
> > index 000000000000..f305c7c7eaf0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/nuvoton,npcm845-clk.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton NPCM8XX Clock Controller Binding
> > +
> > +maintainers:
> > +  - Tomer Maimon <tmaimon77@gmail.com>
> > +
> > +description: |
> > +  Nuvoton Arbel BMC NPCM8XX contains an integrated clock controller,
> which
> > +  generates and supplies clocks to all modules within the BMC.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nuvoton,npcm845-clk
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description:
> > +      specify the external clocks used by the NPCM8XX clock module.
>
> Skip description, it's obvious.
>
> > +    items:
> > +      - description: 25M reference clock
> > +      - description: CPU reference clock
> > +      - description: MC reference clock
> > +
> > +  clock-names:
> > +    description:
> > +      specify the external clocks names used by the NPCM8XX clock
> module.
>
> Skip description, it's obvious.
>
> > +    items:
> > +      - const: refclk
>
> Just "ref"
>
> > +      - const: sysbypck
> > +      - const: mcbypck
>
> Is "ck" short for "clk"? If yes, then just skip the suffix.
>
ck

>
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +    description:
> > +      See include/dt-bindings/clock/nuvoton,npcm8xx-clock.h for the full
> > +      list of NPCM8XX clock IDs.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#clock-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  # Clock Control Module node:
> > +  - |
> > +
>
> No need for blank line.
>
> > +    ahb {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        clk: clock-controller@f0801000 {
> > +            compatible = "nuvoton,npcm845-clk";
> > +            reg = <0x0 0xf0801000 0x0 0x1000>;
> > +            #clock-cells = <1>;
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/include/dt-bindings/clock/nuvoton,npcm8xx-clock.h
> b/include/dt-bindings/clock/nuvoton,npcm8xx-clock.h
> > new file mode 100644
> > index 000000000000..d76f606bf88b
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/nuvoton,npcm8xx-clock.h
>
> Filename - same as bindings, so nuvoton,npcm845-clk.h
>
> > @@ -0,0 +1,50 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
>
> Dual license, same as bindings.
>
> > +/*
> > + * Nuvoton NPCM8xx Clock Generator binding
> > + * clock binding number for all clocks supportted by nuvoton,npcm8xx-clk
> > + *
> > + * Copyright (C) 2021 Nuvoton Technologies tomer.maimon@nuvoton.com
> > + *
> > + */
> > +
> > +#ifndef __DT_BINDINGS_CLOCK_NPCM8XX_H
> > +#define __DT_BINDINGS_CLOCK_NPCM8XX_H
> > +
> > +#define NPCM8XX_CLK_CPU              0
> > +#define NPCM8XX_CLK_GFX_PIXEL        1
> > +#define NPCM8XX_CLK_MC               2
> > +#define NPCM8XX_CLK_ADC              3
> > +#define NPCM8XX_CLK_AHB              4
> > +#define NPCM8XX_CLK_TIMER    5
> > +#define NPCM8XX_CLK_UART     6
> > +#define NPCM8XX_CLK_UART2    7
> > +#define NPCM8XX_CLK_MMC              8
> > +#define NPCM8XX_CLK_SPI3     9
> > +#define NPCM8XX_CLK_PCI              10
> > +#define NPCM8XX_CLK_AXI              11
> > +#define NPCM8XX_CLK_APB4     12
> > +#define NPCM8XX_CLK_APB3     13
> > +#define NPCM8XX_CLK_APB2     14
> > +#define NPCM8XX_CLK_APB1     15
> > +#define NPCM8XX_CLK_APB5     16
> > +#define NPCM8XX_CLK_CLKOUT   17
> > +#define NPCM8XX_CLK_GFX              18
> > +#define NPCM8XX_CLK_SU               19
> > +#define NPCM8XX_CLK_SU48     20
> > +#define NPCM8XX_CLK_SDHC     21
> > +#define NPCM8XX_CLK_SPI0     22
> > +#define NPCM8XX_CLK_SPI1     23
> > +#define NPCM8XX_CLK_SPIX     24
> > +#define NPCM8XX_CLK_RG               25
> > +#define NPCM8XX_CLK_RCP              26
> > +#define NPCM8XX_CLK_PRE_ADC  27
> > +#define NPCM8XX_CLK_ATB              28
> > +#define NPCM8XX_CLK_PRE_CLK  29
> > +#define NPCM8XX_CLK_TH               30
> > +#define NPCM8XX_CLK_REFCLK   31
> > +#define NPCM8XX_CLK_SYSBYPCK 32
> > +#define NPCM8XX_CLK_MCBYPCK  33
> > +
> > +#define NPCM8XX_NUM_CLOCKS   (NPCM8XX_CLK_MCBYPCK + 1)
> > +
> > +#endif
>
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer

--0000000000001ae8c005dfade9f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Krzysztof,</div>=
<div dir=3D"ltr"><br></div><div dir=3D"ltr">Thanks for your comments.</div>=
<div dir=3D"ltr"><br></div><div dir=3D"ltr">the patch will=C2=A0modify acco=
rding to your comments and will be sent in the next kernel revision 5.19.rc=
1</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 23 May 2022 at 10:36, Krzysztof Kozlowski &lt;<a href=3D"mai=
lto:krzysztof.kozlowski@linaro.org">krzysztof.kozlowski@linaro.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 22/05/=
2022 17:50, Tomer Maimon wrote:<br>
&gt; Nuvoton Arbel BMC NPCM7XX contains an integrated clock controller, whi=
ch<br>
&gt; generates and supplies clocks to all modules within the BMC.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/clock/nuvoton,npcm845-clk.yaml=C2=A0 =C2=A0| 68 +++=
++++++++++++++++<br>
&gt;=C2=A0 .../dt-bindings/clock/nuvoton,npcm8xx-clock.h | 50 +++++++++++++=
+<br>
&gt;=C2=A0 2 files changed, 118 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/clock/nuvot=
on,npcm845-clk.yaml<br>
&gt;=C2=A0 create mode 100644 include/dt-bindings/clock/nuvoton,npcm8xx-clo=
ck.h<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-c=
lk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml<=
br>
&gt; new file mode 100644<br>
&gt; index 000000000000..f305c7c7eaf0<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml=
<br>
&gt; @@ -0,0 +1,68 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause<br>
&gt; +%YAML 1.2<br>
&gt; +---<br>
&gt; +$id: <a href=3D"http://devicetree.org/schemas/clock/nuvoton,npcm845-c=
lk.yaml#" rel=3D"noreferrer" target=3D"_blank">http://devicetree.org/schema=
s/clock/nuvoton,npcm845-clk.yaml#</a><br>
&gt; +$schema: <a href=3D"http://devicetree.org/meta-schemas/core.yaml#" re=
l=3D"noreferrer" target=3D"_blank">http://devicetree.org/meta-schemas/core.=
yaml#</a><br>
&gt; +<br>
&gt; +title: Nuvoton NPCM8XX Clock Controller Binding<br>
&gt; +<br>
&gt; +maintainers:<br>
&gt; +=C2=A0 - Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" targ=
et=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; +<br>
&gt; +description: |<br>
&gt; +=C2=A0 Nuvoton Arbel BMC NPCM8XX contains an integrated clock control=
ler, which<br>
&gt; +=C2=A0 generates and supplies clocks to all modules within the BMC.<b=
r>
&gt; +<br>
&gt; +properties:<br>
&gt; +=C2=A0 compatible:<br>
&gt; +=C2=A0 =C2=A0 enum:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - nuvoton,npcm845-clk<br>
&gt; +<br>
&gt; +=C2=A0 reg:<br>
&gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; +<br>
&gt; +=C2=A0 clocks:<br>
&gt; +=C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 specify the external clocks used by the NPCM8XX =
clock module.<br>
<br>
Skip description, it&#39;s obvious.<br>
<br>
&gt; +=C2=A0 =C2=A0 items:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - description: 25M reference clock<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - description: CPU reference clock<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - description: MC reference clock<br>
&gt; +<br>
&gt; +=C2=A0 clock-names:<br>
&gt; +=C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 specify the external clocks names used by the NP=
CM8XX clock module.<br>
<br>
Skip description, it&#39;s obvious.<br>
<br>
&gt; +=C2=A0 =C2=A0 items:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - const: refclk<br>
<br>
Just &quot;ref&quot;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - const: sysbypck<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - const: mcbypck<br>
<br>
Is &quot;ck&quot; short for &quot;clk&quot;? If yes, then just skip the suf=
fix.<br></blockquote><div>ck=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 &#39;#clock-cells&#39;:<br>
&gt; +=C2=A0 =C2=A0 const: 1<br>
&gt; +=C2=A0 =C2=A0 description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 See include/dt-bindings/clock/nuvoton,npcm8xx-cl=
ock.h for the full<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 list of NPCM8XX clock IDs.<br>
&gt; +<br>
&gt; +required:<br>
&gt; +=C2=A0 - compatible<br>
&gt; +=C2=A0 - reg<br>
&gt; +=C2=A0 - &quot;#clock-cells&quot;<br>
&gt; +<br>
&gt; +additionalProperties: false<br>
&gt; +<br>
&gt; +examples:<br>
&gt; +=C2=A0 # Clock Control Module node:<br>
&gt; +=C2=A0 - |<br>
&gt; +<br>
<br>
No need for blank line.<br>
<br>
&gt; +=C2=A0 =C2=A0 ahb {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;2&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk: clock-controller@f0801000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;nuvoto=
n,npcm845-clk&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0 0xf0801000 =
0x0 0x1000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #clock-cells =3D &lt;1&gt;;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; +...<br>
&gt; diff --git a/include/dt-bindings/clock/nuvoton,npcm8xx-clock.h b/inclu=
de/dt-bindings/clock/nuvoton,npcm8xx-clock.h<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..d76f606bf88b<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/dt-bindings/clock/nuvoton,npcm8xx-clock.h<br>
<br>
Filename - same as bindings, so nuvoton,npcm845-clk.h<br>
<br>
&gt; @@ -0,0 +1,50 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
<br>
Dual license, same as bindings.<br>
<br>
&gt; +/*<br>
&gt; + * Nuvoton NPCM8xx Clock Generator binding<br>
&gt; + * clock binding number for all clocks supportted by nuvoton,npcm8xx-=
clk<br>
&gt; + *<br>
&gt; + * Copyright (C) 2021 Nuvoton Technologies <a href=3D"mailto:tomer.ma=
imon@nuvoton.com" target=3D"_blank">tomer.maimon@nuvoton.com</a><br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __DT_BINDINGS_CLOCK_NPCM8XX_H<br>
&gt; +#define __DT_BINDINGS_CLOCK_NPCM8XX_H<br>
&gt; +<br>
&gt; +#define NPCM8XX_CLK_CPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0<br>
&gt; +#define NPCM8XX_CLK_GFX_PIXEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt; +#define NPCM8XX_CLK_MC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A02<br>
&gt; +#define NPCM8XX_CLK_ADC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 3<br>
&gt; +#define NPCM8XX_CLK_AHB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 4<br>
&gt; +#define NPCM8XX_CLK_TIMER=C2=A0 =C2=A0 5<br>
&gt; +#define NPCM8XX_CLK_UART=C2=A0 =C2=A0 =C2=A06<br>
&gt; +#define NPCM8XX_CLK_UART2=C2=A0 =C2=A0 7<br>
&gt; +#define NPCM8XX_CLK_MMC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 8<br>
&gt; +#define NPCM8XX_CLK_SPI3=C2=A0 =C2=A0 =C2=A09<br>
&gt; +#define NPCM8XX_CLK_PCI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 10<br>
&gt; +#define NPCM8XX_CLK_AXI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 11<br>
&gt; +#define NPCM8XX_CLK_APB4=C2=A0 =C2=A0 =C2=A012<br>
&gt; +#define NPCM8XX_CLK_APB3=C2=A0 =C2=A0 =C2=A013<br>
&gt; +#define NPCM8XX_CLK_APB2=C2=A0 =C2=A0 =C2=A014<br>
&gt; +#define NPCM8XX_CLK_APB1=C2=A0 =C2=A0 =C2=A015<br>
&gt; +#define NPCM8XX_CLK_APB5=C2=A0 =C2=A0 =C2=A016<br>
&gt; +#define NPCM8XX_CLK_CLKOUT=C2=A0 =C2=A017<br>
&gt; +#define NPCM8XX_CLK_GFX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 18<br>
&gt; +#define NPCM8XX_CLK_SU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A019<br>
&gt; +#define NPCM8XX_CLK_SU48=C2=A0 =C2=A0 =C2=A020<br>
&gt; +#define NPCM8XX_CLK_SDHC=C2=A0 =C2=A0 =C2=A021<br>
&gt; +#define NPCM8XX_CLK_SPI0=C2=A0 =C2=A0 =C2=A022<br>
&gt; +#define NPCM8XX_CLK_SPI1=C2=A0 =C2=A0 =C2=A023<br>
&gt; +#define NPCM8XX_CLK_SPIX=C2=A0 =C2=A0 =C2=A024<br>
&gt; +#define NPCM8XX_CLK_RG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A025<br>
&gt; +#define NPCM8XX_CLK_RCP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 26<br>
&gt; +#define NPCM8XX_CLK_PRE_ADC=C2=A0 27<br>
&gt; +#define NPCM8XX_CLK_ATB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 28<br>
&gt; +#define NPCM8XX_CLK_PRE_CLK=C2=A0 29<br>
&gt; +#define NPCM8XX_CLK_TH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A030<br>
&gt; +#define NPCM8XX_CLK_REFCLK=C2=A0 =C2=A031<br>
&gt; +#define NPCM8XX_CLK_SYSBYPCK 32<br>
&gt; +#define NPCM8XX_CLK_MCBYPCK=C2=A0 33<br>
&gt; +<br>
&gt; +#define NPCM8XX_NUM_CLOCKS=C2=A0 =C2=A0(NPCM8XX_CLK_MCBYPCK + 1)<br>
&gt; +<br>
&gt; +#endif<br>
<br>
<br>
Best regards,<br>
Krzysztof<br></blockquote><div><br></div><div>Best regards,</div><div><br><=
/div><div>Tomer=C2=A0</div></div></div>

--0000000000001ae8c005dfade9f8--
