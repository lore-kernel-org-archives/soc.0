Return-Path: <SRS0=saM5=2P=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA0FC4332F
	for <soc@archiver.kernel.org>; Fri, 14 Oct 2022 20:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04219C433C1; Fri, 14 Oct 2022 20:32:44 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7AC1C433D6
	for <soc@kernel.org>; Fri, 14 Oct 2022 20:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7AC1C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 9A23B5C0092;
	Fri, 14 Oct 2022 16:32:41 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 14 Oct 2022 16:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1665779561; x=1665865961; bh=oEDP9aG5CrkRtLCkw8d1OJf/8pNCXIne26s
	1w7BJCHY=; b=ONe1ZQXyrWjyKLtQbEMhGqJCI/hJGl9q6xey/GyOuYbbYNZVpYS
	pb2i34uR7lytiiLijCzICcLtffQSz/04EKJ8T2eCCOc7BT9756i0JM20R9iXSc1T
	LeNJl6S+8CjKzSAKKedEurU+UcjsX7qb2y+765MY1JMUTJliFsiQ3TOh9tnNi+l4
	YjvIMC6KIbLF+OJoeV+wv+0VgIBoNPWZDYqJyz7Fol85LhlVEN59naeRMr+77JUX
	uKgYuR5idg5Qmnxa7bV1YFHuR7sDlXarMi/hktgWlU5IBBRYVMGFHGnD3+v096vO
	Igto9WtXYjJLCJB8qxz4+R/9NZx2elzn/Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665779561; x=
	1665865961; bh=oEDP9aG5CrkRtLCkw8d1OJf/8pNCXIne26s1w7BJCHY=; b=Q
	5d3K9lOndHgqUu5SAaSb+OiinV/dOUQAStfp76Q4jytRFnAxWHx0e1rSDqSEXOdz
	csPCSntckBbin2eU1J94ZrBiZhe0JhsgGlYhXG1QZYqtug7vm0j/2APKDjy8qFUZ
	J2wCOUCmDBU99sRJYRlwLefNisJQewk+lcx+3AiQ8w7YSVzHLWBsWoW6cLq6ZAyF
	hTA7NNq9LDX2Rh95Dp5jg0D7RIWTI0lxNxLNlj0FfoDBo+4bomHmEKLIctVxLAng
	Eda7Rd4QOPj7WMRUniFC9UxcOYVKIZ+CJMxznxv6WpW6uNFCZ5SPyGUguQukw7gD
	ztlAZbWwwCWGal7PUirBA==
X-ME-Sender: <xms:acdJY3xDdJk0rLbb-zgYWwtW7USZZ8lswZLItQV8F5tiNkX5gwjYUw>
    <xme:acdJY_Q_aNHoJ_QzypZLzAkjmxBr2IeJ9shsf_sE2caVSG8lWBdEz3uJFN8DkZA5a
    CFxAGEdU2mniqKb1p0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekvddgudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeeffeeuhfekjeevtddvtdelledttddtjeegvdfhtdduvdfhueekudeihfejtefg
    ieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:acdJYxXLKFdKEy0jrq5pB9kHsq5i26Ug_ymOtCejbVna2hHhlv90rg>
    <xmx:acdJYxjCEnWGQRqufb7C2WthVvSdMeeE6pbGETyyhfAb0MOHv9GCJw>
    <xmx:acdJY5D4wa2dzTjn8UrZvFGc70kxcng_bUQC6KV1MhxozAqzIgtpcQ>
    <xmx:acdJY274xs5d234ODovgpMBxFlz-2q9D8zeHe21lZwmX_1UQAqpNlw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 42B05B60086; Fri, 14 Oct 2022 16:32:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <02915464-9faa-46f4-995b-d7c11638d3c1@app.fastmail.com>
Date: Fri, 14 Oct 2022 22:32:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: SoC fixes for 6.1
Content-Type: text/plain

The following changes since commit 4fe89d07dcc2804c8b562f6c7896a45643d34b2f:

  Linux 6.0 (2022-10-02 14:09:07 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.1-1

for you to fetch changes up to bd60aafce5e1943fd395b8bf726e9824fa621eca:

  ARM: mmp: Make some symbols static (2022-10-10 10:40:10 +0200)

----------------------------------------------------------------
ARM: fixes for 6.1

These are three fixes for build warnings that came in during the
merge window.

----------------------------------------------------------------
Chen Lifu (1):
      ARM: mmp: Make some symbols static

Viresh Kumar (2):
      clk: spear: Move prototype to accessible header
      ARM: spear6xx: Staticize few definitions

 arch/arm/mach-mmp/devices.c        |  8 ++++----
 arch/arm/mach-spear/generic.h      |  3 ---
 arch/arm/mach-spear/spear3xx.c     |  1 +
 arch/arm/mach-spear/spear6xx.c     |  9 +++++----
 drivers/clk/spear/spear3xx_clock.c |  1 +
 drivers/clk/spear/spear6xx_clock.c |  1 +
 include/linux/clk/spear.h          | 14 ++++++++++++++
 7 files changed, 26 insertions(+), 11 deletions(-)
