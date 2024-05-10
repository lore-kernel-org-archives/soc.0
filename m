Return-Path: <SRS0=8K98=MN=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B4DC25B74
	for <soc@archiver.kernel.org>; Fri, 10 May 2024 21:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C65EC2BD11; Fri, 10 May 2024 21:12:58 +0000 (UTC)
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87727C113CC
	for <soc@kernel.org>; Fri, 10 May 2024 21:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87727C113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B6B9611400D1;
	Fri, 10 May 2024 17:12:56 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 10 May 2024 17:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715375576; x=1715461976; bh=+A04hSqDZA
	fectEaYhevQbQt0vFNJTAi4AGu5xEjLfA=; b=i3udHqODbkODbXptIFeddoxgHF
	tFGEh/0FArlo2trZdU5uqsfAuZl+BHQdTTRoHYNgdfKScnrRqYoglQmAEorZqSUf
	SrVz4RR6wzsQ8wW58KBgrBnR/smNoAYyvCnX09UclSes2pN+Zw4J/wid05cjduCG
	f/matfYQTt913t+ehYTTd7ACUG0/5csSPlWpWB8lV5YW7u8lea8l9G1ebh60pgVC
	jz9pdgegVJiNyE9vOg1Q6tPjLVpaVgbea/dmBPvTH6iFo6kCSNutXcqYYOVRBSDj
	aSqCG9Y99KadtEa3hrvAffB4egqbPjaOh2xYrHUNeGVrcMyjDEwzz5TMjKgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715375576; x=1715461976; bh=+A04hSqDZAfectEaYhevQbQt0vFN
	JTAi4AGu5xEjLfA=; b=ATiCSB+wTsfOUI0nkbRZTn/iCLWw+g0vKfVAI68h2PUp
	v49GQtMAA6fF4j/273y5jcTraO3xBfaq+0bMKk5T6h8xYf65dbS8FViUKZA9q77y
	yk0NSFZtMjEaxIamHI6JuAGIvVxrkikYv2Dwt4+h1ELfhARaQ0dVqkBQ+E9QFUXY
	fmR+mwUF+4SFbqRoLER/vqM5VCdPqryuNHjYQGCdhxqLpCCeeK7wTtVJktpsaHhu
	lmHsVDlrPqeOsadjsmx3eEsr9HiZqv5wVzJOOwe2JlYNDR5P0MK33/t0O7WcFLN6
	ec2SuW/gf6Di08mhu0u1k8soPyLan+IhGJpIwwFREQ==
X-ME-Sender: <xms:2I0-Zs3XPeZpCNrbvAWoDRlTUpPfwSz4jSvBH23MZEIjASi6MXp3Zg>
    <xme:2I0-ZnEsKZe3voudtPN7rbjpUJwEqru8kAGPwZHaiNC2kJLV9fwl36zVd7BbZUKb_
    asBD4Dd3Z1BR_hsYvo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefkedgudehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:2I0-Zk7KAUjSqsYxkkysamZNh7aIoKOTC_Sa7AC2KNwa8E9Ho6mtFA>
    <xmx:2I0-Zl2jUK35iJcfFmTCNX793ULkNDiXeg1vRLkftx-sAylE6rSNAQ>
    <xmx:2I0-ZvHgGro0z1qbAz78L_szkgBDwGMs6_qbrEozj4hmbEL8cDvrbw>
    <xmx:2I0-Zu_onECDtITEoO5TFZxIXfDWx-mBhn8XYmlyAB-FY0eFOkQoLA>
    <xmx:2I0-ZnDdGcq8nhxotnDycL4AAQx49G7_uiliRC1DUYMyUbMfV4JGcy-o>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7105EB6008D; Fri, 10 May 2024 17:12:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
MIME-Version: 1.0
Message-Id: <0d70e9ef-5291-4134-b41f-183b1233b39b@app.fastmail.com>
In-Reply-To: <fa20b5a4-a131-49b4-9597-15886435a288@app.fastmail.com>
References: <fa20b5a4-a131-49b4-9597-15886435a288@app.fastmail.com>
Date: Fri, 10 May 2024 23:12:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] soc: arm code changes for 6.10
Content-Type: text/plain

The following changes since commit fec50db7033ea478773b159e0e2efb135270e3b7:

  Linux 6.9-rc3 (2024-04-07 13:22:46 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.10

for you to fetch changes up to 428ae88ef519f2009fac37563de76ffa6f93046f:

  arm64: add Airoha EN7581 platform (2024-05-10 15:56:20 +0200)

----------------------------------------------------------------
soc: arm code changes for 6.10

The code changes are fairly minimal, there is a bit of conversion of
the old orion5x platform to modern gpio descriptors, the Kconfig entry
for the added EN7581 platform and a sysfs change for the i.MX PMU
device.

----------------------------------------------------------------
Arnd Bergmann (2):
      Merge tag 'imx-soc-6.10' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into soc/arm
      Merge tag 'mvebu-arm-6.10-1' of git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into soc/arm

Daniel Danzberger (1):
      arm64: add Airoha EN7581 platform

Jonathan Cameron (1):
      ARM: imx: Assign parents for mmdc event_source devices

Linus Walleij (5):
      ARM: orion5x: Convert D2Net board to GPIO descriptors for LEDs
      ARM: orion5x: Convert DNS323 board to GPIO descriptors for LEDs
      ARM: orion5x: Convert MV2120 board to GPIO descriptors for LEDs
      ARM: orion5x: Convert Net2big board to GPIO descriptors for LEDs
      ARM: orion5x: Convert TS409 board to GPIO descriptors for LEDs

 arch/arm/mach-imx/mmdc.c              |  1 +
 arch/arm/mach-orion5x/board-d2net.c   | 16 +++++++--
 arch/arm/mach-orion5x/dns323-setup.c  | 63 ++++++++++++++++++++++++++---------
 arch/arm/mach-orion5x/mv2120-setup.c  | 29 +++++++++++-----
 arch/arm/mach-orion5x/net2big-setup.c | 21 +++++++++---
 arch/arm/mach-orion5x/ts409-setup.c   | 25 +++++++++-----
 arch/arm64/Kconfig.platforms          |  7 ++++
 7 files changed, 124 insertions(+), 38 deletions(-)
