Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DC23B9930
	for <soc@lists.linux.dev>; Tue, 26 May 2026 14:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807209; cv=none; b=rzaKXoaEIUX8bZGpYFVoGU4roHfxzD9zAV4WO3gPTPiAMfiKJO9QQ7X28lxf+2Eu3KjZYvz/QE9JZVg4Rk2d0hebwIOqMO/JX8HyKsXpkf6uGsrfeA5QaCkq68DKG1k1YqAQHsmQnpmnJV5pA5dOS40W/sbOrrRoTNiVcTuzBrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807209; c=relaxed/simple;
	bh=J7KS84d0wt/zG8e1LkOZRy4/IGi/wYaDDu5n3JaES+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CxvxNQOuodp+Xu7W1HdA3jacaBFRmKvE64RGbVOQunuE5DcegPaEzU4dSiAC6SVVyJisAWfPWl8ZKAYczs+ECBDQ27KtwxlRtelxaymATJd3rZvqMnt7ffYGRxZb42jUZjCRdQbHr98JZIY4LB8JizbWWDuMGIbC1ZCwBrV42cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAM1KIY5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAM1KIY5"
Received: by smtp.kernel.org (Postfix)
	id 70DF01F00A3A; Tue, 26 May 2026 14:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F881F00A3D;
	Tue, 26 May 2026 14:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807208;
	bh=NG1MsJD+6r7VdzmGyqNvXHjFFZ8NsZMlL149djZSr2g=;
	h=From:To:Cc:Subject:Date;
	b=gAM1KIY5bwj49FuQYukZaEMwgitseVn3EbKtSxJdWs8YFyuOMTPA0vq0maMBegu9Q
	 Jq4HO3zPzN70CZoz17fpFothsZFMaHtqpmfWjQ+2twUZZu6RdaNPnFtLtMxBiIn3t2
	 LsFaTw4gh7P8mLDgfp+9ji5EmQyJcU9j4/SKI+llCHCa0y6DTw6dnVJO1YgOaK07Fq
	 +ciKoyeIPK1/69UVye8EIOTmTTy3kVWLmfx9l2Txo85tMN5+dX7w1rH0oPkpok2s3g
	 7N3AY/684akel4mlBcv0Zri8zVBBCC3u1A2xtpPUjPrpVm7NZIznSxi71qUifSrUhv
	 qtpBDtNMDcWUw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Val Packett <val@packett.cool>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v7.1
Date: Tue, 26 May 2026 09:53:26 -0500
Message-ID: <20260526145326.3243-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.1

for you to fetch changes up to 67802f981361ebb49cc25175c57179aecb14626c:

  Merge branch '20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com' into arm64-fixes-for-7.1 (2026-05-21 16:34:26 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for v7.1

Add missing power-domain and iface clocks for the ICE node of Eliza and
Milos to avoid the validation errors that resulted from late binding
changes. Also drop the reference clock for the USB QMP PHYs, for the
same reason.

Avoid touching the 20'th I2C bus on the Hamoa-based (X Elite) Dell
laptops, as this conflicts with the battery management firmware.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: glymur: Drop RPMh CXO clocks from QMP PHYs

Bjorn Andersson (1):
      Merge branch '20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com' into arm64-fixes-for-7.1

Harshal Dev (2):
      arm64: dts: qcom: milos: Add power-domain and iface clk for ice node
      arm64: dts: qcom: eliza: Add power-domain and iface clk for ice node

Val Packett (1):
      arm64: dts: qcom: x1-dell-thena: remove i2c20 (battery SMBus) and reserve its pins

 arch/arm64/boot/dts/qcom/eliza.dtsi         |  6 +++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi        | 20 ++++++--------------
 arch/arm64/boot/dts/qcom/milos.dtsi         |  6 +++++-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi |  7 +------
 4 files changed, 17 insertions(+), 22 deletions(-)
