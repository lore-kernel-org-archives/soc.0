Return-Path: <SRS0=mEcO=WH=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEB1C433EF
	for <soc@archiver.kernel.org>; Tue, 31 May 2022 14:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03EC8C3411F; Tue, 31 May 2022 14:47:27 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03513C3411D
	for <soc@kernel.org>; Tue, 31 May 2022 14:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 03513C3411D
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-30c2f288f13so67424507b3.7
        for <soc@kernel.org>; Tue, 31 May 2022 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0/w36mR8lkluvb8r4zMg9iFSFRhtHLpPbTXMI17TU+0=;
        b=LSLyPRCEhXwgNFtzrXoohD9b0LordUSKogzPD70Sspkp+qbF4XrKc4emGZDOqFhtZq
         V9GMbd4oqskJ5yX/Onrv4xCdE2Hb19sjiQLd5lXz3isCADO36PQwBR+CqvHyIbovAct9
         2Goq8LE+bgXwOcTIUbdiMiZ2/O7Hi0EY7NhlWgT4KL5DdcHjD+VfD4cw9dbk7afIZAlR
         ajkQOPs+PJeB46bfEqAgEH6FVCR9dcpq36yDQx5eqH/udxd20DndGF/cTN1/b1XwmS1t
         23sMUF4kMLrWJYOsmDZGqCXs7TLhu2OnlFf3HEPhJMHSsLvyuN9AswgDHGEJUjJUV0Ay
         v9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0/w36mR8lkluvb8r4zMg9iFSFRhtHLpPbTXMI17TU+0=;
        b=oYJTXcd7K4nxNBlGZis2pD4s6L433k213aGEYUvxiRGjuNv7M/F9jfecO2p5ytkUSD
         KzObw7pN2U497rPGdfnDAmFzWXPI004rWYFqhydTGoPeNhssFm6TIdQ3H7zn4aHhESzy
         L2x1za54gkeeVgHu+a8wMRTw41YTuicSDQIlpnlViaKjUMPOhlgYNXZqA4dJoGCfvq95
         vZNOk958DnLi/2EkclBBepdZyehXKDDS2fyLLvhiLtgIMoWYUqbfpYTp+QlMgPP4Bxs6
         Xk/Imt89tUB5K1iVdpZqU324WVPopQNo+z2PpS2d1cjINoXHTiC7QGtYJWmEMmSJgjnp
         33Yg==
X-Gm-Message-State: AOAM533QT3owy50v4R3/97PNUQwRfp64hHRslESNKLvRNGobb3BYnTB8
	3L4bQdhqhPHcuHapNe7x4rLAintdxDY9CDatQVAXJw==
X-Google-Smtp-Source: ABdhPJxalwaZgY7TBxR+rRUyZGByUKq8vkvMzwrupGRbsbPzVyQkfLLhgbl3SHj69aTFZUjOQDLsewD3X2l5ox/iwNk=
X-Received: by 2002:a81:92cd:0:b0:30c:33ad:377e with SMTP id
 j196-20020a8192cd000000b0030c33ad377emr14554771ywg.286.1654008444987; Tue, 31
 May 2022 07:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220530130839.120710-1-pan@semihalf.com> <20220530130839.120710-3-pan@semihalf.com>
 <f789afb2-33c5-2b28-5ade-0c76ebb7206f@linaro.org> <CAHNYxRw00QraVW0085xO-qzgGJdZ2joukuSYzBQo+yjLnkD=Tw@mail.gmail.com>
 <e4ef2056-c990-b308-a9d5-98f11ac0ba51@linaro.org>
In-Reply-To: <e4ef2056-c990-b308-a9d5-98f11ac0ba51@linaro.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Tue, 31 May 2022 16:47:13 +0200
Message-ID: <CAF9_jYR=sjP9wYW9wyfbrVYO4PDYTfMhjvyyh53U3a3+2Zyw=g@mail.gmail.com>
Subject: Re: [PATCH 2/3] dts: socfpga: Add Google Chameleon v3 devicetree
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Alexandru M Stan <amstan@chromium.org>, SoC Team <soc@kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	krzysztof.kozlowski+dt@linaro.org, Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2022 at 11:11 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 31/05/2022 03:20, Alexandru M Stan wrote:
> > Hello Krzysztof
> >
> > On Mon, May 30, 2022 at 11:56 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 30/05/2022 15:08, Pawe=C5=82 Anikiel wrote:
> >>> Add devicetree for the Google Chameleon v3 board.
> >>>
> >>> Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
> >>> Signed-off-by: Alexandru M Stan <amstan@chromium.org>
> >>
> >> Your SoB chain looks odd. Who did what here?
> >
> > Sorry about this.
> >
> > It was mainly Pawel but I did some small changes at some point before
> > it landed in our tree (particularly the GPIOs).
>
> Then usually Pawe=C5=82 should be the owner of the patch, not you.
> Alternatively it could be also co-developed.
>
> >
> >>
> >>> ---
> >>>  arch/arm/boot/dts/Makefile                    |  1 +
> >>>  .../boot/dts/socfpga_arria10_chameleonv3.dts  | 90 +++++++++++++++++=
++
> >>>  2 files changed, 91 insertions(+)
> >>>  create mode 100644 arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
> >>>
> >>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >>> index 023c8b4ba45c..9417106d3289 100644
> >>> --- a/arch/arm/boot/dts/Makefile
> >>> +++ b/arch/arm/boot/dts/Makefile
> >>> @@ -1146,6 +1146,7 @@ dtb-$(CONFIG_ARCH_S5PV210) +=3D \
> >>>       s5pv210-torbreck.dtb
> >>>  dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) +=3D \
> >>>       socfpga_arria5_socdk.dtb \
> >>> +     socfpga_arria10_chameleonv3.dtb \
> >>>       socfpga_arria10_socdk_nand.dtb \
> >>>       socfpga_arria10_socdk_qspi.dtb \
> >>>       socfpga_arria10_socdk_sdmmc.dtb \
> >>> diff --git a/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts b/arch=
/arm/boot/dts/socfpga_arria10_chameleonv3.dts
> >>> new file mode 100644
> >>> index 000000000000..988cc445438e
> >>> --- /dev/null
> >>> +++ b/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
> >>> @@ -0,0 +1,90 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +/*
> >>> + * Copyright 2022 Google LLC
> >>> + */
> >>> +/dts-v1/;
> >>> +#include "socfpga_arria10_mercury_aa1.dtsi"
> >>> +
> >>> +/ {
> >>> +     model =3D "Google Chameleon V3";
> >>> +     compatible =3D "google,chameleon-v3",
> >>
> >> You miss here enclustra compatible.
> >
> > Does this make sense? I don't expect this device tree to boot/work on
> > an enclustra motherboard. It's only really compatible with a
> > "chameleon-v3".
>
> You also do not expect it to boot on altr,socfpga, do you?
>
> If I understood correctly, this board has physically Mercury AA1 SoM, so
> that compatible should be there.

Yes, you understood correctly.
I looked at a similar device - the Cyclone V MCV (SoM) and the MCVEVK
(base board):
arch/arm/boot/dts/socfpga_cyclone5_mcv.dtsi
arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dts
And there is no denx,mcv compatible anywhere, only denx,mcvevk.
Also, devicetree bindings documentation lists denx,mcvevk under
"Cyclone 5 boards", and, unless you consider the MCV to be a board,
there isn't a good place to put denx,mcv (same story with mercury+
aa1/chameleon).

>
> It's the same for every other SoM. Neither Google nor Enclustra are
> special...
>
> >
> >>
> >>> +                  "altr,socfpga-arria10", "altr,socfpga";
> >>> +
> >>> +     aliases {
> >>> +             serial0 =3D &uart0;
> >>> +             i2c0 =3D &i2c0;
> >>> +             i2c1 =3D &i2c1;
> >>> +     };
> >>> +};
> >>> +
> >>> +&gmac0 {
> >>> +     status =3D "okay";
> >>> +};
> >>> +
> >>> +&gpio0 {
> >>> +     status =3D "okay";
> >>> +};
> >>> +
> >>> +&gpio1 {
> >>> +     status =3D "okay";
> >>> +};
> >>> +
> >>> +&gpio2 {
> >>> +     status =3D "okay";
> >>> +};
> >>> +
> >>> +&i2c0 {
> >>> +     status =3D "okay";
> >>> +
> >>> +     ssm2603: ssm2603@1a {
> >>
> >> Generic node names.
> >
> > Dumb question: what does this mean?
> >
> > Are you saying the name is too generic? As someone reading the
> > schematics this would be immediately clear what chip it's talking
> > about.
>
> Let me clarify - please use generic node names, as asked by Devicetree
> specification (2.2.1. Node Name Requirements). There is also list of
> some examples in the spec, but you can use some other generic node name.
>
> Several bindings also require it.

Do you mean something like this?
ssm2603: audio-codec@1a {
u80: gpio@21 {

Regards,
Pawe=C5=82
