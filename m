Return-Path: <SRS0=EOuU=X7=gmail.com=logananth13.hcl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D397CC433EF
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 13:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9238AC341C8; Tue, 26 Jul 2022 13:07:10 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7A19C341CE;
	Tue, 26 Jul 2022 13:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7A19C341CE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id e16so13141445pfm.11;
        Tue, 26 Jul 2022 06:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AYnTicV7YhiJhZ5zJUtgk+2kyMXJ+WN1kn3VWj6vYfw=;
        b=auvi3aVZA+ye5Xdi51jWUr3woiY990y7uPwyvQVFKIdp6aMWuA754pO9LPVzItKwPr
         NwKtEqC5W6gewX1RiHF6iAlSCdqjJIcCVWhaSHpdaFZR8xRDJfDBIG6XrpcsoH4Zy+0T
         7Rk4Gl+79FilEqAGA/TMjY5tVZMTj7Ucl8M1rcrFduQfK+ZaQHdm/UD21CEaKNsLuWeg
         zWpE6qahdG23MDrgH+PsJ/7exRZMg/kLl6xFxuuhtvqYhLALvC57A084FBU7MSLXV+QY
         VYcvK9DJa44THsbQqz7n2sNamqIc0FIL8TBkIovIz/M8fw2PXllEilgbl1lDacuybcU8
         4z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AYnTicV7YhiJhZ5zJUtgk+2kyMXJ+WN1kn3VWj6vYfw=;
        b=0g3GBy36+oo40FmJe3droA8aEJ2BC+9mXjjj33Yr+pih3Xbcab3Z43PoMvxK/S1SN6
         XX60LElfRYq1Rpwd3daSuCTWsw8RVA0UBEAC78eV8No4yUCl9it/Z38zJzARsZrpuPCp
         1Gc2UUgWwUKn24+Blx+ETJulUCZyi648f3LErD1dBUVPasF2SLBIGXZkBS9jEwu5ew0q
         ru+Jko9FAitUx8CGjOo2wxVlviM38useP+/tgX1vs1p8yM4+RrirurCrsYitjucejp8F
         XW8pA7hnL+B7J8YZ7YvLDXw0AthhEReUJYWIMLGpVssjNKXonR8tJILkjTogFLorjDUv
         ZncA==
X-Gm-Message-State: AJIora8aFJcllkIfP6wn3aG2HQGuKAZgOK5KbgCkCiIpJgujJRPHYEtj
	R3bVPbgwWX+aCa0AUuwxVV7vlZolGT58INvD2YA=
X-Google-Smtp-Source: AGRyM1tlzfVIVfnvy5VZgT7QJWP6gqDOzk28dyKA3xu3qdLE9V8Cn3Jibn//tqCc59V+W+Pakhz7a/GkU1Kk0+0WsiU=
X-Received: by 2002:a63:81c2:0:b0:415:d873:ec18 with SMTP id
 t185-20020a6381c2000000b00415d873ec18mr14584987pgd.501.1658840829052; Tue, 26
 Jul 2022 06:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220616120707.GA22590@logan-ThinkPad-T14-Gen-1> <Yqyu+y9ms/DmFCbJ@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <Yqyu+y9ms/DmFCbJ@heinlein.stwcx.org.github.beta.tailscale.net>
From: logananth hcl <logananth13.hcl@gmail.com>
Date: Tue, 26 Jul 2022 18:36:56 +0530
Message-ID: <CAGpPFEFUKxRQSZtToysgeGXQquE4y2sx=3XJdCKfQfLfHEO0Xg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Adding Facebook Yosemite V3.5 BMC
To: Patrick Williams <patrick@stwcx.xyz>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, garnermic@gmail.com, 
	thangavel.k@hcl.com, naveen.mosess@hcl.com
Content-Type: multipart/alternative; boundary="0000000000005ac9b105e4b4fada"

--0000000000005ac9b105e4b4fada
Content-Type: text/plain; charset="UTF-8"

The comments have been addressed and the new patch has been added,

On Fri, Jun 17, 2022 at 10:12 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Thu, Jun 16, 2022 at 05:37:07PM +0530, Logananth Sundararaj wrote:
> > The Yosemite V3.5 is a facebook multi-node server
> > platform that host four OCP server. The BMC
> > in the Yosemite V3.5 platform based on AST2600 SoC.
> >
> > This patch adds linux device tree entry related to
> > Yosemite V3.5 specific devices connected to BMC SoC.
> >
> > Signed-off-by: Logananth Sundararaj <logananth_s@hcl.com>
> >
> > ---
> > --- v2 - Enabled i2c drivers.
> > --- v1 - Initial draft.
> > ---
> >  arch/arm/boot/dts/Makefile                    |   1 +
> >  .../boot/dts/aspeed-bmc-facebook-fby35.dts    | 277 ++++++++++++++++++
> >  2 files changed, 278 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
>
> A few comments below.
>
> ...
> > +&uart5 {
> > +     status = "okay";
> > +     /* Workaround for AST2600 A0 */
> > +     compatible = "snps,dw-apb-uart";
> > +};
>
> Is this comment accurate?  Are we using A0 hardware on this system?
>
>
Done.


> > +&fmc {
> > +     status = "okay";
> > +     reg = <0x1e620000 0xc4>, <0x20000000 0x8000000>;
> > +     flash@0 {
> > +             status = "okay";
> > +             m25p,fast-read;
> > +             label = "spi0.1";
> > +             spi-max-frequency = <50000000>;
> > +             spi-tx-bus-width = <2>;
> > +             spi-rx-bus-width = <2>;
> > +             #include "openbmc-flash-layout-64.dtsi"
> > +     };
> > +};
>
> Aren't there two SPI flashes?  It seems like it based on:
>
> https://github.com/facebook/openbmc-linux/blob/dev-5.10/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts#L162
>
>
yes, two flashes have been added.


> > +
> > +&spi1 {
> > +     status = "okay";
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_spi1_default>;
> > +
> > +     flash@0 {
> > +             status = "okay";
> > +             m25p,fast-read;
> > +             label = "pnor";
> > +             spi-rx-bus-width = <4>;
> > +             spi-max-frequency = <100000000>;
> > +     };
> > +};
>
> What is SPI1 used for?  I don't see it in the facebook/openbmc-linux
> DTS.
>
>
Done.


> > --
> > 2.17.1
> >
>
> Are we missing the pwm/tach support?  Or is that still not upstream from
> Aspeed?
>
>
yes, pwm/tach support is haven't been upstream from the Aspeed for ast2600.


> --
> Patrick Williams
>

Sorry for the late reply Patrick, missed replying.
Thanks.
Logananth

--0000000000005ac9b105e4b4fada
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The comments have been addressed and the new patch ha=
s been added,<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Jun 17, 2022 at 10:12 PM Patrick Williams &lt;<a h=
ref=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jun 16, 2022 at 0=
5:37:07PM +0530, Logananth Sundararaj wrote:<br>
&gt; The Yosemite V3.5 is a facebook multi-node server<br>
&gt; platform that host four OCP server. The BMC<br>
&gt; in the Yosemite V3.5 platform based on AST2600 SoC.<br>
&gt; <br>
&gt; This patch adds linux device tree entry related to<br>
&gt; Yosemite V3.5 specific devices connected to BMC SoC.<br>
&gt; <br>
&gt; Signed-off-by: Logananth Sundararaj &lt;<a href=3D"mailto:logananth_s@=
hcl.com" target=3D"_blank">logananth_s@hcl.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; --- v2 - Enabled i2c drivers.<br>
&gt; --- v1 - Initial draft.<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../boot/dts/aspeed-bmc-facebook-fby35.dts=C2=A0 =C2=A0 | 277 ++=
++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 278 insertions(+)<br>
&gt;=C2=A0 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-fby35.d=
ts<br>
<br>
A few comments below.<br>
<br>
...<br>
&gt; +&amp;uart5 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Workaround for AST2600 A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;snps,dw-apb-uart&quot;;<br>
&gt; +};<br>
<br>
Is this comment accurate?=C2=A0 Are we using A0 hardware on this system?<br=
>
<br></blockquote><div><br></div><div>Done.<br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
&gt; +&amp;fmc {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1e620000 0xc4&gt;, &lt;0x20000000 0=
x8000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0flash@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m25p,fast-read;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;spi0.=
1&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-max-frequency =3D=
 &lt;50000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-tx-bus-width =3D =
&lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-rx-bus-width =3D =
&lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#include &quot;openbm=
c-flash-layout-64.dtsi&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
<br>
Aren&#39;t there two SPI flashes?=C2=A0 It seems like it based on:<br>
<a href=3D"https://github.com/facebook/openbmc-linux/blob/dev-5.10/arch/arm=
/boot/dts/aspeed-bmc-facebook-fby35.dts#L162" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/facebook/openbmc-linux/blob/dev-5.10/arch/arm/bo=
ot/dts/aspeed-bmc-facebook-fby35.dts#L162</a><br>
<br></blockquote><div><br></div><div>yes, two flashes have been added.<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +&amp;spi1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_spi1_default&gt;;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0flash@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m25p,fast-read;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;pnor&=
quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-rx-bus-width =3D =
&lt;4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-max-frequency =3D=
 &lt;100000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
<br>
What is SPI1 used for?=C2=A0 I don&#39;t see it in the facebook/openbmc-lin=
ux<br>
DTS.<br>
<br></blockquote><div><br></div><div>Done.<br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
<br>
Are we missing the pwm/tach support?=C2=A0 Or is that still not upstream fr=
om<br>
Aspeed?<br>
<br></blockquote><div><br></div><div>yes, pwm/tach support is haven&#39;t b=
een upstream from the Aspeed for ast2600.<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
-- <br>
Patrick Williams<br></blockquote><div><br></div><div>Sorry for the late rep=
ly Patrick, missed replying.</div><div>Thanks.<br></div><div>Logananth<br><=
/div></div></div>

--0000000000005ac9b105e4b4fada--
