Return-Path: <SRS0=JgBq=WH=chromium.org=amstan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC94DC433F5
	for <soc@archiver.kernel.org>; Tue, 31 May 2022 01:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9F12EC385B8; Tue, 31 May 2022 01:21:23 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0E2BC3411C
	for <soc@kernel.org>; Tue, 31 May 2022 01:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0E2BC3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f54.google.com with SMTP id m10so619040uao.11
        for <soc@kernel.org>; Mon, 30 May 2022 18:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BWNRT5udm1cgBdQ1Fxg5zG/+3/maHcJ/jTCZwv9kK0Y=;
        b=YQYAAlLeMUHgntePBFcBgxcUsquOmjLnhtgUC/3Q3o/zgoZkgVeK36XpsBCi6pns+R
         kLef9uDuC+Io3XodrSVzibaBXvsOd5uSUfLuES2zkWFDV89HFpb3G0w+Zj0tTY1/E+IC
         3LuKDTbAuqiVOqwu7QJvcN0qtjWnECEHDZoQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BWNRT5udm1cgBdQ1Fxg5zG/+3/maHcJ/jTCZwv9kK0Y=;
        b=QDjYEcLmbdqWjJCXVAwxFC1cZ8qgrIZh54jxuQeHBG35UBZvkNCk3cwypKDeKd9aIm
         IbFK4xMlyXtFqh8f8yorkPhWlW8BNujZxZEqGJO/zD5V/EEytuR44X8RWiQNkSsUzPH3
         O8aPujx0Tc7N6PYDmmvDxXwT2dAlgzOBjgllQsh3hBqIjA7Vsn+yVHtNw9oyz3NMjwj4
         rQii2+w1wCToBpjBsMeRYc4muXqI5MbZAuKIjeF7LsU18WpTY4T30MkwVO8biX1QtKfp
         ULkuMCk2PwjknoARN6nokD0fC8C8whFNxOz1Vuqi4M8I3vVlEaTyKHDIM5IL4eFvdytn
         2kWw==
X-Gm-Message-State: AOAM531p11eyNLZn1SJp1il4fCCR3CAy+jtZ8F2B9iLxWZpgGBxOh5cT
	j1NcEZSbCBF8XsMzZ/kzD47xWTbIN75k0A==
X-Google-Smtp-Source: ABdhPJxDMt+f170o897JpGREZsADfW/Vq1SJzkOJypgOzWXF+TbYBK+p/tUkUpYcKlLYhyU7XicvGA==
X-Received: by 2002:ab0:1343:0:b0:362:9e6c:74f5 with SMTP id h3-20020ab01343000000b003629e6c74f5mr19709282uae.15.1653960081529;
        Mon, 30 May 2022 18:21:21 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id f22-20020ac5c9b6000000b003571658b813sm1575659vkm.10.2022.05.30.18.21.20
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 May 2022 18:21:20 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id b144so1843363vkb.13
        for <soc@kernel.org>; Mon, 30 May 2022 18:21:20 -0700 (PDT)
X-Received: by 2002:a05:6122:818:b0:357:26f8:5e73 with SMTP id
 24-20020a056122081800b0035726f85e73mr20773778vkj.5.1653960079694; Mon, 30 May
 2022 18:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220530130839.120710-1-pan@semihalf.com> <20220530130839.120710-3-pan@semihalf.com>
 <f789afb2-33c5-2b28-5ade-0c76ebb7206f@linaro.org>
In-Reply-To: <f789afb2-33c5-2b28-5ade-0c76ebb7206f@linaro.org>
From: Alexandru M Stan <amstan@chromium.org>
Date: Mon, 30 May 2022 18:20:43 -0700
X-Gmail-Original-Message-ID: <CAHNYxRw00QraVW0085xO-qzgGJdZ2joukuSYzBQo+yjLnkD=Tw@mail.gmail.com>
Message-ID: <CAHNYxRw00QraVW0085xO-qzgGJdZ2joukuSYzBQo+yjLnkD=Tw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dts: socfpga: Add Google Chameleon v3 devicetree
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>, soc@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, arnd@arndb.de, 
	Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	dinguyen@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Krzysztof

On Mon, May 30, 2022 at 11:56 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/05/2022 15:08, Pawe=C5=82 Anikiel wrote:
> > Add devicetree for the Google Chameleon v3 board.
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
> > Signed-off-by: Alexandru M Stan <amstan@chromium.org>
>
> Your SoB chain looks odd. Who did what here?

Sorry about this.

It was mainly Pawel but I did some small changes at some point before
it landed in our tree (particularly the GPIOs).

>
> > ---
> >  arch/arm/boot/dts/Makefile                    |  1 +
> >  .../boot/dts/socfpga_arria10_chameleonv3.dts  | 90 +++++++++++++++++++
> >  2 files changed, 91 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 023c8b4ba45c..9417106d3289 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1146,6 +1146,7 @@ dtb-$(CONFIG_ARCH_S5PV210) +=3D \
> >       s5pv210-torbreck.dtb
> >  dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) +=3D \
> >       socfpga_arria5_socdk.dtb \
> > +     socfpga_arria10_chameleonv3.dtb \
> >       socfpga_arria10_socdk_nand.dtb \
> >       socfpga_arria10_socdk_qspi.dtb \
> >       socfpga_arria10_socdk_sdmmc.dtb \
> > diff --git a/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts b/arch/a=
rm/boot/dts/socfpga_arria10_chameleonv3.dts
> > new file mode 100644
> > index 000000000000..988cc445438e
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
> > @@ -0,0 +1,90 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2022 Google LLC
> > + */
> > +/dts-v1/;
> > +#include "socfpga_arria10_mercury_aa1.dtsi"
> > +
> > +/ {
> > +     model =3D "Google Chameleon V3";
> > +     compatible =3D "google,chameleon-v3",
>
> You miss here enclustra compatible.

Does this make sense? I don't expect this device tree to boot/work on
an enclustra motherboard. It's only really compatible with a
"chameleon-v3".

>
> > +                  "altr,socfpga-arria10", "altr,socfpga";
> > +
> > +     aliases {
> > +             serial0 =3D &uart0;
> > +             i2c0 =3D &i2c0;
> > +             i2c1 =3D &i2c1;
> > +     };
> > +};
> > +
> > +&gmac0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&gpio0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&gpio1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&gpio2 {
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c0 {
> > +     status =3D "okay";
> > +
> > +     ssm2603: ssm2603@1a {
>
> Generic node names.

Dumb question: what does this mean?

Are you saying the name is too generic? As someone reading the
schematics this would be immediately clear what chip it's talking
about.

>
> > +             compatible =3D "adi,ssm2603";
> > +             reg =3D <0x1a>;
> > +     };
> > +};
> > +
> > +&i2c1 {
> > +     status =3D "okay";
> > +
> > +     u80: u80@21 {
> > +             compatible =3D "nxp,pca9535";
>
> Generic node names.

FWIW: Schematic is full of these pca9535 io expanders, only one (U80)
is visible to linux on an I2C bus.

>
>
>
> Best regards,
> Krzysztof

Thanks,
Alexandru Stan (amstan)
