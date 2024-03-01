Return-Path: <SRS0=+ucK=KH=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F29C5475B
	for <soc@archiver.kernel.org>; Fri,  1 Mar 2024 09:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6544AC43390; Fri,  1 Mar 2024 09:55:06 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8A0EC433C7;
	Fri,  1 Mar 2024 09:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8A0EC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 18E803200B0B;
	Fri,  1 Mar 2024 04:55:03 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 01 Mar 2024 04:55:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1709286902; x=1709373302; bh=eKkHrTxA5h
	5UFzBzHhnpvQfEdW1xCrAq+5NyjYHzbVE=; b=CtzA+3e4Aa4kVVENqMhl0j+CMk
	WgYukEVVe+TGxrziQG+/1mZTmqiLOSF6Mga9sDZvK4JizDBFP+GAZTUs3IeZdKG4
	eHdefbDkOyNd5soBXJ5SFIrA4Nn+mWxnDMcKsOGBtiNHgGWubDwDHGK2E5K7lqXk
	ihiQLxUFSvhhZuBcdGXLU7Pt2IzEWNsOFEpjEfxc6KlSt4gOsJu8ehkWCHv5Lel2
	rSzGj1rfXL+6TXPbZBW2Tb7w5PQgZBH+QrukEszlBEObUJTDw4rBecHknVvk3MZs
	8X6aXDqupeu7EydXpOjjvmZmdIuOo9whO6ox0fVZPZv2+5gwqAfJS7cVE/mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709286902; x=1709373302; bh=eKkHrTxA5h5UFzBzHhnpvQfEdW1x
	CrAq+5NyjYHzbVE=; b=Hr9tLQcNME7Qa2TSUc81lcG2NW0DS6QgZCH8q2U1Aeud
	9sZVvkDbS+Vbtf7QKVBg+4ADD0ULcvDsNjg2ZITvjcy17cJrZkk/Kt6Zk7kQyNmI
	VHd/ZBV2Dnc9q9k4ygsyTQHBoUhL8tp7Yj6upLQ8NZZP1nqZ9pUc5SMRWgDIHPDv
	xTZLB6Kf88uTVujQHR+WpsCwFnLWFjta6pqNren/hDGqFroPlUGcwtPZs37kug9X
	uJMlZ1MIq/i5WZV395oGXrNm0Ql3+Hw/nwipAS78hYUYHCdPVJU0T3vyLEmcZ6ch
	+8Ldh/at7dUVAgDFJcpB5TqyugBlw3Zv0O8C3U7aDA==
X-ME-Sender: <xms:9aXhZcIlRQYeJqz3n8dkY0JH6bCXht7iJeq4SDIBVwX6g6efkjzdCg>
    <xme:9aXhZcJ7Kx6Src0m9UY-XM81-V3CG8AP6oKIs-re9k8RXtZP03ByheHxKb2Jo2c98
    2KtJ6maZ9FHBFdxPH8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrhedugddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:9aXhZctV7DPSCqBTNyW4aPbsaAnpAtqBhScAPjeCxzVuqjs0cvnOZg>
    <xmx:9aXhZZZVvNYq4hen4EOvsWM7Hikisc_vBXtl0Vz00NijKUBm9Z0c3A>
    <xmx:9aXhZTb5oNkALvcMbbKJUySwKCXXYs1DF5eaeBoXl_DrKiVbyYixew>
    <xmx:9qXhZeyy_aFmIU_S0U2GNKm7_Xy4YzNIjw2cyZKppq1cMw8NNhyqpA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BBD74B6008D; Fri,  1 Mar 2024 04:55:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-205-g4dbcac4545-fm-20240301.001-g4dbcac45
MIME-Version: 1.0
Message-Id: <3990c5be-6173-4c20-96ca-79e22cb4a40f@app.fastmail.com>
In-Reply-To: <20240223210408.GA9248@jernej-laptop>
References: <20240223210408.GA9248@jernej-laptop>
Date: Fri, 01 Mar 2024 10:54:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Jernej Skrabec" <jernej@kernel.org>, arm <arm@kernel.org>, soc@kernel.org
Cc: "Chen-Yu Tsai" <wens@csie.org>, "Samuel Holland" <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.9
Content-Type: text/plain

On Fri, Feb 23, 2024, at 22:04, Jernej Skrabec wrote:
> Hi!
>
> Please pull following device tree changes for 6.9.
>
> Note that this is based on top of fixes for 6.8:
> https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git 
> tags/sunxi-fixes-for-6.8-1
>

I've pulled it into the soc/dt branch manually, as b4 refused
to pull it because it got confused by the text above and
assumed it should pull from the fixes branch, which does not
match the commit ID below.

Having the stacked pull requests is otherwise the right idea,
just maybe next time only mention the branch name rather than
the URL that can confuse tools.

       Arnd

>
> The following changes since commit cbec657208bdd4bff4ff31cac5924aa18817027c:
>
>   arm64: dts: allwinner: h616: Add Orange Pi Zero 2W to Makefile 
> (2024-02-23 21:02:51 +0100)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git 
> tags/sunxi-dt-for-6.9-1
>
> for you to fetch changes up to f4318af40544b8e7ff5a6b667ede60e6cf808262:
