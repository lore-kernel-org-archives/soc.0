Return-Path: <SRS0=aYPc=MK=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AEEC10F1A
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4708EC3277B; Tue,  7 May 2024 09:28:00 +0000 (UTC)
Received: from wfout2-smtp.messagingengine.com (wfout2-smtp.messagingengine.com [64.147.123.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15828C2BBFC;
	Tue,  7 May 2024 09:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 15828C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id EF73C1C000E5;
	Tue,  7 May 2024 05:27:57 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 07 May 2024 05:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1715074077; x=1715160477; bh=/4ErqzozY9
	sdb6iZyPE43JX+2cvlokG8WL+46eXdKbM=; b=UHIlEDNUjYuCutqEqlnbHXCLSv
	1CeVdu4NMDZefaqu6j0rz1U3iJRnkos+m0rwuHv48wU2HmAWBcXxFISF0+6aWKZR
	8f3R2+ShfFmLn5W2BJkA1Lb/qr3rXLb92fwEkoaKdIeO0S0NyNn3rm6RluipQhYU
	LS9LSWuQcgHEKsH6JEDn62p5sT2N+vkwyQnJzLYDUXPtzzu1+dTFljNUTgydAkqM
	85qotKn+BHSHEv/5moesbW1kPRKKTOv013qoAD/ZTBc0yaer/aVKCH6du2JS8G6r
	DRTww1btEVZYpUfTBq2SQNGd9cgqAcRr2vfbEhxh5Z4H1lb2/KAJY8sFfj1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715074077; x=1715160477; bh=/4ErqzozY9sdb6iZyPE43JX+2cvl
	okG8WL+46eXdKbM=; b=j0m5hnuicHkgii7Ux51eXHgAnOiUKucIZFQGrqc+0sU8
	N/2HzO/vFiQSMP+PakUpBYtBT6ZbbyZlZwiDRYxnE2RzmW75P4owAudVD1fl/3/4
	eRksBYTOq6af+EeqgpchxbORWTuZTE1jwROvwjjcUnuQ6H8a7Re+vs43C9ZbgQ/C
	p7NOvO1fmuSe6SUfLRZUxPD2crXq8zvuJGN02yW0BxxOrDDRDEwX/zkH+zEJl8Ek
	waL2tf6ESF+jQLbM1VlAE3AiYeHsqNAC2ySyZFbN+T432uENO7+prseTyALE8YMt
	I7WhvCVUX4hOTNfIPivH6JTE2q4WFXs+jujMI9EN9g==
X-ME-Sender: <xms:HfQ5ZvEh1M9_XBrr2aaMoSPoJ2PQIaKKubN3MI5yOTZTASnb8pFlNA>
    <xme:HfQ5ZsUV86MsNbHPMsUZ0k88Ic0Rck7uEOPu-ILsY6DeL_EdBs9jZSymeJFPxT2Hn
    Yva6sSkPNWS5zNX2Ok>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:HfQ5ZhKbCxO8bWdns6Rdrj6nMRvBBTkTonJ-JXrV2fklcRexBJXK3g>
    <xmx:HfQ5ZtGevl7bIyVW0QGkSLMCmoIzd6-JvY3QKir757GHTwiLrfvQVw>
    <xmx:HfQ5ZlUpyXzgdv7d54lAeqDDuA5XKIWWJt47lnLQdhWCcLbAe15nCw>
    <xmx:HfQ5ZoOTCy7iJLWLO5vagm9lYs4MybI5ZU45NJeMUdJ5RzsGjBLe8g>
    <xmx:HfQ5ZigsroevU9udlcyg0oB92ktmEgPQXw6VT3WVNlBwm2H5TYv9ZB4q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 34470B6008F; Tue,  7 May 2024 05:27:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
MIME-Version: 1.0
Message-Id: <5222e581-a189-4477-ba6a-edf4ce369eb0@app.fastmail.com>
In-Reply-To: <20240503-swimmer-botany-7368a8a17b1a@spud>
References: <20240503-swimmer-botany-7368a8a17b1a@spud>
Date: Tue, 07 May 2024 11:27:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Conor Dooley" <conor@kernel.org>, soc@kernel.org
Cc: linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.10
Content-Type: text/plain

On Fri, May 3, 2024, at 17:24, Conor Dooley wrote:
> Hey Arnd,
>
> Please pull some dt updates for v6.10. The diff here is a little bigger
> than my tag implies, but I've done this on top of -fixes and wanted to
> make this obvious. I've also not really mentioned all the Kconfig stuff
> much as you'll get that in another branch.

Hi Conor,

I don't have a good feeling about pulling this one, given that it
is both really late and that it pulls in more dependencies than
we'd like to have.

I was really hoping to be done with new features last week
as I pulled in the other branches. There are two other DT
pull requests I got after that (amlogic and aspeed), which
I added to a "soc/dt-late" branch that I could send in the
second week of the merge window if everything goes well, but
those don't have the dependencies.

If you are able to extract the DT bits that don't depend
on other branches (jh7xxx, microchip, bindings and
new files) and resend those, I could still add them to the
same dt-late branch.

Basing a branch on top of a fixes branch is usually fine,
especially if those fixes were originally based on an
early -rc. I can also make exceptions when there are
complex dependencies between branches, but I need to be
able to plan for those and not get them just ahead of
the merge window.

     Arnd
