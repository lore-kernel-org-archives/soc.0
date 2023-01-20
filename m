Return-Path: <SRS0=GsPT=5R=aj.id.au=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D07C004D4
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 02:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E9DBC433D2; Fri, 20 Jan 2023 02:22:21 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BDC7DC433EF;
	Fri, 20 Jan 2023 02:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BDC7DC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=aj.id.au
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id B750E5C0098;
	Thu, 19 Jan 2023 21:22:18 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Thu, 19 Jan 2023 21:22:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674181338; x=1674267738; bh=tziaenBgZf
	HXo7o+JSgvpsIssnOOcpkmBFnl2VxkDts=; b=BpeqyBOTJh/85zUDp7G8ONolva
	JmAWtWXMaRakSKR/0fg7y9JLM16mUWhhv5Vut6Xgk0ahOWq+FGmrv793cT93ZTU3
	UNEFj9/r9UhAHkT6rpL/xY0/JTg3RkgaOJmAlubnANdC+/05L5pfhJMtQKlktbPb
	RnkfQp24zNV+ZshfXCcg8rd9/k/FTXfFhrhniKGREGJubK4hUX/B2xXd58JELm2I
	9DgvERSCbwTT61pb+cGSuzMZQ2pOtYGVqFB4j6FivcQKpd54tWZQbBR+kPF+LQrh
	691yc0uH1wKUJ++JylHE+vqQxlDmdxOHgrAK6SpWNAYY1/hohFh5cQ1sPWmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674181338; x=1674267738; bh=tziaenBgZfHXo7o+JSgvpsIssnOO
	cpkmBFnl2VxkDts=; b=HiGHG2Htaij2b0kSaad4LHPX8Ho4pxGB1Zq2TIOMMOLz
	f5WIMRkE0VpLXFzNkv42R05ilUEPqPx7DP1GbOOP8tE1VErvS+Og0HndM1ONQkWL
	28fvAiEUS4GV/5nsFMryCV4oQdSVy4YZ1WK9o5Xt833EbpaBXbgmytKucqnV7+iA
	el8ozZbf+WzRz/QEoeqOFUR40yz+PuqEsinlNd4tFxqnn8zmWyfEi8keF1mcgLqH
	EEq3iIBkfwvX2S8YTw2U7fEuTp8fQjkbowWShtipqWDI5FFBXqaLXaByr5QoRrGb
	WzIekC/0ko81HUJ8bOPbjRQCfYf5bJI+z9mYFZ9xrQ==
X-ME-Sender: <xms:2frJY_gJjMR3HtFS3jIZbFrsy3yHmg7tzIJpqMiuMp0o-riHTNQ6yg>
    <xme:2frJY8AqKwnv7gNrAxOU0GDuZNyrLYHVq-nLhvho8THfKDW9CuO2xluzmYMCsjyv-
    Jg84QFPOatugCXzEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepudfftddvveekfffgteffffeuveegjeelgefhffejtdehtdfhlefgkeef
    hfefkeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:2frJY_ELKpBQTA3OJmVhRti6tBxHzWjOiPcWKDgJLp9LOeJtUM10Sw>
    <xmx:2frJY8QHsW2Zyyg9SkczDzPT62nyM5BqYzqS3LZupaeN1rUu6cGBrg>
    <xmx:2frJY8wqTh7Ibo-8ScquDcuXRRVuzjql4OPg4K2igyiflLx4fzlW9w>
    <xmx:2vrJY4eh512gab0pYBFER73nNcuTj-Q63tJUL8O6KdrpKRVdhpJRUg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AF0861700089; Thu, 19 Jan 2023 21:22:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <7734c165-5918-4677-b8d4-f7d5a3ed37d5@app.fastmail.com>
In-Reply-To: <20230110042533.12894-1-clayc@hpe.com>
References: <20230110042533.12894-1-clayc@hpe.com>
Date: Fri, 20 Jan 2023 12:51:54 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
List-Id: <soc.lore.kernel.org>
To: clayc@hpe.com, linux-kernel@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 verdun@hpe.com, nick.hawkins@hpe.com, "Arnd Bergmann" <arnd@arndb.de>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Russell King" <linux@armlinux.org.uk>, "Olof Johansson" <olof@lixom.net>
Subject: Re: [PATCH 0/5] ARM: Add GXP SROM Support
Content-Type: text/plain



On Tue, 10 Jan 2023, at 14:55, clayc@hpe.com wrote:
> From: Clay Chang <clayc@hpe.com>
>
> The GXP SROM control register can be used to configure LPC related
> legacy I/O registers. Currently only the SROM RAM Offset Register
> (vromoff) is exported.

What exact behaviour does vromoff influence? You mention I/O registers,
but RAM offset feels like it may be related to MEM or FWH LPC cycles
instead?

I'm trying to understand whether we can find some common ground with
controlling e.g. Aspeed's BMCs LPC peripherals based on Arnd's query[1],
but the description is a bit too vague right now for me to be able to do
that.

[1] https://lore.kernel.org/all/66ef9643-b47e-428d-892d-7c1cbd358a5d@app.fastmail.com/

Andrew
