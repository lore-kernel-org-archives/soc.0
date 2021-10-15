Return-Path: <SRS0=kCD1=PD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AD6C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 16:40:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7131961151
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 16:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7131961151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oWcG2iQ3nbWGs9Q95bh83UONnZ0u0P2iXzPocz1UKk8=; b=c7m+tuOA4Cpo5W
	Jk6eqAwkefLnrgYiYhY67v1kRUONzEWUke1PIxDZrUZdLZWluAMbNHNDyKkgTexboM0r4NQGAMbcq
	IHwSn54zYPXeoFUJom1HgqFA+I6GWMafgNwTSnpZg0gVvobzn0b81AVc2H/oX26VimagHu8Dod9md
	jUE93tR9D+FCP+2+9tQm6KFgYgdZkv488YHP8dIvQVO0zeg784DWQhAWhwFqKEmfr4+je6qRaGbUV
	ooserZYElY9pLELBQ2Gj+1JSQkkzrrr2QCY8imiH6Aq8Ww9/1hx9CdCogf1lRVlKy8eCD06JNxEQC
	nPTn6OUdOaKuYT0VYfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbQEZ-0087oC-4n; Fri, 15 Oct 2021 16:39:03 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbQEU-0087mv-7Y
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Oct 2021 16:38:59 +0000
Received: (Authenticated sender: gregory.clement@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A77CB60009;
 Fri, 15 Oct 2021 16:38:52 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v5.16 (#1)
Date: Fri, 15 Oct 2021 18:38:42 +0200
Message-ID: <874k9imeel.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_093858_430495_6D28D767 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211015163842.KQBNs-MLrLofMEqQ6Wl16B_sbYArt9O8G9T8EuND1Fo@z>

Hi,

Here is the first pull request for dt for mvebu for v5.16.

Gregory

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt-5.16-1

for you to fetch changes up to bf05b706a6eaf769b7a99c475ac702b7e29fc25a:

  ARM: dts: mvebu: add device tree for netgear gs110emx switch (2021-10-13 16:41:44 +0200)

----------------------------------------------------------------
mvebu dt for 5.16 (part 1)

Add support for Netgear GS110EMX switch (Armada 381 SoC based)

----------------------------------------------------------------
Marcel Ziswiler (1):
      ARM: dts: mvebu: add device tree for netgear gs110emx switch

 arch/arm/boot/dts/Makefile                        |   1 +
 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts | 295 ++++++++++++++++++++++
 2 files changed, 296 insertions(+)
 create mode 100644 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
