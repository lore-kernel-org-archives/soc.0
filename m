Return-Path: <SRS0=3nKo=MW=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DF7C4338F
	for <soc@archiver.kernel.org>; Fri, 30 Jul 2021 14:31:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6A62860FE7; Fri, 30 Jul 2021 14:31:49 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4690160F46
	for <soc@kernel.org>; Fri, 30 Jul 2021 14:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4690160F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id h11so12590468ljo.12
        for <soc@kernel.org>; Fri, 30 Jul 2021 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g9e2gORjPncqut/lk+rir6sVzd/s93Oq97n1N2vAdLQ=;
        b=XGWUnR+AMlm5KbE7ohB//psgoZYeUKtPBYVg8mLRqZnYZ/LTos3O9DeFjsU1SjGYEM
         1K7YRWmmPBWy5skTMvkp7mn9GriKGGrNZ/ATdpxXlPbwYONAmwx4psjv0tmN44DLHSsS
         I6uvHTBzZKrwzWMgxf4DHmJeV11FTLFjupXkR7jRiL/G19Wh+r64t1HJrR9VI1kM0xa3
         Adeb3/+ZZJI1eKbHh12FRkORlTei2CWkMx1Zj51QhyPjPQyHwuaVWBBg87IpuAOrhw50
         ECZk00KdeT/AQvz7Oq9xJBtIc8KnKQmKQ6RAGNFEAAul7sLXmjgzx4B9mu2a8+jblkOr
         MtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g9e2gORjPncqut/lk+rir6sVzd/s93Oq97n1N2vAdLQ=;
        b=kr0aZS0yLmUTvjSJydiQIfTh4UryShgXlB/fQAFPzxevn3F/A547NApAKQd6UjanPo
         OiLqVdwhAQNdzdtmK9zroUoXiBVmZHXtzn4kxmov06QEsrDaSiORCgQsCQRIxgWyv4BA
         okEdiljcdH8fJmYnDAh/Vef6bh1f6lu+eAzwy+Q56CHzUUMFzURGVjUmd0ku+MvviEMe
         j8bhdz19j+WltOKF/5j+CU4+kfpPClI/58ok7FQZalX6T+wZ1nlpGWbu7FAzPYJWu9SQ
         3Us1hWHyAggDmy9aCTZ3BhoNB3v8DoYA7u3DuzMYjMcgEpmK6qv6XS9Tjz/ZV+rX9az9
         gfPQ==
X-Gm-Message-State: AOAM530RlguG5EujyKLmw0q0RQLRI6SXpc3O8mggpR2Vw/km5XaoCMkH
	M5vly66SlnT/SsLLRRvEiYSXhyGdl4ZDGm+roKEN6w==
X-Google-Smtp-Source: ABdhPJwUi6ruX2JvFdTxX3N//7AGHOcJenoElF/S1ILL5z+OMowHXbAfQoJ32ZPpcT2tJBoucpswDQEtQOdQPOsCKaU=
X-Received: by 2002:a2e:bc14:: with SMTP id b20mr1876294ljf.200.1627655507652;
 Fri, 30 Jul 2021 07:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210730134552.853350-1-bert@biot.com> <20210730134552.853350-4-bert@biot.com>
In-Reply-To: <20210730134552.853350-4-bert@biot.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Jul 2021 16:31:36 +0200
Message-ID: <CACRpkdYvMtE8b-Xiy6=Aiz20jvY0M0Bz9XmcEQDHhqeS+LErEA@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
To: Bert Vermeulen <bert@biot.com>, Marc Zyngier <maz@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"

Paging Marc Z and Catalin just so they can see this:

On Fri, Jul 30, 2021 at 3:49 PM Bert Vermeulen <bert@biot.com> wrote:

> From: John Crispin <john@phrozen.org>
>
> Add basic support for EcoNet EN7523, enough for booting to console.
>
> The UART is basically 8250-compatible, except for the clock selection.
> A clock-frequency value is synthesized to get this to run at 115200 bps.
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Bert Vermeulen <bert@biot.com>
(...)
> +       gic: interrupt-controller@09000000 {
> +               compatible = "arm,gic-v3";
> +               interrupt-controller;
> +               #interrupt-cells = <3>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               reg = <0x09000000 0x20000>,
> +                         <0x09080000 0x80000>;
> +               interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +
> +               its: gic-its@09020000 {
> +                       compatible = "arm,gic-v3-its";
> +                       msi-controller;
> +                       #msi-cell = <1>;
> +                       reg = <0x090200000 0x20000>;
> +               };
> +       };

Yup GICv3 on ARM32-only silicon.

> +       timer {
> +               compatible = "arm,armv8-timer";
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +               clock-frequency = <25000000>;
> +       };

Also arm,armv8-timer on ARM32-only silicon.

This is kind of a first.

Yours,
Linus Walleij
