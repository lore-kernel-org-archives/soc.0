Return-Path: <SRS0=p3VM=EZ=google.com=benjaminfair@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75987C56201
	for <soc@archiver.kernel.org>; Thu, 19 Nov 2020 18:40:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1B10D24655; Thu, 19 Nov 2020 18:40:29 +0000 (UTC)
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EFF322259
	for <soc@kernel.org>; Thu, 19 Nov 2020 18:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C6mhW7KC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EFF322259
Authentication-Results: mail.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=benjaminfair@google.com
Received: by mail-il1-f193.google.com with SMTP id y18so6223218ilp.13
        for <soc@kernel.org>; Thu, 19 Nov 2020 10:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PvBOcBzyg+eaLhpr35x3ip38QjdZlKmVc5mM+8taPHE=;
        b=C6mhW7KCNFK2+hF2yTFbwgR4Hb2BSiSkENk1iQgAHCifiyZwkapsVC6SULC6UZ5/5Q
         MuxYOBRSLZ2fOcfQyIMgYaJXGn+LgYjGrkIaQNPr6qyDRYr4ITWlcE0SLbBGZbhJXwwS
         hWzTlYMWnMHUTXTprJASQTlPO6Pf0h6kpIYdVbDvAqCepDAl3g2S5TVAIoPWPB6wQcLw
         QhD3yYh6J0USuXo7o3gIYzhPHFpc22mK0CNSwTGssQ405lzyGfS31oq5WZxKiTjJoc70
         02FuPV42opH7PSClyZSKhr+0bPC71r0TnddDkAKLNpk0xZvUhGR0PGCH13Q7WQBC6aJU
         AHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PvBOcBzyg+eaLhpr35x3ip38QjdZlKmVc5mM+8taPHE=;
        b=JIUDEhawoNGIML0NFC6LCXqdLrLzXIBEr8eX0a/cqk3AVqty+8DF8hctKu3j7JEed3
         sJ4Y9IPZIAenAdQ7MmgpD4HpIBIDVCxgaHUW40HKtTmUjQoDVXkiXSk1jy8F5jR/+Zlv
         on9dDwzMK65tkR4c6uld1+VqAb/M2bSw2BHuL+3wkCKVMdTa0AHkr//QGogUfwolE5fB
         FMmbAl4hYTH0NHviDBSnYEPVTehNaV35mmFB7DjDmSXDD+0wipnd+aFwEreJaG+Vm8XO
         Utw5rSlewU8MhcxLp9aLt6Ysp/WG8mQj7mzTmPLSJLF4VHY4mPmvKvHETugfMJeO3MFU
         VmWQ==
X-Gm-Message-State: AOAM530/8JO+s33xsk2n8TIahUlpDPB4NoCQSggjY0KGahacGuKjuiR/
	hi/KvzPxO1+rQa6Ig/x5YR1YcKqq0uDyEKFeyBcnCA==
X-Google-Smtp-Source: ABdhPJyxBFnoi5YnxmRXEWi3RyOT8zK9WD++uul35NAXdT0Y4CBYSq0+BgknePDAlzmhd8jRWTJRg0Pw5651ggprPVM=
X-Received: by 2002:a05:6e02:1348:: with SMTP id k8mr20739743ilr.154.1605811227390;
 Thu, 19 Nov 2020 10:40:27 -0800 (PST)
MIME-Version: 1.0
References: <20201119080002.100342-1-tmaimon77@gmail.com>
In-Reply-To: <20201119080002.100342-1-tmaimon77@gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 19 Nov 2020 10:39:48 -0800
Message-ID: <CADKL2t45q907QGpq9rqjnGgMx=43Gz4RRGbyRLZUozYD0kt-DQ@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: add Nuvoton NPCM730 device tree
To: Tomer Maimon <tmaimon77@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>, olof@lixom.net, arm@kernel.org, 
	soc@kernel.org, avifishman70@gmail.com, Rob Herring <robh+dt@kernel.org>, 
	mark.rutland@arm.com, Nancy Yuen <yuenn@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2020 at 00:00, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add Nuvoton NPCM730 SoC device tree.
>
> The Nuvoton NPCN730 SoC is a part of the
> Nuvoton NPCM7xx SoCs family.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Benjamin Fair <benjaminfair@google.com>

>
> ---
>  arch/arm/boot/dts/nuvoton-npcm730.dtsi | 44 ++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730.dtsi
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730.dtsi b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> new file mode 100644
> index 000000000000..86ec12ec2b50
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020 Nuvoton Technology
> +
> +#include "nuvoton-common-npcm7xx.dtsi"
> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       interrupt-parent = <&gic>;
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               enable-method = "nuvoton,npcm750-smp";
> +
> +               cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> +                       clock-names = "clk_cpu";
> +                       reg = <0>;
> +                       next-level-cache = <&l2>;
> +               };
> +
> +               cpu@1 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> +                       clock-names = "clk_cpu";
> +                       reg = <1>;
> +                       next-level-cache = <&l2>;
> +               };
> +       };
> +
> +       soc {
> +               timer@3fe600 {
> +                       compatible = "arm,cortex-a9-twd-timer";
> +                       reg = <0x3fe600 0x20>;
> +                       interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
> +                                                 IRQ_TYPE_LEVEL_HIGH)>;
> +                       clocks = <&clk NPCM7XX_CLK_AHB>;
> +               };
> +       };
> +};
> --
> 2.22.0
>
