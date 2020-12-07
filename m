Return-Path: <SRS0=s/rV=FL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB1FC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Dec 2020 07:46:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02872220B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Dec 2020 07:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02872220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LSYEJ/0u83AQ5alaW+60TVeNGcCSOxYxHy8k7trP7J8=; b=wgRY1YA6VYNp/uq31AxHXWm7B
	CcQ15osPM6NzW/jiKwjxCLOWkasJT1wzqkhxNopgVF/m+P3MbvxUsB7mNDbIn3zYbieyNxqbuCcRW
	/wdROaCfgPNOdrJ2a1mIw45T+ush17lCu1zjs2DRWwuOzfWVkr6Myr7zqHhlimY+qMtD2nH7msQRX
	GN3+Blv/T2XkHI8/GMILtNU2e6OnnTapP4BApfB1KoGnt1DB6PrNNDWm1nhUBbSIxS6VxCqfTx1t2
	RpKbQJWWPileJrnYVgIlnndBg9YyBOQ9q0qDeFbuLM3G6UPCjng/3UUO5LDaksP3FDi8nBNn614KG
	yXziwMsfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmBDV-00061Y-Gx; Mon, 07 Dec 2020 07:45:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmBDQ-00060J-Re
 for linux-arm-kernel@lists.infradead.org; Mon, 07 Dec 2020 07:45:49 +0000
From: Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL 2/2] ARM: dts: samsung: Third pull for v5.11
Date: Mon,  7 Dec 2020 08:45:28 +0100
Message-ID: <20201207074528.4475-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201207074528.4475-1-krzk@kernel.org>
References: <20201207074528.4475-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_024548_997567_4FD1EBCC 
X-CRM114-Status: GOOD (  10.15  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201207074528.LphfArDLhvBHv5NAdxDEoijgG25pb3vEXT4Tg_8vphg@z>

Hi,

On top of previous pull request.

I think the 2nd pull was not merged so it's message is here:

Samsung DTS ARM changes for v5.11, part two

1. Add devicetree of Samsung Galaxy Note 10.1 tablets
   (GT-N8010/GT-N8013), called P4 Note.  These are quite old but
   still functional devices, based on Exynos4412.
2. Minor cleanups in Odroid XU3 Ethernet.
3. Minor fixes: ADC io-channel-ranges and P4 Note touchscreen GPIO
   polarity.

Best regards,
Krzysztof


The following changes since commit afbd0bdebe0d82c4846dbbce53625110889c5de8:

  ARM: dts: exynos: switch Atmel mxt reset GPIO to active low on P4 Note (2020-11-22 12:36:11 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.11-3

for you to fetch changes up to 7995fb896b9637a5f59a56ae0d8f2b7ca71a040d:

  ARM: dts: exynos: Reduce assigned-clocks entries for SPI0 on Artik5 board (2020-12-03 22:42:12 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.11, part three

1. S3C bindings and DTS cleanup,
2. Correct the clock rates for SPI0 in Artik 5 which is a fix for recently
   introduced Ethernet on SPI on Artik 5 board.

----------------------------------------------------------------
Krzysztof Kozlowski (4):
      dt-bindings: arm: samsung: document SMDK2416 board binding
      dt-bindings: arm: samsung: document S3C6410-based boards binding
      ARM: dts: s3c24xx: add SMDK2416 board compatible
      ARM: dts: s3c6410: correct SMDK6410 board compatible

Marek Szyprowski (1):
      ARM: dts: exynos: Reduce assigned-clocks entries for SPI0 on Artik5 board

 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 13 +++++++++++++
 arch/arm/boot/dts/exynos3250-artik5-eval.dts                |  7 ++-----
 arch/arm/boot/dts/s3c2416-smdk2416.dts                      |  2 +-
 arch/arm/boot/dts/s3c6410-smdk6410.dts                      |  2 +-
 4 files changed, 17 insertions(+), 7 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
