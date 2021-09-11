Return-Path: <SRS0=hxhK=OB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF190C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Sep 2021 03:20:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 674626103D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Sep 2021 03:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 674626103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXuYjdfEilC7hjGjcmOJwaGiicZwtn3rFwyVY4Tg98A=; b=wBUpexdYhXmo1S
	v+Gh4PVvOmnj8KJGilwXovwPG99jTo8vBxVrFuDzEvCATxdWtS+Cth8xwyqK7PqNU7MRPFCTcIOrG
	CI9aWXJEmV7Xnhbnh70op1Cf6XVbGnYccJmB6m8K2dD8V76mbDMeMCypEmtFGeNjXL8PfbSSaXNbC
	IKYnBbFGTnSdG/Mc0cWhwxwNuGgKAeaFd2aDk0fYoZC9eR9K3lewLN8ngLtjKnJUrXVc16zHaeKZU
	iAI7Sqc+F+SndUoNlsi1RkwTYjsY6r6ajW2d55TyuFok0SHgkc00qHM9fwkDMIPg+FpsoQYYc48VU
	0wNGIbikfmCHgTi/ufOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOtXU-00ECzc-30; Sat, 11 Sep 2021 03:18:48 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOtXQ-00ECzI-Mv
 for linux-arm-kernel@lists.infradead.org; Sat, 11 Sep 2021 03:18:46 +0000
Received: by mail-qk1-x730.google.com with SMTP id m21so4287552qkm.13
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 10 Sep 2021 20:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yglhQiqMuWRPXEcp/S7cp6xw4g2Boo9OI0xnp6CMYq0=;
 b=WIz8lZM8PLGizh5UoEnFP8TfCrOQRzhtjoMSFgBW6nZVGw1g7pIgTv2s7R4uf7BE7i
 1Vcn6md5a/DpD/uE0Z0jbqm3xF+uW+OJ5FNv465mG9zup5WjKMvfgXkPtpdqUb6ibXaD
 +ebjUbCnGE5zhrzDu0fCNtIWBpGDOoWEO3TC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yglhQiqMuWRPXEcp/S7cp6xw4g2Boo9OI0xnp6CMYq0=;
 b=FFZFJowdlh0xvlgKYLvyDZbA4pTzlqxGXAkuCUh9T4H1iCoELGVzVQ0X86Ceb5sJCA
 Zmo1NAcuxJ7l4E+GOEN9MHNW1z/oUIE4+fitAZfJbHkVxHm5koT+pFdNROF4jAOc5a75
 EYH2XiCnt6lQXPP1PVHEWHC2iw6EUHgyZtm6lBERNLxxsZHmwlA/Du4R9G/YfxUN0mXj
 DL3gzACt5VQNFuz7nJjAM2cuTXQB4Q2GVEJSfsbdbr6bfbTqM0AeCCrA4fkR+J+ttjhZ
 QdzdhQz9XmH26T4ct0xlRBxibMKQTmDwggBUoWh5Zw6+PK2KX1/VFHrGOu/dm20+SJgv
 wv7Q==
X-Gm-Message-State: AOAM531opuESoVyPeznxSsW1yziG3o5NLGCa0mkKqvsNNRysZiFHReot
 ZbPoZGqRnOIKCKW35P+Xwlf/jrXQg3A2T45nnZtwxw==
X-Google-Smtp-Source: ABdhPJxrshc0/e0qK2u4rQeCBzQr0P9W4mE/w2bCGPbHuyvvD1MoYhyx+d2tpScTXawu9idjHi4apmLNG0MU0Rawwm4=
X-Received: by 2002:a05:620a:228a:: with SMTP id
 o10mr545406qkh.342.1631330322890; 
 Fri, 10 Sep 2021 20:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-3-romain.perier@gmail.com>
In-Reply-To: <20210910190322.27058-3-romain.perier@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Sep 2021 12:18:32 +0900
Message-ID: <CAFr9PXmRXcu_ifE62dT5AwZv2uFbYVfAc5ZX5qBoRkEPKGB+JA@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: mstar: Add the Wireless Tag
 IDO-SBC2D06-V1B-22W
To: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_201844_799103_4C965E7C 
X-CRM114-Status: GOOD (  18.55  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210911031832.Cbmi2AFC5itpE51xSVUVcaU38zhQIv6qXNdVfFo7ioE@z>

Hi Romain,

On Sat, 11 Sept 2021 at 04:03, Romain Perier <romain.perier@gmail.com> wrote:
> +              - wirelesstag,ido-som2d01 # Wireless Tag IDO-SOM2D01
> +              - wirelesstag,ido-sbc2d06-v1b-22w # Wireless Tag IDO-SBC2D06-1VB-22W

For anyone wondering why we have two strings here:
The SBC board is made up of a SoM and a board with the connectors.
The SoM could be used standalone so we might as well have a compatible
for it too.
We have some dtsis for the SoM but really those could be built as is
to support someone using the SoM on it's own.

> +++ b/arch/arm/boot/dts/mstar-infinity2m-ssd201-som2d01-common.dtsi

For anyone wondering:

The som2d01 can come with an SSD201 (64MB DDR2 integrated) or SSD202D
(128MB DDR3 integrated) and they need different fixed regulators for
the DDR supply.
So we have a common dtsi and then override the regulator in another
layer of dtsi for the SSD202D version.

Thinking about it now I think we can drop common from the file name.

> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) 2021 thingy.jp.
> + * Author: Daniel Palmer <daniel@thingy.jp>
> + * Author: Romain Perier <romain.perier@gmail.com>
> + */
> +
> +/ {
> +

Unneeded space.

> +       reg_vcc_dram: regulator-vcc-dram {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc_dram";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-boot-on;
> +       };
> +};
> +
> +&pm_uart {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
> new file mode 100644
> index 000000000000..20b40b711d4f
> --- /dev/null
> +++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) 2021 thingy.jp.
> + * Author: Daniel Palmer <daniel@thingy.jp>
> + * Author: Romain Perier <romain.perier@gmail.com>
> + */
> +
> +/dts-v1/;
> +#include "mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +       model = "Wireless Tag IDO-SBC2D06-1VB-22W";
> +       compatible = "wirelesstag,ido-sbc2d06-v1b-22w", "wirelesstag,ido-som2d01", "mstar,infinity2m";
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               sys_led {
> +                       gpios = <&gpio SSD20XD_GPIO_GPIO85 GPIO_ACTIVE_LOW>;
> +                       linux,default-trigger = "heartbeat";
> +               };
> +       };
> +};
> diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi
> new file mode 100644
> index 000000000000..06567a5219c5
> --- /dev/null
> +++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) 2021 thingy.jp.
> + * Author: Daniel Palmer <daniel@thingy.jp>
> + * Author: Romain Perier <romain.perier@gmail.com>
> + */
> +
> +/dts-v1/;
> +#include "mstar-infinity2m-ssd202d.dtsi"
> +#include "mstar-infinity2m-ssd201-som2d01-common.dtsi"
> +
> +/ {
> +       model = "Wireless Tag IDO-SOM2D01 (SSD202D)";
> +       compatible = "wirelesstag,ido-som2d01", "mstar,infinity2m";
> +
> +       aliases {
> +               serial0 = &pm_uart;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +};
> +
> +&reg_vcc_dram {
> +       regulator-min-microvolt = <1500000>;
> +       regulator-max-microvolt = <1500000>;
> +};
> --
> 2.33.0
>

Cheers,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
