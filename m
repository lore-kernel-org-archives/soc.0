Return-Path: <SRS0=THJM=E4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107D6C5519F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2020 13:35:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6505D2076E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2020 13:35:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zuo2QPWr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6505D2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cK6CADCrPafLoBwOPLnXYBXjU1cxgwsebdRW3uHbOIo=; b=Zuo2QPWrBzfLlF2+vVHFju3Cgs
	jj7hdFdlWgowkQi2NH7ySHXVCv6B0lECqmiQWJS6Vy1bvBiOKEiI5sK93Luw0tIlqbQK36whoCWAw
	EYpUvDemyxX1t03kdeRZAHcnp/3TnhziYT/Q7vxuMVb9d9qWHbAnP71hD3x3/KcxMFvec/75LAB4d
	idvc/OcmT3iklTBv4gArM/AfyS7Big4FlDI+Wp9l1uYW2lKJss+xDdMb7Vbc+q1WRIbZu/jmOVrCP
	2wlgsRZV/d1PKrMrElcIfnFY0rdKO+ChQgCLhGi9HkrDYlOJJrjRLq2TQjdidmiGnZ2TdwFOb0Jf2
	i0v2iMPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgpUR-0000Wx-IK; Sun, 22 Nov 2020 13:33:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgpUO-0000WR-Un; Sun, 22 Nov 2020 13:33:13 +0000
Received: from p508fd741.dip0.t-ipconnect.de ([80.143.215.65]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1kgpUJ-0000rh-LB; Sun, 22 Nov 2020 14:33:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Subject: [GIT PULL] Rockchip dts fixes for 5.10
Date: Sun, 22 Nov 2020 14:33:05 +0100
Message-ID: <11641389.O9o76ZdvQC@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_083313_007962_E717AAC5 
X-CRM114-Status: GOOD (  12.01  )
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
Message-ID: <20201122133305.JrGnSDaKpJIim9wPJPgoMz6lpme63t4496X54Jncjbs@z>

Hi Arnd, Kevin, Olof,

please find below some Rockchip devicetree fixes for the 5.10 cycle.
Please pull!

Thanks
Heiko

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.10-rockchip-dtsfixes1

for you to fetch changes up to 7327c8b98e2e14c47021eea14d1ab268086a6408:

  arm64: dts: rockchip: Reorder LED triggers from mmc devices on rk3399-roc-pc. (2020-11-08 01:34:53 +0100)

----------------------------------------------------------------
Fixed ordering for MMC devices on rk3399, due to a mmc change jumbling
all ordering, a fix to make the Odroig Go Advance actually power down
and using the correct clock name on the NanoPi R2S.

----------------------------------------------------------------
David Bauer (1):
      arm64: dts: rockchip: fix NanoPi R2S GMAC clock name

Maciej Matuszczyk (1):
      arm64: dts: rockchip: Remove system-power-controller from pmic on Odroid Go Advance

Markus Reichl (2):
      arm64: dts: rockchip: Assign a fixed index to mmc devices on rk3399 boards.
      arm64: dts: rockchip: Reorder LED triggers from mmc devices on rk3399-roc-pc.

 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts | 1 -
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    | 4 ++--
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 3 +++
 4 files changed, 6 insertions(+), 4 deletions(-)




_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
