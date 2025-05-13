Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71280DDC1
	for <soc@lists.linux.dev>; Tue, 13 May 2025 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147121; cv=none; b=gSV/DcWKwwaYnDytboE5XauOHeqGZhZzPRqGHJdydrUHTYBjnEUroa89WTiUy3AtfmsinUM/zf635r+/tWKWR3tlQLaiDgSEJULLzl2DtIQnpcOjJJFkM5PCB4/3ekWLEtJC+mcTsm7yFlWcmeevqIhZR1JnmnE0wMlLEHg5/cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147121; c=relaxed/simple;
	bh=xuh4ccfEWUbtA3m2/UHpzfNOPJdc2zuo0mimVfmP/kk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FMkv32r9aVYEh+JJcgNVBh5V7gYzH+tblsy+jVUUZq3eIo+Opoory3xqXnaQ1ZGmDfB3QpvgrHV66ZcZZ/Qd7pKK8iAbea+5MW6hnGoRuvwZU4WqLx/o7OPyjR+iWeMnWjV9IXtUhtzSkTueLoHoLOfuiY9jncIofAipI//u1HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 02256C4CEED; Tue, 13 May 2025 14:38:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 54755C4CEE4;
	Tue, 13 May 2025 14:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54755C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C93E113E;
	Tue, 13 May 2025 07:38:27 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 12ADC3F63F;
	Tue, 13 May 2025 07:38:36 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] arm64: dts: juno/fvp: Updates for v6.16
Date: Tue, 13 May 2025 15:38:27 +0100
Message-Id: <20250513143827.3606686-1-sudeep.holla@arm.com>
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-6.16

for you to fetch changes up to 6332351622db251b97639817a0e9ebc6f2394f87:

  arm64: dts: fvp: Add ETE and TRBE nodes for Rev C model (2025-05-12 18:52:08 +0100)

----------------------------------------------------------------
Armv8 Juno/FVP updates for v6.16

Few updates to the Arm FVP(Fixed Virtual Platform) device tree, enhancing
support for system tracing, power management, and firmware coexistence:

1. ETE and TRBE support
   Adds CoreSight ETE and TRBE nodes for the FVP Rev C model. These are
   disabled by default as they need to be enabled explicitly via model
   parameters.

2. CPU idle states and system timer for idle broadcast
   Introduces CPU idle state definitions but disabled by default due to
   potential performance impact on the model. Also adds a system-level
   broadcast timer for use when CPUs enter deep idle states where local
   timers stop.

3. Firmware memory reservation
   Reserves 64MB at the end of the first DRAM bank to prevent conflicts
   with FF-A firmware or similar configurations that rely on this region.

4. Drop the unnecessary clock-frequency property in the timer nodes
   The boot/secure firmware must configure the timer clock frequency and
   the non-secure OS must be able to read the same. The clock-frequency is
   generally used when the firmware is broken which is not the case on
   most of the fast models and Juno platform.

As noted above some of the changes are disabled by default where applicable
to ensure backward compatibility and avoid unintended performance impact
on platforms using default model parameters.

----------------------------------------------------------------
Leo Yan (1):
      arm64: dts: fvp: Add ETE and TRBE nodes for Rev C model

Sudeep Holla (4):
      arm64: dts: fvp: Add system timer for broadcast during CPU idle
      arm64: dts: fvp: Add CPU idle states for Rev C model
      arm64: dts: fvp: Reserve 64MB for the FF-A firmware in memory map
      arm64: dts: arm: Drop the clock-frequency property from timer nodes

 arch/arm64/boot/dts/arm/corstone1000.dtsi  |   1 -
 arch/arm64/boot/dts/arm/foundation-v8.dtsi |   1 -
 arch/arm64/boot/dts/arm/fvp-base-revc.dts  | 101 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/arm/juno-base.dtsi     |   1 -
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts |   1 -
 5 files changed, 100 insertions(+), 5 deletions(-)
