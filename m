Return-Path: <SRS0=kvJR=QD=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A77ECD5BCA
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 14:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48CDEC4CEC5; Thu,  5 Sep 2024 14:36:39 +0000 (UTC)
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5D09C4CEC7
	for <soc@kernel.org>; Thu,  5 Sep 2024 14:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5D09C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id C552113800F6;
	Thu,  5 Sep 2024 10:36:36 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Thu, 05 Sep 2024 10:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725546996;
	 x=1725633396; bh=uIbC69aguAWvRSfW+UCsvvSejwdoxgr+xUoySi1DV84=; b=
	TrY3foEDI7o6+2N5x+GTphSQpPUXdrdXKeGD5eB1Bj2zygPYECeEip3/hSlMBwdj
	gC5vTi5NLrhzT8o8wKN1pdsMOTSCRwQoNU4DoxwIf8Aw8rz/0+c4E6pbH6swcLww
	n69TWwIO+YjJt+9GGHqB+3x8nyxS2eyMpj8/PVq/Mj14hyuW0ywGZg/OjDMMpNJj
	HcwbWRWqqa5eWqnYIFBaG9sLe7r5DJhfjE1faWPXEH8NefZNtUE1gTMBK4z7viqS
	Rw2GSQzne8+jNQg1EBQsj/gPw+8Sxf2E2MXaq6SUhugenNKeQ4i1VfZcpdViQrPg
	Ya9wRFKIn//UfIMyv1ntLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725546996; x=
	1725633396; bh=uIbC69aguAWvRSfW+UCsvvSejwdoxgr+xUoySi1DV84=; b=e
	6njH3pqZ9S0hD0AFdXmaR+YHSdexQ1bRBUVR6cAsL/xwXrK+myDrg+8Nzc79FCns
	Z/OvUW7ScA0TBcDomZRi4GUipYPz3u/uvSEAn3Wh7BaBhYsgABXzOF+OhGxsQt2Q
	QHaA5UnRfbk0jG9EVDdcwSO7liKJZC3l4CKezC5z6cC0K20Lj57gIVfdg4c4cGFd
	jWXVssho39u/CkbmzkxHlTpd28X+yTCXCFS3fi52HeoON1rJTi4+Mw4E3OYULtdq
	fhFHvSjerSH/L9B7dvyQao3gsrw9/A2Pbs3qORZQOm1GTcQlEZTc8/Dt78KzGh/D
	ywveDOGO/62XOLR7gELew==
X-ME-Sender: <xms:9MHZZpaETmJpoiepAPmHQQIFLBYv8slUu6e8N8ZWu28ZYmKX0q7FhQ>
    <xme:9MHZZgZUy_yPXZQL_DvgzmKL_I5ci4EcI-iSP8g3OEmt5VuMWUxTRlOLa6NWrtRgw
    gMKHHxvgEa6XnnDf2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehledgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosggvrhhtrdhjrghriihmihhkse
    hfrhgvvgdrfhhrpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehhrghojhhirghnrdiihhhurghnghesghhmrghilhdrtg
    homhdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepuggrnhhivghlseiiohhnqhhuvgdrohhrgh
X-ME-Proxy: <xmx:9MHZZr-C-PAQCMNBK2czpj2-SmHV6PYP_4-xIlmcNaQyubj42ntkhA>
    <xmx:9MHZZnqxPk7iaVqzS8SMVq4saAd8AxTsGpJpr3AsKRTI50TdsnL74Q>
    <xmx:9MHZZkrx4Ejc2CbshK0_Wi9Nxy_J0YdG4y5vywaoLlQVwAF21WEiGg>
    <xmx:9MHZZtTUrT1ctS3jun852oFlSXSR3kY96Smk3o9chMTP65IpBKofKA>
    <xmx:9MHZZgeZWTatk783rZIGHyJetSmDCqIKUaDaQbHz3ppiizM6Cw-rRnhF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5F7812220072; Thu,  5 Sep 2024 10:36:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 05 Sep 2024 14:36:15 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Daniel Mack" <daniel@zonque.org>, "Robert Jarzmik" <robert.jarzmik@free.fr>,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Message-Id: <513f718b-b964-4af1-9c51-9e0ba3809225@app.fastmail.com>
In-Reply-To: 
 <CACRpkdZ_y=2WKCLwi5or-=MasvNw2bcxht6a+bFjV=yAfvQhdQ@mail.gmail.com>
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
 <CACRpkdYFc8vuz__7DkFSMFxUC=LSwCJmEun2KXgUvPMq+_e17A@mail.gmail.com>
 <ZsiygIj9SiP4O0OM@google.com>
 <CACRpkdZ_y=2WKCLwi5or-=MasvNw2bcxht6a+bFjV=yAfvQhdQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Remove support for platform data from matrix keypad driver
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024, at 08:52, Linus Walleij wrote:
> On Fri, Aug 23, 2024 at 6:02=E2=80=AFPM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>
>> I'm glad that we agree that we do not want the elaborate merge process
>> and instead push the changes through one tree in one shot we just need
>> to decide which one - soc or input. I am fine with using either.
>
> I'm also fine with either, but let's take the input tree because the
> you're in direct control of it so it will be easier.

Sorry I dropped the ball here, I just saw that these five patches
are still in the patchwork waiting for me to apply them.

I'm also happy for them to go through the input tree, and have
marked them as not-for-us in patchwork now. Dmitry, please add
my

Acked-by: Arnd Bergmann <arnd@arndb.de>

and pick them up in your tree. I've checked that there are no
conflicts against contents of the SoC tree. If you prefer me to
pick them up after all, that is also fine, but please resend in
that case.

      Arnd
