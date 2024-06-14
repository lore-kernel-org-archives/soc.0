Return-Path: <SRS0=4FUO=NQ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F26FC27C77
	for <soc@archiver.kernel.org>; Fri, 14 Jun 2024 05:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA1FAC4AF49; Fri, 14 Jun 2024 05:58:34 +0000 (UTC)
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DAA4C2BD10;
	Fri, 14 Jun 2024 05:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8DAA4C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 010921C00137;
	Fri, 14 Jun 2024 01:58:31 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 14 Jun 2024 01:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718344711;
	 x=1718431111; bh=1qTKwB0xuC17qQ3ohEJr55cUyC8vl4CnlxLvxp8XPlk=; b=
	t+UsECk7Mi7Co0g5TVPKxXAISA0dMXJjbyZKvQ8YpdTEyzQ8DFb7n9Yt4Cm4uJEL
	Q3j/mLvABED4N3neZWKatZaBvL9/HEekLaDLoCb2Xdlull1h4EHQU8/TzIZQS1zf
	P699KsXwXZCB3AgBt9o6EGqN3DMER87206KXMd2aPXCWDQSOeTAcLHboDGYm03m/
	T3xH4cqRZQxJQsfLQgF3aNzQ+q0bYmJ6bGwgMRhk4t3rUsOAD01Pgp25PQsRN8Ew
	KVFJwt+dQ5txXg8vfiu6ysO1Qu5hy8wkoTcEKsezKkHehZI+elNrqYglIFVqfCmD
	V0K4+t+0vMhZ4IMzWTHDiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718344711; x=
	1718431111; bh=1qTKwB0xuC17qQ3ohEJr55cUyC8vl4CnlxLvxp8XPlk=; b=Y
	8yJXVCW2W0m6fhODnAh2EmsqpFph7XkEYguh4DHAUfjp+mkCKG7dd8JOFKoWkNkT
	pXeGRpJ1dmGW2CNv5FdKYe8ezg45GMP6Rwx8XVCBMnj3wlQsHPRz45srWV28SOv5
	VNqF8KiksaG0NIGhiukqWNQrGV94YawTIeYNvYYcmUE4niDUq1Zb6lr66mHx+62p
	ToKUYAe/k2gi2jf7N4VAXJX5sk+yUwkXbSUEi6vft1x/RMYv4o0nB8t4hvkepoPk
	CSXY+wjuCVXOjSLvr0TThHXSL2BP89HN8q6+J+XUU3gmRGaY9OXrjEQDucXv1yFY
	COEU478ZnOf4JGDN6nnhQ==
X-ME-Sender: <xms:B9xrZsE3UE3IyZ2INEDgbz-5RycTF_B3RHY_l1dDk1FYjX_EvntQdA>
    <xme:B9xrZlU_IQndCXZ9mPd1ffN_mNpVkOZBhEa0FPjTNL0EwVeYX8NFhMXrN1vadm3US
    f8Do1B09utnpEemOjI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedukedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:B9xrZmKtytGnBFHA23LtGbf5GkPWDWCCHwYZpM-JWgxXTueFHbAcWA>
    <xmx:B9xrZuFKTYJF0qHjHFJN6IPxz4_cx5hyzor1MYeiIoxndUdE_i5mVA>
    <xmx:B9xrZiXM3k0LgpZoa5sITG_b66mk7GwMQvJAyDURv9U2bCXj3AA2ag>
    <xmx:B9xrZhPGSByPNRl_gdzMfvqxoVM02CMVxgx9i7x0HSou_Qk_K6oZuQ>
    <xmx:B9xrZmqy52Ggk7cNxogoFv5CnpwO0YJgHSlAzQxlcw9KNYumK_bf2l9T>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 55945B6008D; Fri, 14 Jun 2024 01:58:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
MIME-Version: 1.0
Message-Id: <e9ccc218-6263-4f02-aea6-f2bff10597b7@app.fastmail.com>
In-Reply-To: 
 <CAHp75VdYqsrOwxCS+knjgFPHRWL_A8rvkW9TkZJPKq9g+oAbrg@mail.gmail.com>
References: <20240613161045.29606-1-kabel@kernel.org>
 <20240613161045.29606-9-kabel@kernel.org>
 <CAHp75VdYqsrOwxCS+knjgFPHRWL_A8rvkW9TkZJPKq9g+oAbrg@mail.gmail.com>
Date: Fri, 14 Jun 2024 07:58:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: "Gregory Clement" <gregory.clement@bootlin.com>,
 "Andrew Lunn" <andrew@lunn.ch>, soc@kernel.org, arm <arm@kernel.org>,
 "Andy Shevchenko" <andy@kernel.org>, "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v2 08/17] firmware: turris-mox-rwtm: Don't create own kobject type
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024, at 22:32, Andy Shevchenko wrote:
> On Thu, Jun 13, 2024 at 6:11=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel=
.org> wrote:
>
>
>> +static void rwtm_firmware_symlink_drop(void *)
>
> Interesting, can we actually name the parameter, like "unused"?

Agreed.

I was surprised that the compiler doesn't warn about it and
checked: apparently this is a c23 language feature, so
newer versions of gcc now treats it as a gnu extension for
--std=3Dgnu11 as well. gcc-10 and older versions however fail:

error: parameter name omitted

and clang-19 still warns=20

warning: omitting the parameter name in a function definition is a C2x e=
xtension [-Wc2x-extensions]

    Arnd
