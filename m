Return-Path: <SRS0=BD2L=MW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4B3C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 14:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B2660F01
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 14:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1B2660F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5Usv/gjGHRO9WQR1x2+VfFuMURM9MmJeCEo4aDfufw=; b=V4x7IZ1vwwdDFf
	+bNU7ZdNl1td10FHdRm2TbJPs++jzVEcpOqek8kH2BqxQfLaH3ejLVzf0NqGxA+hULmC3FJilM6EY
	U/GXyJ14dkdtUyPE+hJCVoI/3avQnxXQwXFqyAdthpfhGwavfw3lJcpMGTCR1IBcY+NS7QHuUSiaz
	HEE52TKsOyzbyQFDq6sCGqH162XwbWVSyfgTB08UKwO1dAOxvLgDgqeKoWhGan4eydDqbdsDfkRgu
	8BYu2pSfl1n2G5apHQoXKzRbjrs1V6Rl0oL2VykydZmwov0FNH1SVKxyVDhG46U3qvqAVgmhlJ1ws
	dz0v2qFSmBxksH1a2Agg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9TYH-008yEq-Jn; Fri, 30 Jul 2021 14:31:53 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9TYD-008yDi-Js
 for linux-arm-kernel@lists.infradead.org; Fri, 30 Jul 2021 14:31:50 +0000
Received: by mail-lj1-x236.google.com with SMTP id h9so12638783ljq.8
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 30 Jul 2021 07:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g9e2gORjPncqut/lk+rir6sVzd/s93Oq97n1N2vAdLQ=;
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
 b=bqPMQjhoRnnygYm6tjpbjc7RNDodHjkYRFcnxzHXPgwmx3TfvQLNA2ftHkIr/3y3d2
 hORmkMo6l1xPPAhyCNDESSzTOPZTFk2dSrc3g2qAd+zPlBgk+SMb35Khz67+v7droVaG
 CftEeEsLaySDQfvu1L32pzwJACimDI0Jo07KAhhDhkVfuk07N75PNdZjPTsOCyPDeCQP
 CFy9A2i9hhQdqX3hTtY/QdQWlpaYf/JLqMim5EsAqiRTLxlI267lhhw2l7Qd2u3IuN6x
 ZgIOr+VAEXkkn1hXLlmGkSLbDpNvf56mkfjahn3qLVIoNMVglEeq27z8z4vs0tyBzrRY
 KM7g==
X-Gm-Message-State: AOAM533uAxkkvsljF+C3e03qi3Ei9j4vrh0AFNmt1w25L5DdGevVJRcU
 6eBHvKtX/OlI9qXpvIKWQTnbrU2SBYkri8crxXxSig==
X-Google-Smtp-Source: ABdhPJwUi6ruX2JvFdTxX3N//7AGHOcJenoElF/S1ILL5z+OMowHXbAfQoJ32ZPpcT2tJBoucpswDQEtQOdQPOsCKaU=
X-Received: by 2002:a2e:bc14:: with SMTP id b20mr1876294ljf.200.1627655507652; 
 Fri, 30 Jul 2021 07:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210730134552.853350-1-bert@biot.com>
 <20210730134552.853350-4-bert@biot.com>
In-Reply-To: <20210730134552.853350-4-bert@biot.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Jul 2021 16:31:36 +0200
Message-ID: <CACRpkdYvMtE8b-Xiy6=Aiz20jvY0M0Bz9XmcEQDHhqeS+LErEA@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
To: Bert Vermeulen <bert@biot.com>, Marc Zyngier <maz@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_073149_698852_C052EA6D 
X-CRM114-Status: GOOD (  13.58  )
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
Message-ID: <20210730143136.7BPuWHxgMf6TWugwjzXquXnLE1ulAjiYI9aguH0nA8w@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
