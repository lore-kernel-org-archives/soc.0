Return-Path: <SRS0=PKwS=Z2=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDC1ECAAD8
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 11:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB893C43470; Fri, 23 Sep 2022 11:58:37 +0000 (UTC)
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E299BC433C1;
	Fri, 23 Sep 2022 11:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E299BC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id D9CE15808D2;
	Fri, 23 Sep 2022 07:58:34 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 23 Sep 2022 07:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663934314; x=1663937914; bh=Tlu8S8osby
	f9YoTWPk0u1htE14pwtvwvQoWLFa+Uh8I=; b=QY8y+HSjG4MP+5PZMR4SBE3MGM
	/Rp65cikgKsDttI1nDEpfvj5Ifpq4gB6ak4Qn5CdB1UV939DXeW6skXXiG0peMuv
	Tk9CnvNyDNUFLjgLrvXcRinGSTPK5nciY+bzArriVugw6dbrGDGlp0ZNIi9jjOcV
	No+A45GVz8KPjV+x3/h3zGYkaM8y+CRkMbvKX/+MmIyA1Q5rGYS29rRYmvVsX/4T
	UzE0/OObkLxJ6buv2TncZpUu5V+JFM7Q6fQCG3O8n10TqRLPX9HJgca/AywBoyEv
	vSA1BSS+C9xxePd+yYZF7K+9ZNInyka3fQgNcj0xmLc+zu2c/y4XEuMOoO1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663934314; x=1663937914; bh=Tlu8S8osbyf9YoTWPk0u1htE14pw
	tvwvQoWLFa+Uh8I=; b=1OGJYLCFXe7yNDJutPT8TRLHsKwL2NxOFkVWeiLC+cHi
	j0s7Jqd79lCSjhu5H74TASs36WXm5Nim6Iz1Eg+X+k9dspA96X8q3Jl4Peb439tr
	4kCzEJ9EsYG5ssPuYcckOwC2dk4Z2miDBQkkdIo0RFojUvJTfGBtDcX2lR6Ygri9
	PKTFdOg16Wz8XiF8Rs69DTLRILRkHBFGZg6Kq8vJlEMJTsS3iRdhoYmDLjVvrbFl
	qP/ZOZAF+nW7BdJz8LZyJoz+Bg/kZeKsBNO/9EJiPM7xnHq4ooHUdTCfw6+rIdb2
	Vh49u9kW92Es65Tm7Pva6J5SJ+A97UdUP2EoxH5EzQ==
X-ME-Sender: <xms:aZ8tY25FBtB116btlgax1TTqnSSihrgLzIxoPu_KRaccFG4VMDN8Dg>
    <xme:aZ8tY_5_auKphqi0n09QkPUouuxv6NeVczh9LN65RxeyD3pJzAmYY7bCk-ylOmEjq
    WwuHGSc50ef189C4nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefiedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:aZ8tY1cL30_P6X6Nomj_Rbkbt0738EAvy-STxRagXOm7HT3w0CDGcA>
    <xmx:aZ8tYzJqP5FCObMulZHrn7lcIPLdnaETo-nwFG418gddecoilyJbVg>
    <xmx:aZ8tY6LnxE-cfIR5RcOTrDyuRcym94Ou8F5Vmn3rxLst5TswZa673A>
    <xmx:ap8tY21rVWQD-qIqAiIaE0L6PXsaZy4Wx0iEOk6DXSlIDRRYz4X5ig>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7B69BB60086; Fri, 23 Sep 2022 07:58:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <b80444c8-70fc-4aa2-9c71-e7e7e90a3696@www.fastmail.com>
In-Reply-To: <20220923113822.1445491-1-linus.walleij@linaro.org>
References: <20220923113822.1445491-1-linus.walleij@linaro.org>
Date: Fri, 23 Sep 2022 13:58:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Linus Walleij" <linus.walleij@linaro.org>, arm@kernel.org, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, "Christoph Hellwig" <hch@lst.de>,
 stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: integrator: Fix DMA ranges
Content-Type: text/plain

On Fri, Sep 23, 2022, at 1:38 PM, Linus Walleij wrote:
> A recent change affecting the behaviour of phys_to_dma() to
> actually require the device tree ranges to work unmasked a
> bug in the Integrator DMA ranges.
>
> The PL110 uses the CMA allocator to obtain coherent allocations
> from a dedicated 1MB video memory, leading to the following
> call chain:
>
> drm_gem_cma_create()
>   dma_alloc_attrs()
>     dma_alloc_from_dev_coherent()
>       __dma_alloc_from_coherent()
>         dma_get_device_base()
>           phys_to_dma()
>             translate_phys_to_dma()
>
> phys_to_dma() by way of translate_phys_to_dma() will nowadays not
> provide 1:1 mappings unless the ranges are properly defined in
> the device tree and reflected into the dev->dma_range_map.

I don't understand this yet, what did the kernel previously
do to that allowed the correct DMA mapping when a wrong
address was set in the DT?

> There is a bug in the device trees because the DMA ranges are
> incorrectly specified, and the patch uncovers this bug.
>
> Solution:
>
> - Fix the LB (logic bus) ranges to be 1-to-1 like they should
>   have always been.
> - Provide a 1:1 dma-ranges attribute to the PL110.
> - Mark the PL110 display controller as DMA coherent.

Are you sure the actually coherent? I'm not aware of any other
ARM9 based SoC with cache-coherent DMA. What is the DMA master
that accesses

> diff --git a/arch/arm/boot/dts/integratorap-im-pd1.dts 
> b/arch/arm/boot/dts/integratorap-im-pd1.dts
> index 31724753d3f3..ecccbd1777a3 100644
> --- a/arch/arm/boot/dts/integratorap-im-pd1.dts
> +++ b/arch/arm/boot/dts/integratorap-im-pd1.dts
> @@ -248,6 +248,8 @@ display@1000000 {
>  		/* 640x480 16bpp @ 25.175MHz is 36827428 bytes/s */
>  		max-memory-bandwidth = <40000000>;
>  		memory-region = <&impd1_ram>;
> +		dma-ranges;
> +		dma-coherent;
> 
>  		port@0 {
>  			#address-cells = <1>;

Which device is the actual DMA master here? The "dma-coherent"
property sets the pl110 as coherent, but the dma-ranges property
would refer to the port, right?

> diff --git a/arch/arm/boot/dts/integratorap.dts 
> b/arch/arm/boot/dts/integratorap.dts
> index c983435ed492..9148287fa0a9 100644
> --- a/arch/arm/boot/dts/integratorap.dts
> +++ b/arch/arm/boot/dts/integratorap.dts
> @@ -262,7 +262,7 @@ bus@c0000000 {
>  		lm0: bus@c0000000 {
>  			compatible = "simple-bus";
>  			ranges = <0x00000000 0xc0000000 0x10000000>;
> -			dma-ranges = <0x00000000 0x80000000 0x10000000>;
> +			dma-ranges = <0x00000000 0xc0000000 0x10000000>;

In your description, you say that you set a 1:1 map, but this is
not what you seem to be setting here. Instead you map DMA address
zero to point to the beginning of RAM.

     Arnd
