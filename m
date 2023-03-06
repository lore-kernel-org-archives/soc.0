Return-Path: <SRS0=5WGS=66=gmail.com=zhang.lyra@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CFFC61DA4
	for <soc@archiver.kernel.org>; Mon,  6 Mar 2023 07:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84331C433EF; Mon,  6 Mar 2023 07:08:09 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43923C433D2;
	Mon,  6 Mar 2023 07:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43923C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id f20so5754041uam.3;
        Sun, 05 Mar 2023 23:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678086487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nPMxN+7aE/eDgv+4Gb5i0j4P3VUwS4IPF/CTWOVkNGM=;
        b=fRqNtYdlEv5fZLps4+majz9AHPvYvaic55g6HWsHiSVAZEXMVAJDabsuU/LqlyVeP/
         hsEtEHVTr4KYsp2ukX7V8C9wftrW2ezKkjejJ5zYnIx6EUXhmzSak6cc9zbDLVuWGw+w
         aYMUl45VSDS2yK43KQQjQcFOfHZWmS/YRhegzgj57/aok9eNxJ5HPmsqLQo9HC2Lprfv
         hBmZ7qGyCA/ozA609V2Wfu/bpUH7KIB5VIJiSZLZFCCmwNaAaf+ZxUEWkiaMdfxDeVwo
         Gruje/oXyYq09WgSjdXJ7q4KzSNywnN4UvI+/Mei7XCB6X6aUzDRWwVYOoVzt+VC6pl6
         FXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678086487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPMxN+7aE/eDgv+4Gb5i0j4P3VUwS4IPF/CTWOVkNGM=;
        b=vsNUUzgSj9a1kgdgxnUSYreOjBul6p/nWrfio5AnzlI+wyaM8c3vaV1BkYqYB8hon5
         jMW4T+ASJWZz/7zYAaV87ZKCIvnPy/zPAqQ/4hqQDgZzkMXzkbHu8W6bBpLZ3N0Br6rt
         3GewpbFvZSCjqgekMoK/XGyo5KbwtA8s3wt1nVlPGlQSJVtYwpZEls36eVED88qVC32q
         XJi9wXZS/AOylAPCBvoEJBripOogQrqAMpk3MvHP4DwIsBDcIYGvX6Y05+gtcKPF3PAs
         3k6IRbz/Wvap33tfAxEswf4E6+fyT8uUM1OSP9rKBQzdW7/70uqsm/MOMffOcisstahG
         6d5w==
X-Gm-Message-State: AO0yUKWCrrC4IkYyN+neVYsDRUfGrTOxkLTq9bjdQbha2j8msMyLjDJs
	Vkc7CxjIXeq6iDmxR8XToKen52TIdAxP4GA5hAg=
X-Google-Smtp-Source: AK7set9TZcmB2GVYH/FuARKwCQ91BhrjHIj87pIyDTLjCNWkpaFUIFsb0UDJvdVN9GedqoFrpAIpEhchJ1R+9EV49oc=
X-Received: by 2002:a1f:38d6:0:b0:401:a4bf:210d with SMTP id
 f205-20020a1f38d6000000b00401a4bf210dmr6044664vka.1.1678086487119; Sun, 05
 Mar 2023 23:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20230306060446.414986-1-chunyan.zhang@unisoc.com> <fecb3d5c-86b7-f052-6cba-f92b45714665@linaro.org>
In-Reply-To: <fecb3d5c-86b7-f052-6cba-f92b45714665@linaro.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 6 Mar 2023 15:07:31 +0800
Message-ID: <CAAfSe-tE1kTZCUeC6bPQLrxDR1WEASatc8VXr1G5x_RhzGm6Yw@mail.gmail.com>
Subject: Re: [PATCH V3] arm64: dts: sprd: Add support for Unisoc's UMS512
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Chunyan Zhang <chunyan.zhang@unisoc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Mar 2023 at 14:43, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 06/03/2023 07:04, Chunyan Zhang wrote:
> > Add basic support for Unisoc's UMS512, with this patch,
> > the board ums512-1h10 can run into console.
> >
> > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > ---
> > Changes since V2:
> > * Removed redundant gpio.h from ums512-1h10.dts
> >
> > Changes since v1:
> > * Addressed comments:
> >   - Removed earlycon bootargs;
> >   - Moved up gic reg as second property;
> >   - Moved two sdio nodes under to the apb bus node;
> >   - Renamed node name of all fixed clocks;
> >   - Fixed warnings reported by dtbs_check.
>
> Please always mention  under --- why you do not send a binding for new
> board compatible.

Ok, I will address.

>
> > ---
> >  arch/arm64/boot/dts/sprd/Makefile        |   3 +-
> >  arch/arm64/boot/dts/sprd/ums512-1h10.dts |  61 ++
> >  arch/arm64/boot/dts/sprd/ums512.dtsi     | 911 +++++++++++++++++++++++
> >  3 files changed, 974 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/boot/dts/sprd/ums512-1h10.dts
> >  create mode 100644 arch/arm64/boot/dts/sprd/ums512.dtsi
> >
>
> (...)
>                 };
> > +
> > +             apb@70000000 {
> > +                     compatible = "simple-bus";
> > +                     #address-cells = <1>;
> > +                     #size-cells = <1>;
> > +                     ranges = <0 0x0 0x70000000 0x10000000>;
> > +
> > +                     uart0: serial@0 {
> > +                             compatible = "sprd,ums512-uart",
> > +                                          "sprd,sc9836-uart";
> > +                             reg = <0x0 0x100>;
> > +                             interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> > +                             clocks = <&ext_26m>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     uart1: serial@100000 {
> > +                             compatible = "sprd,ums512-uart",
> > +                                          "sprd,sc9836-uart";
> > +                             reg = <0x100000 0x100>;
> > +                             interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> > +                             clocks = <&ext_26m>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     sdio0: sdio@1100000 {
>
> Isn't the node name required to be "mmc"?

Yes, I agree.

>
> > +                             compatible = "sprd,sdhci-r11";
> > +                             reg = <0x1100000 0x1000>;
> > +                             interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > +                             clock-names = "sdio", "enable";
> > +                             clocks = <&ap_clk CLK_SDIO0_2X>,
> > +                                      <&apapb_gate CLK_SDIO0_EB>;
> > +                             assigned-clocks = <&ap_clk CLK_SDIO0_2X>;
> > +                             assigned-clock-parents = <&pll1 CLK_RPLL>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     sdio3: sdio@1400000 {
>
> Same problem.

Thanks for the review,
Chunyan
