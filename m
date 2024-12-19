Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AAF155757
	for <soc@lists.linux.dev>; Thu, 19 Dec 2024 17:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629767; cv=none; b=l61MKLM/kox9IK4tPIHc8lb40kxpBuMTr1R9GA48R9agtqgRMNK5mA46zc02bFYsL5W2h7oJjWlQSiZv7SDlVFxmt0nhZc563q1NF6u3xgevsHlh8dovaV7mMD+Vsz1zQ8cJQ52s9/X4B8VyaOEleabc1q+LbFK+feYdvxToO/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629767; c=relaxed/simple;
	bh=lRlp/CKfeKLamC77DGDAhfboRWcs7T0IMZX+OMo+Dlo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=EWrv1FGwb7g4rjzBbjEeNSQ7xfTWmFvzF4tt54WCYlWbWfA4HYlNNgFFI1Gg6Vw+oApy3Ge31Qqc+cKeTmK50GBBHLkkG2CeCHBvAei3bFCk+3zrW/xjU/V2SXGts5/l2iq0dj4m68NTzLITluYVLYu/m37+w7YB4+whO3NOFbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=YPzuIoaD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UzdnWXAW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="YPzuIoaD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UzdnWXAW"
Received: by smtp.kernel.org (Postfix)
	id E4694C4CED6; Thu, 19 Dec 2024 17:36:06 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08EFEC4CECE
	for <soc@kernel.org>; Thu, 19 Dec 2024 17:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 08EFEC4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D4E531140166;
	Thu, 19 Dec 2024 12:36:03 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 19 Dec 2024 12:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734629763;
	 x=1734716163; bh=iDfa2Muw1eLzXoysgvWlMJjmoDqf3WCXyr0RROwBOkU=; b=
	YPzuIoaDiSpZYJkh2n3/LpZwJ3Qyv0dhBC5pzmq7f9kkSVaSBm6TmJ9h3sM8zJsJ
	fg5D/BZXAdnkPuewHFtcStcYOfdZ4XjrBHHN2HoVoqWjaX8PE6f2fmPZ1Mrnd2mc
	KFLHFCcz92WI1Iep3YkosX9ORHRxoJ6uln0w4r66GltrAQ1yZWoVKcqRiV79uPCk
	YfMH7PWtsNs+QRExzJxowaP1NxPV1l9E+UCnse90m+xL2c6HUV1IRrkcf8HbLvB+
	UKRrkU6cyFP+5xM6pWGIUBTw5uRjBRd5IA6gH88jm4/n7kE+3EnBrulLZXHu85UP
	sIWJvVgcKytOFZcBHhji/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734629763; x=
	1734716163; bh=iDfa2Muw1eLzXoysgvWlMJjmoDqf3WCXyr0RROwBOkU=; b=U
	zdnWXAWCe6KM5NqiN4EpRODxTop7JWW3cP7JNEOqZPjMXUHc8ftDE67KPbOBKEtQ
	ahe3VIlj8uEcb0+hTxIpb8iDZbEOwaZJyWdWF2WVqBjuWaAnzAPVh7iUjjKO3kon
	Oe3oI6PrRUSxya4XWVRrZl0unUxavngzI0irIzGROkVNqw/3agIGWjoNrPHLxhTP
	9U3y5p0aICsvS1ZadpiJ2Fq1SxIUaHVX5Ke6yuzwCix8aCH4tVDPgGFPNVLpEYkS
	pmgCnXxcnMUjYSJ87dXWXdYlUZ4o0jhb4LYACodrFurC1doKDEg0DTYVL9JN8tXp
	UOQenmJ13hvM5ESB0cCOQ==
X-ME-Sender: <xms:gllkZ8IzIr1GOq4dhOtiaswaPEXPhFpWD-vvetnXUz4BRX2rAA0iWw>
    <xme:gllkZ8Jx3nwyOqsNEVOD2wzzD3rqhcUKiTALk3kcXaYOEOsfaXbjs_on3fEw0DYZC
    xcJPXGNLOso6me-fV0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
    uddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuh
    igrdhorhhgrdhukhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhho
    shhsrdhsthdrtghomhdprhgtphhtthhopehprghtrhhitggvrdgthhhothgrrhgusehfoh
    hsshdrshhtrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopeholhhofheslhhigihomhdrnhgvthdprhgtphhtthhopeihoh
    grnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtoheplhhinhhugidqshht
    mhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhm
X-ME-Proxy: <xmx:gllkZ8sTIxduK_5QK7eI7Le7J6ZDjBwwhAs4BRLwzcrpkJPKyg8tDw>
    <xmx:gllkZ5Y7v-tnLgpqrZOgqQ7SoaDvmU3gJemn-Q84cNZH_2vY7fIygg>
    <xmx:gllkZzbngG4eIUW0vd2_45NgebXn6yCAj7DBYsAmDmiKqOjTtA0BLQ>
    <xmx:gllkZ1CSS1cFIGlPd3o-y0gd0nJv29lVI9rF5SE0iNUgOS-MOPGzUw>
    <xmx:g1lkZwSzZ6XoDoQAShssJy-o93Id7cf2Fwx2clVd0HC9EkjKlv7ZgkJM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A5A862220072; Thu, 19 Dec 2024 12:36:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 19 Dec 2024 18:35:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Olof Johansson" <olof@lixom.net>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Petr Mladek" <pmladek@suse.com>, "Yoann Congal" <yoann.congal@smile.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, soc@kernel.org
Message-Id: <7c6dc57c-f33b-4a4b-9423-01ee2933f759@app.fastmail.com>
In-Reply-To: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
References: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
Subject: Re: [PATCH 0/7] ARM: config: stm32: Disable useless flags
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Dec 19, 2024, at 18:29, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>
> *** BLURB HERE ***
>
> Patrice Chotard (7):
>   ARM: configs: stm32: run savedefconfig for STM32 defconfig
>   ARM: configs: stm32: Disable CONFIG_COMMON_CLK_STM32MP in STM32
>     defconfig
>   ARM: configs: stm32: Disable CONFIG_SUSPEND in STM32 defconfig
>   ARM: configs: stm32: Disable CONFIG_ADVISE_SYSCALLS in STM32 defconfig

I would structure these the other way round: you can combine patches
2-7 and just explain why you do those changes in one commit. 


For the things that have changed by themselves, you do need a lot
more explanation, so we can see that you have checked that these
don't accidentally break stuff. You can probably still do them
in a single patch, but it would be nicer to have one patch
per option that has become unavailable, changing all defconfig
files that need the same change.

     Arnd
