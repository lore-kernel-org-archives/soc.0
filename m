Return-Path: <SRS0=Cn3K=OP=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3246BC3DA5D
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 11:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04B5FC4AF0A; Mon, 15 Jul 2024 11:03:56 +0000 (UTC)
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5222DC32782;
	Mon, 15 Jul 2024 11:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5222DC32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0A61311480D8;
	Mon, 15 Jul 2024 07:03:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 15 Jul 2024 07:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721041433;
	 x=1721127833; bh=MVFAcHhuDGzWslHu780vKn92UHoO+ZjE4u7m/bOKBVc=; b=
	F4nwxFBQKMiqkg7BP9IrjGQahfUg2LKcJKGaHhI2scNBzaHj8GFxtaTP2vbAxyav
	swjD1OyzTEdbgn36iXEGv3wTT2kyZ9jooY2leXkIi6rCgUiq6jkwzn7yCDdYc/h0
	i9b645HoaPsNRrkbl3Gil5nW+WkZckNwSqe3YC2XtmIZxW1tt/q1FuO+wFHhAkdu
	4heSMpfYd056f0uT0GEXsElrw6U/q/agXLoSTpfVLnc60F9a4uRKmNI1NGFYNwHq
	+eLlvFzNDODWk22Ev01WnPOhiPNL2ZAui5Ml4rk8bVkRjGf/V++eDe924367DiuT
	gznwRZuiBrg1Z6zuMdTwzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1721041433; x=
	1721127833; bh=MVFAcHhuDGzWslHu780vKn92UHoO+ZjE4u7m/bOKBVc=; b=I
	gvC7fELPfWPFKw5/jcrdUC33KMI4JSjo5NyQ1sCPnddzBjU7OlDpsEHlyUXvp5QR
	YdpSAtwp13BfTMchnp4wyFnYVx1/Spa5qsgtbQbYpNaxCBZIasbJk7+PoniCy6Ew
	z3yF2RrMDFBm6/F/R6wbNoDBILoXPB7XgeYyExR9CXrhvZ4TFFowOMunALUJZHNV
	aYZNnzHR5DHEX+aKwCeXN3A4yAvFsdQkrorOMBjQoUTThH81EbDsL1doqtwQkuQH
	n3QKbjh+oOjSA18bl1Lj4qzurQzLAA8JPqDeAevhQEAlMDqiKNtS91ADyFb9yfTr
	HlWn5jro9cjDjpUpWnPCQ==
X-ME-Sender: <xms:FwKVZqj8mVwh5WLtqXGqsqkCWSPv7bQPPxQl5y9tY1OGpvPs2ttFPQ>
    <xme:FwKVZrCfZamd9ktouvH3wP3RiR15XIJTVanctxOJtIPZVAnGJiAwyq3NrGL0gaSU7
    IrwzG8jftKrCPDui7U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgedvgdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeejgefhuedtjeejheduveegheevudffjeekhfevfefgtedtheegieeludefuedv
    hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:FwKVZiF2XTskTNpMIqdZKHXlxzVTXJGblJZxBCFbJRnFM21EYwJXmg>
    <xmx:FwKVZjRePAinb-gWx5k5WF6_c-ZIYl6SYxwWdg9AkZpf_u8HJOGDbg>
    <xmx:FwKVZnyYiupeJovzOoSOUIqoYL63elKliooMAw2WXiAs9eZJARf8hQ>
    <xmx:FwKVZh7xOP3lwlNk0PVMlaP47jO6Mk22EmUu5AlSMuB1_HQmCwDJ_Q>
    <xmx:GQKVZux1NhzOC8uSjhrtDU82h4wj7O9Wz_5XOha9ykl5MbA75cBccbLX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 68CF6B60093; Mon, 15 Jul 2024 07:03:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <4b4785ca-0fba-4227-8186-c5da08d38eb2@app.fastmail.com>
In-Reply-To: <20240715104723.17751-1-kabel@kernel.org>
References: <20240715104723.17751-1-kabel@kernel.org>
Date: Mon, 15 Jul 2024 13:11:09 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Andrew Lunn" <andrew@lunn.ch>, soc@kernel.org, arm <arm@kernel.org>,
 "Andy Shevchenko" <andy@kernel.org>, "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v4 00/19] Updates for turris-mox-rwtm driver
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024, at 12:47, Marek Beh=C3=BAn wrote:
> Hi Arnd, Andy, Gregory et al.
>
> this is v4 of series of fixes, refactors and cleanups for the
> turris-mox-rwtm driver.
>
> Changes since v3:
> - addressed Andy's recommendations. Some of them resulted in 2 new
>   patches (08/19 and 18/19). Im patch 10/19 I did not address Andy's
>   comment
>     "Actually you may do that without devm. There is a lookup method
>      or so in debugfs APIs that can be used. Can be amended later on,
>      though."
>   since I do not see how to use the debugfs_lookup_and_remove()
>   function without devm and get rid of the driver's .remove() method
>   at the same time...
>

Hi Marek,

The 6.11 merge window is now open, so I am not applying the
cleanup and refactoring patches for this release.

Can you separate the two and resend just the bugfixes so I can
apply them into a branch for 6.11-rc1? After -rc1 is out
with those fixes, please rebase the rest and send that got
inclusion in 6.12.

     Arnd
