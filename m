Return-Path: <SRS0=Jg7J=FK=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A5FC433FE
	for <linux-rockchip@archiver.kernel.org>; Sun,  6 Dec 2020 18:32:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8DE02311B
	for <linux-rockchip@archiver.kernel.org>; Sun,  6 Dec 2020 18:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8DE02311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pA9PUgVKnkj0M4Z2K8tCfjBXq0OdUHrh9esZhD/hjt8=; b=gIfJs0jQaLO41DHyr4sa9/SWq6
	tPR3fvJIPf+XBj/J4yjZUpwnlB2M6BBnKTU4srs1t5wJdkdEdNQjTHZiMUa25yPpjv+nAb9yidBXb
	GsLn8eRTU43AHGSAEC/gJeUgrBHPNcoKY9x+3ikmPkUrNUecKS9+VrqxJZeHReaSgnx6IH247yegj
	roxcvw0b5Ae8aEum/sRr/XFt6mZqU759V7NuwSrwgM6Rvv7aXUFhnX9+JzaDBC6oZditQ0exEEWjG
	pgtsOur9yi2DPEJlpYmX0p8GE3bGZujK/k2BHPUi8qg/4zs98yFjIzUkOQzQPrOofHA9Px0nH1XIg
	CB53DBlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klypq-0003MD-RZ; Sun, 06 Dec 2020 18:32:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klypo-0003L8-Rd; Sun, 06 Dec 2020 18:32:37 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1klypn-0003xT-WC; Sun, 06 Dec 2020 19:32:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 5.11
Date: Sun, 06 Dec 2020 19:32:35 +0100
Message-ID: <2750818.e9J7NaK4W3@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_133237_012966_F63C0DF3 
X-CRM114-Status: UNSURE (   8.38  )
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
Message-ID: <20201206183235.Hbt49sB2Hfos5r30g1dlhUL3WhFlQOLNJyIn0cHIzIY@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-defconfig64-1

for you to fetch changes up to eeffc0fbd022422777b91cdfa0e12ba2bcd6c5e7:

  arm64: defconfig: Enable RTC_DRV_HYM8563 (2020-11-30 22:23:58 +0100)

----------------------------------------------------------------
Some additional modules needed by Rockchip-based boards.

----------------------------------------------------------------
Jagan Teki (4):
      arm64: defconfig: Enable ROCKCHIP_LVDS
      arm64: defconfig: Enable PHY_ROCKCHIP_INNO_DSIDPHY
      arm64: defconfig: Enable USB_SERIAL_CP210X
      arm64: defconfig: Enable RTC_DRV_HYM8563

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
