Return-Path: <SRS0=mnBx=OB=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47F4C433F5
	for <soc@archiver.kernel.org>; Sat, 11 Sep 2021 12:20:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B89D0611B0; Sat, 11 Sep 2021 12:20:05 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BC7E60FDA;
	Sat, 11 Sep 2021 12:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BC7E60FDA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id o124so4023179vsc.6;
        Sat, 11 Sep 2021 05:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7H4xpqYSY81qruCKg0gMtRjcT5K5rttH7wg/f9oDRUM=;
        b=EjO+h+qRdpbAaxSWbNySY0QHC1aHKW7nV63e4IqtLrd636xgC/5uI+LtnX69vgv0wx
         XJUILMykuNMsKd+JQRY7VEYrGKnKytB+LHSkmoC2sgf9U3WQ3lpoxM6jqgabw01fOqSV
         aPyoRXE1I+uuZInytFq6ZMW9wC9m9XVqbOVi2Xe2Nf+EIT6TPJIwCW2MSM9G7KP3o23p
         lPicPE5P2YpprhhSTM3AJa3F61nDbAuXHIHT3ZbhdXIFbPSpkmL83BKOJPQ79uEvohMP
         W6lDSC3YZe+2fE4kOjj4MRn6V0TMXY2QbR/lONQmIP6HRASOqyvzufMxTMlyTeNOmnXQ
         LUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7H4xpqYSY81qruCKg0gMtRjcT5K5rttH7wg/f9oDRUM=;
        b=vbyPCiGGy3regYvodYCjgkKLLEvcK4kNy27ohDXSmA9t2cyiXF0J56gGWT6u5THa1v
         AosFe1OqGFfIeEK4PvZQjx+zcbcFkqdnq7OQHJvnCWl72ICwDDxdQQcApQ9i+s3zorL3
         dwEMMyeftlbxEO0D7MCqAIs92uS+5xtajjog15jBhomGXOFK6I2FkSftejgxzX88bD5n
         9ESVUwfoNQKqzbiUMd86SNTOZ1zeJn2ylqxcskYrRtKDAW6+9WBCkC573dikpCA0soYZ
         tATBHGCT1a6KmJi/zSnQSUy6cpOwo1Ckc+i4qlkvw8I1AIEXRZPFv3lZkoO3cFd9QzI3
         er3g==
X-Gm-Message-State: AOAM532Yga1cyAWuwtyTbj/PQfnpJh1bY3Eiz0HZ2ATGUWfgGJts04lp
	Vg+b+sQ9Yp30Urt7yH77JwpKaDymzCenZFn1s5c=
X-Google-Smtp-Source: ABdhPJwx8ta3pvKIUZJBToP9h/NasPw2m0chELd5Fz7tfkbqg/HunG1xeb+C+1VTrJrxG0KT4myBNizMQaCNb+rNFsI=
X-Received: by 2002:a67:ef85:: with SMTP id r5mr756445vsp.32.1631362804642;
 Sat, 11 Sep 2021 05:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-3-romain.perier@gmail.com> <CAFr9PXmRXcu_ifE62dT5AwZv2uFbYVfAc5ZX5qBoRkEPKGB+JA@mail.gmail.com>
In-Reply-To: <CAFr9PXmRXcu_ifE62dT5AwZv2uFbYVfAc5ZX5qBoRkEPKGB+JA@mail.gmail.com>
From: Romain Perier <romain.perier@gmail.com>
Date: Sat, 11 Sep 2021 14:19:53 +0200
Message-ID: <CABgxDoLBbD8P-PhRH+SmuuQ8jNR53Ti=8brFL3NXMmiotXU5ww@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: mstar: Add the Wireless Tag IDO-SBC2D06-V1B-22W
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Ack, I will fix it (remove "common" from the file name and the unneeded spa=
ce)

Thanks,
Romain

Le sam. 11 sept. 2021 =C3=A0 05:18, Daniel Palmer <daniel@0x0f.com> a =C3=
=A9crit :
>
> Hi Romain,
>
> On Sat, 11 Sept 2021 at 04:03, Romain Perier <romain.perier@gmail.com> wr=
ote:
> > +              - wirelesstag,ido-som2d01 # Wireless Tag IDO-SOM2D01
> > +              - wirelesstag,ido-sbc2d06-v1b-22w # Wireless Tag IDO-SBC=
2D06-1VB-22W
>
> For anyone wondering why we have two strings here:
> The SBC board is made up of a SoM and a board with the connectors.
> The SoM could be used standalone so we might as well have a compatible
> for it too.
> We have some dtsis for the SoM but really those could be built as is
> to support someone using the SoM on it's own.
>
> > +++ b/arch/arm/boot/dts/mstar-infinity2m-ssd201-som2d01-common.dtsi
>
> For anyone wondering:
>
> The som2d01 can come with an SSD201 (64MB DDR2 integrated) or SSD202D
> (128MB DDR3 integrated) and they need different fixed regulators for
> the DDR supply.
> So we have a common dtsi and then override the regulator in another
> layer of dtsi for the SSD202D version.
>
> Thinking about it now I think we can drop common from the file name.
>
> > @@ -0,0 +1,21 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> > +/*
> > + * Copyright (c) 2021 thingy.jp.
> > + * Author: Daniel Palmer <daniel@thingy.jp>
> > + * Author: Romain Perier <romain.perier@gmail.com>
> > + */
> > +
> > +/ {
> > +
>
> Unneeded space.
>
> > +       reg_vcc_dram: regulator-vcc-dram {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vcc_dram";
> > +               regulator-min-microvolt =3D <1800000>;
> > +               regulator-max-microvolt =3D <1800000>;
> > +               regulator-boot-on;
> > +       };
> > +};
> > +
> > +&pm_uart {
> > +       status =3D "okay";
> > +};
> > diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido=
-sbc2d06-v1b-22w.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesst=
ag-ido-sbc2d06-v1b-22w.dts
> > new file mode 100644
> > index 000000000000..20b40b711d4f
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d0=
6-v1b-22w.dts
> > @@ -0,0 +1,23 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> > +/*
> > + * Copyright (c) 2021 thingy.jp.
> > + * Author: Daniel Palmer <daniel@thingy.jp>
> > + * Author: Romain Perier <romain.perier@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +#include "mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +       model =3D "Wireless Tag IDO-SBC2D06-1VB-22W";
> > +       compatible =3D "wirelesstag,ido-sbc2d06-v1b-22w", "wirelesstag,=
ido-som2d01", "mstar,infinity2m";
> > +
> > +       leds {
> > +               compatible =3D "gpio-leds";
> > +               sys_led {
> > +                       gpios =3D <&gpio SSD20XD_GPIO_GPIO85 GPIO_ACTIV=
E_LOW>;
> > +                       linux,default-trigger =3D "heartbeat";
> > +               };
> > +       };
> > +};
> > diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido=
-som2d01.dtsi b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-=
som2d01.dtsi
> > new file mode 100644
> > index 000000000000..06567a5219c5
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d0=
1.dtsi
> > @@ -0,0 +1,28 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> > +/*
> > + * Copyright (c) 2021 thingy.jp.
> > + * Author: Daniel Palmer <daniel@thingy.jp>
> > + * Author: Romain Perier <romain.perier@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +#include "mstar-infinity2m-ssd202d.dtsi"
> > +#include "mstar-infinity2m-ssd201-som2d01-common.dtsi"
> > +
> > +/ {
> > +       model =3D "Wireless Tag IDO-SOM2D01 (SSD202D)";
> > +       compatible =3D "wirelesstag,ido-som2d01", "mstar,infinity2m";
> > +
> > +       aliases {
> > +               serial0 =3D &pm_uart;
> > +       };
> > +
> > +       chosen {
> > +               stdout-path =3D "serial0:115200n8";
> > +       };
> > +};
> > +
> > +&reg_vcc_dram {
> > +       regulator-min-microvolt =3D <1500000>;
> > +       regulator-max-microvolt =3D <1500000>;
> > +};
> > --
> > 2.33.0
> >
>
> Cheers,
>
> Daniel
