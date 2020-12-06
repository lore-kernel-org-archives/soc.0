Return-Path: <SRS0=0k5v=FK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A9EC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Dec 2020 18:32:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D682311B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Dec 2020 18:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24D682311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZUi3Rfj8+hsa1uXrkijZSza7l4PhlNzT95/EER36QpE=; b=Xmo05VVvSmYtjo70+YypBNSFlB
	g1JhJwU5/OhD5Y8nSgARb5qbGPPM1wL3Ra8mSMgQW06LGF4Ys5FuPMLpegXMhO98ZHh7cN2QNqFQb
	vxdZjm4HrQ2zEZ+HuqyZM3HknNaNn720M2mqaTXKgk/KHjjLw59n/pqiyqDUtFdSDks2idzSMo3Zu
	dxI/pvHAxXRj09X36ReafOBVAd1QDKWGU6F0YeZHmL3+RGrQHp2YEfkbrviJKr26qRD/siSTtl4KL
	RMcOK8Y4TReh/QPLnnzPd6M+7i8nu/IQS6rMRazRKeKZEXvxQs4qIf0v1mspYY0mP7boH4lqQj31h
	Is416iYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klynS-0002qn-L5; Sun, 06 Dec 2020 18:30:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klynQ-0002qA-7c; Sun, 06 Dec 2020 18:30:08 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1klynP-0003vj-B9; Sun, 06 Dec 2020 19:30:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.11
Date: Sun, 06 Dec 2020 19:30:06 +0100
Message-ID: <4278011.LvFx2qVVIh@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_133008_327841_DC8C0BA9 
X-CRM114-Status: GOOD (  15.35  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201206183006.V-YjLrQbUNsZ-pQliBAD9bCy959Uj8JDsn3MKH0waHw@z>

Hi Arnd, Kevin, Olof,

please find below and in the following pull-requests Rockchip-changes
aimed at 5.11
Please pull!

Thanks
Heiko

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v5.11-rockchip-dts64-1

for you to fetch changes up to e12f67fe83446432ef16704c22ec23bd1dbcd094:

  arm64: dts: rockchip: use USB host by default on rk3399-rock-pi-4 (2020-1=
2-04 11:23:52 +0100)

----------------------------------------------------------------
Newly added boards are the PX30 SOM system from Engicam and Kobol Helios64.
The Scarlet tablet finally gets support for its cameras, now that the
the rk3399-isp moved out of staging.
The Odroid-Go-Advance got its joystick support now that the adc-joystick
driver was merged and misc omprovements to the RockPi4, rk3328-roc-cc
and orange-pi.

----------------------------------------------------------------
Alexis Ballier (1):
      arm64: dts: rockchip: Properly define the type C connector on rk3399-=
orangepi

Chen-Yu Tsai (4):
      arm64: dts: rockchip: Set dr_mode to "host" for OTG on rk3328-roc-cc
      arm64: dts: rockchip: Enable HDMI audio on rk3328-roc-cc
      arm64: dts: rockchip: Enable analog audio on rk3328-roc-cc
      arm64: dts: rockchip: Fix UART pull-ups on rk3328

Eddie Cai (1):
      arm64: dts: rockchip: add isp and sensors for Scarlet

Heiko Stuebner (1):
      arm64: dts: rockchip: add adc joystick to Odroid Go Advance

Jagan Teki (10):
      dt-bindings: arm: rockchip: Add Engicam PX30.Core EDIMM2.2 Starter Kit
      arm64: dts: rockchip: Add Engicam EDIMM2.2 Starter Kit
      arm64: dts: rockchip: Add Engicam PX30.Core EDIMM2.2 Starter Kit
      dt-bindings: arm: rockchip: Add Engicam PX30.Core C.TOUCH 2.0
      arm64: dts: rockchip: Add Engicam C.TOUCH 2.0
      arm64: dts: rockchip: Add Engicam PX30.Core C.TOUCH 2.0
      arm64: dts: rockchip: Enable USB Host, OTG on px30-enagicam
      arm64: dts: rockchip: Enable LVDS panel on px30-engicam-edimm2.2
      dt-bindings: arm: rockchip: Add Engicam PX30.Core C.TOUCH 2.0 10.1" OF
      arm64: dts: rockchip: Add Engicam PX30.Core C.TOUCH 2.0 10.1" OF

Johan Jonker (1):
      arm64: dts: rockchip: rename sdhci nodename to mmc on rk3399

Michael Trimarchi (1):
      arm64: dts: rockchip: Add Engicam PX30.Core SOM

Shunqian Zheng (1):
      arm64: dts: rockchip: add isp0 node for rk3399

Suniel Mahesh (2):
      arm64: dts: rockchip: Add WiFi support on px30-engicam
      arm64: dts: rockchip: Add BT support on px30-engicam

Uwe Kleine-K=F6nig (3):
      dt-bindings: vendor-prefixes: Add kobol prefix
      arm64: dts: rockchip: Add basic support for Kobol's Helios64
      dt-bindings: arm: rockchip: Add Kobol Helios64

Vicente Bergas (3):
      arm64: dts: rockchip: fix supplies on rk3399-rock-pi-4
      arm64: dts: rockchip: fix I2S conflict on rk3399-rock-pi-4
      arm64: dts: rockchip: use USB host by default on rk3399-rock-pi-4

 .../devicetree/bindings/arm/rockchip.yaml          |  23 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/rockchip/Makefile              |   4 +
 .../boot/dts/rockchip/px30-engicam-common.dtsi     | 124 +++++++
 .../boot/dts/rockchip/px30-engicam-ctouch2.dtsi    |  30 ++
 .../boot/dts/rockchip/px30-engicam-edimm2.2.dtsi   |  66 ++++
 .../px30-engicam-px30-core-ctouch2-of10.dts        |  77 +++++
 .../rockchip/px30-engicam-px30-core-ctouch2.dts    |  22 ++
 .../rockchip/px30-engicam-px30-core-edimm2.2.dts   |  43 +++
 .../boot/dts/rockchip/px30-engicam-px30-core.dtsi  | 237 +++++++++++++
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts |  24 ++
 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts     |  21 ++
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |  16 +-
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |  74 ++++
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 372 +++++++++++++++++=
++++
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts   |  62 +++-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |  15 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  28 +-
 18 files changed, 1219 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-common.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-edimm2.2.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-cto=
uch2-of10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-cto=
uch2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edi=
mm2.2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-px30-core.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts




_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
