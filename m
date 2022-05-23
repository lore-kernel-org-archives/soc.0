Return-Path: <SRS0=08VO=V7=gmail.com=tmaimon77@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E661C433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 13:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62C7FC34100; Mon, 23 May 2022 13:14:20 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B3F8C385A9;
	Mon, 23 May 2022 13:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9B3F8C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id o80so25351886ybg.1;
        Mon, 23 May 2022 06:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uUVMlKQQVBc3oXmHNxKheYpGjkj0/ox35SW9I+79yvQ=;
        b=Ub5LXaiJszGWuePzI+cnR3TvLWQM246Ri79qUf5wtrkkJ9WycOx+ZKWGGLNKehVRSY
         0fDK7RqauANNvfzso7dOOVj59PLBXJbMOXDBYzDtPvRHVfbGwj3CG6YhoxAVHCMerO2u
         i1QsF338tb9cZztWWXsX3Zab/EoL8IwdjOdvmtg008aR9IwT/vuPF6rUUvVGIIuANrKD
         K8gluS9yyE6YGBQo7H9Qc5axLgcEwvD3FHJrgX7ISfF8fH+Bw2tZi+29O3kJTNb7bTAC
         6mxH2zGdH/fDxL0WXMV20GFdkwZbDuo9md2SJswrsqRYD8ArfQk51N/y5P0NAuIQx7Sl
         9Bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uUVMlKQQVBc3oXmHNxKheYpGjkj0/ox35SW9I+79yvQ=;
        b=ZvTlK/tZ2bKUN7vsqSZrPk0M2sKTZaOwt12oT+DtLzRj1bKudtOLTfxKlMJPEBmQmr
         EOQv2PMCJqzhK7qka92SmEnISpoWJ5MPTPpoDVcY8pOyaOfua+VZA0v8Kqxap0tPr+zJ
         3fGKrTN3XEjNbEQhVp3F8Lnzych83cCSguCJk+qxDNhdCwIuMUZ5i3HawMqoXCMqau2v
         VB7iqHBw3bBFQdRzS/euRw8DqXBDUCTrin0QHWtWYKve1HlWJxPCAVPEUqF9Lei6qTen
         V9+K9tTszgwcoG2Q04rZyu0+WSBhPRaS+uBJFOseXaL5XJo8w81goj/zVegOYEplgoh6
         THWQ==
X-Gm-Message-State: AOAM533x/surC3g+pXms9t/1bmYkPnjQ67+rpqHGQWqtkRBmvgrOjZoV
	nC6N3KWLMPAb1sOEAYFYbxo9yZjUUyVr2TvuR7A=
X-Google-Smtp-Source: ABdhPJyKyv2YnvW2QOEcod5rPSyzIApwfpZOMURRAXsZHGBTEjXFFK74Y7lU8aWbyrH3yWxQuAoDEyzVNCbZDmK9s6o=
X-Received: by 2002:a05:6902:70c:b0:64f:4e29:a858 with SMTP id
 k12-20020a056902070c00b0064f4e29a858mr18592314ybt.462.1653311658716; Mon, 23
 May 2022 06:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-5-tmaimon77@gmail.com>
 <CAK8P3a0Nh4m7O_WPe1DTWqwWU32C5khOPH0ir7r_=s106mLv5A@mail.gmail.com>
 <CAP6Zq1jk=wf3VbxttrHZwS-wywMoO4upgMQH4yr2AeKwYV8G4Q@mail.gmail.com> <2ccfbfa8-be11-50ed-66ca-3476cbddb320@linaro.org>
In-Reply-To: <2ccfbfa8-be11-50ed-66ca-3476cbddb320@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 23 May 2022 16:14:07 +0300
Message-ID: <CAP6Zq1jjE25HMtSZvFX2MA-5yogMozYaMVuF-qZCo=DdXzbL6w@mail.gmail.com>
Subject: Re: [PATCH v1 04/19] tty: serial: 8250: Add NPCM845 UART support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
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
Content-Type: multipart/alternative; boundary="0000000000001ef18c05dfad9e8f"

--0000000000001ef18c05dfad9e8f
Content-Type: text/plain; charset="UTF-8"

Yes, that's what I mean forgot the 750...

Thanks Krzysztof

On Mon, 23 May 2022 at 16:06, Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 23/05/2022 14:58, Tomer Maimon wrote:
> > Hi Arnd,
> >
> > Thanks for your comment.
> >
> > On Mon, 23 May 2022 at 14:48, Arnd Bergmann <arnd@arndb.de
> > <mailto:arnd@arndb.de>> wrote:
> >
> >     On Sun, May 22, 2022 at 5:50 PM Tomer Maimon <tmaimon77@gmail.com
> >     <mailto:tmaimon77@gmail.com>> wrote:
> >     > +++ b/drivers/tty/serial/8250/8250_of.c
> >     > @@ -333,6 +333,7 @@ static const struct of_device_id
> >     of_platform_serial_table[] = {
> >     >         { .compatible = "ti,da830-uart", .data = (void
> >     *)PORT_DA830, },
> >     >         { .compatible = "nuvoton,wpcm450-uart", .data = (void
> >     *)PORT_NPCM, },
> >     >         { .compatible = "nuvoton,npcm750-uart", .data = (void
> >     *)PORT_NPCM, },
> >     > +       { .compatible = "nuvoton,npcm845-uart", .data = (void
> >     *)PORT_NPCM, },
> >     >         { /* end of list */ },
> >
> >     If these are compatible devices, it's usually easier to claim
> >     compatibility with both the specific chip and the older model
> >     as a fallback, to avoid driver changes. This seems to apply to
> >     the timer and watchdog devices as well.
> >
> > Just to make sure, Do you mean claim in the device tree?
> > like
> >
> > compatible = "nuvoton,npcm845-timer", "nuvoton,npcm-timer";
>
> compatible = "nuvoton,npcm845-timer", "nuvoton,npcm750-timer"";
>
>
> Best regards,
> Krzysztof
>

--0000000000001ef18c05dfad9e8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes,=C2=A0that&#39;s what I mean forgot the 750...<div><br=
></div><div>Thanks=C2=A0Krzysztof</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 23 May 2022 at 16:06, Krzysz=
tof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowski@linaro.org">krzyszt=
of.kozlowski@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 23/05/2022 14:58, Tomer Maimon wrote:<br>
&gt; Hi Arnd,<br>
&gt; <br>
&gt; Thanks for your comment.<br>
&gt; <br>
&gt; On Mon, 23 May 2022 at 14:48, Arnd Bergmann &lt;<a href=3D"mailto:arnd=
@arndb.de" target=3D"_blank">arnd@arndb.de</a><br>
&gt; &lt;mailto:<a href=3D"mailto:arnd@arndb.de" target=3D"_blank">arnd@arn=
db.de</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Sun, May 22, 2022 at 5:50 PM Tomer Maimon &lt;<a=
 href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">tmaimon77@gmail.com<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tmaimon77@gmail.com" t=
arget=3D"_blank">tmaimon77@gmail.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/drivers/tty/serial/8250/8250_of.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -333,6 +333,7 @@ static const struct of_dev=
ice_id<br>
&gt;=C2=A0 =C2=A0 =C2=A0of_platform_serial_table[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible=
 =3D &quot;ti,da830-uart&quot;, .data =3D (void<br>
&gt;=C2=A0 =C2=A0 =C2=A0*)PORT_DA830, },<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible=
 =3D &quot;nuvoton,wpcm450-uart&quot;, .data =3D (void<br>
&gt;=C2=A0 =C2=A0 =C2=A0*)PORT_NPCM, },<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible=
 =3D &quot;nuvoton,npcm750-uart&quot;, .data =3D (void<br>
&gt;=C2=A0 =C2=A0 =C2=A0*)PORT_NPCM, },<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D =
&quot;nuvoton,npcm845-uart&quot;, .data =3D (void<br>
&gt;=C2=A0 =C2=A0 =C2=A0*)PORT_NPCM, },<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* end of l=
ist */ },<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If these are compatible devices, it&#39;s usually e=
asier to claim<br>
&gt;=C2=A0 =C2=A0 =C2=A0compatibility with both the specific chip and the o=
lder model<br>
&gt;=C2=A0 =C2=A0 =C2=A0as a fallback, to avoid driver changes. This seems =
to apply to<br>
&gt;=C2=A0 =C2=A0 =C2=A0the timer and watchdog devices as well.<br>
&gt; <br>
&gt; Just to make sure, Do you mean claim in the device tree?<br>
&gt; like<br>
&gt; <br>
&gt; compatible =3D &quot;nuvoton,npcm845-timer&quot;, &quot;nuvoton,npcm-t=
imer&quot;;<br>
<br>
compatible =3D &quot;nuvoton,npcm845-timer&quot;, &quot;nuvoton,npcm750-tim=
er&quot;&quot;;<br>
<br>
<br>
Best regards,<br>
Krzysztof<br>
</blockquote></div>

--0000000000001ef18c05dfad9e8f--
