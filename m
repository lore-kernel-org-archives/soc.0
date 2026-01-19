Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2F428C87D
	for <soc@lists.linux.dev>; Mon, 19 Jan 2026 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838803; cv=none; b=WWMd3iD6a5fKpFURM3QhD1U8U1IbF3aerLz/ZeqOp2DRZlCoDgIlZaLlfNywoVharuhaIG/GE4GMLnBB3B2M0Yk/QVAhkH1V5WPcDNWquPJk8p7p7XeVRvxMtpRCtEQJ7uIkXDiYPzDPoFjomSEUjE3p5DNESHor4euD8v27LIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838803; c=relaxed/simple;
	bh=xo28tgWBvvqBcKarBmzdhk1+UC7ykuAy3SMnlm0dwjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LlNDKEyZyWTCIuPlduxdEEJy7SThoGFxS945OVw7L5bPNQaE32aZck/mfKgY2gneQ0Sw8C7lKvazPHxOMgMOGze71XuZFeMwHCu/d34Ic05RMSBmRzOxm5Ri3hoPQ2u62tHnRqNERw5V7UhFLB5PCiaqBhMC6qQD1rQZMKKZgf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r7U4Aveu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r7U4Aveu"
Received: by smtp.kernel.org (Postfix)
	id CB297C2BC86; Mon, 19 Jan 2026 16:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2231BC116C6;
	Mon, 19 Jan 2026 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768838802;
	bh=xo28tgWBvvqBcKarBmzdhk1+UC7ykuAy3SMnlm0dwjo=;
	h=From:To:Cc:Subject:Date:From;
	b=r7U4AveucwM8EVCwDML70klVCqCPN3a89Qv2WUsOz+/dwsFzOkDoracEZx64nOQWv
	 J3K1rbgQXZArk6Obj5A+duVI9qDvBpKK32D7wxGJ3EY+3l/D1VAsE5abKOSN+wG1nN
	 p23ZS+tXrpHzDmaCr4QVB6sCQBTzuvoBif3ponqBXn68X5jCVH5bLJ/XaLp87KDmW/
	 JN5rpXwsQRlEtdC3Z4Z2sOoCtQzd0dGZc9vzy1XzZeOGtLh+RDsZOiWL0z9uKOFc96
	 +J8ggkvpE2hQNg3XT8lrgl89U60yf5swlJH3ULXtxg2RYrslhp9iurImKY8JwWeDnz
	 gUmpTsXttLTag==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca@lucaweiss.eu>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.20
Date: Mon, 19 Jan 2026 10:06:41 -0600
Message-ID: <20260119160641.840311-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.20

for you to fetch changes up to df7c440c904f754d8c94863a910d99e7ed8bbda9:

  ARM: dts: qcom: msm8974: Start using rpmpd for power domains (2026-01-19 09:40:32 -0600)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.20

Migrate the MSM8974 remoteproc power supplies to RPM provided
power-domains, to match what is done on most other platforms.

Give the LG Nexus 5 its more human friendly model name.

----------------------------------------------------------------
Luca Weiss (3):
      ARM: dts: qcom: msm8974-hammerhead: Update model property
      ARM: dts: qcom: msm8974: Sort header includes alphabetically
      ARM: dts: qcom: msm8974: Start using rpmpd for power domains

 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 13 ------
 .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    | 14 +-----
 .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 12 ------
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 12 ------
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 50 ++++++++++++++++++++--
 .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |  8 ----
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  | 11 -----
 .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |  9 ----
 .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  | 11 ++---
 ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 12 ------
 10 files changed, 52 insertions(+), 100 deletions(-)
