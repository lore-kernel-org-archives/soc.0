Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AA44508F4
	for <soc@lists.linux.dev>; Tue, 31 Mar 2026 21:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991765; cv=none; b=GteUGni0BIVwYuOgfA66YBgLJ51VFkNES1ZuieP7T9gN4QhgapLc4xp59yCcyI25KJs9rwvYf9sFreov3qZW/x4M6uZgLvSy5clCyq92pRVssgBFnD3+ffR2ddS5UqG50vf1J4twNWEHFt49pJXv1+YPNPjKz2ZPG5WSGAqkAMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991765; c=relaxed/simple;
	bh=/Zuj465z+SJXeuy8BFVva/2T89KUCArNO4FegDfx9oE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TTmnMxSF01PW6W5t0bEcu6KpRDzyXAbq9nQToATM27ZkC5GtlSqAdqW0tkQFUWhcvJ08KeDTR1cZCAtMWwCYEH46Mt/tOms3fNQIXgQAQWx5xNKX9NsKlCPRifWeX4haM567w2N2Wd0tyoHpVpS3D/L3MFcAQ4w7xVgIGPzWyPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3gTmA2S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3gTmA2S"
Received: by smtp.kernel.org (Postfix)
	id A8760C2BCB2; Tue, 31 Mar 2026 21:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA640C19423;
	Tue, 31 Mar 2026 21:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774991765;
	bh=/Zuj465z+SJXeuy8BFVva/2T89KUCArNO4FegDfx9oE=;
	h=From:To:Cc:Subject:Date:From;
	b=o3gTmA2S/CH8s2brCacnXtwcIc8+v4oRzecEPqcJ874UO+DZ+POF0HD8aLSYjkAr+
	 9rTKEPtsuxZNGQlLxfeqaDwJFHxcaiqwJjE4/M6EPDgeAOsoixISqzgNaDAe7rGmdr
	 KWXpo7IWoN8CFpQJmNnXR0fcrdDbCdUX0pwfenarZ2z5NkZC2sPVriHVQjXEIPuuZ0
	 V84O2UD1pGTuWB3nek/enBCN613qa4csw1lkt7n/D51nIATeFh3tZmGldpNxJ5quXo
	 +agOcmOyrLfMB/pS8hE9l11Fdc0XI363OY8VCR5WCYNdvUhK5MwdFpDRj67GyEbUaX
	 0yl6OnKwtWdDA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v7.1
Date: Tue, 31 Mar 2026 16:16:02 -0500
Message-ID: <20260331211602.959960-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-7.1

for you to fetch changes up to 6453ad0865b68ab0de5873c1a8bb4addbbde5c19:

  ARM: dts: qcom: msm8974: Drop RPM bus clocks (2026-03-31 15:59:12 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v7.1

Qualcomm APQ8084 is incomplete and hasn't seen functional contributions
since 2016, so drop the platform (for now?). Also drop a number of
unused IPQ-related dtsi files.

Lastly clean up the RPM bus clocks in MSM8974 interconnect nodes.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      ARM: dts: qcom: drop apq8084 support
      ARM: dts: qcom: msm8974: Drop RPM bus clocks

Rob Herring (Arm) (1):
      ARM: dts: qcom: Drop unused .dtsi

 arch/arm/boot/dts/qcom/Makefile                    |   2 -
 arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts    |  34 -
 arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts        |  23 -
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi           | 852 ---------------------
 arch/arm/boot/dts/qcom/qcom-ipq8062-smb208.dtsi    |  37 -
 arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi           |   8 -
 arch/arm/boot/dts/qcom/qcom-ipq8064-smb208.dtsi    |  37 -
 .../boot/dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi    |  37 -
 arch/arm/boot/dts/qcom/qcom-ipq8065-smb208.dtsi    |  37 -
 arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi           |   8 -
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  21 +-
 11 files changed, 3 insertions(+), 1093 deletions(-)
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-apq8084-ifc6540.dts
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi
