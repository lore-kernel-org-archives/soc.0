Return-Path: <SRS0=FTzm=24=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F140CFA3742
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 11:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC019C433D6; Thu, 27 Oct 2022 11:28:51 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3951DC433D7;
	Thu, 27 Oct 2022 11:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3951DC433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 367935C01D7;
	Thu, 27 Oct 2022 07:28:49 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Thu, 27 Oct 2022 07:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1666870129; x=1666956529; bh=IsY1kEvEYG
	Njx7tvNwuoNGkxDZVrFMwwBASmVJ2tn3o=; b=CkpnFEmGBwaVOTbhDV0IRXv7N7
	xPFyaCGZDtG6ROD9CxdHqFKNgFkcYu2a4U3ZLQut2uYJQRwJ6ZGDhXJdWGAJrony
	nWAFG8zqZWsEBFG7F2GnCpjcNXC6JxaB9vjwZ+ABNGhfKU7gDUlwm2OqJb4dTpX1
	Rig/fPMt1MY2hrBRnH8LYxCDm7uavciuYTlWZiBfQwQ6dcsV+LVJP7/gJvbpwz72
	cMBrgRBPFXLnPtzBA7cmXRJTcwA9Ug5kC8B0gULeIa88FFEj7yVIA5Dk4IrOiGWp
	txnFA9yyIiKmQxh6402UdDtWOFMqm6gRBNyuyrMef22SIxdq4o9YRUAugv2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666870129; x=1666956529; bh=IsY1kEvEYGNjx7tvNwuoNGkxDZVr
	FMwwBASmVJ2tn3o=; b=Wle9Uf20LTzIbD/X59keL08he2hO5EH2lyhjIJ7Uxptl
	05mCGIfVLtxLyRd4rUXyGEbQGt/ErY/+X9g9RNLiZzv6WAVMz3O2o674/jRGLq/C
	R2vlXDlAgMuGq0QgzFrLgrt1kxFpS3xlVUDnFFcNcWokWme9I6WONc587XjdSSOq
	/9IbswHm4kYSc+2dvGfWEatVLYyNbucUv1e66YgfdDT6aJmcKenQiwPVyZYTqOvi
	1QqQ4i8w3R5ydx7ZPcZm8SBsUUt68oDKp2XPywLfMIwx2cEtAuuuwdeHY64xf4vr
	V+vL9CkEvXFdH8b1yt+8ZgVL2SgMiv+2EJub8t6XLA==
X-ME-Sender: <xms:cGtaY0mXm2AS9Vq6wIs4wu_BzD8QhbX8Q-I9DxgImZpFAbyS9RnAVQ>
    <xme:cGtaYz0cbflU-d8MaX1bMbh2vMhvWy4dcoCZ3bs9jCqFvv6U47LRByLF24VhUzXXm
    7Un-LXjQUj8u44HlKs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:cWtaYyoscCAEn-osru8r3Zp0fOEir1pV2GnPV4fQTM01-WGYYzsj_A>
    <xmx:cWtaYwn2C_-QMWRgUR3ZIe1Lx7h59TtjtB7zrhYbMxWvwB1WGeK4ZQ>
    <xmx:cWtaYy2cszHW6-Qs3q84P8ZwcHIlHic33WI6yTPu44xCub1oXzlFtg>
    <xmx:cWtaY8pgMVdL-wF8ODRyFboF69WxORo6UnIpkVXca8nhvsZIOZRopA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E5E92B60086; Thu, 27 Oct 2022 07:28:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
Message-Id: <dcbbde62-fcf1-4435-8f65-665b25ec3b0a@app.fastmail.com>
In-Reply-To: <8c11d7c4-dfc4-b84c-82cd-a9708bd79aab@socionext.com>
References: <20221027045157.23325-1-hayashi.kunihiko@socionext.com>
 <20221027045157.23325-5-hayashi.kunihiko@socionext.com>
 <b3c4f9ec-ba8e-4af1-b347-e07b06530d6c@app.fastmail.com>
 <8c11d7c4-dfc4-b84c-82cd-a9708bd79aab@socionext.com>
Date: Thu, 27 Oct 2022 13:28:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kunihiko Hayashi" <hayashi.kunihiko@socionext.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Olof Johansson" <olof@lixom.net>, "Masami Hiramatsu" <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: uniphier: Add NX1 SoC and boards support
Content-Type: text/plain

On Thu, Oct 27, 2022, at 13:19, Kunihiko Hayashi wrote:
> On 2022/10/27 19:01, Arnd Bergmann wrote:
>> On Thu, Oct 27, 2022, at 06:51, Kunihiko Hayashi wrote:

>>> +			#interrupt-cells = <1>;
>>> +			interrupt-names = "dma", "msi";
>>> +			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
>>> +			interrupt-map-mask = <0 0 0 7>;
>>> +			interrupt-map = <0 0 0 1 &pcie_intc 0>,	/* INTA */
>>> +					<0 0 0 2 &pcie_intc 1>,	/* INTB */
>>> +					<0 0 0 3 &pcie_intc 2>,	/* INTC */
>>> +					<0 0 0 4 &pcie_intc 3>;	/* INTD */
>>> +			phy-names = "pcie-phy";
>>> +			phys = <&pcie_phy>;
>>> +
>>> +			pcie_intc: legacy-interrupt-controller {
>>> +				interrupt-controller;
>>> +				#interrupt-cells = <1>;
>>> +				interrupt-parent = <&gic>;
>>> +				interrupts = <GIC_SPI 86
>> IRQ_TYPE_LEVEL_HIGH>;
>>> +			};
>>> +		};
>> 
>> Shouldn't there be an "msi-map" or "msi-parent" property pointing at
>> the GIC?
>
> Since Designware PCIe receives an interrupt from GIC with interrupt-name "msi"
> and passes the interrupt to the linear irq domain corresponding to MSI,
> I think there is neither "msi-map" nor "msi-parent" properties.

Usually, you have the choice to use either the built-in
MSI logic of the PCIe controller, or the one built into the
GIC itself, assuming you have a modern enough GIC implemetation.

Using the GIC is preferred here, because otherwise you lose
all the benefits that MSIs offer, regarding latency and CPU
affinity.

     Arnd
