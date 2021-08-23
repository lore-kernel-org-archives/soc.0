Return-Path: <SRS0=GAqo=NO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB71C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Aug 2021 18:47:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76CAA613BD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Aug 2021 18:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76CAA613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y4Xp5ptP6IuXEh0nlrqxyZpxCrVez7eNzTUfBdHXKHA=; b=AzXYhcsbaK+SNY
	TOomSY4J8TM17POZXDyw2jEz+794iLHE0fDvS8uQu0VBpkJmp0YJrfJa8covAzbVaVmgrXZr+kTSS
	dHCaJiEpVeEuHNUUCpi++ifZiAN+QHP4UolmD2tEz0T3Trp3H7Wez9dswABUNZNzwTiyCaRaND/9U
	iwNYbBUE74uLAU83YrMkb1EQEih4o0wepPkxmjtwOinEGxD8QGeL8LVgF8WxDSm7JqMF4UJAf1MEC
	zAVA56F4IF/+PN/5P8ue7eAMRPUIrakIXT11eJlWffH41hKNt9P/3mhOIxpSXUTDkZdwC5uBuf7IE
	/1gnOW82g7IFTMv5DIxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIEwY-000Lqv-Df; Mon, 23 Aug 2021 18:45:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIEwT-000Lov-56; Mon, 23 Aug 2021 18:45:06 +0000
Received: from dynamic-046-114-139-102.46.114.pool.telefonica.de
 ([46.114.139.102] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mIEwR-0002Lr-VI; Mon, 23 Aug 2021 20:45:04 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.15 - #2
Date: Mon, 23 Aug 2021 20:45:00 +0200
Message-ID: <6569432.ejJDZkT8p0@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_114505_284744_F1FB64FB 
X-CRM114-Status: GOOD (  11.25  )
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
Message-ID: <20210823184500.OOZXDnJoVuTOsj_3d4xwX3yeA-E9AwbelmBgea7Ebgg@z>

Hi Arnd, Kevin, Olof,

another late (and now final addition) hopefully for 5.15.
This includes some dts fixes for changes from previous pull request.

So if it's still suitable, please pull.

Thanks
Heiko


The following changes since commit 9a35fd01f4abc3974e12539448038307acf27f16:

  arm64: dts: rockchip: add RK3399 Gru gpio-line-names (2021-08-21 18:18:50 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.15-rockchip-dts64-2

for you to fetch changes up to b12a5946f5ea7a54b8b983c42f0812152e3122de:

  arm64: dts: rockchip: add saradc to rk3568-evb1-v10 (2021-08-23 19:56:32 +0200)

----------------------------------------------------------------
Some fixes and the tiny addition of the saradc to the rk3568-evb

----------------------------------------------------------------
Alex Bee (2):
      arm64: dts: rockchip: Re-add interrupt-names for RK3399's vpu
      arm64: dts: rockchip: Fix GPU register width for RK3328

Michael Riesch (2):
      arm64: dts: rockchip: add missing rockchip,grf property to rk356x
      arm64: dts: rockchip: add saradc to rk3568-evb1-v10

 arch/arm64/boot/dts/rockchip/rk3328.dtsi         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi         | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts | 5 +++++
 arch/arm64/boot/dts/rockchip/rk356x.dtsi         | 1 +
 4 files changed, 8 insertions(+), 1 deletion(-)




_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
