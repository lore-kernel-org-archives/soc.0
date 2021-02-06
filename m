Return-Path: <SRS0=0nBm=HI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1963CC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 00:03:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 693116500F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 00:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 693116500F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=raowJJvY5wyObutL9O2LbLHIIpjL1tfREUM43KaIXEk=; b=SGkOF1Q2gG3UB/IJy0WP56pzg1
	4lqVRcYFmTRaGIPajIG4LjZiEFooGdNC3QUV5ZzA5heWrF7s7VeQzzMTmgO3Mf4ju8uUZwyriHPcp
	0Ro5+HvfY+RnK077/k1+UdpYM1qQtgAbzW94bHexZr3QD/oEcqt+WWdZlWt9+M/rHOQaz2acAURgR
	4mdnZLH8zI/ZMli4VvvTd8mBaoAmU3ZDKUkhqgkwNjdYgXxkx2gLfqzOkhLQQDEG6BIXoolS9WMYh
	MO2109dfFH4LvKASGeDHbizbs0CZ63AklRDJUtKshy3nUJVWpQifUegap/9Y2h1ewtuKgHBT2oaX4
	SYvXcerw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8B35-000330-K4; Sat, 06 Feb 2021 00:02:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8B32-00032K-68; Sat, 06 Feb 2021 00:02:00 +0000
Received: from p508fdf7d.dip0.t-ipconnect.de ([80.143.223.125]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1l8B2y-00050v-Lj; Sat, 06 Feb 2021 01:01:56 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 5.12
Date: Sat, 06 Feb 2021 01:01:56 +0100
Message-ID: <4622596.31r3eYUQgx@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_190200_288651_D2F97CCF 
X-CRM114-Status: UNSURE (   8.83  )
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
Message-ID: <20210206000156.N0yW3CqZUFqORFEg9n1HsWnGYta92F5JA_5Xk-70H64@z>

Hi Arnd, Kevin, Olof,

please find below and in the next mails Rockchip changes
targetted at 5.12

Please pull
Thanks
Heiko

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.12-rockchip-defconfig64-1

for you to fetch changes up to 3c8e5d51e4c6e5e93d31f59d4a54fb3a14358ee4:

  arm64: defconfig: Enable REGULATOR_MP8859 (2021-01-09 15:09:49 +0100)

----------------------------------------------------------------
Enable REGULATOR_MP8859 - the main power supply for one Rockchip board.

----------------------------------------------------------------
Jagan Teki (1):
      arm64: defconfig: Enable REGULATOR_MP8859

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)




_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
