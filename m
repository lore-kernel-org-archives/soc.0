Return-Path: <SRS0=JtlV=CK=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4320EB64DB
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 15:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7053CC433C9; Thu, 22 Jun 2023 15:29:59 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 309B8C433C8;
	Thu, 22 Jun 2023 15:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 309B8C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 910A53200979;
	Thu, 22 Jun 2023 11:29:56 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 22 Jun 2023 11:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1687447796; x=1687534196; bh=1q
	zMczPA1uugIbj0lCtxAIAQDz09+lT/si6RX5im9dg=; b=dX67cQ/y5pVZYhO41u
	9wFgqKHvDrVQFQQnxLFO5KgwfkORvAHOxG+wdEHqCfhP+9RJJ+n3Cd8fcxGU9EgH
	VkCmbiRXYKlGY3+c13TVBO8Fi4yms6yHiqiG0/5Q0iXk4E/VrjBXFBuQt47tkLOy
	tjkCZW8oEoBys50JgSerQw6PmiVT3iIAf7S5WO9ckbvs/hTLqGDOLSUeIsbdRjV0
	y9CV5AQJbwpjKxQL2sOWSxSkEtRRdhCooNSbP3w+ormdGSfWWdMTJfHrEp4Cgzd/
	H2jxQSXofyJXSJ2h7AHuvaDsIBHC9YqrwbpJQn7FYCXsF4xaoP6w90SWa/Oa//5v
	gcdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687447796; x=1687534196; bh=1qzMczPA1uugI
	bj0lCtxAIAQDz09+lT/si6RX5im9dg=; b=meyfQLOFDeuFUkRVby8RCB6U9RRzl
	9BgIgxKzArE28ohmTE08IcP43eTfCVahJFU2q9OlFhsdd5/A/e5KLdDDMNmh+ctL
	mKLIJCi8upVgZBzgtZOyGrm9ofR57TsEUV+hJneGHAGX7+q/yYLRVbc7Xzx6Ek4J
	NClrQuRVp2w1Gp+3nimYvgtFJ6gynwd/SUaIt7Pw1P0ZDehivKvu/NLLifE7kJ3Y
	8/VqoypSon3JbxZRqkCAowfP+IesUuFMI1TxsVdLGA2fl0akBBR1WvPKVuF8MkV0
	dgRhN270jPxcjUT7Ys6Jf63ZT6LbvWHs6u/v21XhFZXOFHUppysGq7RzQ==
X-ME-Sender: <xms:9GiUZB_gcTe4J63Utl-L86ztyCENyshaOkyUoN8hh-jNvV4LHIEK4Q>
    <xme:9GiUZFtjYrHhJiPtJHjzFVcxLbkUuOO9RjSUMbeiDqyJsJ-Vydv0DFiIz4noP6PE4
    oXUUEUJbemO4Zb0EuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeguddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepjedvvddvudeludehjeeitdehheeivdejgfelleffiefgvefhhfeuudfhgeef
    feehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:9GiUZPBnbGXKbgFRdHG0vU39WID5unB2GbDiSloY3sq-SLhO2Z4Ncw>
    <xmx:9GiUZFdNrcp0CRzF2S42Yyq-WDk6KyskxqUyVhnfmY9qY4bRr-ePxw>
    <xmx:9GiUZGPcvfkg0A_2UM6dLauG0GlL1i2vEPfE1H6_sU3dh2-9I1l3rQ>
    <xmx:9GiUZN3uoYYRD0216XQOfeqvnHkqfTKZUvZe4rAK0d48NLtFJC7Bsw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E8BBFB60086; Thu, 22 Jun 2023 11:29:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <cd9b66ab-e2c9-4255-b5a9-10ac83035969@app.fastmail.com>
In-Reply-To: <20230619134920.3384844-3-florian.fainelli@broadcom.com>
References: <20230619134920.3384844-1-florian.fainelli@broadcom.com>
 <20230619134920.3384844-3-florian.fainelli@broadcom.com>
Date: Thu, 22 Jun 2023 17:29:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Florian Fainelli" <florian.fainelli@broadcom.com>, soc@kernel.org
Cc: "Justin Chen" <justin.chen@broadcom.com>,
 "Kamal Dasu" <kamal.dasu@broadcom.com>, linux-arm-kernel@lists.infradead.org,
 "Olof Johansson" <olof@lixom.net>, "Kevin Hilman" <khilman@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 3/3] Broadcom maintainers changes for 6.5
Content-Type: text/plain

On Mon, Jun 19, 2023, at 15:49, Florian Fainelli wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
>
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.5/maintainers
>
> for you to fetch changes up to 825edae7d1c39171634253203f03cf6c6cf380bc:
>
>   MAINTAINERS: Replace my email address (2023-06-19 04:48:28 -0700)
>
> ----------------------------------------------------------------
> This pull request contains MAINTAINERS file updates for 6.5, please pull
> the following:
>
> - Justin, Kamal and Florian update their email to use their corporate
>   Broadcom email address

There was a small merge conflict against 80e62bc8487b0 ("MAINTAINERS:
re-sort all entries and fields"), should be all resolved now.

     Arnd
