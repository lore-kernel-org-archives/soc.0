Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C97917C8B
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737046191; cv=none; b=QWfi78jF9IbTnkKOFGBoCGKhtYJ4W1dfjRiwa7lfOYa4107HWCbapAGYlOHqSdzS0E0ZycgCd93NWkfM1Pxg/2KoQK1pQqtgYsNxaVHqioro2QlFaPMLRuo8MHhejULLKeI98M8SqmrZ90JCQyOnU5p4t+xKnnz7oTBiBZ3unx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737046191; c=relaxed/simple;
	bh=KzW4MdLP2St8fieHAR05NWfpMiu0Y3/MOoThqzlEIBI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jpBz3QBmfeN+zmclneZOTcI2Ei0/F9h/3vhy584b93hbh7sqp+aw1LV/+vG4DwGpn7ksqL/76bXRYvEvZfUgOHD7ZrCMMnWJgDMhd0hjkmtOM6pq1BrOm7a4wJPAJnqFr4dy9l5iczXwvpU+QOEysryYPUSm9dE6gY09u7LymyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ZX5vdrzM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E85ecyC4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ZX5vdrzM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E85ecyC4"
Received: by smtp.kernel.org (Postfix)
	id 369DFC4CEE3; Thu, 16 Jan 2025 16:49:51 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B476EC4CED6;
	Thu, 16 Jan 2025 16:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B476EC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 85908114015E;
	Thu, 16 Jan 2025 11:49:48 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 16 Jan 2025 11:49:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737046188;
	 x=1737132588; bh=P5XEoRIU6R8iKZqDv1WNMWR/Ys7A+lJYA0/6g97taqY=; b=
	ZX5vdrzMQeSNRNLxoR3mbpQptn85pU121DSMcloP7VgKCsyHEapJ0CJV5WYTtxUF
	Bxr0Qcxo5NInJCU8AQMmdrTntZnxesUcn6BRTeCFxWQjrQaa3QFc5KIygJ89dfoS
	PExIWcOQRdbm9WLrHQrVLIhFPVXb0ByxXV1p157jvj/nM6utOSdVHsEP7l2zLyxG
	E/dAQNKfGNMdHT9CH9ZBNg9hI8OF/Jmh9o0PMYfQnDWLMfQackwS8ptT9iOWkret
	sDg1r33k18LKpnu90NEFExBg0SsSFNUOPuShM6eWr3DrvF+YvuBW8VncT9sK1lsA
	c3Q2RpbmoVZFKaf/iFezeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737046188; x=
	1737132588; bh=P5XEoRIU6R8iKZqDv1WNMWR/Ys7A+lJYA0/6g97taqY=; b=E
	85ecyC4HDIsNhNG7pBSQlNmBWcPYmKEsh/xXSt+tDpxIMiflDNIq5ZLOGAhzFgFx
	MnRueVB1WUMw6S0HiYZWrmF2H2qhstN3hPoHQATtqnzDac6dyQSUtIttRyFnhPfN
	13Sux1ezfmLvKCH7pRRI/YxPIfTBxcsZkTxfEqWo3htaDYAkEE6GpOJXleLXcoeL
	Hh/FD8GYte41Se43cnPTXwFpndUNM28g/1sJMTChZEKpPk0hNVIqtFOgAX/7jRS/
	PgddsTtuu2PKC8PDsI3spC3t3Jz9G/3h3nGYjwQ9aXDE+umFeGa1TR0EiJ2kcvfg
	Mjxf+fdcT1P9ypvXdsG8Q==
X-ME-Sender: <xms:qjiJZ4Aa0JmixKo-eBuktCxVodO-u7DYYerlrqKgH586seohfASnEg>
    <xme:qjiJZ6hkYCvn8qCAw4gVvmjXZ7s5aqEOF9xR2mcI08OxbXd_71o5i_sCMKk2HuIFZ
    BelCTFGtd2jEWkcB1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiuddgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptgihhiestgihhihsvghlfhdrnhgrmh
    gvpdhrtghpthhtohepughlrghnsehgvghnthhoohdrohhrghdprhgtphhtthhopehinhho
    tghhihgrmhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhrrdgsohhsshhmrghntd
    ejheesghhmrghilhdrtghomhdprhgtphhtthhopehufihusehitggvnhhofiihrdhmvgdp
    rhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohgtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeiihhgrnhhgmhgvnhhgrdhkvghvihhnsehl
    ihhnuhigrdhsphgrtggvmhhithdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstg
    hvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:qjiJZ7kjuoTVsnkM5tyzGUotO5dqoCzD5RshTjVI4zdVUa6JdumGIQ>
    <xmx:qjiJZ-zXyGCbTH61g15Mdf3wxv3z2AjueF207SLPruXeY8jAvcHzLw>
    <xmx:qjiJZ9S7VZnOzgGNYedBlvebhQRF8vQLxLpQ2hzqaLXibA_9QCMOkA>
    <xmx:qjiJZ5YNmNAIgseb-i_KoIH0qNl06rmjoSsCfxDVNbnzutOvQ6zBWw>
    <xmx:rDiJZ4FsDe_5TYfZQ-_kdTbIJLL2NChbwMqplZEi07lWtRGCvQfZzG2_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4BD102220072; Thu, 16 Jan 2025 11:49:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 17:49:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yixun Lan" <dlan@gentoo.org>, soc@kernel.org
Cc: "Conor Dooley" <conor@kernel.org>, "Inochi Amaoto" <inochiama@gmail.com>,
 "Yangyu Chen" <cyy@cyyself.name>, "Jesse Taube" <mr.bossman075@gmail.com>,
 "Icenowy Zheng" <uwu@icenowy.me>,
 "Meng Zhang" <zhangmeng.kevin@linux.spacemit.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Message-Id: <6a8bb914-858e-479d-a7d9-09e0ff688160@app.fastmail.com>
In-Reply-To: <20250108142122-GYA3300457@gentoo>
References: <20250108142122-GYA3300457@gentoo>
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.14
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jan 8, 2025, at 15:21, Yixun Lan wrote:
> Hi Arnd,
>
> Here is SpacemiT's device tree changes for 6.14 cycle.
> All patches have been merged in linux-next tree for testing.
>
>
> ----------------------------------------------------------------
> RISC-V SpacemiT DT changes for 6.14
> - basic device tree support
> - pinctrl dt node info
> - update MAINTAINERS info
>

Sorry for the delay in pulling this. I just had a look and found
that your branch is based on -rc3 while the soc tree is currently
using 6.13-rc2. I try hard to avoid unnecessary backmerges of
upstream contents into my tree, so it would be nice if you could
rebase it onto 6.13-rc1 or 6.13-rc2 and resend.

While looking through the contents, I also found a mistake
in the contents:

+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -0,0 +1,459 @@
...
+       aliases {
+               serial0 = &uart0;
+               serial1 = &uart2;
+               serial2 = &uart3;
+               serial3 = &uart4;
+               serial4 = &uart5;
+               serial5 = &uart6;
+               serial6 = &uart7;
+               serial7 = &uart8;
+               serial8 = &uart9;
+       };

The aliases here should be in the k1-bananapi-f3.dts file,
not in the k1.dtsi file, since the mapping between exposed
UART devices and those available in the chip is board
specific. You normally want to list only those devices
that are marked status="okay" on that board.

I would suggest you fix this in a patch on top of your
existing commits, but make it part of the pull request.

      Arnd
