Return-Path: <SRS0=YjQ7=HI=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4D6C433E0
	for <linux-rockchip@archiver.kernel.org>; Sat,  6 Feb 2021 00:02:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 767F565014
	for <linux-rockchip@archiver.kernel.org>; Sat,  6 Feb 2021 00:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 767F565014
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=swVz1GiWoFYprC3zrB3budl2kIKcnoikAqKATCZDDYI=; b=ORaiICoJ7eHn4W/pO4FMZe41N2
	+9k6WMuv8/xi/UgUHGAmP5m0w8BQtY9Sg9w082X8KersKoiVGMBLNUN+RXrtqA77oIEFpECWOrLwe
	nbq6bBL4/jyQQxmjFoOXWutxlLRa1WTYwPPDKq62Nve4HUkwThaq+SSt+CfFpxUmYDulQ5Qt4oPLC
	TEi6ZkIyY4sXZCDuLpQio5xwZct5e6/G9QyC8wA2GtqHQb9A1g3iP22aZV2+QYoiqoBo8OEeH49g/
	gyvub59/OjXgeC98G93jd674elCYS4FwdiXBDLZe4ExDh3sH7EsBQ1Yz6m2SR+7NL+gA7ybV9GTBa
	l4Nos+XQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8B3j-00037N-QS; Sat, 06 Feb 2021 00:02:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8B3h-00036n-5n; Sat, 06 Feb 2021 00:02:41 +0000
Received: from p508fdf7d.dip0.t-ipconnect.de ([80.143.223.125]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1l8B3g-00051J-BB; Sat, 06 Feb 2021 01:02:40 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.12
Date: Sat, 06 Feb 2021 01:02:39 +0100
Message-ID: <2184150.ElGaqSPkdT@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_190241_254175_A8639831 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-rockchip@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Upstream kernel work for Rockchip platforms
 <linux-rockchip.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip@lists.infradead.org>
List-Help: <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: linux-rockchip@lists.infradead.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
Message-ID: <20210206000239.nHS7W26-4ytT_I0wDYLxiLicp-i1HTZ8n8nggAeJWno@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.12-rockchip-dts32-1

for you to fetch changes up to 1034e2b6b8435758c0d699b77761365fd09a5f4a:

  ARM: dts: rockchip: assign a fixed index to mmc devices on rv1108 boards (2021-01-26 00:31:23 +0100)

----------------------------------------------------------------
Fixed indices for mmc nodes; removal of obsolete amba bus nodes;
addition of nand flash controller odes to rk3036, rk2928, rv1108;
gpu node for rk3288-miqi and some cleanups to make dtbscheck happier.

----------------------------------------------------------------
Demetris Ierokipides (1):
      ARM: dts: rockchip: add gpu node to rk3288-miqi

Johan Jonker (5):
      ARM: dts: rockchip: add QoS register compatibles for rk3066/rk3188
      ARM: dts: rockchip: add QoS register compatibles for rk3288
      ARM: dts: rockchip: rename thermal subnodes for rk3288
      ARM: dts: rockchip: assign a fixed index to mmc devices on rk322x boards
      ARM: dts: rockchip: assign a fixed index to mmc devices on rv1108 boards

Robin Murphy (1):
      ARM: dts: rockchip: Remove bogus "amba" bus nodes

Yifeng Zhao (3):
      ARM: dts: rockchip: Add NFC node for RV1108 SoC
      ARM: dts: rockchip: Add NFC node for RK2928 and other SoCs
      ARM: dts: rockchip: Add NFC node for RK3036 SoC

 arch/arm/boot/dts/rk3036.dtsi     |  83 ++++++++++++++++++++-------
 arch/arm/boot/dts/rk322x.dtsi     |  32 +++++------
 arch/arm/boot/dts/rk3288-miqi.dts |   5 ++
 arch/arm/boot/dts/rk3288.dtsi     | 115 ++++++++++++++++++--------------------
 arch/arm/boot/dts/rk3xxx.dtsi     | 106 ++++++++++++++++++-----------------
 arch/arm/boot/dts/rv1108.dtsi     |  14 +++++
 6 files changed, 205 insertions(+), 150 deletions(-)




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
