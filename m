Return-Path: <SRS0=MvIc=OR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA16C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 09:45:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E00D661157
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 09:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E00D661157
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bJ/GAUXNxCGCgcckGk5S3e8NkAY4+sNOXbe8qqmRWn0=; b=jkFxIq38ss/H/d
	U/1jMPdiKP3lg82vEohi2018pljZ260fUhxQ04doXKpkKTgaEiqStABvFyagDiqgFze6srHwq9tZ0
	leyBieoEumIBqrQX+QsEJyKielEHJl0i/ZlH7axX6lbmShuRzT873W1wRuKfQ8oXQAJWnQmpkuWdC
	t40vv51lVc+9cg4/Bqkc0RLeirypu8lrwARqIdxOm9HMuugzn97Xkq6VOUtGPhoCb7PsLeGDnyNI5
	/xRwsUacp22s9OIGuX+mAt9qGeiZgz6+6W+hEMzkP+Jazw7q2iVHaGMTT6Nz59qocvCfi2sJweC8J
	57mTxbi4tND8+YwPg+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUnAZ-002CJs-8D; Mon, 27 Sep 2021 09:43:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUnAV-002CIJ-03; Mon, 27 Sep 2021 09:43:28 +0000
Received: from user91-192-32-221.grape.cz ([91.192.32.221] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <heiko@sntech.de>)
 id 1mUnAT-0002DE-Ta; Mon, 27 Sep 2021 11:43:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.16
Date: Mon, 27 Sep 2021 11:43:25 +0200
Message-ID: <5121280.Lt9SDvczpP@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_024327_073055_DA84C0B4 
X-CRM114-Status: UNSURE (   9.11  )
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
Message-ID: <20210927094325.1HDX0AseQzMBpBFadCGxXva-Tu8nIjxNAWy6znz_oN8@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.16-rockchip-dts32-1

for you to fetch changes up to 3e6f8124a78840d074fab36853ee1f5a2e7cffe5:

  ARM: dts: rockchip: swap timer clock-names (2021-09-20 15:22:48 +0200)

----------------------------------------------------------------
ADC-keys for the mk808 board and a number of further cleanups
to make dt-schema happier.

----------------------------------------------------------------
Johan Jonker (5):
      ARM: dts: rockchip: add adc-keys node to rk3066a-mk808
      ARM: dts: rockchip: change rv1108 gmac nodename
      ARM: dts: rockchip: rename opp-table node names
      ARM: dts: rockchip: add more angle brackets to operating-points property on rk3066a
      ARM: dts: rockchip: swap timer clock-names

 arch/arm/boot/dts/rk3036.dtsi       |  4 ++--
 arch/arm/boot/dts/rk3066a-mk808.dts | 27 +++++++++++++++++++++++++++
 arch/arm/boot/dts/rk3066a.dtsi      | 17 ++++++++---------
 arch/arm/boot/dts/rk3188.dtsi       |  2 +-
 arch/arm/boot/dts/rk3229.dtsi       |  2 +-
 arch/arm/boot/dts/rk322x.dtsi       |  6 +++---
 arch/arm/boot/dts/rk3288.dtsi       |  4 ++--
 arch/arm/boot/dts/rv1108.dtsi       |  8 ++++----
 8 files changed, 48 insertions(+), 22 deletions(-)




_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
