Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707BA22B595
	for <soc@lists.linux.dev>; Mon, 10 Mar 2025 19:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741634051; cv=none; b=MjyrjiEjOuua2pRQboGCP+h/YVFXowO4Fe6I0uArqO0VG4RV1Kr+/yMIi/jRmh7w4R5azqxTAfDdI5+Ruvc7SyA0hriHdk6Prr1exJq8XYRkCJxZWPRvlGO8RTfzA9G5hEmVBjdUMi92SzMHzshMRI1mJ/oCOHqQErB4bQRm+ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741634051; c=relaxed/simple;
	bh=xQeemCsrfUF+jP/rsD1veh7JdHq+E8YcGMftlCccdmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fCorVfkQg4muObtnlSynBzSP8SYA/zxg2SEBcywuPwkvqGQSlnCUlcWcrMkoQrWEDBRiM+7cg5FKx2PfiRxiW17oSI8wXCna1vuP40LIZCcbcZ3bxJ8JgNZrdAky59L8/qBBcFlYnpZxUnbGZJu8bu+fx9EDIWjjMXoVhdsDBS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yi88lkeb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yi88lkeb"
Received: by smtp.kernel.org (Postfix)
	id 08F18C4CEED; Mon, 10 Mar 2025 19:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD97C4CEE5;
	Mon, 10 Mar 2025 19:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741634050;
	bh=xQeemCsrfUF+jP/rsD1veh7JdHq+E8YcGMftlCccdmg=;
	h=From:To:Cc:Subject:Date:From;
	b=Yi88lkebQIjrJiDYz7RgeYpBz1fH4NtfixP8nEee3ndJTluyve9Hm/vB3WOFUmmiC
	 i2DcYZrmIGl1HMv8S/mYOXsFupNTmOixGBXVDp7HnkqJiyN0u9wpp7TK82tc9W3IFJ
	 2U847Ap6yxYmZweDIwMDajso44Iahgnu50LCeIYp4jzkHGJ0pPfmqd3gW/DjbYRdU8
	 ULwJXqwCIoZVFkKDoD6DUKIMKAds+zJyEOSePF0hGDzgGxk7jZqi/cdswQBi37I03i
	 pq/dn1MDUxj6s80k98cyLUVRySlRztRHPlhGJ3G+qmWO2I+p/BHgynVdmq1Ud1+V2w
	 lWCaJcELT+SGA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 Devicetree fixes for v6.14
Date: Mon, 10 Mar 2025 14:14:08 -0500
Message-ID: <20250310191409.1208520-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.14

for you to fetch changes up to f00db31d235946853fb430de8c6aa1295efc8353:

  Revert "arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on apps_smmu" (2025-02-25 09:52:52 -0600)

----------------------------------------------------------------
Qualcomm Arm64 Devicetree fixes for v6.14

Revert the change to marking SDM845 SMMU dma-coherent, as this is
reported not to be true.

----------------------------------------------------------------
Konrad Dybcio (1):
      Revert "arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on apps_smmu"

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 -
 1 file changed, 1 deletion(-)
