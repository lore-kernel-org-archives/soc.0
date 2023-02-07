Return-Path: <SRS0=JTxQ=6D=gmail.com=zhang.lyra@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0529C61DA4
	for <soc@archiver.kernel.org>; Tue,  7 Feb 2023 02:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADCBDC433D2; Tue,  7 Feb 2023 02:20:26 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD015C433EF;
	Tue,  7 Feb 2023 02:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD015C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id v5so7135900vkc.10;
        Mon, 06 Feb 2023 18:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wf3HC2mlTdYNjd8GEebr8jn/i1yT97naYl2GNc8cIpw=;
        b=fDbMhgcTUax1lMtfUv5HFNSNsKlkRHVb+vbt8C59aMZUeizW7edZItdvc6QL4BgzWP
         FE/PhFiF4Ia1aiYiVzcFoNputMS3oRD3uLcWM/cmWPcuScjX37tWvdb1lcpQRf/SO3nt
         tUhIr1btt37D7Pi9Z8zQU8fdlb2Z2shjEqhW9hMIK8YzC7Gy6EFBtDEIJA7GhAyXc1JI
         S2DPCt2S34hatLhyxxsm03xNK6WCRjbrckvElXGvoOiNabOaY+RYNTgHZ0AdhKmrjuDJ
         IYEUwzdMGsPTZ/KuoQMqb226viydounwE6iTXI5JDjAMUTM8m8rrXLh+a5ZBz6S3/RrZ
         1FdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wf3HC2mlTdYNjd8GEebr8jn/i1yT97naYl2GNc8cIpw=;
        b=FtbebHEqW6fA/76rpvcZ4G5gZL+3tvmhA2CV/rTLeBMw+hZK8DueGBKNQiKkfBJC18
         OXi7HnyteCUUI2J5RQMBaEaJq+HH/LWlbQ4xiWPogCL69dDtxYiDVVBP2lxPcy7mVvVi
         YNWKYLQG4NiFskvyBWBdp8lT8oOe8qDwU3x+aHpxtjj94NepcFTJWBrBJ6lnki8FqoPb
         qqgx1HW3Qprfwv78y33pQJxt3VqMSBV1gJrF780h8My6g0+whfBFPBLK7DD3NKkgRXLa
         n96IUsNrJqo4pGpK9Q0Y3uXkFELdsPR6x/z3CJuNjiD2XJ9YM2Obs50X5bvvyhdD4YXz
         l2qQ==
X-Gm-Message-State: AO0yUKURsdU6aer4uRddZ72gYhza3Az9PV7mx3tceXWC44yymdlxKc7c
	PnBWmzEor/vhF3QL8EmH1/LJawswdQUW4Hf7/As=
X-Google-Smtp-Source: AK7set/PDj9CS876HmB5BRlrj9RiObdimv/HVqL18k7r0C6xw11U1nGIcvIBhlQ07DbVRP2L1dNn6xRhu1bG8SZne04=
X-Received: by 2002:a1f:9c08:0:b0:3ea:78fc:6dd8 with SMTP id
 f8-20020a1f9c08000000b003ea78fc6dd8mr147481vke.21.1675736424702; Mon, 06 Feb
 2023 18:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20230118084025.2898404-1-chunyan.zhang@unisoc.com> <41fd5c2a-9fc5-8af8-b66e-45bb83b24179@linaro.org>
In-Reply-To: <41fd5c2a-9fc5-8af8-b66e-45bb83b24179@linaro.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 7 Feb 2023 10:19:48 +0800
Message-ID: <CAAfSe-v3VW_sE4FwjURoOapMXrGavOK0hzeU-84-U_6xfhYbQQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Add support for Unisoc's UMS512
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Chunyan Zhang <chunyan.zhang@unisoc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Jan 2023 at 19:40, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 18/01/2023 09:40, Chunyan Zhang wrote:
> > Add basic support for Unisoc's UMS512, with this patch,
> > the board ums512-1h10 can run into console.
> >

[snip]

> > +             ap-apb {
>
> Non-unit-address nodes cannot be mixed with unit address ones. Something
> is wrong here.

To make sure I understand correctly, did you mean non-unit-address
nodes shouldn't be the parent of unit-address nodes?

Does that mean the bus node should have a unique base address like:
        ap-apb@70000000 {
        ...

Thanks,
Chunyan

>
> > +                     compatible = "simple-bus";
> > +                     #address-cells = <2>;
> > +                     #size-cells = <2>;
> > +                     ranges;
> > +
> > +                     sdio0: sdio@71100000 {
> > +                             compatible = "sprd,sdhci-r11";
> > +                             reg = <0 0x71100000 0 0x1000>;
> > +                             interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > +                             clock-names = "sdio", "enable";
> > +                             clocks = <&ap_clk CLK_SDIO0_2X>,
> > +                                      <&apapb_gate CLK_SDIO0_EB>;
> > +                             assigned-clocks = <&ap_clk CLK_SDIO0_2X>;
> > +                             assigned-clock-parents = <&pll1 CLK_RPLL>;
> > +                             status = "disabled";
> > +                     };
