Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7D93D566D
	for <soc@lists.linux.dev>; Tue, 31 Mar 2026 20:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774990402; cv=none; b=oBMhJRDq9MDsNADQqrj7eR9ouVswS2pjw44jmv1Qa7DN4yNyK5o8YEQOTd2ZRZLk9Xgg7BrpwgoduUnCFPPFXDzqqp+t5KqAyyq05kcfvmefWp4qa+bcG+Jp4H/zaVKwCcE00u7bUOnD45o5Mkjo0BAzchryjcN/NE6Y5+yxo9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774990402; c=relaxed/simple;
	bh=x9UvOv0YJRzcsdGEQnhZlvNVNt/6OghCH7bhRc/MRdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kPhUZJO4F1V6TPp0Sci6MbhrRzlwNEBa65BMosjWtVmTuhhbV7t/T07Gf1eHzkkSvw4ID3rPxQB29vfa/tlTL7k/uXqVG90TBAh7ChBN9t+qeCRUA9KH4AQmwUyWVKPgWVpqaOp/RBYvo9tSE8L5sEKuBym3T+k5BuMj7JOrhKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=umpA/U03; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="umpA/U03"
Received: by smtp.kernel.org (Postfix)
	id DA8C5C2BCB2; Tue, 31 Mar 2026 20:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2832DC19423;
	Tue, 31 Mar 2026 20:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774990401;
	bh=x9UvOv0YJRzcsdGEQnhZlvNVNt/6OghCH7bhRc/MRdo=;
	h=From:To:Cc:Subject:Date:From;
	b=umpA/U03EBFsKfKcuLIJWoFPDip/PxEOF+yeMwP8RFFCIcBqOS0ulC7ih/hkK5iT6
	 FA4crWMc8ea/hg6ScRj9jVTrIHrSgj82axc7ykYDx2yBT9vjaJOevt67aUa/MCsIHL
	 CEi8mq3i3mjRJ9fbwnqJek9y5sGCngH9d42CYPYvCvkoMXbSW+96tXk3SvFm+kDRov
	 mDtu1O+ICQCgUeSrYYSV2v/73Ic7L10m2Rr04tEWkn62zhD0bi0gxPQ3HKfHKDYNil
	 98ysIUydh5CrOyUILlnElQQ+LHO22tTqr2r6CADqT1wcGW2Dh0qW1o40GigBV/O/kW
	 kunHuTx8BZijw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm Arm64 DeviceTree fixes for v7.0
Date: Tue, 31 Mar 2026 15:53:18 -0500
Message-ID: <20260331205318.952913-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 2c409e03fc04b5cded81b7add9ce509706c922e3:

  arm64: dts: qcom: agatti: Fix IOMMU DT properties (2026-03-23 22:31:40 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.0-2

for you to fetch changes up to 11b72b1ca9891c77bc876ef9fc39d6825847ffee:

  arm64: dts: qcom: hamoa: Fix incomplete Root Port property migration (2026-03-30 08:08:48 -0500)

----------------------------------------------------------------
More Qualcomm Arm64 DeviceTree fixes for v7.0

The shuffling of reset and wake GPIO properties across various Hamoa
devices left things in an incomplete state, fix this.

Add the missing "ranges" property to the QCM2290 MDSS DeviceTree binding
example, to fix the validation warning that was introduced by the
previous fix.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      dt-bindings: display/msm: qcm2290-mdss: Fix missing ranges in example

Ziyue Zhang (1):
      arm64: dts: qcom: hamoa: Fix incomplete Root Port property migration

 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |  1 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  | 16 +++++++++------
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 24 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        | 14 +++++++------
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   | 14 +++++++------
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  8 +++++---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  6 +++---
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    | 15 +++++++-------
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 14 +++++++------
 9 files changed, 66 insertions(+), 46 deletions(-)
