Return-Path: <SRS0=Iqg5=FN=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83214E728D7
	for <soc@archiver.kernel.org>; Fri, 29 Sep 2023 19:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2CD41C433C9; Fri, 29 Sep 2023 19:14:01 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85197C433C8
	for <soc@kernel.org>; Fri, 29 Sep 2023 19:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 85197C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 0A44E320055E;
	Fri, 29 Sep 2023 15:13:57 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 29 Sep 2023 15:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1696014837; x=1696101237; bh=zZPTi9rC6WiqSpWMNCP3ybSRnhAovP9bviw
	/z6BgAXQ=; b=E3letZpQ4ekkxzGazFRiLpwm7o2URG6Y+BYutSovQzMJ/bccR8z
	ObvOPHn9wQ1auA/MB3qGtR2wUuh1mQ8tH7JRyDA4dG8u2zFhwEnAoZoFwooXEdx+
	gTC3BIaJ3lYorRF/GvnsHUcd7ixu4mQOGzg+x7/G0Y6d8gYw8ilS1wB7sVCJ5zRI
	9mCLk9cuQWxkZ2M9KH5KyMo0I0kclM6HJVXh9QHR2F16yHzTQQYrrv+D7+u54Rxd
	Tm3oTuD8rGRxQe020F/FcGZCGgCL4gmrJNz8kyrsXWehCYQdiRkPoo8TVZISyww8
	0l47/aJp1/V6ujE88y0UmgpwWM6BW6m24+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1696014837; x=1696101237; bh=zZPTi9rC6WiqSpWMNCP3ybSRnhAovP9bviw
	/z6BgAXQ=; b=kKbHxDsJ+iDXutFwP2fkVJlx2cxvoyFs19JgO6rvRgbcU69ZoV6
	vJT3+bri5+9HTt6FfCe3GcUdGtILRam7L7LevToNenRKYgB4psiGUgkugxpf4x+T
	J76vMoONub3XLMk4BRrkoJB5mYekP4qONNROCgNh4wKclItORCgQaJ4W8lqhA3Jk
	nmSmUWb4DPpO0GXftadGL8EiaBEX9WA4tMWYANSE07Ap/Acx5Xh5daS/8QIjVhLg
	X/f50ampDCTpwxrcICcUNgeSa/j67PJeoQ85VrRTUVio3nILk+wFoV4s8Id0F0A1
	Wr/EQxTvGuQML+ISjoJ63C/nGSdFxHVFoXA==
X-ME-Sender: <xms:9CEXZYht6wTLYYBw0DpelSK1A-M1l2nQE2C4ZHRMUvTsJx3vi6LwNw>
    <xme:9CEXZRDv-80uc1081A_CHfOgUXdkvgR1JZ8XcJtdZwjrDl44R-eYvSosfY7Y6yURM
    IiM9bDgIJKD4YoyCcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrtddvgddufeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:9CEXZQGCLUfKgyXIN1HVffKtuhZC900lVE35msSD_ynCaX0L863iyA>
    <xmx:9CEXZZSs_CxTTyRileYABBmzllPmgxoIAPknkCIDqGSTLf0InI5Giw>
    <xmx:9CEXZVw3VtcS0oO3s90bg0WdWdtEuPUsqB0obopGVXRpiJJ-w4q6MA>
    <xmx:9SEXZQ9Uli-nRCQFhrjQJwyGn-qm54H2iZu_9hb0oJzhUwPjTULaog>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C9730B60089; Fri, 29 Sep 2023 15:13:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <b0fdfb95-dcd9-4d63-9e72-5a985808de3f@app.fastmail.com>
In-Reply-To: <20230929060114.zbex7z4atuzojs45@pengutronix.de>
References: <20230928070652.2290946-1-u.kleine-koenig@pengutronix.de>
 <a5aadd2b-6c88-4a7e-a0e5-580dfe604c68@broadcom.com>
 <20230929060114.zbex7z4atuzojs45@pengutronix.de>
Date: Fri, 29 Sep 2023 15:13:35 -0400
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
Cc: "Pengutronix Kernel Team" <kernel@pengutronix.de>, soc@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Fix Florian Fainelli's email address
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023, at 02:01, Uwe Kleine-K=C3=B6nig wrote:
> On Thu, Sep 28, 2023 at 11:21:50PM +0200, Florian Fainelli wrote:
>> On 9/28/2023 9:06 AM, Uwe Kleine-K=C3=B6nig wrote:
>> > Commit 31345a0f5901 ("MAINTAINERS: Replace my email address") added=
 13
>> > instances of ...@broadcom.com and one of only ...@broadcom. I didn't
>> > double check if Broadcom really owns that TLD, but git send-email
>> > doesn't accept it, so add ".com" to that one bogous(?) instance.
>> >=20
>> > Fixes: 31345a0f5901 ("MAINTAINERS: Replace my email address")
>> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e>
>>=20
>> Embarrassing, thanks for fixing this Uwe!
>>=20
>> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
>
> Who picks this up? 31345a0f5901 went in via arm-soc. Arnd, will you?
>

Yes, I've already included it in the arm/fixes branch now, doing
some final testing on the branch before I send the PR.

       Arnd
