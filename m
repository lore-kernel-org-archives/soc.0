Return-Path: <SRS0=kCD1=PD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0C7C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 16:39:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A87B61181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 16:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A87B61181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w8XRTGrWDu8JiYZHiPZPaVTLUhXgDjHg7Ep1nx7/fTo=; b=xcOdQZkSWArETH
	8j3u/CUyYW8Z++E6f+w64DC8jTVwfl7tOvzX8Ap0auh92Ryy0YT6JUIbGeb3rlBgAa9Cw+CGWcP41
	+oUEoSBH19/fV4EZDNcIrBBak7oMfTXcudcyv/CMFPb8YVX03NPGV3rc2aJ7QExcXk9pSw7fXu/ss
	5vVsRdhQE+7ijSItT5NabiSJbBJ2Opq9054M8Od0DKjoJaGkIjKqsFgzSZDqkeC9H/zWQ7PogZTyD
	/Jxfxg7SI+/kYGsR5yI/bth0hEWReGaHRuV/q71fu08XcVPO6oOuDTn4FVcf2nn7hp3m6fKhhoZ1q
	yN+aeIN39Ls0aR82jw6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbQDj-0087du-Ga; Fri, 15 Oct 2021 16:38:11 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbQDg-0087d9-7F
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Oct 2021 16:38:10 +0000
Received: (Authenticated sender: gregory.clement@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 057FA10000A;
 Fri, 15 Oct 2021 16:37:59 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.16 (#1)
Date: Fri, 15 Oct 2021 18:37:53 +0200
Message-ID: <877deemefy.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_093808_441440_D15F6510 
X-CRM114-Status: UNSURE (   7.50  )
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
Message-ID: <20211015163753.UpwR1XKCDqpgTRRAr0BGaIeM3IgnXYwc9ZCnEg2j9B4@z>

Hi,

Here is the first pull request for dt64 for mvebu for v5.16.

Gregory

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-5.16-1

for you to fetch changes up to 73792919128304938412194d047be3c61cccc76d:

  arm64: dts: marvell: add Globalscale MOCHAbin (2021-10-13 16:45:59 +0200)

----------------------------------------------------------------
mvebu dt64 for 5.16 (part 1)

Add support for Globalscale MOCHAbin an Armada 7040 based development
board.

----------------------------------------------------------------
Robert Marko (1):
      arm64: dts: marvell: add Globalscale MOCHAbin

 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 .../boot/dts/marvell/armada-7040-mochabin.dts      | 458 +++++++++++++++++++++
 2 files changed, 459 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
