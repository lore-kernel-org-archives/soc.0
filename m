Return-Path: <SRS0=6E+6=NW=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF24C27C79
	for <soc@archiver.kernel.org>; Thu, 20 Jun 2024 09:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFCAEC4AF09; Thu, 20 Jun 2024 09:39:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id CE144C4AF07;
	Thu, 20 Jun 2024 09:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE144C4AF07
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B04ACDA7;
	Thu, 20 Jun 2024 02:40:08 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A582B3F6A8;
	Thu, 20 Jun 2024 02:39:42 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] arm64: dts: juno: Updates for v6.11
Date: Thu, 20 Jun 2024 10:39:18 +0100
Message-ID: <20240620093924.375244-2-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620093924.375244-1-sudeep.holla@arm.com>
References: <20240620093924.375244-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-6.11

for you to fetch changes up to 75895aa2bc1e0dbf062a33ec1f754ef6801d64dd:

  arm64: dts: juno: Enable GPU (2024-06-20 09:52:54 +0100)

----------------------------------------------------------------
Arm Juno updates for v6.11

Addition of dedicated FPGA syscon compatible for Juno platforms. Also
enablement of GPU device node now that the panfrost driver is already
enabled as a module in defconfig.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      dt-bindings: arm: arm,juno-fpga-apb-regs: document FPGA syscon
      arm64: dts: juno: add dedicated FPGA syscon compatible

Robin Murphy (1):
      arm64: dts: juno: Enable GPU

 .../bindings/arm/arm,juno-fpga-apb-regs.yaml       | 61 ++++++++++++++++++++++
 arch/arm64/boot/dts/arm/juno-base.dtsi             |  1 -
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi      |  3 +-
 3 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,juno-fpga-apb-regs.yaml
