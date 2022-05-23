Return-Path: <SRS0=08VO=V7=gmail.com=tmaimon77@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF96C433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 12:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EAA83C34116; Mon, 23 May 2022 12:20:35 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5617C385A9;
	Mon, 23 May 2022 12:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5617C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id d137so24998191ybc.13;
        Mon, 23 May 2022 05:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=icgmI5FXMscqJu2JxSPX/fBxQoYXzAjqROshWiyRu3E=;
        b=Vw9IH7gdZPMJlP8LJC7kai4ZV1vnkSiBeC3re8VfDH9IR4AfmakR6dfVif+DDjif4+
         pFYI4ojY9blxNrbGiGotcRSqYIUG+xlwOLzzAIBRRyBDO0+d4i00ZaCK9RqBSJuC6KwA
         QOJRc3KdtxWq9Xt+vdqGnP2dT/FWSOamDVzK1wtI16EvMGAQyfb3lOY/oTPLfGYtALrJ
         2xnDLjT9vIwjDQ9tBETgeK/aZoJP9ApEWnHJadSRPFy0uPT4gy8Ic70aDmHVuaINO+DE
         Y68Bkvu/TeA2Jz8+K+E2tXoXsdOxRY87eQL7SykvTlwr5loTmztPmf0+uKYzX+6Zu1kC
         1tKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=icgmI5FXMscqJu2JxSPX/fBxQoYXzAjqROshWiyRu3E=;
        b=4jjUJGBmoycJVOKkHqb88eYrUtt77/HBcuqqs0RXs6oaarAzFbr09gkVCYnbKvMWFw
         7Zwm8Pwgmqq0Bg6mxovNMuS+KinQKDHM0t+nuSLhKTpWf3z750qwwxY/1cJXBzVnRQEK
         GotuupyyTwn2Qk7ZuN+IsXnE3ai19eHUSHCbW4xWoKoM8SFECzSlPZxvoh+CZtllOYZY
         SRPU3H8jFH95nVvXHXgZ3K2zm8d/bXMgVFJ2eKc/jNFy0MPXpTNft2AYFZddX+2egoJH
         nI1jXzMdC7rytrPJc3TCUxNQBeFzup2P1pkuwCPWbBc7eICbM+LmJi3BKsZ4L21uh1iK
         KPEA==
X-Gm-Message-State: AOAM531R6QBD96PHJQvGkmW4kOcFdKh3gSf+VcmVZsecFQ18nfSEfpE4
	zGuNLJX/X+GVfKjtgvYE4GpX+g48r3onTXt3GMY=
X-Google-Smtp-Source: ABdhPJzHiTgyI3psjJudxC3x8jMw2v6f/G52mQ6yN2swNO3e/VwXzNF5IFB8/fZ5g72rxplouKRojzEwhEZMs0GRQ98=
X-Received: by 2002:a25:b3c3:0:b0:64f:fda2:e394 with SMTP id
 x3-20020a25b3c3000000b0064ffda2e394mr2911840ybf.272.1653308433761; Mon, 23
 May 2022 05:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <CAK8P3a2CUy17vbd5Go523894vcF_oLz=dAR7JNLsUuR1Gsc9sA@mail.gmail.com>
In-Reply-To: <CAK8P3a2CUy17vbd5Go523894vcF_oLz=dAR7JNLsUuR1Gsc9sA@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 23 May 2022 15:20:22 +0300
Message-ID: <CAP6Zq1gw5pRDhJ6EkEsObm6YVHa9eEzXgsfVmzqCduCVMfS65A@mail.gmail.com>
Subject: Re: [PATCH v1 00/19] Introduce Nuvoton Arbel NPCM8XX BMC SoC
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, gregkh <gregkh@linuxfoundation.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, Vinod Koul <vkoul@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, robert.hancock@calian.com, 
	"nathan=20Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>, Lubomir Rintel <lkundrak@v3.sk>, SoC Team <soc@kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/alternative; boundary="000000000000e60a4d05dfacdd50"

--000000000000e60a4d05dfacdd50
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

Appreciate your comments

On Mon, 23 May 2022 at 14:46, Arnd Bergmann <arnd@arndb.de> wrote:

> On Sun, May 22, 2022 at 5:50 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > This patchset  adds initial support for the Nuvoton
> > Arbel NPCM8XX Board Management controller (BMC) SoC family.
> >
> > The Nuvoton Arbel NPCM8XX SoC is a fourth-generation BMC.
> > The NPCM8XX computing subsystem comprises a quadcore ARM
> > Cortex A35 ARM-V8 architecture.
> >
> > This patchset adds minimal architecture and drivers such as:
> > Clocksource, Clock, Reset, and WD.
> >
> > Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.
> >
> > This patchset was tested on the Arbel NPCM8XX evaluation board.
>
> Thanks for your submission. Please note a few things about the process
> here:
>
> - The merge window is currently open, which means a lo
>
> Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.
>
> This patchset was tested on the Arbel NPCM8XX evaluation board.
>
> Tomer Maimon (19):
>   dt-bindings: timer: npcm: Add npcm845 compatible string
>   clocksource: timer-npcm7xx: Add NPCM845 timer support
>   dt-bindings: serial: 8250: Add npcm845 compatible string
>   tty: serial: 8250: Add NPCM845 UART support
>   dt-bindings: watchdog: npcm: Add npcm845 compatible string
>   watchdog: npcm_wdt: Add NPCM845 watchdog support
>   dt-binding: clk: npcm845: Add binding for Nuvoton NPCM8XX Clock
>   clk: npcm8xx: add clock controller
>   dt-bindings: reset: add syscon property
>   reset: npcm: using syscon instead of device data
>   dt-bindings: reset: npcm: Add support for NPCM8XX
>   reset: npcm: Add NPCM8XX support
>   dt-bindings: arm: npcm: Add maintainer
>   dt-bindings: arm: npcm: Add nuvoton,npcm845 compatible string
>   dt-bindings: arm: npcm: Add nuvoton,npcm845 GCR compatible string
>   arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC
>   arm64: dts: nuvoton: Add initial NPCM8XX device tree
>   arm64: dts: nuvoton: Add initial NPCM845 EVB device tree
>   arm64: defconfig: Add Nuvoton NPCM family supportt of maintainers
>   won't be reviewing your patches at the moment. It may be better to wait
>   for the -rc1 to be out before sending out v2
>
 Will do.

>
> - don't send your patches to soc@kernel.org unless you want me to pick
>   them up into the soc tree and they have been reviewed already. The series
>   is clearly still under review at the moment, and I expect it to go
> through
>   a few revisions first.
>
I will remove soc@kernel.org in the next patchset revision.


> - gmail marked your emails as possible spam for me. I don't know what
>   happened here, but you may want to look into this to ensure that
>   everybody receives it.

Unfortunately, this is happen because of the way we send the mail from our
mail server.
I double-check it our IT guys if there is a way to overcome it.

>
> Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.
>
> This patchset was tested on the Arbel NPCM8XX evaluation board.
>
> Tomer Maimon (19):
>   dt-bindings: timer: npcm: Add npcm845 compatible string
>   clocksource: timer-npcm7xx: Add NPCM845 timer support
>   dt-bindings: serial: 8250: Add npcm845 compatible string
>   tty: serial: 8250: Add NPCM845 UART support
>   dt-bindings: watchdog: npcm: Add npcm845 compatible string
>   watchdog: npcm_wdt: Add NPCM845 watchdog support
>   dt-binding: clk: npcm845: Add binding for Nuvoton NPCM8XX Clock
>   clk: npcm8xx: add clock controller
>   dt-bindings: reset: add syscon property
>   reset: npcm: using syscon instead of device data
>   dt-bindings: reset: npcm: Add support for NPCM8XX
>   reset: npcm: Add NPCM8XX support
>   dt-bindings: arm: npcm: Add maintainer
>   dt-bindings: arm: npcm: Add nuvoton,npcm845 compatible string
>   dt-bindings: arm: npcm: Add nuvoton,npcm845 GCR compatible string
>   arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC
>   arm64: dts: nuvoton: Add initial NPCM8XX device tree
>   arm64: dts: nuvoton: Add initial NPCM845 EVB device tree
>   arm64: defconfig: Add Nuvoton NPCM family support
>
> - For an initial platform submission, I can merge the
>   clk/clocksource/serial/reset drivers along with the platform if they
>   have an Ack from the subsystem maintainers. I would normally
>   not include the watchdog patch in this as it's not essential, but
>   I suppose that it's fine if you only do a oneline change and it
>   has an Ack. If you have other nonessential drivers that need changes,
>   best submit them separately though.
>
Sure.

>
>          Arnd
>

Best regards,

Tomer

--000000000000e60a4d05dfacdd50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Arnd,<div><br></div><div>Appreciate yo=
ur comments</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, 23 May 2022 at 14:46, Arnd Bergmann &lt;<a href=3D=
"mailto:arnd@arndb.de">arnd@arndb.de</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Sun, May 22, 2022 at 5:50 PM Tomer M=
aimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">tmaimon7=
7@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This patchset=C2=A0 adds initial support for the Nuvoton<br>
&gt; Arbel NPCM8XX Board Management controller (BMC) SoC family.<br>
&gt;<br>
&gt; The Nuvoton Arbel NPCM8XX SoC is a fourth-generation BMC.<br>
&gt; The NPCM8XX computing subsystem comprises a quadcore ARM<br>
&gt; Cortex A35 ARM-V8 architecture.<br>
&gt;<br>
&gt; This patchset adds minimal architecture and drivers such as:<br>
&gt; Clocksource, Clock, Reset, and WD.<br>
&gt;<br>
&gt; Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.<br>
&gt;<br>
&gt; This patchset was tested on the Arbel NPCM8XX evaluation board.<br>
<br>
Thanks for your submission. Please note a few things about the process here=
:<br>
<br>
- The merge window is currently open, which means a lo<br>
<br>
Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.<br>
<br>
This patchset was tested on the Arbel NPCM8XX evaluation board.<br>
<br>
Tomer Maimon (19):<br>
=C2=A0 dt-bindings: timer: npcm: Add npcm845 compatible string<br>
=C2=A0 clocksource: timer-npcm7xx: Add NPCM845 timer support<br>
=C2=A0 dt-bindings: serial: 8250: Add npcm845 compatible string<br>
=C2=A0 tty: serial: 8250: Add NPCM845 UART support<br>
=C2=A0 dt-bindings: watchdog: npcm: Add npcm845 compatible string<br>
=C2=A0 watchdog: npcm_wdt: Add NPCM845 watchdog support<br>
=C2=A0 dt-binding: clk: npcm845: Add binding for Nuvoton NPCM8XX Clock<br>
=C2=A0 clk: npcm8xx: add clock controller<br>
=C2=A0 dt-bindings: reset: add syscon property<br>
=C2=A0 reset: npcm: using syscon instead of device data<br>
=C2=A0 dt-bindings: reset: npcm: Add support for NPCM8XX<br>
=C2=A0 reset: npcm: Add NPCM8XX support<br>
=C2=A0 dt-bindings: arm: npcm: Add maintainer<br>
=C2=A0 dt-bindings: arm: npcm: Add nuvoton,npcm845 compatible string<br>
=C2=A0 dt-bindings: arm: npcm: Add nuvoton,npcm845 GCR compatible string<br=
>
=C2=A0 arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC<br>
=C2=A0 arm64: dts: nuvoton: Add initial NPCM8XX device tree<br>
=C2=A0 arm64: dts: nuvoton: Add initial NPCM845 EVB device tree<br>
=C2=A0 arm64: defconfig: Add Nuvoton NPCM family supportt of maintainers<br=
>
=C2=A0 won&#39;t be reviewing your patches at the moment. It may be better =
to wait<br>
=C2=A0 for the -rc1 to be out before sending out v2<br></blockquote><div>=
=C2=A0Will do.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
- don&#39;t send your patches to <a href=3D"mailto:soc@kernel.org" target=
=3D"_blank">soc@kernel.org</a> unless you want me to pick<br>
=C2=A0 them up into the soc tree and they have been reviewed already. The s=
eries<br>
=C2=A0 is clearly still under review at the moment, and I expect it to go t=
hrough<br>
=C2=A0 a few revisions first.<br></blockquote><div>I will remove=C2=A0<a hr=
ef=3D"mailto:soc@kernel.org" target=3D"_blank">soc@kernel.org</a>=C2=A0in t=
he next patchset revision.</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
- gmail marked your emails as possible spam for me. I don&#39;t know what<b=
r>
=C2=A0 happened here, but you may want to look into this to ensure that<br>
=C2=A0 everybody receives it.=C2=A0=C2=A0</blockquote><div>Unfortunately, t=
his is happen because of the way we send the mail from our mail server.</di=
v><div>I double-check it our=C2=A0IT guys if there is a way to overcome it.=
=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Some of the Arbel NPCM8XX peripherals are based on Poleg NPCM7XX.<br>
<br>
This patchset was tested on the Arbel NPCM8XX evaluation board.<br>
<br>
Tomer Maimon (19):<br>
=C2=A0 dt-bindings: timer: npcm: Add npcm845 compatible string<br>
=C2=A0 clocksource: timer-npcm7xx: Add NPCM845 timer support<br>
=C2=A0 dt-bindings: serial: 8250: Add npcm845 compatible string<br>
=C2=A0 tty: serial: 8250: Add NPCM845 UART support<br>
=C2=A0 dt-bindings: watchdog: npcm: Add npcm845 compatible string<br>
=C2=A0 watchdog: npcm_wdt: Add NPCM845 watchdog support<br>
=C2=A0 dt-binding: clk: npcm845: Add binding for Nuvoton NPCM8XX Clock<br>
=C2=A0 clk: npcm8xx: add clock controller<br>
=C2=A0 dt-bindings: reset: add syscon property<br>
=C2=A0 reset: npcm: using syscon instead of device data<br>
=C2=A0 dt-bindings: reset: npcm: Add support for NPCM8XX<br>
=C2=A0 reset: npcm: Add NPCM8XX support<br>
=C2=A0 dt-bindings: arm: npcm: Add maintainer<br>
=C2=A0 dt-bindings: arm: npcm: Add nuvoton,npcm845 compatible string<br>
=C2=A0 dt-bindings: arm: npcm: Add nuvoton,npcm845 GCR compatible string<br=
>
=C2=A0 arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC<br>
=C2=A0 arm64: dts: nuvoton: Add initial NPCM8XX device tree<br>
=C2=A0 arm64: dts: nuvoton: Add initial NPCM845 EVB device tree<br>
=C2=A0 arm64: defconfig: Add Nuvoton NPCM family support<br>
<br>
- For an initial platform submission, I can merge the<br>
=C2=A0 clk/clocksource/serial/reset drivers along with the platform if they=
<br>
=C2=A0 have an Ack from the subsystem maintainers. I would normally<br>
=C2=A0 not include the watchdog patch in this as it&#39;s not essential, bu=
t<br>
=C2=A0 I suppose that it&#39;s fine if you only do a oneline change and it<=
br>
=C2=A0 has an Ack. If you have other nonessential drivers that need changes=
,<br>
=C2=A0 best submit them separately though.<br></blockquote><div>Sure.=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Arnd<br></blockquote><div><br></div><div>=
Best regards,</div><div><br></div><div>Tomer=C2=A0</div></div></div>

--000000000000e60a4d05dfacdd50--
