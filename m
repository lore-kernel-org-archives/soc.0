Return-Path: <SRS0=4FUO=NQ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A66C27C6E
	for <soc@archiver.kernel.org>; Fri, 14 Jun 2024 05:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8A9EC32786; Fri, 14 Jun 2024 05:45:01 +0000 (UTC)
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A94CC2BD10;
	Fri, 14 Jun 2024 05:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3A94CC2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id BA1861C000CC;
	Fri, 14 Jun 2024 01:44:58 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 14 Jun 2024 01:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718343898;
	 x=1718430298; bh=i+6mjti30CLuPmApydp796n6ZqD+G6yGZjkAtddMQrY=; b=
	OsAtKFmIX1BG5fhU9lL/8c4nCHC6DIwPVBvxlN4xHQHY37Q9VmxJZL22U1kQlHy2
	6AYsi1nDrsoRU1iaxleb5yv6axZC4Q2brFxz9PAFyIRMAPcV10n3tRdSg8doW7EG
	vsGFowUnHbGiy7EDMPKVDmcy8LRwg9rYqjqWkudc30UqMD3fx9mdIA4YMWJz2KnX
	whLaShhHq8wAvYgTOTIqTcLTbBvgKptnA4WMetOItHfDhtra0vOiDRXdQVaoEzuu
	STHsSa44iHLZoMarfJ7eRIBKGSElrxSKUnNF/E6Jr6JWXG9hTRgB3rxEIbqOMD1Q
	8oolV5XuhElRG8dH0C2XCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718343898; x=
	1718430298; bh=i+6mjti30CLuPmApydp796n6ZqD+G6yGZjkAtddMQrY=; b=F
	0JbhllAjtkqgC4CPQnSmfY+QVvL80bQY445yDsPEbDI3m0rmJqJWuZ3Qgm2Tguck
	n7akgMCp7Km0fflLH92XPrQvBphel+qB7hC8kyOC6qt3tfoxlHTuPGoLhb9qjbrX
	qZlCjGX8amSueC+3hp3FXQwluqTXHmC++kJuVBRyJHI8ts7NDRajCT1hiG21acyl
	Ofw0oC+tryh7RVnx4gA2fhfcrVRk6bn+qb06nltbKDXXuqyfCa1B3aQWNOnK8ZnK
	bslGXXgbND4B6mjqwrwmyYuQDbuZnOHIthvuGKI0qTKgF1t8nJhcTep4P+Gva1v1
	d24rCqRtADYWKxVcI59VA==
X-ME-Sender: <xms:2dhrZrqWzbBAQriqZUdovu_xPaiTfkYkQRzazieQ7X0_VjXsBeyVMg>
    <xme:2dhrZlplYoRDWeAh2oZqG4uJEALPZB_yPWJgQoReCk5aQblQKld_PU31ZmO0_yfFl
    0xJwBXrAYO8Vjnrk-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedukedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:2dhrZoNbTDfdBvOYaCMuTw7gBJQawpIKckUt13-T3xkbbnuLu62qKg>
    <xmx:2dhrZu4UYmGSpbYiMO0X9hXDgQ5gM3ho02dNKqGdAu1xdzs30-P0RA>
    <xmx:2dhrZq6BPIEjkF3PG4xVs1hANfUSzwcvZ5FUaPwEwkU0t7azbOvT6g>
    <xmx:2dhrZmgnlFSdzl8Et22Utchgauldi1zvXaIlXVeKIuK8t-qPDQZgKA>
    <xmx:2thrZssqJXKwQL7KS_2aO07f5xMRHas_nP0x5KRj4nCp_jfRgT75devt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 82662B6008D; Fri, 14 Jun 2024 01:44:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
MIME-Version: 1.0
Message-Id: <8d243a21-6712-4359-9c4d-34c08afe3f8b@app.fastmail.com>
In-Reply-To: 
 <CAHp75VeRjddGOG72dkH7pvrebA2-BkzrEH2ZBk0s8Xtk-bD1ew@mail.gmail.com>
References: <20240613161045.29606-1-kabel@kernel.org>
 <20240613161045.29606-4-kabel@kernel.org>
 <CAHp75VeRjddGOG72dkH7pvrebA2-BkzrEH2ZBk0s8Xtk-bD1ew@mail.gmail.com>
Date: Fri, 14 Jun 2024 07:44:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: "Gregory Clement" <gregory.clement@bootlin.com>,
 "Andrew Lunn" <andrew@lunn.ch>, soc@kernel.org, arm <arm@kernel.org>,
 "Andy Shevchenko" <andy@kernel.org>, "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v2 03/17] firmware: turris-mox-rwtm: Use macro constant instead of
 hardcoded 4096
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024, at 19:51, Andy Shevchenko wrote:
> On Thu, Jun 13, 2024 at 6:10=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel=
.org> wrote:
>>
>> The 4096 bytes limit in mox_hwrng_read() is due to the DMA buffer bei=
ng
>> allocated to one PAGE_SIZE bytes. Use new local macro constant
>> RWTM_DMA_BUFFER_SIZE at allocation time and when used in mox_hwrng_re=
ad().
>
> ...
>
>> +#define RWTM_DMA_BUFFER_SIZE   PAGE_SIZE
>
> Is it guaranteed to work on any possible PAGE_SIZE settings? We have
> some architectures that may have it quite different to 4k. Even if
> this driver will never be run in such an environment, strictly
> speaking it might not be a good idea to replace 4096 with PAGE_SIZE.

This is a Cortex-A53, so it does support 64KB page size and the
driver should be written to work with that even if it's silly
to use that configuration in practice.

I did not check if using PAGE_SIZE or SZ_4K is the correct
choice for CONFIG_PAGE_SIZE_64KB kernel here.

      Arnd
