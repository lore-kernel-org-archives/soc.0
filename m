Return-Path: <SRS0=0k5v=FK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B270C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Dec 2020 18:33:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1394223E0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Dec 2020 18:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1394223E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Te0blF5/wav/gPGTp41xq1npH7n0nduvxldkNEOxpwo=; b=0L0/z3q+1Jb6isrPPaUoISzuSB
	Etn0jx9mx7cdGPm2F0370udZk94EfZXafOPfpOg/2gu7G0zLJf8HUjloHRxCnNIHBfrMmJLYWwLaw
	9IjVmcB0FeQHhhsdIyfl0VeuKy0ksi4BRgNyHUI3z6jTCqePI1eAjFAgZg8Ohkt8pBR9vQmWRHvTL
	WogjzdAAYs4Ww3iANmUnMETAetF4ocPeZLXc9tuxR0WGg0bV9VR686dnUZmN0V1RscP7JBN2F1QxV
	gvrGjFMzGj102Kv1e6tQfhThKG/dVVktJgH59MUsCWWa4fy9EB+0TS7xJEl2JwYULcudjE+zD9AAe
	mhGV7kkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klyps-0003MY-87; Sun, 06 Dec 2020 18:32:40 +0000
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
List-Id: <soc.lore.kernel.org>
Cc: linux-rockchip@lists.infradead.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201206183235.om42-mDrdbZm3DHTy2QdaHVeYf4k2n8Bq7VYc4E1vz0@z>

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
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
