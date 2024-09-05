Return-Path: <SRS0=zQxs=QD=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC91ACD5BB8
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 19:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4732C4CEC7; Thu,  5 Sep 2024 19:59:59 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75389C4CEC3;
	Thu,  5 Sep 2024 19:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75389C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCD7EE0003;
	Thu,  5 Sep 2024 19:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725566395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PaEVwI8SIDhsZjwFTiM6E6Aop21nF7kHvGWkD3z7b7c=;
	b=JlltqpiPDonUJx4MhlHGMVvw97qu7DaHsPXPBUpkI0wSGxLYrYcgcS7uE62bpRVzpk0xms
	BsWrhmVw/iZiP26ODUrrm74kGGF21mh9VkzHsrpwwlZGPfRV56f83bJUcb7VTqx1vqx6/V
	lblo8TwrJ5w59QdRmvoGjsD42dgF6QoSOmMfYI4DN7ipoAJ4wBblYJlp/pObPfhBv1MOib
	ri7dachGWIt1o5SoFCe0x4bxlzbudoN3JCAoxakWSb7I5Pmu12hXrkzQV91Sh0AaK48mOb
	/hjMyX63tK6VqPDUG5QPWYpK2tFnadojcG7SJPg8ONWlpRReYYN/eirBOpKRgQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v6.12 (#1)
Date: Thu, 05 Sep 2024 21:59:54 +0200
Message-ID: <871q1xrhvp.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for arm for mvebu for v6.12.

Gregory

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-arm-6.12-1

for you to fetch changes up to dea56c781ed3d1621b7a8fb7707037f644847c42:

  ARM: dove: Drop a write-only variable (2024-09-02 16:11:28 +0200)

----------------------------------------------------------------
mvebu arm for 6.12 (part 1)

Fix a few warning error with W=3D1
Switch orion5x to new sys-off handler API

----------------------------------------------------------------
Andrew Davis (1):
      ARM: orion5x: Switch to new sys-off handler API

Uwe Kleine-K=C3=B6nig (2):
      ARM: mvebu: Warn about memory chunks too small for DDR training
      ARM: dove: Drop a write-only variable

 arch/arm/mach-dove/common.c                    | 4 ++--
 arch/arm/mach-mvebu/board-v7.c                 | 3 +++
 arch/arm/mach-orion5x/board-mss2.c             | 2 +-
 arch/arm/mach-orion5x/dns323-setup.c           | 6 +++---
 arch/arm/mach-orion5x/kurobox_pro-setup.c      | 2 +-
 arch/arm/mach-orion5x/mv2120-setup.c           | 2 +-
 arch/arm/mach-orion5x/net2big-setup.c          | 2 +-
 arch/arm/mach-orion5x/terastation_pro2-setup.c | 2 +-
 arch/arm/mach-orion5x/ts209-setup.c            | 2 +-
 arch/arm/mach-orion5x/ts409-setup.c            | 2 +-
 10 files changed, 15 insertions(+), 12 deletions(-)
