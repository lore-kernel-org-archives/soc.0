Return-Path: <SRS0=LoRv=PN=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4ABEC433EF
	for <soc@archiver.kernel.org>; Mon, 25 Oct 2021 15:31:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 79CB161002; Mon, 25 Oct 2021 15:31:39 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44F6760FBF;
	Mon, 25 Oct 2021 15:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44F6760FBF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id q13so22998504uaq.2;
        Mon, 25 Oct 2021 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IxBtXt/McEd0zaURu/nR6YIizPPZdAJGI900Sn82FSA=;
        b=QAEUyLWS6DQz43rm2jZKIEv2Ny6tvYFTCEdFVYjoZ5PR2C/zpFwK7dmaGjfgroqcCk
         EtHQvQndTz8/j76aREBJxZ+75nksYhpjmm9eHogFg0eD61FteAM6Qh74Qlz2UUTLwCKW
         1Z413Y54Lb9ZviLmWqzNDfXF23ipsv9WA7ApvVmDtMo/74CH+bBQO/PBIfYhqYkKhDdZ
         tVM1IQonvB2pwSUnW/n9y4IA3vikSYJeGW4wYX4d3wJO2HLkykLWNsOHboUVLQW0r5FR
         FL4VRUVN2jf4WT/G3hPwYw+Xa0aKJbY2G1TVOJUMnkXbcQtXxXYJGUDKkmGfqL5OW6+8
         X2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IxBtXt/McEd0zaURu/nR6YIizPPZdAJGI900Sn82FSA=;
        b=pHREwyTIMiF57g0BSct/bGjr7atlFQ/Z6zE9p+LOEwoqR+X2InOomYtJdNkAHTHVEE
         FvcPeZ4L2JCMN1O9vbKgjLhyHyCw/r+mi6gGGyS9e22oUIIyB86qRslRsbf/UJQ29cPn
         u+7gtvQx0kDVQAHtaMhLZKoLzGeTH9cRgUFmbjyYK1c/AUuANqomV88GwYMhWmyeVm3I
         tm7Jw6xiFLvUKu1zqVde/P3/bOiDWNBfHM21GyUnpLKYKgFhTA4qy7Yelk0nuEJh9QZJ
         m+46khiCnYEy1ePR3L52s9ouCR/26r078svqj/0RpbLUlUC7ooQhUlGev33+BMiwpcEG
         Cs8g==
X-Gm-Message-State: AOAM530BP7MFNNRNlvLVM1hC6WSNi4E+XzchjLO+BaOIubt3kjX1xaQ0
	gQTBPSaB57LSJpuWrkhc+akpkqdkis4JlvrSZ6XXCSlJcDliig==
X-Google-Smtp-Source: ABdhPJwpKQP0GioA9cZHmpvIwb/mzZ97aCwTFuWnIXIBTqbtLNCPaw3izlCA8SkERP5CX8LmKeqOIXRzejZoYX7vaFE=
X-Received: by 2002:a9f:3d85:: with SMTP id c5mr15811316uai.12.1635175898278;
 Mon, 25 Oct 2021 08:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-6-Mr.Bossman075@gmail.com> <1635166454.818167.190975.nullmailer@robh.at.kernel.org>
In-Reply-To: <1635166454.818167.190975.nullmailer@robh.at.kernel.org>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 25 Oct 2021 11:31:26 -0400
Message-ID: <CAJFTR8Tz3Nd=4A9ngM7b7s+7mmaocssZjku2RpmkD5kcePEDoQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] dt-bindings: clock: imx: Add documentation for
 i.MXRT clock
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Turquette <mturquette@baylibre.com>, 
	Olof Johansson <olof@lixom.net>, Dong Aisheng <aisheng.dong@nxp.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andy Duan <fugang.duan@nxp.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Adrian Hunter <adrian.hunter@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	b20788@freescale.com, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, gregkh <gregkh@linuxfoundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, 
	linux-clk <linux-clk@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Abel Vesa <abel.vesa@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, 
	linux-mmc <linux-mmc@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Stefan Agner <stefan@agner.ch>, Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	SoC Team <soc@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000008fef5605cf2f0e60"

--0000000000008fef5605cf2f0e60
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 8:54 AM Rob Herring <robh@kernel.org> wrote:

> On Sun, 24 Oct 2021 11:40:19 -0400, Jesse Taube wrote:
> > Add DT binding documentation for i.MXRT clock driver.
> >
> > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> > ---
> >  .../bindings/clock/imxrt-clock.yaml           | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Error:
> Documentation/devicetree/bindings/clock/imxrt-clock.example.dts:32.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:385:
> Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1441: dt_binding_check] Error 2


Oh will fix I didn't know that that check existed, the problem was
macros...


>
>
doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1545398
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>
>

--0000000000008fef5605cf2f0e60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 8:54 AM Rob H=
erring &lt;<a href=3D"mailto:robh@kernel.org">robh@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 24 Oct=
 2021 11:40:19 -0400, Jesse Taube wrote:<br>
&gt; Add DT binding documentation for i.MXRT clock driver.<br>
&gt; <br>
&gt; Cc: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettienginee=
ring.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt;<b=
r>
&gt; Signed-off-by: Jesse Taube &lt;<a href=3D"mailto:Mr.Bossman075@gmail.c=
om" target=3D"_blank">Mr.Bossman075@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/clock/imxrt-clock.yaml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 57 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 57 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/clock/imxrt=
-clock.yaml<br>
&gt; <br>
<br>
My bot found errors running &#39;make DT_CHECKER_FLAGS=3D-m dt_binding_chec=
k&#39;<br>
on your patch (DT_CHECKER_FLAGS is new in v5.13):<br>
<br>
yamllint warnings/errors:<br>
<br>
dtschema/dtc warnings/errors:<br>
Error: Documentation/devicetree/bindings/clock/imxrt-clock.example.dts:32.2=
7-28 syntax error<br>
FATAL ERROR: Unable to parse input tree<br>
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/c=
lock/imxrt-clock.example.dt.yaml] Error 1<br>
make[1]: *** Waiting for unfinished jobs....<br>
make: *** [Makefile:1441: dt_binding_check] Error 2</blockquote><div><br></=
div><div>Oh will fix I didn&#39;t know that that check existed, the problem=
 was macros...=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
doc reference errors (make refcheckdocs):<br>
<br>
See <a href=3D"https://patchwork.ozlabs.org/patch/1545398" rel=3D"noreferre=
r" target=3D"_blank">https://patchwork.ozlabs.org/patch/1545398</a><br>
<br>
This check can fail if there are any dependencies. The base for a patch<br>
series is generally the most recent rc1.<br>
<br>
If you already ran &#39;make dt_binding_check&#39; and didn&#39;t see the a=
bove<br>
error(s), then make sure &#39;yamllint&#39; is installed and dt-schema is u=
p to<br>
date:<br>
<br>
pip3 install dtschema --upgrade<br>
<br>
Please check and re-submit.<br>
<br>
</blockquote></div></div>

--0000000000008fef5605cf2f0e60--
