Return-Path: <SRS0=08VO=V7=gmail.com=tmaimon77@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0601C433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 13:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9668AC36AE5; Mon, 23 May 2022 13:53:41 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4CA9C385A9;
	Mon, 23 May 2022 13:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4CA9C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2f83983782fso148715217b3.6;
        Mon, 23 May 2022 06:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fwrl5pkmtobvpvOlmyCPDHLSgcljWU2s2g8xgJT/8Bg=;
        b=gI2hVr3QF4rmERD2tZMfZaajjYcsXniCJqFY1aBdtFmfs5rkr75VAe+dn6S/WLYzc4
         i4MchuHmEL1ithCfXRH336QVhiS6cIq4G54M6+MQlQCQQ4NxF6ObJdyQXDki5KiOXYFZ
         /pxn8YSvwwnQAZ4bBIWWTa5R+tJLdVJQkquJwSejIIVbGEPh4x22Xpi0WypFqVfUGO0H
         3M5GKWDp0QoDk7QWcijbKiqHODRmRxH50Txc9B3r47UIDKwKotuPtWD6rewfDqSbr9wa
         oitpXzrIZYNdshWSznDtFg88d6I1AtGxxYc90XNmKbUD+uMksPlPD/sn1aUEgxfeS622
         fhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fwrl5pkmtobvpvOlmyCPDHLSgcljWU2s2g8xgJT/8Bg=;
        b=sp5q+qoobIVybQkgYjGdIKBBCCFNXujHryiLiqCBcmhzjd8Unb0IQos3XP+aJgiD4M
         K/cITDe+ov8fjqKVyoRkbNE7WifxCFJkaISzV6sHOwxA9YRVaWdUZpSSTuHlQfpd4wXo
         JI2JbuTQK8v0vx6Ebl+G4Uh4DT/Z9QfKLJjAp9U75EfHcb0GJbNb37xNPiDsYtqOE7yf
         prkviUPI4XlC1iV5HkbTuzNoAfoc98hihvR0xFe0GYo3aRYf3Rp8msxBD5fd+sLdy5EG
         cI3Byzx0RAX2n7Z+ayFAvc1sCmHJp1l01cR0gHS04AvG75t2Hu0wEv5aoYxn0Q/e7O8G
         bnxw==
X-Gm-Message-State: AOAM5317yNJEkdAKfpDI4jyozsYauq8aPnOrBiiQKVnUswU8dbk3e1k0
	He4jbZG3ZvnvJ146nODQfCt8NzZjGLC7KOpL7L4=
X-Google-Smtp-Source: ABdhPJy8588ACx3n4BiYU2UrcUgQmkLHkK5BAYCJEieTT6xV/Uu6FEotzfVgmNyKOUG2Ww1VEKTPoWnr//gviV5W7wk=
X-Received: by 2002:a81:d86:0:b0:2ff:2258:f9b3 with SMTP id
 128-20020a810d86000000b002ff2258f9b3mr23805455ywn.355.1653314019663; Mon, 23
 May 2022 06:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-11-tmaimon77@gmail.com>
 <973d75b8-0eb6-ff5b-6cd2-9b7d7c5cbcaa@linaro.org>
In-Reply-To: <973d75b8-0eb6-ff5b-6cd2-9b7d7c5cbcaa@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 23 May 2022 16:53:28 +0300
Message-ID: <CAP6Zq1ijxK-vqBzsihGSZaffVvsr67R9xHRWZbZeiJ0tWo47DQ@mail.gmail.com>
Subject: Re: [PATCH v1 10/19] reset: npcm: using syscon instead of device data
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
Content-Type: multipart/alternative; boundary="000000000000d8229a05dfae2aed"

--000000000000d8229a05dfae2aed
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your comments.

the patch will modify according to your comments and will be sent in the
next kernel revision 5.19.rc1

On Mon, 23 May 2022 at 11:54, Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 22/05/2022 17:50, Tomer Maimon wrote:
> > Using syscon device tree property instead of
> > device data to handle the NPCM GCR registers.
>
>
> https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586
>
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/reset/reset-npcm.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
> > index 2ea4d3136e15..0c963b21eddc 100644
> > --- a/drivers/reset/reset-npcm.c
> > +++ b/drivers/reset/reset-npcm.c
> > @@ -138,8 +138,7 @@ static int npcm_reset_xlate(struct
> reset_controller_dev *rcdev,
> >  }
> >
> >  static const struct of_device_id npcm_rc_match[] = {
> > -     { .compatible = "nuvoton,npcm750-reset",
> > -             .data = (void *)"nuvoton,npcm750-gcr" },
> > +     { .compatible = "nuvoton,npcm750-reset"},
> >       { }
> >  };
> >
> > @@ -155,14 +154,10 @@ static int npcm_usb_reset(struct platform_device
> *pdev, struct npcm_rc_data *rc)
> >       u32 ipsrst1_bits = 0;
> >       u32 ipsrst2_bits = NPCM_IPSRST2_USB_HOST;
> >       u32 ipsrst3_bits = 0;
> > -     const char *gcr_dt;
> >
> > -     gcr_dt = (const char *)
> > -     of_match_device(dev->driver->of_match_table, dev)->data;
> > -
> > -     gcr_regmap = syscon_regmap_lookup_by_compatible(gcr_dt);
> > +     gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
> "syscon");
>
> I think this just broke all existing boards...
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer

--000000000000d8229a05dfae2aed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Krzysztof,</div>=
<div dir=3D"ltr"><br></div><div dir=3D"ltr">Thanks for your comments.</div>=
<div dir=3D"ltr"><br></div><div dir=3D"ltr">the patch will=C2=A0modify acco=
rding to your comments and will be sent in the next kernel revision 5.19.rc=
1</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 23 May 2022 at 11:54, Krzysztof Kozlowski &lt;<a href=3D"mai=
lto:krzysztof.kozlowski@linaro.org">krzysztof.kozlowski@linaro.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 22/05/=
2022 17:50, Tomer Maimon wrote:<br>
&gt; Using syscon device tree property instead of<br>
&gt; device data to handle the NPCM GCR registers.<br>
<br>
<a href=3D"https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/=
process/submitting-patches.rst#L586" rel=3D"noreferrer" target=3D"_blank">h=
ttps://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/subm=
itting-patches.rst#L586</a><br>
<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/reset/reset-npcm.c | 11 +++--------<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 8 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c<b=
r>
&gt; index 2ea4d3136e15..0c963b21eddc 100644<br>
&gt; --- a/drivers/reset/reset-npcm.c<br>
&gt; +++ b/drivers/reset/reset-npcm.c<br>
&gt; @@ -138,8 +138,7 @@ static int npcm_reset_xlate(struct reset_controlle=
r_dev *rcdev,<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const struct of_device_id npcm_rc_match[] =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nuvoton,npcm750-reset&quo=
t;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D (void *)&qu=
ot;nuvoton,npcm750-gcr&quot; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nuvoton,npcm750-reset&quo=
t;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ }<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; @@ -155,14 +154,10 @@ static int npcm_usb_reset(struct platform_device=
 *pdev, struct npcm_rc_data *rc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ipsrst1_bits =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ipsrst2_bits =3D NPCM_IPSRST2_USB_HOST;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ipsrst3_bits =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0const char *gcr_dt;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0gcr_dt =3D (const char *)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0of_match_device(dev-&gt;driver-&gt;of_match_table=
, dev)-&gt;data;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gcr_regmap =3D syscon_regmap_lookup_by_compatible=
(gcr_dt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gcr_regmap =3D syscon_regmap_lookup_by_phandle(de=
v-&gt;of_node, &quot;syscon&quot;);<br>
<br>
I think this just broke all existing boards...<br>
<br>
Best regards,<br>
Krzysztof<br></blockquote><div><br></div><div>Best regards,</div><div><br><=
/div><div>Tomer=C2=A0</div></div></div>

--000000000000d8229a05dfae2aed--
