Return-Path: <SRS0=Ww9O=QL=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BBAFA372E
	for <soc@archiver.kernel.org>; Fri, 13 Sep 2024 08:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B263C4CED3; Fri, 13 Sep 2024 08:21:14 +0000 (UTC)
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 165C4C4CEC0;
	Fri, 13 Sep 2024 08:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 165C4C4CEC0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 3BEE11380105;
	Fri, 13 Sep 2024 04:21:12 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Sep 2024 04:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726215672;
	 x=1726302072; bh=/y3Vva3fvwuIn0WsxTO61vMjrXBBZReSc8alqn8Lbu0=; b=
	kbGjOGVLyhT5AcUPXyJX/gVgfzeBdBZ2k6n4152IS8zOQWEG8okL0/yZvqNsD7IH
	KeEdZQsdgQvMFXh8G5fPdXJVjYYpt/r9ZDRYic+Uctjb/U0k732HbRI7X8yvPLI+
	KA0QTRD3W+eLOGOjrHWXDKrp2SnbGrZ8yN1tWRSwhMm3sRG5ZS5/TuR1RvNXddjr
	6JF8Ygk9qzotzdtnhTSo9RfcrDqv/kr0Iw/yMnpPKg6qruwwTWDSoOMyhR6WRnEI
	kyK/JbR+DQseHUzuvppS7WMQWEZmE0yzjY9iNJG2Ff1RWEjsAdauGsVSWeIeu6uP
	0gSzrn0meL79F4MxiO7v3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726215672; x=
	1726302072; bh=/y3Vva3fvwuIn0WsxTO61vMjrXBBZReSc8alqn8Lbu0=; b=U
	Jw/ImulLkS2wu4z1qp6wWly45JBZEkJuLLDmbKcDG0nWZGIlUAgwrGJYiLe8Z60C
	3VtBC1QbG4ZeF55S0fhcihHjbOfCEpnwMQFYrHhST1V0CtvV9Bv08QZAB+Rkfyr3
	yPK7Klm8vuhWzr3A/8mI39horA5ad1kFHt8EuT6VbkdPDRvNLyFs7tE/XiQQSt1p
	8WpEQsWU3k8QqVwgi0o9FtdH4NhaM5spI8YSTjdi4xF4if8PouuYUDlkThAtt9zm
	JTgBI6YPGoQrUsV4CFopPzrP+AAF2x+Pt/ez6rA1g3P3kfuVoydiE49DmvDATo//
	k7fhco4CuXNTMGGy8zRdA==
X-ME-Sender: <xms:9_XjZkCgRF1iZ3oAoW_L2qCOTEgHS1CA0drG3I40ibgQypxTDxmL7g>
    <xme:9_XjZmjXJ-GnfS05ap6o1adziZXxATnbClI1jk6qFcD-M-RvsLSW5juxF5iIqoNba
    1CeXwr8KCium99e9vA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejjedgtdduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:9_XjZnl_vmTywlXfkHR0twrf-enV-y09jiqCQeMwODnswumrK-6X3A>
    <xmx:9_XjZqxoEsIEsVLIsYlhqQ-mt8H6rV36MJQcBo1C4ZM9e6QCI1rl1g>
    <xmx:9_XjZpTdtA4MGmDRMOmLLr4rmkQm_CSyR4BvlBkPZKavzFpOOgHeqQ>
    <xmx:9_XjZlbsa9-hb7lXV4CQ-NFPblDP5Kdg1qdOJl13hfzfuBdnoffAVw>
    <xmx:-PXjZhz8OH7XK6wXp5Q8Bo4xNSvBSow_1uq2TlBonecaO179HGuFosWU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 885EE222006F; Fri, 13 Sep 2024 04:21:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 13 Sep 2024 08:20:41 +0000
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
Message-Id: <2ad02a70-8926-45db-8ab5-503ec1e65552@app.fastmail.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
Subject: Re: [PATCH 00/21] Adding support of ADI ARMv8 ADSP-SC598 SoC.
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 18:24, Arturs Artamonovs via B4 Relay wrote:
> This set of patches based on ADI fork of Linux Kerenl that support 
> family of ADSP-SC5xx
> SoC's and used by customers for some time . Patch series contains 
> minimal set
> of changes to add ADSP-SC598 support to upstream kernel. This series 
> include
> UART,I2C,IRQCHIP,RCU drivers and device-tree to be able boot on 
> EV-SC598-SOM
> board into serial shell and able to reset the board. Current SOM board
> requires I2C expander to enable UART output.
>
> UART,I2C and PINCTRL drivers are based on old Blackfin drivers with
> ADSP-SC5xx related bug fixes and improvments.
>
> Signed-off-by: Arturs Artamonovs <arturs.artamonovs@analog.com>

Hi Arturs,

Thanks for your submission. I've done a first pass of a review
now, but the drivers will all need a more detailed review from
the subsystem maintainers as well.

For the drivers/soc and include/linux/soc portions, I need
to do second review round when you have added a description
about what these are used for, ideally I would hope that most
of those can disappear from the final series when the required
bits are moved into other drivers.

I commented on one of the bindings about the compatible
string, but later saw that the same issue is present in all
of the bindings, which each need a more specific identifier
for a particular piece of hardware they are compatible with.

        Arnd
