Return-Path: <SRS0=fGjY=CJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FFCEB64D8
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 09:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E173AC433C0; Wed, 21 Jun 2023 09:37:14 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6880FC433C8;
	Wed, 21 Jun 2023 09:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6880FC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 0E0D932007D7;
	Wed, 21 Jun 2023 05:37:09 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 21 Jun 2023 05:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1687340229; x=1687426629; bh=sO
	c6wz1DSt49ZRU9TRFU6qTEbYFcvanTnrJ2RrO4fCc=; b=qocp2wOA7JiDbd8wBx
	vGs6+soz5HpqqYzJicdwz2qUYeyFuabijLABV1RIRzL1UUi6O/8UMz2hESAbFzcz
	4j9MdMr+bVO0NAq8MGhxt7HATOdslGYJR+/KGk/8m2X1kNyS0fyhvWZIzb2eHVow
	O/yeG30nQZQawrGWjZDFj+kg3YpCtIQahI1I+DuwcPZ18+z+WQT2aysgy4PPhyBR
	fqx/Z3gDhxEDHZfiImdqnzlKB0gwTnjwS6gDoN0xIGBkvM1BEzamXNzspAGQZz0Y
	bE4UAI7wsw4uuqmtKROWlvDLrGbPkA8XE3MF3dB6uespLact0JP7jMTdAj3yGZay
	6wIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687340229; x=1687426629; bh=sOc6wz1DSt49Z
	RU9TRFU6qTEbYFcvanTnrJ2RrO4fCc=; b=M/EKxA/yazcvKHcNil/o8XQPgfdmz
	GIoKn2yArQTYdjEPm5yJNwQanoE6oMsZ+vOLqi4kmUdifrglYUKEYesK396PxnrW
	cCrG5IYWkuC6Eq5Z1KgASQmwL1qL5NPcURVWzjtqnHKORoRTwMgbBNpc9Y2i2WUH
	A1HsQe3BCAXEy7YTEK29Ds5US5eHfhykiDX94v6SkWQW4kSWJFd6rEXIXBNojKRK
	Udj+0Ou6nyCNtHfwrVllp0qeqUsJJ2AxgZOtWK5htwvswnH4c3yzBKRgtT2mos5/
	EExOxAfy+KMmko5bebmD+eXjAiu+KkO+wiDr2w2f/kz0q1yqY2Hsgfvuw==
X-ME-Sender: <xms:xcSSZLA3mmB_Fpz91uU4CpBjvUq_ZM-PmN5qDrm1wplNVxOU8EsdVQ>
    <xme:xcSSZBjy5-2zGmZmRRbG_HidplHZeV4LaUrSlg6bBd7lDpCoh1o0iQkZ0RMNFbzz7
    BbsRdr2B3ytrJiasv4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefjedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:xcSSZGn8w6RH9g77dY1GBibc67NX8Xjhcnw4ID-2P0D9ThLMQTDwOw>
    <xmx:xcSSZNw66D-XW8qdDUoMCDHtxOliNTnpkYi8WWMXv2_u8BDNAQ2jsg>
    <xmx:xcSSZAR81iEoZKWsIubA5jxRoolFYr9CIBrfZ8EbJTx65WOIToL0OQ>
    <xmx:xcSSZLeFC7nAjU6JIGBhBG9raVZSV5B6U3B0yBKFNYHJqnogcSnRVw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 69B63B60086; Wed, 21 Jun 2023 05:37:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <5dd55b3f-9a12-4c3e-99a8-b81add924cbb@app.fastmail.com>
In-Reply-To: <20230615174940.jmzuv5kb6o7htkwo@mercury.elektranox.org>
References: <20230615174940.jmzuv5kb6o7htkwo@mercury.elektranox.org>
Date: Wed, 21 Jun 2023 11:36:48 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>, soc@kernel.org
Cc: arm <arm@kernel.org>, linux-arm-kernel@lists.infradead.org,
 kernel@lists.collabora.com
Subject: Re: [GIT PULL] ARM64 RK808 defconfig fix
Content-Type: text/plain

On Thu, Jun 15, 2023, at 19:49, Sebastian Reichel wrote:
> Hi,
>
> Since I did not get any feedback for the defconfig patches from [0] and they
> are fixing a KernelCI regression (Rockchip Chromebooks no longer boot because
> of missing PMIC driver), I prepared a pull request with the defconfig change
> instead as suggested by Tony [1]. It consists of the rk806 immutable branch
> prepared by Lee Jones [2] and the arm64 defconfig patch. I will send a second
> pull request for the arm32 multi_v7 defconfig. This is targeting linux-next.
>
> [0] 
> https://lore.kernel.org/all/20230518040541.299189-1-sebastian.reichel@collabora.com/
> [1] 
> https://lore.kernel.org/linux-omap/20230604060436.GT14287@atomide.com/
> [1] https://lore.kernel.org/all/20230515152425.GV10825@google.com/

I don't think it's important to have bisectable defconfig changes,
and I'd prefer to just cherry-pick the two defconfig patches in
this case if that's ok with you.

> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
>
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
>
> are available in the Git repository at:
>
>   
> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git/ 
> rk806-defconfig-fix-arm64

This is also not a public git URL, you may need something like this
in your .gitconfig to generate better pull requests:

[url "https://git.kernel.org"]
    insteadOf = ssh://git@gitolite.ra.kernel.org

       Arnd
