Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C642269D18
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 02:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377207; cv=none; b=kSR0n7uryIGeYsHlOf6Z2cag1PqKIZhUdiXge1KXglvI/xSaPyuMRU/U14yJRn/GFemvbJR/qXiSTGxGKMdVuVYBRd8sHoGYFz18zCZGDonj+3kDo73hAtOFUTITySRg5EZKow5Bac7Z1x8aMNNc3lKRynT5hjjhpZdO9I6J64U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377207; c=relaxed/simple;
	bh=CpHO3RZDQ+NyGUCtuZdusXsaETAe8lzjbPfQoIJ58So=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QgRdXvim3S/dhYAx5tkkEpDjfR9DMSppmdBd31vbub4LJhSHwxd6d+M+t9qpn4pUiIchIyySgFhmDcpF8/ftmH32w6mz2gN11K4VIRXHOIfSEW4omrS1wgLJybyLHtNLrhqeulShT2GuvbG1UW8fvELKWYeKoeKFSG2LmGnPyh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZl/qbuU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZl/qbuU"
Received: by smtp.kernel.org (Postfix)
	id E241D1F00A3D; Thu, 30 Jul 2026 02:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CB41F000E9;
	Thu, 30 Jul 2026 02:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785377205;
	bh=PAt+eZwf8tQx/cEfnmLtW7Yb9P3v3HHpCqPrZ+zoQ4Q=;
	h=From:To:Cc:Subject:Date;
	b=fZl/qbuU/+0Cy/P550elaPKyJIDbtw0qsVazlVfw/W4DQPKrwm4s+xrQHjaGavvY1
	 93aa5LuQQZ6erVoOCiY1TlvjMU6E2kqnkgj18O8jCGuHTM/BRn57MKzmpNB2CDIjc3
	 H79WTXnp41nnCOmI2KIP4e/yzRvWP0Lk9TAr/mTFtsnTU3xPXlGYqE5pJhrqG4w608
	 TaoOLdH76R52xBbVM+PT2lKL1CkLzjV5iP5jbSgzxwJ66d4tg/DcZ6vYtlI+DR9lwi
	 0nZDVweBmfkBeiYfpWUPEH20mQ9RHM4rybavp2bsH36TgoR1/ygqs/gjPCnYuiZAC2
	 IGj9S0+rorVlA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for 7.2
Date: Wed, 29 Jul 2026 21:06:42 -0500
Message-ID: <20260730020642.68595-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.2

for you to fetch changes up to a3ba349af8e1bb7e0efdcd2dd53d69282f18478a:

  arm64: dts: qcom: eliza: Fix DSI1 phy reference clock rate (2026-07-29 16:15:06 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for 7.2

Correct the ESPI interrupt specifiers for PCIe SMMU and QUP nodes in
Glymur.

Correct the GIC address cells on Monaco, to avoid DeviceTree validation
failures introduces in v7.2-rc1.

Drop the secondary interrupt from the GPU SMMU on Purwa.

Fix the invalid PDC IRQ mapping for SC8280XP to ensure associated GPIOs
have functional interrupt handling. Correct the EC interrupt on Huawei
Matebook E Go.

Reduce the depth of the requested sleep state for SDM850-based Lenovo
Yoga C630, to work around the regression of suspend crashing the
machine.

Adjust the IPA IMEM address on SM8650, to avoid clobbering the wrong
memory region in IMEM.

Correct the DSI1 PHY reference clock on Eliza, to ensure that the right
clock rate is used.

----------------------------------------------------------------
Akhil P Oommen (1):
      arm64: dts: qcom: purwa: Fix GPU IOMMU property

Alexander Koskovich (1):
      arm64: dts: qcom: sm8650: Fix IPA IMEM slice

Bjorn Andersson (2):
      arm64: dts: qcom: glymur: fix PCIe SMMU interrupts
      arm64: dts: qcom: glymur: fix QUP serial engine IRQs

Dmitry Baryshkov (1):
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI cluster idle

Krzysztof Kozlowski (2):
      arm64: dts: qcom: monaco: Add default GIC address cells
      arm64: dts: qcom: eliza: Fix DSI1 phy reference clock rate

Pengyu Luo (2):
      arm64: dts: qcom: sc8280xp: add several missing pdc map entries
      arm64: dts: qcom: sc8280xp: gaokun3: correct EC interrupt pin

 arch/arm64/boot/dts/qcom/eliza.dtsi                |  2 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 32 +++++++++++-----------
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  1 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                |  2 ++
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |  2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  4 +--
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  4 +++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  4 +--
 8 files changed, 29 insertions(+), 22 deletions(-)
