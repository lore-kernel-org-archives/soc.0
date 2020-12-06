Return-Path: <SRS0=Jg7J=FK=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE80C4361B
	for <linux-rockchip@archiver.kernel.org>; Sun,  6 Dec 2020 18:31:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC00D2311B
	for <linux-rockchip@archiver.kernel.org>; Sun,  6 Dec 2020 18:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC00D2311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ptUeZvhFfrPAVKotIGdqE+3FZ1uoJAto9VFk+nHUa9w=; b=MzjLgKsbLSgP2/1oWkMsy10GcS
	E4LfP2p3L9LXXzdoJeFleKOMlTTlZe33GZJCh7ELH2G12QbATzeGzl1iUP1keutYyB4U+f1lnYNUu
	Qje4H0SS1RG5BQY2fpIiJ85odHwOOYZKzXKChJQ65cUxPKFy0JgIVfZXxMRC7jWht6n2X9Y9lioOe
	Uj5JIeuO64qR50i2MX3mOLUtnVBVdXNtKCBARnHDSQEjgDNKQNcPDnnebGyfHD5lq/tLMzzyCYALg
	3nCdMRee7bv+6IkbJVC77UkVq4pzxAMw2eFRx4ebLn/46PFFtbHaFJC0X2WXQHgImGlDzi/nyvAKA
	AoHENgrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klyoz-0003AB-Tg; Sun, 06 Dec 2020 18:31:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klyoy-00039f-OC; Sun, 06 Dec 2020 18:31:45 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1klyox-0003wQ-9t; Sun, 06 Dec 2020 19:31:43 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.11
Date: Sun, 06 Dec 2020 19:31:42 +0100
Message-ID: <4582475.GXAFRqVoOG@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_133144_832261_9EFFDBAA 
X-CRM114-Status: UNSURE (   9.80  )
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
Message-ID: <20201206183142.-IsJIYF3WZ1YI76CRO1Q_S5XlYHRwsaFhqshJirRwZA@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-dts32-1

for you to fetch changes up to 29952fea5e85083374d19cb0a33206962e087d5b:

  ARM: dts: rockchip: Add SDIO0 node for VMARC SOM (2020-11-30 14:30:56 +0100)

----------------------------------------------------------------
Veyron backlight fix, another fix for dtbs-check and some additions
to the rk3288-based VMARC boards.

----------------------------------------------------------------
Alexandru Stan (1):
      ARM: dts: rockchip: Remove 0 point from brightness-levels on rk3288-veyron

Jagan Teki (2):
      ARM: dts: rockchip: Add rtc node for VMARC SOM
      ARM: dts: rockchip: Add SDIO0 node for VMARC SOM

Johan Jonker (1):
      ARM: dts: rockchip: rename wdt nodename to watchdog on rv1108

 arch/arm/boot/dts/rk3288-veyron-jaq.dts            |  2 +-
 arch/arm/boot/dts/rk3288-veyron-minnie.dts         |  2 +-
 arch/arm/boot/dts/rk3288-veyron-tiger.dts          |  2 +-
 arch/arm/boot/dts/rk3288-vmarc-som.dtsi            | 40 ++++++++++++++++++++++
 .../boot/dts/rockchip-radxa-dalang-carrier.dtsi    | 21 ++++++++++++
 arch/arm/boot/dts/rv1108.dtsi                      |  2 +-
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     | 16 +++++++++
 7 files changed, 81 insertions(+), 4 deletions(-)




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
