Return-Path: <SRS0=Ww9O=QL=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82239EEEC39
	for <soc@archiver.kernel.org>; Fri, 13 Sep 2024 07:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5307FC4CED1; Fri, 13 Sep 2024 07:22:31 +0000 (UTC)
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89F0CC4CEC0;
	Fri, 13 Sep 2024 07:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 89F0CC4CEC0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 91FCB138025C;
	Fri, 13 Sep 2024 03:22:28 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Sep 2024 03:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726212148;
	 x=1726298548; bh=2oQEFoCPYi2QMn8U1xO87M2WoQhLkPtOwQ6Ztptql7Q=; b=
	H5Zwon+48gp+9ycLozX3Po/oWzAGByal1NW0PjUn7dwtSaelJ47YcLKjEgkXAxtv
	y+WLvTdVzA4JC/hn7OFoy26iMDJKNPDnT1N38XZjpXf5aHbP/p0Pha8KtojA9scc
	k6Mt+stHyTQegighu+vxFTq8aN+vGqK5xxZIEQrukKbSOe5k5QlNQrDnywEauuvM
	1shhGcFkauXa88DufvLFmbbQHaAH2j3nrunLH5d+ah6z0ZlCdeRZVB2t9m8FViPZ
	5GXwTLzCv1LMsfMd8PSXLayF/LD2TJo3VpU2ts2zLKMIMSjDqWEqnH4hd6vc/8Zr
	7R9aLhNnarDP61lkcHsU7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726212148; x=
	1726298548; bh=2oQEFoCPYi2QMn8U1xO87M2WoQhLkPtOwQ6Ztptql7Q=; b=K
	bk/Kh6a69Tx4wdnHdfhpjYPQGjz8LJNEQBlkAgE607gyKYh+maLUh9kR24Y7j/gS
	c8WYteuRU6Nd3XX/6A22HRJKlvEJ4AU/N3kVGWX4wmYZ5Fj7K69mZx4XpDNRejVh
	IcEHwQ94kivtlgV5++1TpKZeoJHp9ARtRMXpndrZV0Doo4QJ3zDGFqHgJbn+aU3b
	2cKrnhMovk4XKshjIuFgg0dSkyaCyGSN7FRRzYFxiPAKPU8G8qL6q4wlMUuk9qF8
	jRljW0KPcKd1DlAt7CBFfhh1uDSsHHjuFXaMJFsRKG5666qr4e7N8J73uN3+Cj9x
	STdgvT5VVaL08drpesUwQ==
X-ME-Sender: <xms:M-jjZjwcGKF3oD8QhWro4BuCDKETNJlwQblWPVsNK0TadIWU4CMbEw>
    <xme:M-jjZrQJ6Jfu22_qk7PfUtdM4dMbHliVhJlZc6jJRf9t2n5iaxkpscK4rXzE7QtU2
    cSDELSJ505hQfVeww4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejiedgfeelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:M-jjZtUx1CcaU5ttqpfhH-cw3bJ-0cydHgOkPJUla9O9k65EqDZ5Kg>
    <xmx:M-jjZtgBXoUGwddeLK9ny-NPLeQ9xOXA9oNJTqOp1NbxAUF8zALWlw>
    <xmx:M-jjZlCdEn7NcUyv51eObd7AD7sCQuNtdJQoIzVyR_AlJutfTJEQHw>
    <xmx:M-jjZmJ36U236uMjiigd2_wn-qRvMwBCnstt6HdEYW92wFAJmug1OA>
    <xmx:NOjjZij9dCyUJGL4ETJCpWZg2kzk_N7BRjAc0OEz_jAAS3-AZ3OnNjC9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D4D33222006F; Fri, 13 Sep 2024 03:22:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 13 Sep 2024 07:22:07 +0000
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
Message-Id: <193d68e0-e347-46b5-b6d2-107042b93ca1@app.fastmail.com>
In-Reply-To: <20240912-test-v1-2-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-2-458fa57c8ccf@analog.com>
Subject: Re: [PATCH 02/21] reset: Add driver for ADI ADSP-SC5xx reset controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 18:24, Arturs Artamonovs via B4 Relay wrote:
> From: Arturs Artamonovs <arturs.artamonovs@analog.com>
>
> Adding support for ADI ADSP reset controller. This driver allows
> trigger a software reset.
>
> Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
> Co-developed-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
> Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
> Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
> Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
> ---
>  drivers/reset/Makefile | 1 +
>  1 file changed, 1 insertion(+)

It looks like you accidentally dropped the actual driver during
a rebase, this is only the Makefile change.

       Arnd
