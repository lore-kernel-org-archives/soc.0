Return-Path: <SRS0=GbX+=LO=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32B2C48BDF
	for <linux-rockchip@archiver.kernel.org>; Sun, 20 Jun 2021 22:32:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36FAE60725
	for <linux-rockchip@archiver.kernel.org>; Sun, 20 Jun 2021 22:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36FAE60725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qj/RgrQvzxbG/DuvaS/ka7nq5d+YWqe/5MIHC/5xjn0=; b=zO2sccOMyABCC1
	2hNsUjGwe2RB4z7z4EyQJ3QiWtz7VY1yKCWF4FcbGf7bPfMnxGrN5TPrTMYpavRqgOnBKDBeelvu1
	LHTSYJQGDXA118Lm/cmVS8Z4ZudmbxBHVMmt40M3cpLu/ZT5HCXNTOTasEYEGjTuOZd+csr0vHHMl
	DG1vEBRu9vTlnTRWULBguvydKtTzWiVIPzjyPMyARf36FGfaJ+IhMuxlNuGty1DBvvJDLr8Rawgqs
	e8MIrNEBnLJnsr9qCl5+UnEGIwYgyL9hb4V7O9uaBbWXS09tnOhVc9NI84ohwdszuoMPNgp/DAxzd
	T+Y152rTC7ERIkl1p5Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lv5zo-001ghh-QG; Sun, 20 Jun 2021 22:32:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lv5zm-001ggI-7y; Sun, 20 Jun 2021 22:32:51 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lv5zl-0005Vj-4P; Mon, 21 Jun 2021 00:32:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 5.14
Date: Mon, 21 Jun 2021 00:32:48 +0200
Message-ID: <4647955.GXAFRqVoOG@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_153250_339537_A5E646CD 
X-CRM114-Status: GOOD (  10.72  )
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
Message-ID: <20210620223248.2Mc-DM1903q0QVv0RHVO1HBy_yVF0dH2OskbTmKEjeI@z>

Hi Arnd, Kevin, Olof,

please find below (and in the next mail) changes for
Rockchip platforms for 5.14.

Please pull

Thanks
Heiko


The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.14-rockchip-drivers1

for you to fetch changes up to fcafd31b5f535573dd045f6151ab93a806e2b05b:

  dt-bindings: soc: rockchip: drop unnecessary #phy-cells from grf.yaml (2021-06-10 09:29:26 +0200)

----------------------------------------------------------------
Yaml conversion of grf, pmu and power-domain bindings,
Power-domains for rk3568 + necessary plumbing,
Fixes for the usbphy bindings.

----------------------------------------------------------------
Elaine Zhang (4):
      dt-bindings: add power-domain header for RK3568 SoCs
      soc: rockchip: power-domain: Add a meaningful power domain name
      dt-bindings: power: rockchip: Add bindings for RK3568 Soc
      soc: rockchip: power-domain: add rk3568 powerdomains

Enric Balletbo i Serra (1):
      dt-bindings: power: rockchip: Convert to json-schema

Heiko Stuebner (2):
      Merge branch 'v5.14-shared/powerdomain' into v5.14-armsoc/drivers
      dt-bindings: soc: rockchip: drop unnecessary #phy-cells from grf.yaml

Johan Jonker (4):
      dt-bindings: arm: rockchip: convert pmu.txt to YAML
      dt-bindings: arm: rockchip: add more compatible strings to pmu.yaml
      dt-bindings: soc: rockchip: convert grf.txt to YAML
      dt-bindings: phy: rename phy nodename in phy-rockchip-inno-usb2.yaml

Tobias Schramm (1):
      dt-bindings: soc: rockchip: grf: add compatible for RK3308 USB grf

 .../devicetree/bindings/arm/rockchip/pmu.txt       |  16 --
 .../devicetree/bindings/arm/rockchip/pmu.yaml      |  55 +++++
 .../bindings/phy/phy-rockchip-inno-usb2.yaml       |  11 +-
 .../bindings/power/rockchip,power-controller.yaml  | 248 ++++++++++++++++++++
 .../devicetree/bindings/soc/rockchip/grf.txt       |  61 -----
 .../devicetree/bindings/soc/rockchip/grf.yaml      | 261 +++++++++++++++++++++
 .../bindings/soc/rockchip/power_domain.txt         | 136 -----------
 drivers/soc/rockchip/pm_domains.c                  | 252 +++++++++++---------
 include/dt-bindings/power/rk3568-power.h           |  32 +++
 9 files changed, 744 insertions(+), 328 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/rockchip/pmu.txt
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
 create mode 100644 Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/power_domain.txt
 create mode 100644 include/dt-bindings/power/rk3568-power.h




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
