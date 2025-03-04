Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08051F4CA6
	for <soc@lists.linux.dev>; Tue,  4 Mar 2025 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085943; cv=none; b=VseYHTRPxQq1P7ZppRpeWTu46Hb5sn14x6ig5q2b/fe6uLw8yFfyUASsbBpRnCaulE3UqLfYdXKcuVGdYtEt3ypwiqyO0AX28tjsFP6/AR9rkGjhcAGPTe3hHk/dBifdHCAHi9SpRhxDwifvfGGev/tpUc8k4hrzUUl3EHQtiLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085943; c=relaxed/simple;
	bh=s25yDH9waspJIVkXmf+k+AtkgO/lejj3AjHJuKQJkb4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T1mE0EpVEaWtHD3s9xmpwlSW8gyAGj7efYN4BK2MRVIfdUG62A8QkfdxoiMwZY+aNT8Z9vuinBoYLS5u3vYCc0lonYlU5YgkUPlwyIPOky5KHlrHctU5/a5tFmGpUn6lEtmJNw8RpsVw0jyl94ulj+/7BpgiKAct18/8G+5FfsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id D1417C4CEEB; Tue,  4 Mar 2025 10:59:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 86CC4C4CEE5;
	Tue,  4 Mar 2025 10:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86CC4C4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85823FEC;
	Tue,  4 Mar 2025 02:59:15 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5A7183F5A1;
	Tue,  4 Mar 2025 02:59:00 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [GIT PULL] arm64: dts: juno/vexpress: Updates for v6.15
Date: Tue,  4 Mar 2025 10:58:56 +0000
Message-Id: <20250304105856.432848-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-6.15

for you to fetch changes up to 21b9f56cec8f8918b5bbb900d6d86eaf06d54537:

  arm64: dts: corstone1000: Add definitions for secondary CPU cores (2025-03-03 17:07:15 +0000)

----------------------------------------------------------------
Armv8 FVP/Vexpress/Juno updates for v6.15

The main and bulk of the addition this time is the support for the Arm
reference Morello System Development Platform (SDP).

The Morello architecture is an experimental extension to Armv8.2-A,
enhancing the AArch64 execution state with capabilities for fine-grained
memory protection and scalable software compartmentalization. However
these changes doesn't add any of the support for security enhancements.
This is mainly adding device tree support for Morello SDP.

The platform iteslf is shipped with ACPI firmware. However, since the
ACPI bindings for GPU, DPU, I2C, I2S,..etc are not well defined or not
provided in the shipped ACPI firmware, there is a need for the device
tree as alternative for the developers focusing on those features.

The CPU is called rainier, the architecture is Morello and the platform
is Morello SDP board. There is FVP equivalent of the same though they
are not completely in feature parity with the real hardware.

These changes provide the initial support for Morello SDP and FVP
platforms.

Apart from this, we have an update to add support for secondary cores
on Corstone1000 FVP platform.

----------------------------------------------------------------
Hugues KAMBA MPIANA (1):
      arm64: dts: corstone1000: Add definitions for secondary CPU cores

Vincenzo Frascino (9):
      arm64: Kconfig: Update description for CONFIG_ARCH_VEXPRESS
      dt-bindings: arm: Add Morello compatibility
      dt-bindings: arm: Add Morello fvp compatibility
      dt-bindings: arm: Add Rainier compatibility
      dt-bindings: arm-pmu: Add support for ARM Rainier PMU
      arm64: dts: morello: Add support for common functionalities
      arm64: dts: morello: Add support for soc dts
      arm64: dts: morello: Add support for fvp dts
      MAINTAINERS: Add Vincenzo Frascino as Arm Morello Maintainer

 .../devicetree/bindings/arm/arm,morello.yaml       |  35 +++
 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 Documentation/devicetree/bindings/arm/pmu.yaml     |   1 +
 MAINTAINERS                                        |   7 +
 arch/arm64/Kconfig.platforms                       |   5 +-
 arch/arm64/boot/dts/arm/Makefile                   |   1 +
 arch/arm64/boot/dts/arm/corstone1000-fvp.dts       |  26 ++
 arch/arm64/boot/dts/arm/corstone1000.dtsi          |   3 +-
 arch/arm64/boot/dts/arm/morello-fvp.dts            |  77 +++++
 arch/arm64/boot/dts/arm/morello-sdp.dts            | 157 ++++++++++
 arch/arm64/boot/dts/arm/morello.dtsi               | 323 +++++++++++++++++++++
 11 files changed, 632 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,morello.yaml
 create mode 100644 arch/arm64/boot/dts/arm/morello-fvp.dts
 create mode 100644 arch/arm64/boot/dts/arm/morello-sdp.dts
 create mode 100644 arch/arm64/boot/dts/arm/morello.dtsi
