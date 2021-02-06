Return-Path: <SRS0=YjQ7=HI=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B49C433E0
	for <linux-rockchip@archiver.kernel.org>; Sat,  6 Feb 2021 00:02:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3B7E6500F
	for <linux-rockchip@archiver.kernel.org>; Sat,  6 Feb 2021 00:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3B7E6500F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qXBTqjip6TuFj5RqJrFaiukCypA5iOTrLCu9YNMglEc=; b=P5v+1BGl/C/3JsbFzULiVpYsBD
	7Aen6tYdUypdwtpNpZKK3IM/WZx8F3dBEdWTHM6bO3RBXL+4mEx6C9iTlyE9lYcMr/+XIWzQkj8Cp
	PAjfcXHMqq56S3vRmNY2dHYcx0/QAwo7rKoPqUVvBzghuDF5NueHP1TjZ8JH+K2DK4wAwOSPrzewW
	sCrzxioYnKHokPVC5lOYQhQujMqO3oNj33xEdehhVmfDZXmaM1balk4a7BmcmuRXXDYqDobx2biB+
	ou9WLKN0vhdEQX3CB7cVnqZuSoEbM6f7Y/Y/FxU853fLcdNPR4sb4RHW6uJ+OVlBNV2S63dwYbMD+
	KnOsEsIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8B34-00032t-Eb; Sat, 06 Feb 2021 00:02:02 +0000
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
Message-ID: <20210206000156.HabIxGeph2mOLMt1Q6HuOHKttpKonYYtvaeCs7CFaTM@z>

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
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
