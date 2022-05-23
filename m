Return-Path: <SRS0=08VO=V7=gmail.com=tmaimon77@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BF7C433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 13:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7CCFFC385AA; Mon, 23 May 2022 13:44:32 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0F23C385A9;
	Mon, 23 May 2022 13:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0F23C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2f83983782fso148405027b3.6;
        Mon, 23 May 2022 06:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XPNftA/DKTK/dvQpog9avnEaQ3TQlTIxCXNc19+PcAc=;
        b=F7XY+xDJabBSZnWT7Co8MIS5MGWFxVdrs4yGK5blSOSq+CPW7kOaKdy4FmowiCQGeH
         kveDf2wY2jWk76yyfJLjFbC1BPpcG+arrA3p/8ISTPvvd0T7nAt427km96pp85sr6jjJ
         Oy1gCUxYtAmEdXYZeUxGuycedY9bqdtF+YBlIa7aEPJM5w6qAbNVaCkpl/Bs4YkgRB3P
         PjgQFOlaLkmG9puFomHUVRN/nzWLiH0dcA1sUcT8hzSyGjDYMgYSO9UOOYO2kya8uwWq
         G2PTuSKX05AxD7uJyT5W9QdBhpuf7wxcAsCEuGFg+wporn3AIJax0K9uzoefvKAr+vK3
         2Gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XPNftA/DKTK/dvQpog9avnEaQ3TQlTIxCXNc19+PcAc=;
        b=mXLHdMm2xQbk+dhwfkNvAOJIz5kFT6I1j+IKRgt3JQok7LDguAEVJ5H2ypcAtfZTgw
         7/WkF66dLD8K/0714ob5qCojtMQWPcL0k7VZGO3QwRjrRlJJ1SoNoMouiYvxbwUojD3b
         Z5Y4BpMr9DTi/bRJbkNEhUO/x4/V9qzKAS+fL5GpFnt1FpYlKWwMDlfa9pR8M34M3t07
         yPE3uRKQVNDgL74x9zr18pa0dkmEJm0EYIXbM7vY2QRedfzPXkyBl3tz1lBCpHEk+30W
         h6NenujK/OapY6ygDNC83vmO/hkzj//Z0vXRNdts9tx1hQrhfiAkmOqfnhPclntg2cRZ
         MzbA==
X-Gm-Message-State: AOAM5316E1yTwXHp46wrOKtlus5NTIumcEjugDC0cGdSZLj2bgjKs2G1
	+eFXBS4d7BqJjEP7DVir5yQF+6Phe2RuoQJ06/Q=
X-Google-Smtp-Source: ABdhPJx1jMRAQ2KIm4uKfs2tJQNylZK638Pzy9lDKb1nuBj6ZwM0ls6edh/ZFq4kv1fTuSimYpbFFnimzVN0mL+tRFw=
X-Received: by 2002:a0d:e585:0:b0:300:14ed:f2a with SMTP id
 o127-20020a0de585000000b0030014ed0f2amr1075302ywe.342.1653313470719; Mon, 23
 May 2022 06:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-10-tmaimon77@gmail.com>
 <d02b042c-7f6e-8d2b-a5eb-c7ac4a0eea7d@linaro.org>
In-Reply-To: <d02b042c-7f6e-8d2b-a5eb-c7ac4a0eea7d@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 23 May 2022 16:44:19 +0300
Message-ID: <CAP6Zq1gGZguC9h4A6KL8x1QLf3MAZvvBiA2nmcK_4PS7AdNa+Q@mail.gmail.com>
Subject: Re: [PATCH v1 09/19] dt-bindings: reset: add syscon property
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
Content-Type: multipart/alternative; boundary="0000000000001feb4805dfae0a68"

--0000000000001feb4805dfae0a68
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your comments.

On Mon, 23 May 2022 at 10:39, Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 22/05/2022 17:50, Tomer Maimon wrote:
> > Describe syscon property that handles GCR registers
> > in Nuvoton BMC NPCM reset driver.
>
> Please wrap according to Linux standards:
>
> https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

Which problem do you see with the commit explanation body?

>
>
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git
> a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> > index 17b7a6a43a29..cb1613092ee7 100644
> > --- a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> > +++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> > @@ -4,6 +4,7 @@ Required properties:
> >  - compatible : "nuvoton,npcm750-reset" for NPCM7XX BMC
> >  - reg : specifies physical base address and size of the register.
> >  - #reset-cells: must be set to 2
> > +- syscon: a phandle to access GCR registers.
>
> syscon is not a generic property, so vendor prefix and some descriptive
> name of property.
>
> Will do.

> >
> >  Optional property:
> >  - nuvoton,sw-reset-number - Contains the software reset number to
> restart the SoC.
> > @@ -16,6 +17,7 @@ Example:
> >               compatible = "nuvoton,npcm750-reset";
> >               reg = <0xf0801000 0x70>;
> >               #reset-cells = <2>;
> > +             syscon = <&gcr>;
> >               nuvoton,sw-reset-number = <2>;
> >       };
> >
>
>
> Best regards,
> Krzysztof
>

Best Regards,

Tomer

--0000000000001feb4805dfae0a68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Krzysztof,</div>=
<div dir=3D"ltr"><br></div><div dir=3D"ltr">Thanks for your comments.</div>=
<div dir=3D"ltr"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, 23 May 2022 at 10:39, Krzysztof Kozlowski &l=
t;<a href=3D"mailto:krzysztof.kozlowski@linaro.org">krzysztof.kozlowski@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 22/05/2022 17:50, Tomer Maimon wrote:<br>
&gt; Describe syscon property that handles GCR registers<br>
&gt; in Nuvoton BMC NPCM reset driver.<br>
<br>
Please wrap according to Linux standards:<br>
<a href=3D"https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/=
process/submitting-patches.rst#L586" rel=3D"noreferrer" target=3D"_blank">h=
ttps://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/subm=
itting-patches.rst#L586</a></blockquote><div>Which problem do you see with =
the commit explanation body?</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt |=
 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/reset/nuvoton,npcm-rese=
t.txt b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt<br>
&gt; index 17b7a6a43a29..cb1613092ee7 100644<br>
&gt; --- a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt<b=
r>
&gt; +++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt<b=
r>
&gt; @@ -4,6 +4,7 @@ Required properties:<br>
&gt;=C2=A0 - compatible : &quot;nuvoton,npcm750-reset&quot; for NPCM7XX BMC=
<br>
&gt;=C2=A0 - reg : specifies physical base address and size of the register=
.<br>
&gt;=C2=A0 - #reset-cells: must be set to 2<br>
&gt; +- syscon: a phandle to access GCR registers.<br>
<br>
syscon is not a generic property, so vendor prefix and some descriptive<br>
name of property.<br>
<br></blockquote><div>Will do.=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
&gt;=C2=A0 <br>
&gt;=C2=A0 Optional property:<br>
&gt;=C2=A0 - nuvoton,sw-reset-number - Contains the software reset number t=
o restart the SoC.<br>
&gt; @@ -16,6 +17,7 @@ Example:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &=
quot;nuvoton,npcm750-reset&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xf0=
801000 0x70&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#reset-cells =3D=
 &lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0syscon =3D &lt;&amp;g=
cr&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nuvoton,sw-reset=
-number =3D &lt;2&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 <br>
<br>
<br>
Best regards,<br>
Krzysztof<br></blockquote><div><br></div><div>Best Regards,</div><div><br><=
/div><div>Tomer=C2=A0</div></div></div>

--0000000000001feb4805dfae0a68--
