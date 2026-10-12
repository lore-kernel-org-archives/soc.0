Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0B44CE677
	for <soc@lists.linux.dev>; Mon, 12 Oct 2026 19:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832867; cv=none; b=br5gb4d3wcBongPEi/6udT+mzn7uNqaUG1Rqc628WIyBlUyG6XERMcNK+A1YJgrH6ZE3MZUB6pSaNU5uM1WSoNa8CZpLHWkb0wKzpmSny746akpvVLcLUCBoC/X2+MnY0pGAqjtFDSnRy2J7PQ6JCv1wCIhmSmq38nRnIYNJR5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832867; c=relaxed/simple;
	bh=r8GHIgBtTR7WSB0FeH03V1z3B5/YXMhj2GbjMcamAsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iQa9NG4WytyyldphZVY17Z0SCqDXBv2e8SFnePucwD0JfpL7dWNlIv2U1+OWe5IzfPp1fI1iQ/EqnKzab0qHppLMuU/DtqoggJ7jZdqzKTRidN7/YlRuDatTU0iayu2OgpQgUsZ5MC3cVbOryfNiJjkqrTsvB3sSj7/UJgmPNiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yx3pr79S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yx3pr79S"
Received: by smtp.kernel.org (Postfix)
	id 4D5161F0089B; Mon, 12 Oct 2026 19:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89121F008A1;
	Mon, 12 Oct 2026 19:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791832866;
	bh=bsaFSZfndAczrKiugFmOGwtt440SXaY/1HwOOWFeNCg=;
	h=From:To:Cc:Subject:Date;
	b=Yx3pr79SOnZBTyh4x5/XmITPz1+aTdKgovI/dHQX4ZW6FagzVMvistC/u8xAXKJpc
	 7P0Mo2/yZxuxboOkgRbB4I/B5RnnhTBk7Klcb6KOgViaagpEowTI5lJuEeRZj7Y9fZ
	 c/4PK3dhQPRFn/QJHkh0U8zN2wn6gouVyl7KylaAS+baZp6eTfpuAyfvTABfIzGVmr
	 qS/kHhZOR8F/gRtC/ccBr50TuaFwPB8C6FwRcT2QdSGUZZhcaOLK3lMGLiIdVwU56I
	 WLbzKTwseYAfuRz6ynkpd7WptCg40fQ366ochZ/xwDNx4SiSZlZIFozjlUdYPoXB/T
	 idJct2b0Ue/+w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Antony Kurniawan Soemardi <linux@smankusors.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v7.4
Date: Mon, 12 Oct 2026 14:21:02 -0500
Message-ID: <20261012192102.12999-1-andersson@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-7.4

for you to fetch changes up to ccf7f47dbe15d2c2bf57e7c443e9e485d2290c2d:

  ARM: dts: qcom: sdx55: Fix PCIe WAKE# GPIO polarity (2026-09-27 21:25:32 -0500)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v7.4

Add MSM8960 wireless connectivity support by describing the RPM clock
controller, SCM, SMEM, SFPB hardware mutex, SMSM, and Riva/WCNSS nodes,
including firmware memory and Bluetooth/Wi-Fi pinctrl state. Enable Wi-Fi
and Bluetooth on the Sony Xperia SP (Huashan) board.

Fix MSM8960 USB clock descriptions by wiring the controller to the RPM
Daytona fabric clock and correcting the HS1 transceiver clock usage.

Fix MSM8974 display by adding the MDSS reset line needed for reliable DSI
bring-up, and fix the SDX55 T55 PCIe WAKE# GPIO polarity to active-low.

----------------------------------------------------------------
Antony Kurniawan Soemardi (6):
      ARM: dts: qcom: msm8960: add RPM clock controller and fix USB clocks
      ARM: dts: qcom: msm8960: add SCM
      ARM: dts: qcom: msm8960: add SMEM & hwlock
      ARM: dts: qcom: msm8960: add SMSM & SPS
      ARM: dts: qcom: msm8960: add Riva
      ARM: dts: qcom: msm8960: huashan: enable Wi-Fi and Bluetooth

Dmitry Baryshkov (1):
      ARM: dts: qcom: msm8974: add MDSS reset

Krishna Chaitanya Chundru (1):
      ARM: dts: qcom: sdx55: Fix PCIe WAKE# GPIO polarity

 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    |  15 ++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 169 ++++++++++++++++++++-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   3 +
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts          |   2 +-
 4 files changed, 186 insertions(+), 3 deletions(-)
