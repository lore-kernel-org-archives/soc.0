Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D2E155A52
	for <soc@lists.linux.dev>; Sat, 11 Jan 2025 17:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736615489; cv=none; b=ACgXbZ0EygXm7DvFY8u145BBS++xiqSXJ6V/SM3z9orR5IVWo9GlaQzJfTclFXywkUwKU2+YVpTi7XwKFyyVBecb/c6cSjyCEw5vHHIRr/A8y0YqOOpZkjwm/eEFN1G0sPpJaEINZ2IiAP45xOgkpoPOFrQN1tL3Z7VWa3nbiB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736615489; c=relaxed/simple;
	bh=TV4EgiOr0QvNxIquX6LwrbCC+EAwZWTAXAYrvwrxvm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P2x4mgh+nTCKdDTT5sDL0oKJiGKW8yG6gX6GjSDu2+IT1UyTwqUm5Ou7LAIkGteDHCJGIlmB+zAAGQkM9nomv9gg0aNYHRr5ZwC3ZnzpoxaGEPWIzI7E9RdMWhOnLYfJGeWOdxwBv4fCJSfnC2oVzirtkoIn28kkqM+vzJpDN8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHhY5vzC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHhY5vzC"
Received: by smtp.kernel.org (Postfix)
	id CC50AC4CEE1; Sat, 11 Jan 2025 17:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F473C4CED2;
	Sat, 11 Jan 2025 17:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736615488;
	bh=TV4EgiOr0QvNxIquX6LwrbCC+EAwZWTAXAYrvwrxvm8=;
	h=From:To:Cc:Subject:Date:From;
	b=KHhY5vzCaRsnIxvM2lIqM3SGvVAVEuKfQDXnZW1BIrlVdMwxqRZ3G1J2pt7Wo8SeM
	 Kj7+ot43FvoeLCPp/Wpca1aYMV8dgHcD5/eNPxSocVGmTbbrkJjmWv4JQ8T7hXLnXG
	 AJJt/2hw/9OnJf2TSisL6KGv79DJqx+T1pPtfo84QgueGrVgOvPx19RUi7nJAtD2xo
	 4oJV6j0ZveghB+9Oc8huTm6t//FXXXtZ6gYSG4BxV3/hFrh/tx6bC5N+5SWfFARMZm
	 zwCFm28uAsbKU4BUW42Vo0wgSUeJnHOGGZtCw36bDswWhWxMCa5p6y5JqKUz08cDwI
	 RjPEdJtsHp8GA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Prashanth K <quic_prashk@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.14
Date: Sat, 11 Jan 2025 11:11:26 -0600
Message-ID: <20250111171126.369502-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.14

for you to fetch changes up to e3bab40d5961453545ef39aeb5198d2e718c9693:

  ARM: dts: qcom: sdx55: Disable USB U1/U2 entry (2025-01-06 17:49:34 -0600)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.14

Describe the interconnect paths for PCIe EP controllers on SDX55 and
SDX65. Disable USB U1/U2 entry to improve USB stability on the same.

----------------------------------------------------------------
Krishna chaitanya chundru (2):
      ARM: dts: qcom: sdx65: Add PCIe EP interconnect path
      ARM: dts: qcom: sdx55: Add CPU PCIe EP interconnect path

Prashanth K (2):
      ARM: dts: qcom: sdx65: Disable USB U1/U2 entry
      ARM: dts: qcom: sdx55: Disable USB U1/U2 entry

 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 7 +++++--
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 6 ++++++
 2 files changed, 11 insertions(+), 2 deletions(-)
