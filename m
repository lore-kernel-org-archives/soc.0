Return-Path: <SRS0=08VO=V7=gmail.com=tmaimon77@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E82C433F5
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 12:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BED39C34100; Mon, 23 May 2022 12:58:26 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEABBC385A9;
	Mon, 23 May 2022 12:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EEABBC385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2ff155c239bso147184677b3.2;
        Mon, 23 May 2022 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H2SgtclidI4iuGau++H6wEXBlJgCKiXoYBEmOVsDezE=;
        b=Ae8e+0YunXWp4UO+xUn9fY1k19Mu7MfVD+bJm4OT2BUCihawO7TSZZ/+l/o+iLng+X
         43cOw7GdCdXLyozaSyuBjjWLYIABZU6wsnNQZ5IQMRl2WPWd08sYVA886qjpuVQ3wCvg
         Z34nvU9TXhtXQNa1EKEO9E4oaX2CCJ5CfmRkJ0o4zPEovYcpEEBTPWGVpzRKDK2jTT/h
         eNnJSOUHsK1L3cw9JwlxhYcMHKs+DcBuuG9btrB2dYVq6tpQQ0JPIfR6vVp/HYhV1pGM
         XL/WbOHdSS90JuPXVcoIXw+uovEiLn/LQiroWF5p8DX4LGAHzm2+UZ9uE0WABrYWrg2c
         rR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H2SgtclidI4iuGau++H6wEXBlJgCKiXoYBEmOVsDezE=;
        b=uGvATYrvkF7Y5lHOPB+SKSxxfX5mbU3JyiG5QGaAxuCnJnaWuH/cDEKc27ZnBOJhkk
         bFbw3ViLdtNSqgH/gdagGXiJc5RxVKChwekm2YZE2cNbcWc8JEL1xJfWZg0Qa52bczXi
         nAabxz+Nz9FnNiFy5Ky6RQrhvHl513phR/2s7RXV6J7wpxaO5vk+i6RdpooXSMPWSGn9
         ZUoJ31/nw52UnRenC0WA5QFt7vk3rwnGbg+MuttI19sRN6nzeEwyWHpQE06Ugi6wKKpO
         OaweVLyvN+ueierKBsjPDo7zxHLKaIHm6bz9KP7jdHjxRMpNhvRv1PZ9K00ciomXkQuF
         8Mng==
X-Gm-Message-State: AOAM5319sikQtm8e655PGFELa1Ulgo0Ki8dSYR8iBMhXqHXerU163xZv
	VJFdvKNoTF2Mx6FNXL4lns2ZwmRTfyn4hfL63tk=
X-Google-Smtp-Source: ABdhPJzDrZary66QlIxNLydjcgYbhP8hOHcOLPAJ/kOGWQeFiOmFweXgJhT1U+CUtwm37GMrIyYEr7qJTw+oG0q81mQ=
X-Received: by 2002:a0d:e585:0:b0:300:14ed:f2a with SMTP id
 o127-20020a0de585000000b0030014ed0f2amr847020ywe.342.1653310705049; Mon, 23
 May 2022 05:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-5-tmaimon77@gmail.com>
 <CAK8P3a0Nh4m7O_WPe1DTWqwWU32C5khOPH0ir7r_=s106mLv5A@mail.gmail.com>
In-Reply-To: <CAK8P3a0Nh4m7O_WPe1DTWqwWU32C5khOPH0ir7r_=s106mLv5A@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 23 May 2022 15:58:14 +0300
Message-ID: <CAP6Zq1jk=wf3VbxttrHZwS-wywMoO4upgMQH4yr2AeKwYV8G4Q@mail.gmail.com>
Subject: Re: [PATCH v1 04/19] tty: serial: 8250: Add NPCM845 UART support
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
Content-Type: multipart/alternative; boundary="0000000000004722df05dfad65e8"

--0000000000004722df05dfad65e8
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

Thanks for your comment.

On Mon, 23 May 2022 at 14:48, Arnd Bergmann <arnd@arndb.de> wrote:

> On Sun, May 22, 2022 at 5:50 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> > +++ b/drivers/tty/serial/8250/8250_of.c
> > @@ -333,6 +333,7 @@ static const struct of_device_id
> of_platform_serial_table[] = {
> >         { .compatible = "ti,da830-uart", .data = (void *)PORT_DA830, },
> >         { .compatible = "nuvoton,wpcm450-uart", .data = (void
> *)PORT_NPCM, },
> >         { .compatible = "nuvoton,npcm750-uart", .data = (void
> *)PORT_NPCM, },
> > +       { .compatible = "nuvoton,npcm845-uart", .data = (void
> *)PORT_NPCM, },
> >         { /* end of list */ },
>
> If these are compatible devices, it's usually easier to claim
> compatibility with both the specific chip and the older model
> as a fallback, to avoid driver changes. This seems to apply to
> the timer and watchdog devices as well.
>
Just to make sure, Do you mean claim in the device tree?
like

compatible = "nuvoton,npcm845-timer", "nuvoton,npcm-timer";


>        Arnd
>

 Best regards,

Tomer

--0000000000004722df05dfad65e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Arnd,<div><br></div><div>Thanks for yo=
ur comment.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, 23 May 2022 at 14:48, Arnd Bergmann &lt;<a href=3D=
"mailto:arnd@arndb.de">arnd@arndb.de</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Sun, May 22, 2022 at 5:50 PM Tomer M=
aimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">tmaimon7=
7@gmail.com</a>&gt; wrote:<br>
&gt; +++ b/drivers/tty/serial/8250/8250_of.c<br>
&gt; @@ -333,6 +333,7 @@ static const struct of_device_id of_platform_seria=
l_table[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;ti,da830-uart=
&quot;, .data =3D (void *)PORT_DA830, },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nuvoton,wpcm4=
50-uart&quot;, .data =3D (void *)PORT_NPCM, },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nuvoton,npcm7=
50-uart&quot;, .data =3D (void *)PORT_NPCM, },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nuvoton,npcm845-ua=
rt&quot;, .data =3D (void *)PORT_NPCM, },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* end of list */ },<br>
<br>
If these are compatible devices, it&#39;s usually easier to claim<br>
compatibility with both the specific chip and the older model<br>
as a fallback, to avoid driver changes. This seems to apply to<br>
the timer and watchdog devices as well.<br></blockquote><div>Just to make s=
ure, Do you mean claim in the device tree?<br></div><div>like</div><div><di=
v style=3D"font-family:&quot;Courier New&quot;;font-size:11pt;color:rgb(0,0=
,0)">
<pre>compatible =3D &quot;nuvoton,npcm845-timer&quot;, &quot;nuvoton,npcm-t=
imer&quot;;</pre></div></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Arnd<br></blockquote><div><br></div><div>=C2=A0B=
est regards,</div><div><br></div><div>Tomer</div></div></div>

--0000000000004722df05dfad65e8--
