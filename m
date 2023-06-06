Return-Path: <SRS0=uhhx=B2=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC18C77B7A
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 11:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B78FC4339B; Tue,  6 Jun 2023 11:47:10 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70B82C433EF;
	Tue,  6 Jun 2023 11:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70B82C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 15C165C0068;
	Tue,  6 Jun 2023 07:47:07 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 06 Jun 2023 07:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1686052027; x=1686138427; bh=dA
	jZXnSLv8zideXMYfipOX2kQzWtw8W7LqpkuBArsm8=; b=iowoh88imufE/I74sh
	/Qqc5VguGgE1kZQWJ8bLwvlULfXaNr4BLeNMZnnav/vwRkgDdmpAa3DnN/BbXlGL
	7Va/X3pX+Pi1ns3aC5OfpXODP4pAkwaIxCQ7iS5UTrqL34xgWBuoo+54p7C9fFID
	0kmiMZDw4W7jG1EF1iz4HfMGAwMZtVpJAP63OdAPcDaYLIz/MWoLBB3S27Bhn8Bh
	+DJ7bG/YUebn+cFW2+zDiyqYSYGuDnpbWD7RKHAWCecuLC0pp9ocHmUAXOnufDhS
	E9p0f0B8YR5WiFAJGWdFmU/WbtivZoyf4hYNY+lO0YNPXTE3dVmonAcuP76hPkl9
	Q7BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686052027; x=1686138427; bh=dAjZXnSLv8zid
	eXMYfipOX2kQzWtw8W7LqpkuBArsm8=; b=TVNuRbhZevQ950/x6PWjau6/Ulx+/
	LjtZT+mWPxMQD8i4CBPYBhv5npqOewu5thkKIpabgl+R57byiomZOwIJlwP0tW5x
	yAIQw7gAFaNVGXtVfjWlI5NlxZsUFc8APCfAdDgWE4w7i8y4l78sS763+6+xAG6L
	kywfctMPMecTmhVBczWd/h2er7ejWYyRudLi2Gap4rg3zYxMOBx9N1/JZZAkymH7
	J5I5LIPLiWJpIXlMgrwDWeRn45adpHasD9wV2onyUA3HlKZ/nEAYQqvBr4hRQQWJ
	pVK5+VVdlkDAL53WVV/3yO7PmYIy73d6NZm+ayHGQ7u1bfSASbz6vIFwA==
X-ME-Sender: <xms:uhx_ZNR7KnMWkS1jGZ_9_RCNz4OPrwAU-zyP_uqZPlscwFq_-76jkQ>
    <xme:uhx_ZGxNvXuHyKNl9EgZhar-wM-lsVznyA0CrQLClikzrEf5tI8ckYbrF1hF1bx4V
    Zv7vCshxvwVnVpH1Fc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtuddggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhephfdtlefhtedttedvtedvueeugedvueelueduvefhuefhuefgvddtveevvdff
    hfdunecuffhomhgrihhnpehlihhnrghrohdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:uhx_ZC1XGcJGj4WIBKz60QluVUSZyHge-6Jcfexmc3k98xUqYJ0y2w>
    <xmx:uhx_ZFD4exF8octn-J6Uy1qTvNAp-T0KgL6LVmN5ALnjR3Y4sf9anA>
    <xmx:uhx_ZGhe5Fjd6VOgQXlWBTl3CPsNYVWx2_LJv6x8EVmb_KVcwfZCRQ>
    <xmx:uxx_ZJvQ5UXq4GAJVBe9NFLE7KeEIwIvL1CdwubYtvOa11exlUdjdg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B8E8EB60086; Tue,  6 Jun 2023 07:47:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <0fac8e65-fe05-4dbf-a634-4620f764e2bd@app.fastmail.com>
In-Reply-To: <20230606075843.GA2792442@rayden>
References: <20230606075843.GA2792442@rayden>
Date: Tue, 06 Jun 2023 13:46:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Jens Wiklander" <jens.wiklander@linaro.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 op-tee@lists.trustedfirmware.org
Subject: Re: [GIT PULL] AMDTEE fix for v6.5
Content-Type: text/plain

On Tue, Jun 6, 2023, at 09:58, Jens Wiklander wrote:
> Hello arm-soc maintainers,
>
> Please pull this AMDTEE driver fix to add a return origin field to the
> struct tee_cmd_load_ta used when loading a Trusted Application into the
> AMDTEE. This change is backward compatible.
>
> Note that this isn't a usual Arm driver update. This targets AMD instead,
> but is part of the TEE subsystem.
>
> Thanks,
> Jens
>
> The following changes since commit f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6:
>
>   Linux 6.4-rc2 (2023-05-14 12:51:40 -0700)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/jens.wiklander/linux-tee.git 
> tags/amdtee-fix-for-v6.5
>
> for you to fetch changes up to 436eeae0411acdfc54521ddea80ee76d4ae8a7ea:

I see there is only one patch here, and it is marked as 'Cc: stable',
so I assume  you meant this to be include in v6.4, not 6.5. Can you
confirm that?

     Arnd
