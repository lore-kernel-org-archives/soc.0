Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DFE5464E
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746824662; cv=none; b=XsI2OjpM23DSdApRUQD6GTYNdeB3qWlx5hoKBrr4UmTt5HCR93+bhfJbR8sdZWFAj1j8mmzMv6uhI41AVkKf18K959qAa69CZI/m7qGaCvgyf77uN0HTGSSzTf28JQt2U5kLx32CB+/oNBX9n82t5cbisjEpCTzPPrfRejd22I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746824662; c=relaxed/simple;
	bh=tkG8j5azIbiDaWcgJyjMm+A/nRbEckwyHOPwh7oG/r0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=K8OK4NBldg50G+f0HzChQ2yAatwlln3TCojkq3/Zxhiz8njg2iRMixuTAWr8wEKaO6pOn1+R6nuByxJBSuaYa0OOJtBu6LU4hUwBzmPkfi0srO6Pe5md+vdLAnj4dDV84CvskrCmKweq0pcAIts9xNbsaoqHDyhBxwG1sqFBsqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=sWha1hs6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=q0c9tA68; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="sWha1hs6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="q0c9tA68"
Received: by smtp.kernel.org (Postfix)
	id BA366C4CEEB; Fri,  9 May 2025 21:04:20 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11FFDC4CEE4;
	Fri,  9 May 2025 21:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 11FFDC4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DE44B11400A9;
	Fri,  9 May 2025 17:04:16 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Fri, 09 May 2025 17:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746824656;
	 x=1746911056; bh=A1ZumDxuGmpXUjlvvZI3hOnnT1685l9jUF3247k5dyA=; b=
	sWha1hs6PFJJi6uC/F6rQ/iAJeevO8Y4siw7Z7Lt0B9SDv9KlH4AbfQ1cMBX/g+m
	eyqkxkmGzStRub4lIdqfJUfoAI5AlfkGugr1avdqdtdwVAnoY5y7KNCMPKJ+G2Xi
	xjLUBqXCNpMtIlLZZbCmpzc6+7c2KN7l9wX3PYk36sTcXsw1anhoVYCTmQfBKBUb
	QK9Sc7VfbZMeR30PwdgptUqI0l9DfYizdUmaGm9ob2gIArWeQNl/sDrQZfIy0Wn8
	QiQaqqViRu67pbcM7YgYE5RJ5LdrDbSbJD/UlqpccocyCRODe3pv2qOkY+ndQY/8
	aDYg97/RxnOjFQIed9wEKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746824656; x=
	1746911056; bh=A1ZumDxuGmpXUjlvvZI3hOnnT1685l9jUF3247k5dyA=; b=q
	0c9tA685PpwzRYFdGuv3DSQ8cH1X5KpXAntPbnFItACP+T31hmnG3r/3hdjQohx6
	590uPW8hKirfHT262feIB2y5IBWtru1gj+b7XxVkOoUP79XOtRG/n5siovL7DQUj
	3AksghhXakhDgoWkQ6cODu1EL5ejXFql3XikwVTlYX6tEpxXn2xtm3dOxMYU3m7a
	mWUfUjKangduSJ2VJOruFsVH57PahCJjRbofWYYQfEQrkasW+S2953E45sd8PFNX
	7PS9q/2e3VM3VFrXGVOsixOj70arprWzI0/XRYcjNXYrq7yyvjHLXLSwTdHt9130
	9y5y+E3eWAudo3YSCpMwQ==
X-ME-Sender: <xms:0G0eaFAIEC69H_JVLhTXpNtNmmtFvJsdce2Dd8iTSo64ngbIFv9-Mg>
    <xme:0G0eaDiGAVadl-YyJr-MDND9SP3ByBCIJza8tN9LVdH3OXht-NpMsgfekZ-8ccC21
    2UnfZW4MIEHj89j8ms>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepiihihigrohesughishhrohhoth
    drohhrghdprhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehs
    ohgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhrohgtkhgthhhipheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehhvghikhhosehsnhhtvggthhdruggv
X-ME-Proxy: <xmx:0G0eaAnOPEDxNA0b1DUJk0rVAe_pkDNfMBL7-PtvqA4PexsC3MkM4g>
    <xmx:0G0eaPw7L_75BzAVUbqaWuGH8LvmeTDPT0hnonqyG8AEhv36TkBryg>
    <xmx:0G0eaKS2lLr5pnIMlkySGxa9CHdeZR2magNJs4xzEO9p2J4hRvo91A>
    <xmx:0G0eaCa4fyWDPWQGX0TPEYvi7nQq1Ns6zCJyfwTukHKOIbRH430gBA>
    <xmx:0G0eaOfgl2h4WI-uDqQLd4VFjdyAe9yjuHfKgWMRya_xSRCuc5MCz81R>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 275BE1C20068; Fri,  9 May 2025 17:04:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: T8d120477412db8f8
Date: Fri, 09 May 2025 23:03:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, arm <arm@kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, "Yao Zi" <ziyao@disroot.org>
Message-Id: <c142bdf4-3910-48bb-ba5e-8accbdb32a00@app.fastmail.com>
In-Reply-To: <2307187.iZASKD2KPV@diego>
References: <2307187.iZASKD2KPV@diego>
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.16 #1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, May 8, 2025, at 00:04, Heiko Stuebner wrote:
> Hi soc maintainers,
>
> please find below and in a subsequent pull-requests
> Rockchip changes for for 6.16 .
>
> Even some arm32 boards got some love (in the next PR)

One small issue stuck out here:


> Yao Zi (2):
>       arm64: dts: rockchip: Add I2C controllers for RK3528

This creates a lot of new aliases in the dtsi file:

index 826f9be0be19..2c9780069af9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -24,6 +24,14 @@ aliases {
                gpio2 = &gpio2;
                gpio3 = &gpio3;
                gpio4 = &gpio4;
+               i2c0 = &i2c0;
+               i2c1 = &i2c1;
+               i2c2 = &i2c2;
+               i2c3 = &i2c3;
+               i2c4 = &i2c4;
+               i2c5 = &i2c5;
+               i2c6 = &i2c6;
+               i2c7 = &i2c7;
                serial0 = &uart0;
                serial1 = &uart1;

but the corresponding nodes are left at disabled. I see
that the same mistake is present in the uart nodes.

Please send a fixup to remove these from the .dtsi file
here and the similar chips, unless you are sure that every
board will have them enabled (like e.g. the gpio nodes).

The aliases are not meant to refer to soc-internal names,
but the identifiers on board.

      Arnd
