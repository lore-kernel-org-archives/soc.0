Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336931E492D
	for <soc@lists.linux.dev>; Wed, 25 Mar 2026 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454438; cv=none; b=R8Ry/T7BFQY8jRtnXeLRiVTahM8TJS+wVg4WOd85Y5laenxNDX+HGm2ZscB1jiPVro0+q8P4eqKet0/Ja+m2ico2Rgk94msPYXPQRoL5iBvqMerYJurxzwMfYhXseDb36AMfXOT0t9EOPgs0WT/e/d9C37E17z6nVVq8l9LFvmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454438; c=relaxed/simple;
	bh=xQezrSndPPUacdy/MK97EgDqQ0wsautz6vO1I8UUloY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u2LQI48kPo16Rl1bXzIdwkqeAADTL5+4oS8m4Yb5z/jPpP6tlJuSXW0F/ll2C+RZmYdd2ghcbZlWUbIRxYEGfE/V9J16ASeXeRwebRr3Bwy31M3og6SF4UHt5lyGsTtNhOstDyy+VRDO95N0W9CTCuG+1qa3PRBBp+hVjvR96a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4Lb8zAO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4Lb8zAO"
Received: by smtp.kernel.org (Postfix)
	id CEC6DC2BCB0; Wed, 25 Mar 2026 16:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC95C4CEF7;
	Wed, 25 Mar 2026 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774454437;
	bh=xQezrSndPPUacdy/MK97EgDqQ0wsautz6vO1I8UUloY=;
	h=From:To:Cc:Subject:Date:From;
	b=k4Lb8zAOP3bn7AOkVSEt1zFlpeVJUnYgPO0OQb4Wci9qG6Ed+P0ao6fZw0vnClJxN
	 rPUkclIVvRhx0J1B3dhwcCU1k9PsmioeY55+rJEoIHMegES3avd49FeZ8fRlKTJNAx
	 BkyMAUZvS2XyOFhn/G1oO61vkHCtwjk2FANwCTF+0mvJ0eDR1qWjCQCTSPRNB3/tkW
	 uhRwxCfo8SOmuEF18Bcwpa+6gw5TPQDtVC82GSJ528kdE0qHFdbnkIqt/Z/ek3ELlp
	 u2cN0qZfEbV/BSyIv+haoBV+vKd9yuhWlDIyFvjhGKGlblEy7ShFgR5raD/mdXuWEG
	 6p+dKX77sxqVQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] arm64: dts: juno/fvp: Updates for v7.1
Date: Wed, 25 Mar 2026 16:00:21 +0000
Message-ID: <20260325160027.4115793-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-7.1

for you to fetch changes up to 87599f1843d3baa4083dc9dd01c95826b536de24:

  arm64: dts: arm/corstone1000: Add corstone-1000-a320 (2026-03-23 10:03:28 +0000)

----------------------------------------------------------------
Armv8 Juno/FVP/Vexpress updates for v7.1

1. The primary addition is initial support for Zena CSS that includes:
   a new binding compatibility, a shared `zena-css.dtsi` description, and
   an FVP device tree.

2. Extension of Corstone-1000 FVP platform support with binding updates
   to add the new `arm,corstone1000-a320-fvp` platform, and the
   `arm,corstone1000-ethos-u85` NPU integration.

Overall, this combines new platform enablement with some DTS layout
cleanup for Arm reference FVP based systems.

----------------------------------------------------------------
Debbie Horsfall (3):
      dt-bindings: arm: Add Zena CSS compatibility
      arm64: dts: zena: Add support for Zena CSS
      arm64: dts: zena: Move SRAM into SoC and memory node out of SoC

Rob Herring (Arm) (5):
      dt-bindings: arm,corstone1000: Add "arm,corstone1000-a320-fvp"
      dt-bindings: npu: arm,ethos: Add "arm,corstone1000-ethos-u85"
      arm64: dts: arm/corstone1000: Move cpu nodes
      arm64: dts: arm/corstone1000: Move FVP peripherals to separate .dtsi
      arm64: dts: arm/corstone1000: Add corstone-1000-a320

 .../devicetree/bindings/arm/arm,corstone1000.yaml  |  15 +-
 .../devicetree/bindings/arm/arm,vexpress-juno.yaml |  10 +
 .../devicetree/bindings/npu/arm,ethos.yaml         |   2 +-
 arch/arm64/boot/dts/arm/Makefile                   |   2 +
 arch/arm64/boot/dts/arm/corstone1000-a320-fvp.dts  |  15 +
 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi     |  91 +++
 arch/arm64/boot/dts/arm/corstone1000-fvp.dts       |  96 +--
 arch/arm64/boot/dts/arm/corstone1000-fvp.dtsi      |  44 ++
 arch/arm64/boot/dts/arm/corstone1000-mps3.dts      |  13 +
 arch/arm64/boot/dts/arm/corstone1000.dtsi          |  13 -
 arch/arm64/boot/dts/arm/zena-css-fvp.dts           |  63 ++
 arch/arm64/boot/dts/arm/zena-css.dtsi              | 769 +++++++++++++++++++++
 12 files changed, 1054 insertions(+), 79 deletions(-)
 create mode 100644 arch/arm64/boot/dts/arm/corstone1000-a320-fvp.dts
 create mode 100644 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
 create mode 100644 arch/arm64/boot/dts/arm/corstone1000-fvp.dtsi
 create mode 100644 arch/arm64/boot/dts/arm/zena-css-fvp.dts
 create mode 100644 arch/arm64/boot/dts/arm/zena-css.dtsi
