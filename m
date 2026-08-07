Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1830E0F2
	for <soc@lists.linux.dev>; Fri,  7 Aug 2026 15:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117839; cv=none; b=sCsQiFmqEZpe7XaP4/GUpphhMe+TswxBuNHp7iCB3cmkCCeSBhpt7pin65VnMLX7GIG5nFKf3aWU73i7lrtjqjvjk0MQ2/aWoZn5nYP9zFylKDCFCVhEZ/9nW01DkcoqGZi62eAikm+tPJSeP70hSIWKyhQARdCrJyKWpR0+ZS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117839; c=relaxed/simple;
	bh=O9I7U9+l0+X/hkgohmgxXLRhwWWdjQ4TTE3VgHkshbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IupXa7cEFfoD/aSHavy3vcYh1zEjL0xRmQ4JgYp6iJ42CfM8eS6SKnjSVxk4WKuKIXriHYvQFD7188EiNsqJKYnOz5sRyYxmMnJCFMVvuK1r4u6j3O5O2lcEQng9I4HP3TAXdU07LfHZLJtJLZbrGQ/WhjhsYohpVf+FtZAfrVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/KitA0f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/KitA0f"
Received: by smtp.kernel.org (Postfix)
	id 5609D1F00A3A; Fri,  7 Aug 2026 15:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5241F000E9;
	Fri,  7 Aug 2026 15:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786117838;
	bh=p2nGN5ZXRiqoTtzpZL872g3TGzGSNiIhzVCcBASG2ew=;
	h=From:To:Cc:Subject:Date;
	b=V/KitA0fjocwxz1GdntzyJGUQRV/7s5428bv4zaiwbu5mlfGYe/aJHQ1XW93O/zBG
	 cQ5hGOuSFSZvc6Iq/lncalhUBnIsUfwq1k4+AhDXQFAOvE2Q+AkmoFkAQfiia3KkKk
	 LX94URQ+ixLinklf5ty1Pcgka/Rj84tEeHVpEPCXotxPXdLro6QMnKJE34CEwZT7hZ
	 sTNUKbNxXK875P4BaijdP4dJovtHlC/CeaH87INIAtcT2fD5kCTFwFh5C2Ptvlmw47
	 PgmxegjWdIZgFeRxmSfsR0Oh6u7/UXTVj38MIRK2jFDl3qmLmZj+oaAx07+xA3NFYK
	 x2auKZc9BPj/g==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Messier <alex@me.ssier.org>,
	Antony Kurniawan Soemardi <linux@smankusors.com>,
	David Wales <daviewales@disroot.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Erikas Bitovtas <xerikasxx@gmail.com>,
	Rudraksha Gupta <guptarud@gmail.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v7.3
Date: Fri,  7 Aug 2026 10:50:35 -0500
Message-ID: <20260807155035.603563-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-7.3

for you to fetch changes up to 1c436bca83bef0f7ca8d106a878a89af17048270:

  ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree (2026-07-11 13:11:35 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v7.3

Add initial device tree support for the MSM8926-based Sony Xperia M2 and
the MSM8226-based Motorola Moto G2 (2014).

Add touchscreen, Bluetooth pin configuration, NFC, and multicolor status LED
support to the MSM8974-based HTC One M8 device tree.

Add the coreriver,tc360-touchkey compatible touchkey node to the MSM8960
Samsung ExpressATT device tree and label PM8921 XOADC channels.

Consolidate shared IPA properties in the SDX55 device tree.

----------------------------------------------------------------
Alexandre Messier (4):
      ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
      ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
      ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
      ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen

Antony Kurniawan Soemardi (1):
      ARM: dts: qcom: pm8921: add labels for ADC channels

David Wales (1):
      ARM: dts: qcom: msm8226: Support Motorola Moto G2 (2014)

Dmitry Baryshkov (1):
      ARM: dts: qcom: sdx55: consolidate IPA properties

Erikas Bitovtas (1):
      ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree

Rudraksha Gupta (1):
      ARM: dts: qcom: msm8960: expressatt: Add coreriver,tc360-touchkey

 arch/arm/boot/dts/qcom/Makefile                    |   2 +
 arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts  | 350 ++++++++++++++++++
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 407 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/pm8921.dtsi                 |  12 +
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  54 +++
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  |  94 ++++-
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts          |   2 -
 .../boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts   |   2 -
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |   3 +
 9 files changed, 918 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts
 create mode 100644 arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts
