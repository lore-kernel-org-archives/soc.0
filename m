Return-Path: <SRS0=ef6L=KD=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090A5C48BF6
	for <soc@archiver.kernel.org>; Mon, 26 Feb 2024 10:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BAD3EC433F1; Mon, 26 Feb 2024 10:37:08 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 023FAC433C7;
	Mon, 26 Feb 2024 10:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 023FAC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 26C4260462;
	Mon, 26 Feb 2024 10:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1708943818;
	bh=oYT/HiK94SkFdce/HNd/VrIiwY34Ea01L0AEBbrybCE=;
	h=From:To:Cc:Subject:Date:From;
	b=QyhzL5YSf0CH02td46MD2M7l5wTIr+W1Rkl0vvKX6NWyvhBBRCzbT+R8+jrwl/dbu
	 /k5XVnxdPLWphk5w9JCNisk5UrlF14m8qlsRIncdRY9GA8riO27JhQJVYXlzIHATob
	 okha8QqxVHDHCkNINZPcm1S8S5F6vZQUw9rnS/giTCImU35v+TgTZrX07ub7CadiMm
	 sthr0mYOwieOgqBe41yJ7mdwHoLGznermZhjhmL5X7ooZD35KTPZzP9Bdwns5C8SvE
	 D0U5z8AByBq1Yma/ZMSAefCFrS5wt72m/J0b9InQB6XxfiYKDgr3qHRTmVW3dNT2pT
	 i8Up2FzH+SQZg==
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
	"Rob Herring" <robh@kernel.org>,
	"Nishanth Menon" <nm@ti.com>,
	"Vignesh Raghavendra" <vigneshr@ti.com>,
	"Andrew Davis" <afd@ti.com>
Subject: [GIT PULL] Add PowerVR Series5 SGX GPUs for the TI SoCs
Date: Mon, 26 Feb 2024 12:36:12 +0200
Message-ID: <pull-1708943489-872615@atomide.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/sgx-for-v6.9-signed

for you to fetch changes up to 21cfb2ba471bde8fefc327f4c8e2af9499f5173d:

  arm64: dts: ti: k3-am654-main: Add device tree entry for SGX GPU (2024-01-26 09:43:23 +0200)

----------------------------------------------------------------
Add PowerVR Series5 SGX GPUs for the TI SoCs

With the Imagination Rogue GPU binding added, let's also add the devicetree
binding for earlier SGX GPUs. Let's also patch the TI SoCs for the related
SGX GPU nodes.

Based on the mailing list discussions, the conclusion was that we need two
separate device tree bindings, one for Rogue and upcoming GPUS, and one for
the older SGX GPUs.

For merging the changes, I applied the binding changes together with the
TI SoC related changes into a branch leaving out the sun6i and mips changes
as suggested by Rob.

These changes are mostly 32-bit SoCs, but also contains one arm64 change.
It does not cause any merge conflicts.

----------------------------------------------------------------
Andrew Davis (9):
      dt-bindings: gpu: Rename img,powervr to img,powervr-rogue
      dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
      ARM: dts: omap3: Add device tree entry for SGX GPU
      ARM: dts: omap4: Add device tree entry for SGX GPU
      ARM: dts: omap5: Add device tree entry for SGX GPU
      ARM: dts: AM33xx: Add device tree entry for SGX GPU
      ARM: dts: AM437x: Add device tree entry for SGX GPU
      ARM: dts: DRA7xx: Add device tree entry for SGX GPU
      arm64: dts: ti: k3-am654-main: Add device tree entry for SGX GPU

 .../{img,powervr.yaml => img,powervr-rogue.yaml}   |   4 +-
 .../devicetree/bindings/gpu/img,powervr-sgx.yaml   | 138 +++++++++++++++++++++
 MAINTAINERS                                        |   3 +-
 arch/arm/boot/dts/ti/omap/am33xx.dtsi              |   9 +-
 arch/arm/boot/dts/ti/omap/am3517.dtsi              |  11 +-
 arch/arm/boot/dts/ti/omap/am4372.dtsi              |   6 +
 arch/arm/boot/dts/ti/omap/dra7.dtsi                |   9 +-
 arch/arm/boot/dts/ti/omap/omap34xx.dtsi            |  11 +-
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |   9 +-
 arch/arm/boot/dts/ti/omap/omap4.dtsi               |   9 +-
 arch/arm/boot/dts/ti/omap/omap5.dtsi               |   9 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |   7 ++
 12 files changed, 195 insertions(+), 30 deletions(-)
 rename Documentation/devicetree/bindings/gpu/{img,powervr.yaml => img,powervr-rogue.yaml} (91%)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
