Return-Path: <SRS0=rYkI=6G=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4104C636CD
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 13:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D72CC433D2; Fri, 10 Feb 2023 13:34:26 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0D58C433EF;
	Fri, 10 Feb 2023 13:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0D58C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id A16845C033E;
	Fri, 10 Feb 2023 08:34:23 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 10 Feb 2023 08:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1676036063; x=1676122463; bh=SWWz231xWC
	cewib2N3MKUCO8MUfeBPN4A1AV9apJ1uY=; b=pSHjvRh3WqGh2CHvueG3KCrKxk
	0T/WbJ9cCY8SeIvTKusfsOjj+Ujpp0gz3SA+V1zB/TPQDU2nkudITnbmgva9TitG
	Ri/JbBueTkt2B5SEwyBjpgWsb1jF2V2s9zqHN6LOfVURYnYTH1FyoOPTsTEP2u+p
	qm+EEUny9WfIiaIOQgUbAFwxryp4sJM/t+BLKwKDrUr5O0Yn+gESksmMmo5li2pz
	l3a0bZoilBR0VgJhpYkCpKXdW3VFUGQNb2RVDCOBRGI/QVfXcfLi0rtxUZYCKwfZ
	lIGdLDEHIY/twkmAGF97jDi/4w4pLGkg64+uw0nR5fr5RUDcBWbHjG/JPNwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1676036063; x=1676122463; bh=SWWz231xWCcewib2N3MKUCO8MUfe
	BPN4A1AV9apJ1uY=; b=tOT/xD/os/Td2BZCswtDfZWUDVGZ95fIZ0r5uwOr51fs
	p7tlH4yOBDx+0vl14W5aZtzNPQesNxKoLFyOxWgrS3jXNLf6P0A2HZ55Ou3h3LQ6
	F165QyTxf9QKZWn+RcftQnbk/sL7vFVngtAM5CDP32/YDzc1+BDy0TpB+/X+hBQt
	S6NnsiX4UZhI09M4S5Bk66gakuGI3d+85VFpATEEFlnar35fyFAW3vKW7z1jhLe+
	a2wG/37LeO7KvCR2o0hjqE4ulWHKiOJLVz5B9LsojxmPtbIueNQkHPsi/8uSsSJ7
	keQQqBkGiPnuPRLfuVIWIl1F71wNNmA6kuCx/gUpAQ==
X-ME-Sender: <xms:30fmY28i8QbMT-v0_8Q0CqsNNM4T8bqAMOToWd9ukUTwEm2h4HLwiQ>
    <xme:30fmY2t_5eFy5CSXXS_XCpjiBWoMAHkBrUqGDL4L3T52gZQlAfZXoViGynSJzRVID
    xBivP03gjJNnt38vFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehhedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:30fmY8C6NZfnmQKvEK9WwhiVQ5M80RDaklcMuUffUbzapJRpAQPZ5Q>
    <xmx:30fmY-dvjJW9ysGwuYTR42N8pKt_HhY3AR6_AzILWZsMwvt9_W2JMQ>
    <xmx:30fmY7PzjJCnZNUfe4AMpShA9kod1PTP0wUEZ_DXCj_FhrbiSBq1Qg>
    <xmx:30fmYwouB0vywNVcQlF2z8X8pQgJqqeGRmGJp8Ua0bCN88PZYXkn4Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2C4AEB60086; Fri, 10 Feb 2023 08:34:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <c67dff61-37a8-49a9-855b-c69fcf275f59@app.fastmail.com>
In-Reply-To: <20230203-arm64-defconfigs-v1-0-6d0d03a6dbd2@kernel.org>
References: <20230203-arm64-defconfigs-v1-0-6d0d03a6dbd2@kernel.org>
Date: Fri, 10 Feb 2023 14:34:03 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Mark Brown" <broonie@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 soc@kernel.org
Cc: "Mark Rutland" <mark.rutland@arm.com>,
 "Peter Zijlstra" <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: configs: Provide slimmed down configuration for guests
Content-Type: text/plain

On Mon, Feb 6, 2023, at 17:26, Mark Brown wrote:
> It has been noted that due to the extensive platform support it
> enables the arm64 defconfig is rather large and takes a while to
> build in comparison with other architectures which can be a
> burden when doing cross architecture work, especially when
> testing is mainly in emulation.  We can mitigate this by providing
> a configuration that only enables the support required to run in
> mach-virt, this will be much smaller and quicker to build.
>
> Having two completely separate configurations would mean that we'd
> need to make any changes to the architecture wide configuration in
> both the existing defconfig and the new configuration if we wanted to
> ensure consistent default behaviour.  We can reduce this by splitting
> the existing defconfig into a base fragment which enables options for
> the architecture itself and one for platform configuration which has
> all the platform enablement options, merging them to produce
> defconfig.  We can then add another fragment enabling only options for
> mach-virt and merge that with the base config to provide a new
> virtconfig configuration.
>
> The split of configurations is somewhat arbitrary, there will be some
> room for discussion there, and it may be that splitting things up in
> this manner is considered more trouble than it's worth.  If we're
> going to start doing this then there may also be some desire for other
> configurations. 
>
> This is based on current -next since it's very late in the
> release cycle.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

I definitely like the idea of splitting the platform specific
options from generic settings, that seems extremely useful. My fear
with your specific patch is that this will lead to the config
getting out of sync because it is very hard to compare the
contents with the 'make savedefconfig' output, at least with
the tools I usually use.

I wonder if we could get to a similar result by having 'defconfig'
still contain all platform support, but then use a fragment to
turn off most of the CONFIG_ARCH_* symbols which in theory
should also disable any platform specific drivers, provided
they have the usual 'depends on ARCH* || COMPILE_TEST' guard.

A related fragment we could have would be to configure anything
as built-in that is needed for booting a typical Debian rootfs
in a virtual machine, and then just run 'make Image' to boot
that without having to even build the modules.

      Arnd
