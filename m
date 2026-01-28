Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C9A36A008
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 15:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612617; cv=none; b=rdmMU5ngQyFUr7RM3dWDUsKN3Ju+UvtdhhSldlR0+krO2ILlbHh6TVw/GoLc6e2rG1d3KA9SZR1y68WFirXDnKehLHT1x7kOoQH3H9Al5ljXY+wYSQ0V2BSHNVTMrzPDfsc7zLuWSh6o3D3RYwdopSre+ueSl0XKaiBTNS/feOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612617; c=relaxed/simple;
	bh=SRI/Bhj5iQxuWLS2Y73G5XTyLHgrFBNxPOnmb5dA5zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CfQjRS+J6wWhHMunw0Fj5PXNLa7hw85zSI68Dk/NIR6t2jlxAsOB2dUZcWkzY3aksFJWRy3yP6ZQLAR7rm5iIkrWNLjqbm5Jw/oJPi3TWlIsoMJm8iY0p2Lx6PEcQB5cDpmgj+Ghbfp4Y0WJvxrXa1IJYhtLrlB3ki2qOPPAiog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLoWLJsB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLoWLJsB"
Received: by smtp.kernel.org (Postfix)
	id 72379C116C6; Wed, 28 Jan 2026 15:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50F6C4CEF1;
	Wed, 28 Jan 2026 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769612616;
	bh=SRI/Bhj5iQxuWLS2Y73G5XTyLHgrFBNxPOnmb5dA5zw=;
	h=From:To:Cc:Subject:Date:From;
	b=OLoWLJsBoBmxjaPnML7nSJiQA7OyXqjyx9+FFNnMGrWMtj0npzizD/S2bk7uWQilu
	 QKNftvWLH3Y6gdgWqydGgLNuZuQCQY2GlGgbfKKRUuCIzCsDdSHN0e8oXfIr78lagR
	 0FZY/Y+BSJdYk28ky7M+iP5T7PLDkEXcbZmNHrLapwqFFLRhUjmhI3UKIXVqPuxlYp
	 LNOVofO+XbrABJfpedRhk/2wgR0v+F+iOvlc6oW6jecMLCugPZTtEBXhK/mo+KFTtA
	 FNYc8i1dS1tr9w1mWJrlwrdirbj/MynnZlggUokTfs5B2zd3EAwTPBXBzHX/dqQZ84
	 XaO6R/2XYGvdw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm Arm32 DeviceTree updated for v6.20
Date: Wed, 28 Jan 2026 09:03:34 -0600
Message-ID: <20260128150334.2089748-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit df7c440c904f754d8c94863a910d99e7ed8bbda9:

  ARM: dts: qcom: msm8974: Start using rpmpd for power domains (2026-01-19 09:40:32 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.20-2

for you to fetch changes up to 4506cdf52a806be0d9e1b1c0b6c9bc2909ca8b1c:

  ARM: dts: qcom: switch to RPMPD_* indices (2026-01-21 15:05:03 -0600)

----------------------------------------------------------------
More Qualcomm Arm32 DeviceTree updated for v6.20

MSM8226 is switched to generic RPMPD_ indices, to allow dropping the
duplicate platform-specific constants.

On MSM8960 two additional GSBIs and I2C controllers are introduced.
Accelerometer, Magnetometer, NFC and Light/Proximity sensors are then
enabled on the Samsung Galaxy Express.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      ARM: dts: qcom: switch to RPMPD_* indices

Rudraksha Gupta (5):
      ARM: dts: qcom: msm8960: Add GSBI2 & GSBI7
      ARM: dts: qcom: msm8960: expressatt: Add Light/Proximity Sensor
      ARM: dts: qcom: msm8960: expressatt: Add NFC
      ARM: dts: qcom: msm8960: expressatt: Add Magnetometer
      ARM: dts: qcom: msm8960: expressatt: Add Accelerometer

 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           |   4 +-
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 109 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  96 ++++++++++++++++++
 3 files changed, 207 insertions(+), 2 deletions(-)
