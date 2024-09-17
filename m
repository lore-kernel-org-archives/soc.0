Return-Path: <SRS0=m9IP=QP=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C7AC36004
	for <soc@archiver.kernel.org>; Tue, 17 Sep 2024 09:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36C3FC4CEC6; Tue, 17 Sep 2024 09:51:09 +0000 (UTC)
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3862FC4CEC5
	for <soc@kernel.org>; Tue, 17 Sep 2024 09:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3862FC4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 494701140373;
	Tue, 17 Sep 2024 05:51:06 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 17 Sep 2024 05:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726566666;
	 x=1726653066; bh=GbrrgIHjViktpwgvFI8woB13idERRrjUXMDsSxC4Jfw=; b=
	DBOBLb04O0+ddRopUb7Q+5FepHRsb62pOGYkpP+tDvKI1FpUiHn0PmZqGh5W3lYp
	Asrq7G8CRHM9zD0X9sojv9DFsHfhmBvxMqGzGPsAySLqOXek+VyH8PksdhUX+XbF
	wVzE1w3D6i90xuSlJF0VpYS5JSD3Y7gea3h2DUV8SFsIQihgIkIhA2FrzbCcTo10
	ORGO5Lh1PxYglBpnQ3U98TY+SQCPpV2UParV9ADIWiShPk3jDTjWuWE6a8F0Wdph
	JjHDxsOq7Vm9Y2/Ms2N36E5XUBRNa3KC3R2ef+IBO2qIPJ+SAhZ6ZCscUwhqnuS3
	uEvxW/GO5t07bYmdCQFmUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726566666; x=
	1726653066; bh=GbrrgIHjViktpwgvFI8woB13idERRrjUXMDsSxC4Jfw=; b=Q
	UEmuaJn7/8+n9uuYJ+ML/m5B+SZV78E2zQQhdtZ9TPapZA9k0ow66dtbU93nPw4z
	JrQL+kveB2bMnclYhrHwSXOFs4A8sYalJwSxepni4G1cBBeJ3sgd4wpniaF7risI
	51bzzHwTxbzNFad2BEAFy5y9ukuNVvmtbHD4AkgNw4vHnnG72fNYYcMkwhPwK+kO
	9tcHAQSm5Guo+0SQpq8EEGyzuanhYObQZKulA5GnL0Qgr2Ejrkv5UqhgDizehUQJ
	+rTx/diRfpuJJNcm2TkBMAF46OLgM7G7lDMLwcQ27u14SM3nJ+0nKDdf93YKQyUr
	3KxdnnMn6v01QCCNvJhTw==
X-ME-Sender: <xms:ClHpZvl0oeFPCOUyg27iVQ_Y3S9osLcTkR4GT4PYvD9WItjemAIepw>
    <xme:ClHpZi2gWCwih-SeFel9sKN4jeAarRR7LYMIKdOMGSolwiGYfQIkHcly3oCaAYdbG
    DOTHE5PghHcKxQzPu4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudekjedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ClHpZlr5gCjftyenFClL48w34eHGn6Yx4OhL_C1x-eGRr2nS74kIRQ>
    <xmx:ClHpZnlzzE4QB5V0Bdc9YVDEfHG7-6rEtJGyVTUDyvUZpq6c_oslEw>
    <xmx:ClHpZt2km9ombQs3V6lwB87zAJtgW1tM5quhDygwaApdn-5ncxKAvw>
    <xmx:ClHpZmtcBg0MfJH3YWvKqboipYKX_oA5kve-2tM7NAEfau2NhZi-Qw>
    <xmx:ClHpZmzEV1cPBpnsTN3k9RoauJzY7G-V96Wr_sCo0ByzM4FTGoEP3o0K>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DA95E2220071; Tue, 17 Sep 2024 05:51:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 17 Sep 2024 09:50:44 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <33013b66-9638-411f-b22e-1c23122534b7@app.fastmail.com>
In-Reply-To: 
 <CAHk-=wh3C2F3aO+Ky8CUQDM7+tUSxkCRRCVcLH+yuhaLoao=vg@mail.gmail.com>
References: <a40b4b3a-5d61-4bef-b367-745ba058be9e@app.fastmail.com>
 <212ba952-faee-42f8-959d-c2a8d3dc89a7@app.fastmail.com>
 <CAHk-=wh3C2F3aO+Ky8CUQDM7+tUSxkCRRCVcLH+yuhaLoao=vg@mail.gmail.com>
Subject: Re: [GIT PULL 1/4] soc: devicetree updates for 6.12
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 17, 2024, at 08:46, Linus Torvalds wrote:
> On Mon, 16 Sept 2024 at 18:32, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> soc: devicetree updates for 6.12
>
> Yes, the diffstat is large, but I'd still have liked to see it as part
> of the pull request...
>
> Your other pull requests do seem to have it, but this was missing it.

My mistake. I usually replace the DT diffstat with a dirstat
in order to make sure the mailing lists don't reject the
mail for size reasons, but forgot to add this back.

The below is what I had meant to include, but if you like, I can
change back to including the full diffstat in the future (700
lines, 44KB this time, usually a bit more).

     Arnd

   0.0% Documentation/devicetree/bindings/arm/aspeed/
   0.0% Documentation/devicetree/bindings/arm/stm32/
   0.0% Documentation/devicetree/bindings/arm/ti/
   0.4% Documentation/devicetree/bindings/arm/
   0.9% Documentation/devicetree/bindings/clock/
   0.1% Documentation/devicetree/bindings/interrupt-controller/
   0.8% Documentation/devicetree/bindings/pinctrl/
   0.0% Documentation/devicetree/bindings/power/
   0.0% Documentation/devicetree/bindings/reset/
   0.0% Documentation/devicetree/bindings/riscv/
   0.0% Documentation/devicetree/bindings/soc/bcm/
   0.0% Documentation/devicetree/bindings/soc/renesas/
   0.0% Documentation/devicetree/bindings/soc/ti/
   0.1% Documentation/devicetree/bindings/timer/
   0.0% Documentation/devicetree/bindings/
   0.0% arch/arm/boot/dts/amlogic/
   0.0% arch/arm/boot/dts/arm/
  14.0% arch/arm/boot/dts/aspeed/
   2.0% arch/arm/boot/dts/broadcom/
   0.0% arch/arm/boot/dts/intel/socfpga/
   0.0% arch/arm/boot/dts/marvell/
   0.4% arch/arm/boot/dts/microchip/
   0.0% arch/arm/boot/dts/nuvoton/
   3.2% arch/arm/boot/dts/nvidia/
   2.6% arch/arm/boot/dts/nxp/imx/
   0.0% arch/arm/boot/dts/nxp/lpc/
   0.1% arch/arm/boot/dts/nxp/mxs/
   1.6% arch/arm/boot/dts/qcom/
   0.8% arch/arm/boot/dts/rockchip/
   2.4% arch/arm/boot/dts/st/
   0.1% arch/arm/boot/dts/ti/omap/
   0.0% arch/arm/boot/dts/xilinx/
   0.2% arch/arm64/boot/dts/allwinner/
   2.6% arch/arm64/boot/dts/amlogic/
   0.0% arch/arm64/boot/dts/apm/
   0.0% arch/arm64/boot/dts/arm/
   0.7% arch/arm64/boot/dts/broadcom/
   0.0% arch/arm64/boot/dts/exynos/google/
   0.1% arch/arm64/boot/dts/exynos/
  12.1% arch/arm64/boot/dts/freescale/
   2.1% arch/arm64/boot/dts/mediatek/
   0.4% arch/arm64/boot/dts/nuvoton/
   1.9% arch/arm64/boot/dts/nvidia/
  12.1% arch/arm64/boot/dts/qcom/
   5.0% arch/arm64/boot/dts/renesas/
  25.0% arch/arm64/boot/dts/rockchip/
   0.1% arch/arm64/boot/dts/sprd/
   3.5% arch/arm64/boot/dts/ti/
   0.1% arch/arm64/boot/dts/toshiba/
   0.4% arch/riscv/boot/dts/sophgo/
   0.2% arch/riscv/boot/dts/thead/
   1.9% include/dt-bindings/clock/
   0.1% include/dt-bindings/interconnect/
   0.0% include/dt-bindings/mailbox/
