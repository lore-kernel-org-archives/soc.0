Return-Path: <SRS0=kCD1=PD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F19FC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 16:41:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E1860E0C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 16:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48E1860E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kn9qJiCmllNs/FfYlVFj3T4R4iH4zmd2fMzxlUqUEfU=; b=Oh7D41+Wr4utQ4
	lIPb24XtyDfVrqJWHIuTPisf01IYvc1AsqiVh0jneFR2MjHa1SlZPmVhiQB7yFajjeHmE/gcIR6YP
	gmlp/20yXk8R06VnzM0YuB08HE1ZZcdkDeKsCKsPblnOMyzajnMKaCOhmTXhnDmBRi3kKXBRkJx14
	GALA4lWIEfKkm3z88D79RAdsqd/QV8o3Ei7XMHUlm4ObCzNtc9gn0njX8Sa/SWgZHSP5IFEhEdr4E
	nh3bewCi0OQHEDvqEdQcyuVVz4/GhsQq81H4BLnEdxU0d2cdM5fS78FKRY5opIllPNbelg0Llib4t
	1G44dPWepZIf/zYF5yxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbQFU-00885P-Mu; Fri, 15 Oct 2021 16:40:00 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbQFO-00883z-Ja
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Oct 2021 16:39:56 +0000
Received: (Authenticated sender: gregory.clement@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3790B1BF207;
 Fri, 15 Oct 2021 16:39:50 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: defconfig for v5.16 (#1)
Date: Fri, 15 Oct 2021 18:39:43 +0200
Message-ID: <871r4mmecw.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_093954_821121_95B1F4A3 
X-CRM114-Status: UNSURE (   6.12  )
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
Message-ID: <20211015163943.lbMHoX2obrOry3H53w5sDFlHwurRetCUfBp4EUsGB2I@z>

Hi,

Here is the first pull request for defconfig for mvebu for v5.16.

Gregory

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-defconfig-5.16-1

for you to fetch changes up to 8d41453493c28d489aeec583fcf3f9d9f4ef0b9c:

  ARM: mvebu_v7_defconfig: rebuild default configuration (2021-10-13 16:37:12 +0200)

----------------------------------------------------------------
mvebu defconfig for 5.16 (part 1)

Update defconfig and enable mtd physmap

----------------------------------------------------------------
Marcel Ziswiler (2):
      ARM: mvebu_v7_defconfig: enable mtd physmap
      ARM: mvebu_v7_defconfig: rebuild default configuration

 arch/arm/configs/mvebu_v7_defconfig | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
