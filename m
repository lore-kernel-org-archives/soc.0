Return-Path: <SRS0=3mSG=WD=gmail.com=orsonzhai@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B4BC433EF
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 04:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42741C34119; Fri, 27 May 2022 04:35:38 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 413E3C385A9;
	Fri, 27 May 2022 04:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 413E3C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id x143so3366794pfc.11;
        Thu, 26 May 2022 21:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uBIy+XD7lWXKd3obbEbmlxcAEGIWUdMJxl6QYdZxAyE=;
        b=pk3C44RBR/+/qs7EGLyeVNQQLJIwxCCiDl3e4OTh56P24zwAnRgg2V1M0sWOZ42lxW
         P+yys8wAHwy2lu+7Pstghia9gwIh4EeeKYpM04LQe0Ab2j7CSP/Kxnc56w2i3qjTafl5
         UDvtgdpFoup9bpp6/6ViK/252nsuaC51f5GHecrRQIwqH0Q1KCt+r3GM5dgTjxJ8Diq8
         +XOMXbXa/MAySPFJzquySETyGFsJ0+6c4l6hpCzsCj2oHZjHYaET2eaIYvzI4wNTmOkX
         YXmHSSvivBjWNEhjXUIqBTJ+vYZA9iw1+tm0NBegnP9hv+mxmIyaExzcfFxPz1TDgZoR
         lGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uBIy+XD7lWXKd3obbEbmlxcAEGIWUdMJxl6QYdZxAyE=;
        b=8EH6PDTs2yjMhDABg0d5tTKxbMJsQqJ5fIcKnThnosp41yvtAOOF37McA8XqMmdoGy
         ct5M9xgVEF8XfCHTdJ7hn9qzC7Ciyyi2emFMeJzvqecLYyKP5FEJj6tCVVK8UbtOZRrr
         UJCfaAwEYlAxMDjj7hsa6/3JkVASpRoAkNf7V8QDbOTbaehm61G30W4MdqQ5yX2MJkR6
         KSvdSSmYArCKIVXfy3P2gYxYkUAei+ZxMIjnJmmMulRC1s6PnIwjIU08vO0/9DdpDojl
         oFMHaJxywUPnlq0wnNOV6yHy0Fy0hkHYRF3qUfZqhN6eAHvHP6fm7gUZmoi/vxysrc9k
         +uzg==
X-Gm-Message-State: AOAM532F4tn9HQmbH8LvN1CjEbEuXuCRawdElG5//0WH5PcLdi8BE1VJ
	ju3PARrrYIYP/HQlr0YBphTQELmG9WvGwz6UUAY=
X-Google-Smtp-Source: ABdhPJyx2hblX79GnRu3uWDAS8OT6x9VZtsN7tCpz7ZgifunUNHTUiOThiZe/qFp7zXncFPHYRHyDbEZWPJ1xqSHEwo=
X-Received: by 2002:a65:6055:0:b0:3c6:adfd:5135 with SMTP id
 a21-20020a656055000000b003c6adfd5135mr35953340pgp.146.1653626136739; Thu, 26
 May 2022 21:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220526204152.831948-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204152.831948-1-krzysztof.kozlowski@linaro.org>
From: Orson Zhai <orsonzhai@gmail.com>
Date: Fri, 27 May 2022 12:35:25 +0800
Message-ID: <CA+H2tpGipB4faYDEdJZ82kjTak5ewW_cp=3LO+JkDa=hYiqZJw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sprd: adjust whitespace around '='
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Baolin Wang <baolin.wang7@gmail.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="00000000000078c2c205dff6d68a"

--00000000000078c2c205dff6d68a
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, May 27, 2022 at 4:42 AM Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
>
Thanks for your patch.

We have a plan to reconstruct the device tree of SPRD into modular form.
sc9836 has been in status of EOL for years and I believe no one will need
to run it anymore.
We want to remove it as well.

But your patch is fine.
It could be taken in advance.

Reviewed-by: Orson Zhai <orsonzhai@gmail.com>

---
>
> Output compared with dtx_diff and fdtdump.
> ---
>  arch/arm64/boot/dts/sprd/sc9836.dtsi  | 10 +++++-----
>  arch/arm64/boot/dts/sprd/sc9863a.dtsi |  4 ++--
>  arch/arm64/boot/dts/sprd/whale2.dtsi  |  2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/sprd/sc9836.dtsi
> b/arch/arm64/boot/dts/sprd/sc9836.dtsi
> index 231436be0e3f..8bb8a70966d2 100644
> --- a/arch/arm64/boot/dts/sprd/sc9836.dtsi
> +++ b/arch/arm64/boot/dts/sprd/sc9836.dtsi
> @@ -207,11 +207,11 @@ gic: interrupt-controller@12001000 {
>         };
>
>         psci {
> -               compatible      = "arm,psci";
> -               method          = "smc";
> -               cpu_on          = <0xc4000003>;
> -               cpu_off         = <0x84000002>;
> -               cpu_suspend     = <0xc4000001>;
> +               compatible = "arm,psci";
> +               method = "smc";
> +               cpu_on = <0xc4000003>;
> +               cpu_off = <0x84000002>;
> +               cpu_suspend = <0xc4000001>;
>         };
>
>         timer {
> diff --git a/arch/arm64/boot/dts/sprd/sc9863a.dtsi
> b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
> index 8cf4a6575980..22d81ace740a 100644
> --- a/arch/arm64/boot/dts/sprd/sc9863a.dtsi
> +++ b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
> @@ -552,7 +552,7 @@ ap-ahb {
>                         ranges;
>
>                         sdio0: sdio@20300000 {
> -                               compatible  = "sprd,sdhci-r11";
> +                               compatible = "sprd,sdhci-r11";
>                                 reg = <0 0x20300000 0 0x1000>;
>                                 interrupts = <GIC_SPI 57
> IRQ_TYPE_LEVEL_HIGH>;
>
> @@ -568,7 +568,7 @@ sdio0: sdio@20300000 {
>                         };
>
>                         sdio3: sdio@20600000 {
> -                               compatible  = "sprd,sdhci-r11";
> +                               compatible = "sprd,sdhci-r11";
>                                 reg = <0 0x20600000 0 0x1000>;
>                                 interrupts = <GIC_SPI 60
> IRQ_TYPE_LEVEL_HIGH>;
>
> diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi
> b/arch/arm64/boot/dts/sprd/whale2.dtsi
> index 79b9591c37aa..957b2658e1fb 100644
> --- a/arch/arm64/boot/dts/sprd/whale2.dtsi
> +++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
> @@ -132,7 +132,7 @@ ap_dma: dma-controller@20100000 {
>                         };
>
>                         sdio3: sdio@50430000 {
> -                               compatible  = "sprd,sdhci-r11";
> +                               compatible = "sprd,sdhci-r11";
>                                 reg = <0 0x50430000 0 0x1000>;
>                                 interrupts = <GIC_SPI 41
> IRQ_TYPE_LEVEL_HIGH>;
>
> --
> 2.34.1
>
>

--00000000000078c2c205dff6d68a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Krzysztof,<br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 27, 2022 at 4:42 AM Krzy=
sztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowski@linaro.org">krzys=
ztof.kozlowski@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Fix whitespace coding style: use single space inst=
ead of tabs or<br>
multiple spaces around &#39;=3D&#39; sign in property assignment.=C2=A0 No =
functional<br>
changes (same DTB).<br>
<br>
Signed-off-by: Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowsk=
i@linaro.org" target=3D"_blank">krzysztof.kozlowski@linaro.org</a>&gt;<br>
<br></blockquote><div><br></div><div>Thanks for your patch.</div><div><br><=
/div><div>We have a plan to reconstruct the device tree of SPRD into modula=
r form.</div><div>sc9836 has been in status of EOL for years and I believe =
no one will need to run it anymore.</div><div>We want to remove it as well.=
=C2=A0  <br></div><div><br></div><div>But your patch is fine.</div><div>It =
could be taken in advance.<br></div><div>=C2=A0</div><div>Reviewed-by: Orso=
n Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com">orsonzhai@gmail.com</a>&g=
t;</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><s=
pan style=3D"font-family:monospace">
---<br></span>
<span style=3D"font-family:monospace"><br>
Output compared with dtx_diff and fdtdump.<br>
---<br>
=C2=A0arch/arm64/boot/dts/sprd/sc98</span><span style=3D"font-family:monosp=
ace">36.dtsi=C2=A0 | 10 +++++-----<br>
=C2=A0arch/arm64/boot/dts/sprd/sc98</span><span style=3D"font-family:monosp=
ace">63a.dtsi |=C2=A0 4 ++--<br>
=C2=A0arch/arm64/boot/dts/sprd/whal</span><span style=3D"font-family:monosp=
ace">e2.dtsi=C2=A0 |=C2=A0 2 +-<br>
=C2=A03 files changed, 8 insertions(+), 8 deletions(-)<br></span>
<span style=3D"font-family:monospace"><br>
diff --git a/arch/arm64/boot/dts/sprd/sc9</span><span style=3D"font-family:=
monospace">836.dtsi b/arch/arm64/boot/dts/sprd/sc9</span><span style=3D"fon=
t-family:monospace">836.dtsi<br>
index 231436be0e3f..8bb8a70966d2 100644<br>
--- a/arch/arm64/boot/dts/sprd/sc9</span><span style=3D"font-family:monospa=
ce">836.dtsi<br>
+++ b/arch/arm64/boot/dts/sprd/sc9</span><span style=3D"font-family:monospa=
ce">836.dtsi<br>
@@ -207,11 +207,11 @@ gic: interrupt-controller@12001000 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br></span>
<span style=3D"font-family:monospace"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 psci {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible=C2=A0 =
=C2=A0 =C2=A0 =3D &quot;arm,psci&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &quot;smc&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_on=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &lt;0xc4000003&gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_off=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &lt;0x84000002&gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_suspend=C2=A0 =
=C2=A0 =C2=A0=3D &lt;0xc4000001&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;arm,psci&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method =3D &quot;sm=
c&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_on =3D &lt;0xc4=
000003&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_off =3D &lt;0x8=
4000002&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_suspend =3D &lt=
;0xc4000001&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br></span>
<span style=3D"font-family:monospace"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer {<br>
diff --git a/arch/arm64/boot/dts/sprd/sc9</span><span style=3D"font-family:=
monospace">863a.dtsi b/arch/arm64/boot/dts/sprd/sc9</span><span style=3D"fo=
nt-family:monospace">863a.dtsi<br>
index 8cf4a6575980..22d81ace740a 100644<br>
--- a/arch/arm64/boot/dts/sprd/sc9</span><span style=3D"font-family:monospa=
ce">863a.dtsi<br>
+++ b/arch/arm64/boot/dts/sprd/sc9</span><span style=3D"font-family:monospa=
ce">863a.dtsi<br>
@@ -552,7 +552,7 @@ ap-ahb {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ranges;<br></span>
<span style=3D"font-family:monospace"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sdio0: sdio@20300000 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible=C2=A0 =3D &quot;sprd,sdhci=
-r11&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;sprd,sdhci-r11&q=
uot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0 0x20300000 0 0x1000&gt=
;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;GIC_SPI 57 IRQ_TY=
PE_LEVEL_HIGH&gt;;<br></span>
<span style=3D"font-family:monospace"><br>
@@ -568,7 +568,7 @@ sdio0: sdio@20300000 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 };<br></span>
<span style=3D"font-family:monospace"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sdio3: sdio@20600000 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible=C2=A0 =3D &quot;sprd,sdhci=
-r11&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;sprd,sdhci-r11&q=
uot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0 0x20600000 0 0x1000&gt=
;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;GIC_SPI 60 IRQ_TY=
PE_LEVEL_HIGH&gt;;<br></span>
<span style=3D"font-family:monospace"><br>
diff --git a/arch/arm64/boot/dts/sprd/wha</span><span style=3D"font-family:=
monospace">le2.dtsi b/arch/arm64/boot/dts/sprd/wha</span><span style=3D"fon=
t-family:monospace">le2.dtsi<br>
index 79b9591c37aa..957b2658e1fb 100644<br>
--- a/arch/arm64/boot/dts/sprd/wha</span><span style=3D"font-family:monospa=
ce">le2.dtsi<br>
+++ b/arch/arm64/boot/dts/sprd/wha</span><span style=3D"font-family:monospa=
ce">le2.dtsi<br>
@@ -132,7 +132,7 @@ ap_dma: dma-controller@20100000 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 };<br></span>
<span style=3D"font-family:monospace"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sdio3: sdio@50430000 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible=C2=A0 =3D &quot;sprd,sdhci=
-r11&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;sprd,sdhci-r11&q=
uot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0 0x50430000 0 0x1000&gt=
;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;GIC_SPI 41 IRQ_TY=
PE_LEVEL_HIGH&gt;;<br></span>
<span style=3D"font-family:monospace"><br>
-- <br>
2.34.1<br></span>
<span style=3D"font-family:monospace"><br></span>
</blockquote></div></div>

--00000000000078c2c205dff6d68a--
