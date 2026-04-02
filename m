Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119483932D8
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 22:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775167257; cv=none; b=iy3j2thlAd81n0EpbVR/9w3Ii6sB0v94mUlzChuO1HNP7Wx6zv8dcpkase8h0SkBrwOJWrXhI97MQMBJ1b+Y+TM/WZO5apz7rTbg61FQxeqzVt2vCXyV7Kh+5z+5lSpQi03VdRgT6LIQLhEFyIwULlJZMDZyIioSs8yT5ShbyAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775167257; c=relaxed/simple;
	bh=vktjIXNNZtQX0tlpPW2gaIING9c5ShyxjKYC9KKxn0M=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Nt/6bOn6FBnYjn9An9d8kuARji8GRcMXkkInDrNOLl1lURsSAfjSpOP11jIUovJSnK/8ZeulBGNuagAD3A/SCMSu58i+Vxu7YtYLMUYCuNO1ghzw8pZVSb9KyFMUaZBudnc2fEC8uh07E0CnEY79WRkB+MS/hqd8r1Hb6GDEFhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ctutmgim; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FYaoUNk5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ctutmgim";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FYaoUNk5"
Received: by smtp.kernel.org (Postfix)
	id 75DD4C2BCB1; Thu,  2 Apr 2026 22:00:56 +0000 (UTC)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3197C116C6;
	Thu,  2 Apr 2026 22:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3197C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id D33341D000B9;
	Thu,  2 Apr 2026 18:00:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 02 Apr 2026 18:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775167253;
	 x=1775253653; bh=n+l/aJg99+jURz0t2bEUsGc7u7mBcNC8I1cRKQs52X0=; b=
	ctutmgimzMvI2bZPsB1O2ZZKXvY6axgEpcR8Qbl1uv++VGD2WgvN02Qp+F5qcVaa
	N+MFB5N4pmnicHpZlNmkZma/JwNP8Q8Ga9f7ck2F/whle0EoEEkynNZ+SwoV9DSH
	jOjPxOk9gFDDBS769Am73XJ9yq5q2TTp5UZffaDwX2RZ3laBFczNb+EVm+avEN5K
	ZkAva8XlZBmivcLaTIkAE0Q7nrSI3v5/MRBoASnP7pNRKOXNDU33uZHtJS3hzSdl
	uGScJpLkNcdd0rc6Ya+lqMY3XiDWPoYOKpeBZqM9H6SyLgQD8dak5yjXNupDtfSX
	HuhKLe1e9Xl2WWeR1Yf8pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775167253; x=
	1775253653; bh=n+l/aJg99+jURz0t2bEUsGc7u7mBcNC8I1cRKQs52X0=; b=F
	YaoUNk5hG3M2diDOU2VH0Glpkw7FYla9e/U96Su0EHu3vfBzqJxBi0whd9HY2fiP
	U0xPMyLBrtrCK4ecabXLsh3K1XK7MJO6jYA++HXHMoYUTgPjhlyu7V3UVbMBsExI
	2TpwtxT8niWWHxbf+bJAblYX+T5xm6uaEplS6A4gSAKWKFeeQIBN92LZyzxe2MvB
	DKYr3tX6MjZnL6fcnqpu1CUs7D4EeFHqJvdTXHmoebg72eJLrqo7UllMvCzS4kE9
	WGSRZiqW/pxzvGiv5sjWPZfbIJ2Ppo3aQZlAYAvRGHbWMV5wCCY2TpN0Nhp5nvFC
	0TrPuE+kC9KH5UuxJxoEg==
X-ME-Sender: <xms:FefOaazhAPeFPitrxfd4RV0_OxMnnQxeVohRlpXInkrlDSKMWin_Rw>
    <xme:FefOaRFyPwRQl3d1ca8ougIk8KyaIVzHLVla0BZEZhufOguNFUe7M6FEX6uziGUtH
    OyXijglyDdqnYETNmmxB2AKfbNOMyFJxQlpd7oJh_LLYgnCDtBMA-o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrihhsthhose
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvg
    grugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhr
    tghpthhtohepnhhmsehtihdrtghomhdprhgtphhtthhopehvihhgnhgvshhhrhesthhird
    gtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:FefOadis3rSKqrJJm3JxxJDaae1Yyr8AtKKq1sYVVRGFLsZezNzl4w>
    <xmx:FefOaUmI7euFS-XesSs80Vi9BQ6ENMRktDGPCnbDzClJwkPVkBccvw>
    <xmx:FefOaQty_lR0M2SsKnCE7EmgCi5dESXVSgvpNJySWVy_PohnfAwNEw>
    <xmx:FefOaSYmfYR4x4SWGDH4h-Feqakvt9LVw0JaIDLnehS7m2KqtS7h4g>
    <xmx:FefOaT8n0SFb_xXotOFC9jOKo4qfexDgkIiaYuz9Z_Zq9SnCLC3x6RXR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5A3C7700069; Thu,  2 Apr 2026 18:00:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ARM_Kd3jj6po
Date: Fri, 03 Apr 2026 00:00:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vignesh Raghavendra" <vigneshr@ti.com>, SoC <soc@kernel.org>,
 arm <arm@kernel.org>
Cc: "SoC list" <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Tero Kristo" <kristo@kernel.org>,
 "Nishanth Menon" <nm@ti.com>
Message-Id: <1ed625c0-e977-42d4-85f0-91e90a4c3547@app.fastmail.com>
In-Reply-To: <e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com>
References: <e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com>
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: K3 updates for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 1, 2026, at 19:14, Vignesh Raghavendra wrote:

Hi Vignesh,

I've merged this now, but I see that there are a number of
patches that look like they should have been part of an
earlier pull request for 7.0 and possibly backports:

> Generic Fixes/Cleanups:
> - ti,min-output-impedance addition to all K3 board DT files
>
> AM69 Aquila:
> - Fix DP regulator enable GPIO
>
> AM62A7-SK:
> - Fix pin name in comment from M19 to N22
>
> AM62L3 EVM:
> - Disable MMC1 internal pulls on data pins
>
> AM62P:
> - SK: Disable MMC1 internal pulls on data pins and enable Main UART

Can you have a look to see if my intuition is right on these
ones, and make sure they get merged more quickly in the future?

    Arnd
