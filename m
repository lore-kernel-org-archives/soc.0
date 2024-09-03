Return-Path: <SRS0=OJnQ=QB=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E22CD3430
	for <soc@archiver.kernel.org>; Tue,  3 Sep 2024 13:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 805BFC4CEC8; Tue,  3 Sep 2024 13:21:49 +0000 (UTC)
Received: from pfhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0BFAC4CEC4;
	Tue,  3 Sep 2024 13:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0BFAC4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C406D1140227;
	Tue,  3 Sep 2024 09:21:46 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Tue, 03 Sep 2024 09:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725369706;
	 x=1725456106; bh=6uAg9vdYou7CPE1C/iTNIR5JX9ARrPpI3BYjJuX3CTQ=; b=
	CxfvmrV2scOeCBa+R/XV5lhFzS0KctzvlnqO6wT7o8GiayG4pFvhEcQXoSx/1B1x
	hurRrqKVjAm9CHao7LI9+UW0wnCDw4CNtYTcuMQcJqSQwOUnpVEi+11Dq/OSUMYs
	41P5ptEkmCt/fejpXkqdcob2rY30MFoW5PKWBv6jfJSNAqtPEa84QSFhBQnVHuce
	txuahYPLccvjaYvfmacmUHZ0t/8KWOYaivySqtSKVC19btH//N3RLc2XELqN3aiC
	o0xAltMWY/TE8a58Av/jrn6EjOzWLP8NnRLw1JnD52Avm1BdEj0sVnnG7W3Xq+69
	6IJkKMVsrFB90dtJrtvm1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725369706; x=
	1725456106; bh=6uAg9vdYou7CPE1C/iTNIR5JX9ARrPpI3BYjJuX3CTQ=; b=T
	yM2PDfFGKzG9MECFSzd1DLJPkSiYjmgmfBTs2bZA9HbYViKwp18xfB7ItpSOT//w
	sY2Fuc/oWsktrJ1ts6uygxU85jSdqXN26fQXBYQqfVA3DTslrDv2cbHGTDqMBYjA
	+eWVoXRqBdx+W7H/7TwEOz9magM+idGiUgJrhtioibxhFtzfne2M0RU3OPkwhQm4
	DT18iAbWQK+8qB56ZBTiFsUq0ZALCCERS+3wGrNFfetp4RnyU4EZSmZfcKmwZKKJ
	yUBpZITI+5XocqqRqdRS+HmEaHcNG1BdC2uvMHqCzjCPww02h+rMh48etOxCXzQf
	9Lo0lmCoI0yB1AaG+ec+A==
X-ME-Sender: <xms:ag3XZk9xlec1MNjqXNyjFRHYPel7qR2UtFv2s3OaMuU04NIhbVe83A>
    <xme:ag3XZstUOB2pXp64a3lYxFDD4RrUsJBU1ZAM2ydcC5VV3ctM5JQIqFVqKyOgISroq
    9KufEftpM3Pg7f0jnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehhedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnh
    htsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshgvsggrshhtihgrnhdrhhgvshhs
    vghlsggrrhhthhesghhmrghilhdrtghomhdprhgtphhtthhopegrnhguhieskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    khgrsggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhl
    phhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhope
    grnhgurhgvfieslhhunhhnrdgthh
X-ME-Proxy: <xmx:ag3XZqDUrjlzIYiIPzU7AiP7mZKKJRi_uPl4WpTiqRiwWGXwaPooFA>
    <xmx:ag3XZke026oHq9pL-JmBLdkkQJwchi69dvPcUikcJx6BAR6D4f-t2Q>
    <xmx:ag3XZpNQOyM8491IcMyp-OJ-W-t2W1W1rNwxm2aAD0SMjvUjsJfhmQ>
    <xmx:ag3XZun8D40sPTs8FEcOJY9VLsio50aO82ebjE1Mqg1I3bZ9mCdNQA>
    <xmx:ag3XZukbMymzv_WXBwnbzdEUoKzYnF1rIckiyrQSzae62kNFGKVKX29a>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4F4902220083; Tue,  3 Sep 2024 09:21:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 03 Sep 2024 15:21:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "Lee Jones" <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: "Pavel Machek" <pavel@ucw.cz>, linux-leds@vger.kernel.org, soc@kernel.org,
 "Gregory Clement" <gregory.clement@bootlin.com>, arm <arm@kernel.org>,
 "Andy Shevchenko" <andy@kernel.org>, "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>
Message-Id: <fce1d0ed-d7e3-401a-9132-0b5c1571398c@app.fastmail.com>
In-Reply-To: <20240903101930.16251-11-kabel@kernel.org>
References: <20240903101930.16251-1-kabel@kernel.org>
 <20240903101930.16251-11-kabel@kernel.org>
Subject: Re: [PATCH leds v2 10/11] leds: turris-omnia: Use 100 columns in the rest of
 the code
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024, at 12:19, Marek Beh=C3=BAn wrote:
> There are 7 more places in the code where the 100 column limit can be
> used to make the code more uniform. Do it.
>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

I feel like it's ok to use either 80-character or 100-character line
lengths in a file, but I don't see much value in changing from one to
another here, maybe just drop this patch.

       Arnd
