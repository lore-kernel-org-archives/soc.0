Return-Path: <SRS0=Ww9O=QL=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C88FA3723
	for <soc@archiver.kernel.org>; Fri, 13 Sep 2024 07:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F3F0C4AF0C; Fri, 13 Sep 2024 07:44:33 +0000 (UTC)
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF278C4CEC0;
	Fri, 13 Sep 2024 07:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF278C4CEC0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id C62DA1380255;
	Fri, 13 Sep 2024 03:44:29 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Sep 2024 03:44:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726213469;
	 x=1726299869; bh=ASky3zL5oAIAgoydVci+Abhny5EjFe7NPYg23iemIz8=; b=
	jja0CkoHIwYg/WFYPr8JqvpOrpbMBjNKkG03+ZaTTeK+V6Zw2G05ORgewsdzdXza
	a62zQwPMCkkwYWNs3mxivs58DILf3138AWDsWyGni/RJ6zTn41+PU5A4ZjrdHOJA
	tIYhqAjxSHkuZouOplEBvfTMohyqcl0i0qFcg5ANry/9Ju7b6ckSU4T0DhnLHd7M
	amtnT8LVTW4qB1w29ahTpapkcFn1yFwpntLVPicCOSs3nL/wNmEeBQoDQqX0sIEu
	GYmNszbF3H3CzHCW5gbyl6U6qCQQP7T32x6ISZ0jCu2WmqejaFOxt45D5mCtECxC
	uqDQOshrZ5IXYOG8debgMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726213469; x=
	1726299869; bh=ASky3zL5oAIAgoydVci+Abhny5EjFe7NPYg23iemIz8=; b=t
	2TimrG1l6Jbf6mjZaxLtdIvy+FAnkwAWYJPYA7IduEzGgIKclFSBh2o0riXXWEQo
	Qpyj9Ko04bHno2ERBTZn9NMCV0F0xM4atYWWf4L0ZODJzamI9EA9ZkAIC+jwXJw3
	WuyBHjZrYL4n0L91yiUPQ3L+zdz7CbXayns5CdcRuiHTn702eWUe15KYvZ+OARNR
	t3flrzzbv1/LbWXjNZYjMtmAKnQWU92aWVcLuxxsQYNY/DIbQhyMFWeFJuws/GCy
	VZqatv1ov697TKmUv0tJBsRxhj0ByuHcmW0x3bSvLoy/8uPx5Y9pJk3/HB8n362E
	2U9VVtgbuJhD2ae30DgZw==
X-ME-Sender: <xms:Xe3jZm2-G4Eem-Sjx6NQrDVGy9hu9K_mMLpAblSydd1HhvYi6DadGA>
    <xme:Xe3jZpEeWEC5BW7Do3jTk4eCqT0yYMY6YwSbffNgRA7ftXlTmeFFOuCeBBdajm2iV
    BOJJb8pcYO-PO8Iy98>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejiedggeefucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:Xe3jZu6hB3Tc2ik6R4PD3w7pPZv7KtTe6D6QZHGYlY86boQ_Daz5zw>
    <xmx:Xe3jZn0yBzN0vM5i20JnHlqeE1cET1S76lTGOkDwn0wVerFT4E0K2g>
    <xmx:Xe3jZpGR7F4yN6pb_j9FskEIkM1F_sEpznEpBmD7cWeYHMeRjDI_QA>
    <xmx:Xe3jZg_dFGZa6gWqm8TidYslENoXR1BmbkSMax2J1_DMyuM2OnKRSA>
    <xmx:Xe3jZlW9bWHUqzZRZWmH1PcsQVGZojKRcePhKcvM5oELpG0h1V8ivvzR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 24D01222006F; Fri, 13 Sep 2024 03:44:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 13 Sep 2024 07:44:08 +0000
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
Message-Id: <117b76ac-97b2-4201-86b2-b48b063bac35@app.fastmail.com>
In-Reply-To: <20240912-test-v1-20-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-20-458fa57c8ccf@analog.com>
Subject: Re: [PATCH 20/21] arm64: defconfig: sc598 add minimal changes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 18:25, Arturs Artamonovs via B4 Relay wrote:
> From: Arturs Artamonovs <arturs.artamonovs@analog.com>
>
> Add ADSP-SC598 defconfig
>
> @@ -513,6 +515,7 @@ CONFIG_TCG_TIS_I2C_CR50=m
>  CONFIG_TCG_TIS_I2C_INFINEON=y
>  CONFIG_I2C_CHARDEV=y
>  CONFIG_I2C_MUX=y
> +CONFIG_I2C_ADI_TWI=y
>  CONFIG_I2C_MUX_PCA954x=y
>  CONFIG_I2C_BCM2835=m
>  CONFIG_I2C_CADENCE=m
> @@ -539,6 +542,7 @@ CONFIG_I2C_UNIPHIER_F=y
>  CONFIG_I2C_RCAR=y
>  CONFIG_I2C_CROS_EC_TUNNEL=y
>  CONFIG_SPI=y
> +CONFIG_SPI_ADI=y
>  CONFIG_SPI_ARMADA_3700=y
>  CONFIG_SPI_BCM2835=m
>  CONFIG_SPI_BCM2835AUX=m

These are usually not required for booting and should be
made loadable modules if possible.

      Arnd
