Return-Path: <SRS0=Ww9O=QL=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEB6FA3723
	for <soc@archiver.kernel.org>; Fri, 13 Sep 2024 07:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E00DC4CED1; Fri, 13 Sep 2024 07:35:57 +0000 (UTC)
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA53FC4CEC0;
	Fri, 13 Sep 2024 07:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA53FC4CEC0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id E93A913805FC;
	Fri, 13 Sep 2024 03:35:54 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Sep 2024 03:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726212954;
	 x=1726299354; bh=NGR5qqH9BPt1jFdj+yIMRlQVEYpFagFg+5zP2bRkTnQ=; b=
	mQXEeYxDf/GtHBQszb6qw4r5IV0XefG8dumxARrXOIekoQ0xJ1TYVpIaaR6h9WMH
	1+oP77fOJJrUMojiWTvxnWupW14Wx6EDR/W/1QzHQsDqTsLk+INT9xSoBKSJYn4h
	/ZMgTdfIBZZ4gq2goKoI226kdBO0sm+SIrX+jAdVjoBTf7x/h2kJ/m5UFdOwLKo2
	rn3iun8TP5APG/1FU0+7Mde6lYbSlPyA0mmFHTvWArjMx0yknUDjQZHUVzVPNBfY
	cWwBF6mihz0ZqVALfNACOyOU0olNNoVNIsjH9QHpkY27QvOwc2pD2EvpBKiR1MGm
	t9u3whrugopy8Bf1SeL0ZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726212954; x=
	1726299354; bh=NGR5qqH9BPt1jFdj+yIMRlQVEYpFagFg+5zP2bRkTnQ=; b=N
	PXTN6mGjaX0AkN834hN0TRaL3yuuFmcvUNjWUvLlSqfpVwU8kbQIAQUNR4M7lOXn
	bZ5lYdFKdkWc0Q99Vi/5g1EefWq9z9zAx38kvsdavfp9HlKxch3+ui2/bHUY0c8U
	jJFS2iqpFNBLQbAw0cSS1lOeknWAvzhJOfhpTDIZtmZQwDWAIX4cHlPkRrqazxx7
	aiPGCCbFlqBE2hgCB2jTUO4liCwtcFFy6HfDk0NvDXb7UcQdmweNX5tfbD2/LqHX
	r6Nef8AGrrZkoJ2fQhAAaYpy/BT5f8DETY6GdlBUp6NCsroP6TPY54/D1F50Qe74
	LjzhrmWSH1HNvdFmwL6Tw==
X-ME-Sender: <xms:WevjZiToxK0Zky-LW7IDM3yMRfKx6PwD_D9TX50dCbGeBlSf_kpoxQ>
    <xme:WevjZnxLjWZMywpFVerfpy9dASIQuRkje_cGAcA4DYcQmVuHP-AoOMh2UI_AXJYP2
    IfJ3g0hiFOix2IA7EQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejiedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehuthhsrghvrdgrghgrrhifrghlse
    grnhgrlhhoghdrtghomhdprhgtphhtthhopegrughsphdqlhhinhhugiesrghnrghlohhg
    rdgtohhmpdhrtghpthhtoheprghrthhurhhsrdgrrhhtrghmohhnohhvshesrghnrghloh
    hgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtgho
    mhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtg
    hpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegrnhguihdrshhhhiht
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehjihhrihhslhgrsgihsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:WuvjZv3jqrFxtR7IVXCO1LeS21ubrmL3J-uCjlo7Nhg6WMp4EEG3eA>
    <xmx:WuvjZuDMtwZ9awswkTprGlxtGT77KbS205zBdYr_GLawW8xzjsbIFQ>
    <xmx:WuvjZrg_F1nYychiEBFpSDKNksQo--brPC1En3JVWjOY9pDuvd_i8g>
    <xmx:WuvjZqoNrKCkFzUn6pa_j3A4HvtGyrdwdfJw2Krw-XVaFwlqU76PWA>
    <xmx:WuvjZnBX6AQqdISbT2oOrAdgXC7M5yU1TU5PvhCaNLNv9uT24r4_iXme>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D76B7222006F; Fri, 13 Sep 2024 03:35:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 13 Sep 2024 07:35:33 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: arturs.artamonovs@analog.com, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Greg Malysa" <greg.malysa@timesys.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Utsav Agarwal" <Utsav.Agarwal@analog.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Olof Johansson" <olof@lixom.net>,
 soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 adsp-linux@analog.com,
 "Nathan Barrett-Morrison" <nathan.morrison@timesys.com>
Message-Id: <c9bda67d-ec94-48d7-b71f-de2b57b239d4@app.fastmail.com>
In-Reply-To: <20240912-test-v1-6-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-6-458fa57c8ccf@analog.com>
Subject: Re: [PATCH 06/21] include: dt-binding: clock: add adi clock header file
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 18:24, Arturs Artamonovs via B4 Relay wrote:
> From: Arturs Artamonovs <arturs.artamonovs@analog.com>
>
> Add adi clock driver header file

Are you sure this is necessary? If the clk controller follows
a logical structure, it's usually easier to identify individual
clks by the way the hardware is laid out.

> +#ifndef DT_BINDINGS_CLOCK_ADI_SC5XX_CLOCK_H
> +#define DT_BINDINGS_CLOCK_ADI_SC5XX_CLOCK_H
> +
> +#define ADSP_SC598_CLK_DUMMY 0
> +#define ADSP_SC598_CLK_SYS_CLKIN0 1
> +#define ADSP_SC598_CLK_SYS_CLKIN1 2
> +#define ADSP_SC598_CLK_CGU0_PLL_IN 3
> +#define ADSP_SC598_CLK_CGU0_VCO_OUT 4

Unlike the DT compatible strings, these #defines don't have
to be specific to a particular SoC, you could just reuse them
for a family of chips even if they each use a slightly different
subset. Maybe name them "ADSP_CLK_*" or "ADSP_SC5XX_CLK_*"?

> +#define ADSP_SC598_CLK_END 80

This should not be part of the binding, in particular you
probably want to be able to extend this in order to support
additional chips.

      Arnd
