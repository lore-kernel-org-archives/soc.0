Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E152C56201
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Nov 2020 18:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3976122255
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Nov 2020 18:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C6mhW7KC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbgKSSk2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Nov 2020 13:40:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729640AbgKSSk2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Nov 2020 13:40:28 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32359C0613D4
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2020 10:40:28 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id y18so6223217ilp.13
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2020 10:40:28 -0800 (PST)
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
        b=BJuNdSLf4/OtdFAxSCabD+3jV+NKK5Pr2OUKhjytSwoOydBov0fYu4tLFtonrOq7SP
         XCtutlhtyPrHrfWC6pRGXy1flwa6yDzcjL/QMngmiSMPS00YJl+tlqD7bX2z0VP++jX7
         /FjzpA7hWdoUIuMYariuDfQHYsOhZhiA/pTSiGwRfx+/Zm/dvDtLMPjlhpXIs8ATeMhs
         RNLs4yqGnC3+YP9zO4mgzeAHjDJ/f+1ceKknAhn90d5i1/CK1aJ1Vj+H4elvhYMnvqQr
         QUj07KoCTq7qzjeNVTjkt6oIl1N12WaxpZdk4vAj2R2fssJFAjOY/7a6kjW8r3hoPzmC
         h+dw==
X-Gm-Message-State: AOAM5308M1+lIhC/XRakLIKnNDvXXB7b3xYe3na78McOeG4JLiNW9pXf
        vZnrNZx+3qefoHDzRNu8kP9UuDm3IHAOlX3iEubopQ==
X-Google-Smtp-Source: ABdhPJyxBFnoi5YnxmRXEWi3RyOT8zK9WD++uul35NAXdT0Y4CBYSq0+BgknePDAlzmhd8jRWTJRg0Pw5651ggprPVM=
X-Received: by 2002:a05:6e02:1348:: with SMTP id k8mr20739743ilr.154.1605811227390;
 Thu, 19 Nov 2020 10:40:27 -0800 (PST)
MIME-Version: 1.0
References: <20201119080002.100342-1-tmaimon77@gmail.com>
In-Reply-To: <20201119080002.100342-1-tmaimon77@gmail.com>
From:   Benjamin Fair <benjaminfair@google.com>
Date:   Thu, 19 Nov 2020 10:39:48 -0800
Message-ID: <CADKL2t45q907QGpq9rqjnGgMx=43Gz4RRGbyRLZUozYD0kt-DQ@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: add Nuvoton NPCM730 device tree
To:     Tomer Maimon <tmaimon77@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc:     Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
        olof@lixom.net, arm@kernel.org, soc@kernel.org,
        avifishman70@gmail.com, Rob Herring <robh+dt@kernel.org>,
        mark.rutland@arm.com, Nancy Yuen <yuenn@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20201119183948.HOug4UfIxiT2ep8KZ6G0GfHGk2qr7LqD_asqOyyTyCs@z>

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
