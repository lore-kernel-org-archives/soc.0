Return-Path: <SRS0=I26k=NA=baylibre.com=bcousson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6774C25B75
	for <soc@archiver.kernel.org>; Wed, 29 May 2024 09:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C5FFC4AF0B; Wed, 29 May 2024 09:26:26 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8111FC2BD10
	for <soc@kernel.org>; Wed, 29 May 2024 09:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8111FC2BD10
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5785f7347cdso1981845a12.0
        for <soc@kernel.org>; Wed, 29 May 2024 02:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716974783; x=1717579583; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0c2VBkZnNFQSkF5HpEZa/3M4/PXAGu7qN45PFuHAPE=;
        b=Y99CTLQmGnwrpswAaAFPxFPPav6NpLQZgAeb6VmRlA6gIpYYMunVjUOh8Y16Cp0ZjH
         qe9WaG/+nOsp6IWu73u/1hwkhMz7zCPl1s623yDeqAxhspRO5YGKmU/NBNH9tj890B6r
         XNnujPyTqLP2/IHtR/8ADIEhyDDX2OxkuWvh5vLpkPdR3iibr6c7/wj6Scf3VjWoHXhI
         u/Ntwd5YN1Zyp9EhZdujuGrp50jUosJeZWS0RUHrs7Kn2ojSoiHdn5WF+nHOj1yg3BhD
         aGAqhcT/XyllbmJYinjwr6eKWueYqyHbvPkSIq6YEDUZDrlUO7R78Zb+aUIwoVM22I8W
         zSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716974783; x=1717579583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0c2VBkZnNFQSkF5HpEZa/3M4/PXAGu7qN45PFuHAPE=;
        b=l+DQGMpeYleN+WEvdmPbKyzPhU9aZjCTWLXVEqqVXERBfsAdOXXjWNVN0x5uUYN7JK
         lKR9UaFeamgaVpZvpB2VFfnyskV/NCcEjx+CkuJYDXfsq+vxwlmc8NUbuLgiehKLWMqi
         X0aFrFbZGNv4Vt/TFaR0lu0b0iWe989RqlT9NYsovhlFhuOs4agcoCQ9y4ENcN1xCqEm
         fF1s86FjZyLviZ1KEnxb/pHdGZqpaU71YJgaTHRkmL1a7LPakRKVj5V8WVRL1j9iby+F
         SkpusQF+uO3TldYDvGDnV7lw4pZaB6RmhESwmaRjfk0zilAztA6cV3zBIzVgtoZ8x7kb
         Apzw==
X-Forwarded-Encrypted: i=1; AJvYcCW92WeJ+LbW9DlNsYiw5KK7WzqNgBNYRL0i+6RO33v1eg3HCqKAoyjl7mCuXNMCm7fXwatrT7ClKwFrVSg5mA==
X-Gm-Message-State: AOJu0YxvidIsleiG3PzCxsGqwL07937dM6idrlpLD7tVakHuOuUgktpj
	W+a0/UC5yjNecldaM4mt05G/o05r+UsEyEkF+Ttg1ilWcr88AAfutC1fJUaf63k2CX809z8kpxF
	57SIqSSMg8Wwxw+YXsJDS4Pj2eqPd1KdMM/yITA==
X-Google-Smtp-Source: AGHT+IFGQMfOt9P1e58O+h1I5kyuyrp7Z9rcNMfsvpyuyhrnijSmsG0oYQC92G/kn5k1HbYYnCWP52Ok0diTBgtlLKM=
X-Received: by 2002:a50:9e25:0:b0:579:8d79:4a2e with SMTP id
 4fb4d7f45d1cf-5798d795d04mr7712032a12.10.1716974782660; Wed, 29 May 2024
 02:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240520074013.9672-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240520074013.9672-1-krzysztof.kozlowski@linaro.org>
From: Benoit Cousson <bcousson@baylibre.com>
Date: Wed, 29 May 2024 11:26:11 +0200
Message-ID: <CALpuT31Rhnjpsc_kePK9H-UNDs1310Aj1z3EHrqJUL0xOFEpvw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_1=2F2=5D_ti=3A_omap=3A_MAINTAINERS=3A_move_Beno=C3=AEt_?=
	=?UTF-8?Q?Cousson_to_CREDITS?=
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, 
	Antoine Tenart <atenart@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: multipart/alternative; boundary="000000000000025a540619945822"

--000000000000025a540619945822
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof

Le sam. 25 mai 2024 =C3=A0 21:51, Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> a =C3=A9crit :

> Last email from Beno=C3=AEt Cousson was in 2014 [1], so remove him from
> maintainers of the TI OMAP platform.  Stale maintainer entries hide
> information whether subsystem needs help, has a bus-factor or is even
> orphaned.
>

Whaooo, 10 years ago already... Time flies :-)


> Beno=C3=AEt Cousson, thank you for TI OMAP contributions and maintenance.
>

You're welcome! Thanks for doing the necessary cleanup.

[1] https://lore.kernel.org/all/?q=3Df%3Abcousson%40baylibre.com
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>

Here is my latest contribution then ;-)

Acked-by: Beno=C3=AEt Cousson <bcousson@baylibre.com>


> ---
>  CREDITS     | 5 +++++
>  MAINTAINERS | 2 --
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/CREDITS b/CREDITS
> index 0107047f807b..ea84fb373310 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -796,6 +796,11 @@ E: luisfcorreia@gmail.com
>  D: Ralink rt2x00 WLAN driver
>  S: Belas, Portugal
>
> +N: Beno=C3=AEt Cousson
> +E: bcousson@baylibre.com
> +D: TI OMAP Devicetree platforms
> +D: TI OMAP HWMOD boards
> +
>  N: Alan Cox
>  W: http://www.linux.org.uk/diary/
>  D: Linux Networking (0.99.10->2.0.29)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a482f2a499e4..8193bd95c84c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16147,7 +16147,6 @@ S:      Maintained
>  F:     arch/arm/*omap*/*clock*
>
>  OMAP DEVICE TREE SUPPORT
> -M:     Beno=C3=AEt Cousson <bcousson@baylibre.com>
>  M:     Tony Lindgren <tony@atomide.com>
>  L:     linux-omap@vger.kernel.org
>  L:     devicetree@vger.kernel.org
> @@ -16202,7 +16201,6 @@ S:      Maintained
>  F:     arch/arm/mach-omap2/omap_hwmod*data*
>
>  OMAP HWMOD SUPPORT
> -M:     Beno=C3=AEt Cousson <bcousson@baylibre.com>
>  M:     Paul Walmsley <paul@pwsan.com>
>  L:     linux-omap@vger.kernel.org
>  S:     Maintained
> --
> 2.43.0
>

Best Regards,
Beno=C3=AEt

---
Beno=C3=AEt Cousson
President & COO
BayLibre - At the Heart of Embedded Linux
www.baylibre.com

--000000000000025a540619945822
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Krzysztof<br clear=3D"all"><div><div d=
ir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div=
><br></div><div>Le=C2=A0sam. 25 mai 2024 =C3=A0=C2=A021:51, Krzysztof Kozlo=
wski &lt;<a href=3D"mailto:krzysztof.kozlowski@linaro.org">krzysztof.kozlow=
ski@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div></div></div></div></div=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Last email from Beno=C3=AEt Cousson was in 2014 [1], so remove h=
im from<br>
maintainers of the TI OMAP platform.=C2=A0 Stale maintainer entries hide<br=
>
information whether subsystem needs help, has a bus-factor or is even<br>
orphaned.<br></blockquote><div><br></div><div><div>Whaooo, 10 years ago alr=
eady... Time flies :-)=C2=A0</div><div>=C2=A0<br></div></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Beno=C3=AEt Cousson, thank you for TI O=
MAP contributions and maintenance.<br></blockquote><div><br></div><div>You&=
#39;re welcome! Thanks for doing the necessary cleanup.=C2=A0</div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">[1] <a href=3D"htt=
ps://lore.kernel.org/all/?q=3Df%3Abcousson%40baylibre.com" rel=3D"noreferre=
r" target=3D"_blank">https://lore.kernel.org/all/?q=3Df%3Abcousson%40baylib=
re.com</a><br>
<br>
Signed-off-by: Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowsk=
i@linaro.org" target=3D"_blank">krzysztof.kozlowski@linaro.org</a>&gt;<br><=
/blockquote><div><br></div><div>Here is my latest=C2=A0contribution=C2=A0th=
en ;-)=C2=A0</div><div><br></div><div>Acked-by: Beno=C3=AEt Cousson &lt;<a =
href=3D"mailto:bcousson@baylibre.com" target=3D"_blank">bcousson@baylibre.c=
om</a>&gt;<br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0CREDITS=C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A0MAINTAINERS | 2 --<br>
=C2=A02 files changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/CREDITS b/CREDITS<br>
index 0107047f807b..ea84fb373310 100644<br>
--- a/CREDITS<br>
+++ b/CREDITS<br>
@@ -796,6 +796,11 @@ E: <a href=3D"mailto:luisfcorreia@gmail.com" target=3D=
"_blank">luisfcorreia@gmail.com</a><br>
=C2=A0D: Ralink rt2x00 WLAN driver<br>
=C2=A0S: Belas, Portugal<br>
<br>
+N: Beno=C3=AEt Cousson<br>
+E: <a href=3D"mailto:bcousson@baylibre.com" target=3D"_blank">bcousson@bay=
libre.com</a><br>
+D: TI OMAP Devicetree platforms<br>
+D: TI OMAP HWMOD boards<br>
+<br>
=C2=A0N: Alan Cox<br>
=C2=A0W: <a href=3D"http://www.linux.org.uk/diary/" rel=3D"noreferrer" targ=
et=3D"_blank">http://www.linux.org.uk/diary/</a><br>
=C2=A0D: Linux Networking (0.99.10-&gt;2.0.29)<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index a482f2a499e4..8193bd95c84c 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -16147,7 +16147,6 @@ S:=C2=A0 =C2=A0 =C2=A0 Maintained<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0arch/arm/*omap*/*clock*<br>
<br>
=C2=A0OMAP DEVICE TREE SUPPORT<br>
-M:=C2=A0 =C2=A0 =C2=A0Beno=C3=AEt Cousson &lt;<a href=3D"mailto:bcousson@b=
aylibre.com" target=3D"_blank">bcousson@baylibre.com</a>&gt;<br>
=C2=A0M:=C2=A0 =C2=A0 =C2=A0Tony Lindgren &lt;<a href=3D"mailto:tony@atomid=
e.com" target=3D"_blank">tony@atomide.com</a>&gt;<br>
=C2=A0L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linux-omap@vger.kernel.org" t=
arget=3D"_blank">linux-omap@vger.kernel.org</a><br>
=C2=A0L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:devicetree@vger.kernel.org" t=
arget=3D"_blank">devicetree@vger.kernel.org</a><br>
@@ -16202,7 +16201,6 @@ S:=C2=A0 =C2=A0 =C2=A0 Maintained<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0arch/arm/mach-omap2/omap_hwmod*data*<br>
<br>
=C2=A0OMAP HWMOD SUPPORT<br>
-M:=C2=A0 =C2=A0 =C2=A0Beno=C3=AEt Cousson &lt;<a href=3D"mailto:bcousson@b=
aylibre.com" target=3D"_blank">bcousson@baylibre.com</a>&gt;<br>
=C2=A0M:=C2=A0 =C2=A0 =C2=A0Paul Walmsley &lt;<a href=3D"mailto:paul@pwsan.=
com" target=3D"_blank">paul@pwsan.com</a>&gt;<br>
=C2=A0L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linux-omap@vger.kernel.org" t=
arget=3D"_blank">linux-omap@vger.kernel.org</a><br>
=C2=A0S:=C2=A0 =C2=A0 =C2=A0Maintained<br>
-- <br>
2.43.0<br></blockquote><div><br></div><div><div>Best Regards,<br clear=3D"a=
ll"><div><div dir=3D"ltr"><div dir=3D"ltr"><div>Beno=C3=AEt</div><div><br><=
/div></div></div></div></div><div>---</div><div>Beno=C3=AEt Cousson<br></di=
v><div>President &amp; COO<br>BayLibre - At the Heart of Embedded Linux<br>=
<a href=3D"http://www.baylibre.com/" target=3D"_blank">www.baylibre.com</a>=
</div></div><div>=C2=A0</div></div></div>

--000000000000025a540619945822--
