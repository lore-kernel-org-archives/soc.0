Return-Path: <SRS0=+Xhu=LQ=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F1CC2B9F4
	for <linux-rockchip@archiver.kernel.org>; Tue, 22 Jun 2021 13:26:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A494E6113E
	for <linux-rockchip@archiver.kernel.org>; Tue, 22 Jun 2021 13:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A494E6113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tt28PZsfGDIQHrkKX6i8b3KKGUicBKHqpvk4x0Y3E/0=; b=fb57jcGawgScK+
	wKX3u4fgQSEhTCgHdkT7X0xzyxhTScipnQYXc7ZMp9+W7nfuWuqCN2u4jJ6fTuI9i2HwJvdvBGK1q
	1KottJ3qMbl89E3uQscr47QnBTisG4GRwLdJOb1DMAHvJy0KiGv0POj2Rm+XsfIZyEepjrW5nMBnS
	rp4soz6VHmMOiBna0jkU+GwCf9IgtGpXfBToinh7tTLbF7UVpg12ZIXt+GNsO0pWwqbNnZ62Xf74g
	JYxSUxKILrvwond45WNwsbVAGkwpeLr4AUYq0zkIXpz/AguN/qDCA9te8P4Wk7NENBvi7eE/iixNb
	sUr3vtNkh2EHJbHwbJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvgPc-007IVv-8A; Tue, 22 Jun 2021 13:25:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvgPZ-007IVN-Eo; Tue, 22 Jun 2021 13:25:54 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lvgPY-0003up-9M; Tue, 22 Jun 2021 15:25:52 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.14 - #2
Date: Tue, 22 Jun 2021 15:25:51 +0200
Message-ID: <4876354.ZzFAyJQhcr@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_062553_555175_C2018261 
X-CRM114-Status: GOOD (  10.86  )
X-BeenThere: linux-rockchip@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
Message-ID: <20210622132551.UHccTZgajAjHD3KrOtm1wdxHfCCAgVe7x5qPU3ff43c@z>

Hi Arnd, Kevin, Olof,

another late (and now final addition) hopefully for 5.14.
Basic support for the new rk3568 SoC released some weeks ago.

The core dtsi and evb support is isolated from the rest of course,
so hasn't really the capacity to break anything else and the yaml
dtbscheck was happy with the addition as well.

So if it's still suitable, please pull.

Thanks
Heiko


The following changes since commit eb607cd4957fb0ef97beb2a8293478be6a54240a:

  arm64: dts: rockchip: Re-add regulator-always-on for vcc_sdio for rk3399-roc-pc (2021-06-19 23:55:10 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.14-rockchip-dts64-2

for you to fetch changes up to 01610a24cefa182b155a17e38cd0b84f8a3f0529:

  arm64: dts: rockchip: add basic dts for RK3568 EVB (2021-06-22 12:21:55 +0200)

----------------------------------------------------------------
Basic support for the new rk3568 soc.

----------------------------------------------------------------
Liang Chen (3):
      arm64: dts: rockchip: add generic pinconfig settings used by most Rockchip socs
      arm64: dts: rockchip: add core dtsi for RK3568 SoC
      arm64: dts: rockchip: add basic dts for RK3568 EVB

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   |   79 +
 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi   | 3111 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |  593 ++++
 arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi |  344 +++
 6 files changed, 4133 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
