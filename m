Return-Path: <SRS0=Ww9O=QL=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D390FA3723
	for <soc@archiver.kernel.org>; Fri, 13 Sep 2024 07:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03E70C4AF0C; Fri, 13 Sep 2024 07:39:16 +0000 (UTC)
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 035D6C4CEC0;
	Fri, 13 Sep 2024 07:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 035D6C4CEC0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 113AB13805FD;
	Fri, 13 Sep 2024 03:39:14 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Sep 2024 03:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726213154;
	 x=1726299554; bh=4RxENSVw+QennMKyvBqiq7B8zuv7KrZS6yfqHV9YR9U=; b=
	A+0QKa3F2pM5dRKOawqql+cT7ZceMYNyLwbR0eDvRxpXMYTtnpBhHp0qnpORpbsN
	ZZrmYqbMHAax8SZV7XJABh4JSIl1t6hJICfvKP+xhjIuYHYwW/K9XEAIy4fBKyZf
	/nj+EZoKL+MAQk+gtx9aPHkcqYE6476vp4NH2EY6R7KZu5QtCAK7WpXZUlEAieZO
	0j2H/D9fpop//Bx80Rfm8X/jfY2KrhpGY6wW8HMHcmP0Pu/xjAXX69G9buVoMngu
	esoH2b/sBLP5PIkYHALp5Ina4LYOCRNSFCD+iJb4S/1v7utolwoYxudoXQvINCwX
	bzVHl5FA6ERa/9o8X/T+7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726213154; x=
	1726299554; bh=4RxENSVw+QennMKyvBqiq7B8zuv7KrZS6yfqHV9YR9U=; b=c
	5BSoSaDhmXTG7OlfFJgDKDzVpptqCJUOw4Ce4j8KDHEX4CfgLmG/ntkxgipb5zgB
	UAaNycUggiC8uu0FWT8vc12OmViPHGlfxHXpvhQOQnFmMV3tBr5TfOgySUj+k9+e
	yxg1o2Ouoatnc1VI5VFCvCbsUFtmTXUA8mKC5ghGqSWoxwXzzcQlRqyFqdZvoFe2
	qYrvalDDgXq5yne3X7XPefiGkPib4B/6/2iT/BEZSMLStoQFjzTI4lI1biAgtsEd
	Ka09afVhgmvSsrjWa33CpnCKvbTJl5upWx07OZr5iQClYe3ejR3osfcP/oaUA3Pd
	QFRUXsOxFDImgR3J3D4NA==
X-ME-Sender: <xms:IezjZkCY-f70XXtoh1HY7thk-2E9Mjo4cb5sSxBibhQ-DhdGD3fdbQ>
    <xme:IezjZmhvBfI3VksaG__iCI3SyprACwGI71D9JL2pLyPxbLJuiPcECqlVYqx3RX60N
    UQHAesG1UnxSeKK6AY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejiedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehuthhsrghvrdgrghgrrhifrghlse
    grnhgrlhhoghdrtghomhdprhgtphhtthhopegrughsphdqlhhinhhugiesrghnrghlohhg
    rdgtohhmpdhrtghpthhtoheprghrthhurhhsrdgrrhhtrghmohhnohhvshesrghnrghloh
    hgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtgho
    mhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtg
    hpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegrnhguihdrshhhhiht
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehjihhrihhslhgrsgihsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IezjZnk3qMnTs5XWgatW-u5DyZRYpFQdHF6YBY16xqm6b6mDp8i_7g>
    <xmx:IezjZqzA5VSunTV1liWFxn2qW3dSXNzo5wMlrWN0N-A9roY1JAD6dQ>
    <xmx:IezjZpRVwZNheubIFdTyqBmOYVB7HNr30FysEXnF2C-qaWLgHKue7w>
    <xmx:IezjZlYEi1kcvMrentfAR8G9imhoUl5ObSd0qBMnKOw42mTnxwplwg>
    <xmx:IuzjZhwUxK209n_amf5mB7GWxjlRzisayn2CeEK2oNmxgA7brD6HQ4-J>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9A1EB222006F; Fri, 13 Sep 2024 03:39:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 13 Sep 2024 07:38:51 +0000
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
Message-Id: <c01bf7be-415a-4653-a122-d24f2d764b2a@app.fastmail.com>
In-Reply-To: <20240912-test-v1-9-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-9-458fa57c8ccf@analog.com>
Subject: Re: [PATCH 09/21] gpio: add driver for ADI ADSP-SC5xx platform
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 18:24, Arturs Artamonovs via B4 Relay wrote:
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/adi/adsp-gpio-port.h>
> +#include "gpiolib.h"
> +
> +static int adsp_gpio_direction_input(struct gpio_chip *chip, unsigned 
> int offset)
> +{
> +	struct adsp_gpio_port *port = to_adsp_gpio_port(chip);
> +
> +	__adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_DIR_CLEAR);
> +	__adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_INEN_SET);
> +	return 0;

What is the purpose of these __adsp_gpio_writew() in a global header?
Can't those be moved into this file directly?

> \ No newline at end of file

Whitespace damage?

   Arnd
