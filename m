Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1022AF03
	for <soc@lists.linux.dev>; Sun, 21 Sep 2025 02:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758420374; cv=none; b=TnKs5kAkT8SZ6lB0O2QCOJtYAN2HUEm2Io993Gi4ezf7X7eWEGPHNSomevYB6+WcvDCgq/JYPePBEzV9G3EA1NGGNBkWdJia//0GMZp2lUr0LS1AYYa5Bm2LOnyHrlMwzGpypaodheASGCqWA9ojNoyBNiptf0vLT8wTp+HA5qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758420374; c=relaxed/simple;
	bh=XRVEQjw1TfKD68ddI6HdIZfq35WBmMfjMmlYbT5eTks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OtvzxyfdlBXl0ddMtzv2NWdcOSyAbtGT75XVidRLNlyqBlsIJqXej7gmnr2prFjvFceA8ktDnwH06jitffPs3PpVVcbCxowgsObdhQ2BnEmQih/+VnMvpz1YlVZzkx1spOwqfHEfqwL37Wurh7x1zhlZy8DHzZ9dDAV/eoMKF3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XykrCcVi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XykrCcVi"
Received: by smtp.kernel.org (Postfix)
	id 169AEC4CEF1; Sun, 21 Sep 2025 02:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEBDC4CEEB;
	Sun, 21 Sep 2025 02:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758420373;
	bh=XRVEQjw1TfKD68ddI6HdIZfq35WBmMfjMmlYbT5eTks=;
	h=From:To:Cc:Subject:Date:From;
	b=XykrCcViqIFvL3D8GoPzc1FlkdTNNd2yNBSZ1tAwiT9BSHoTgihgWMWX6OTOXZJDv
	 3WmscXJ/je5Zi54mL/COra5VLpYtvwOQZA69FzbdZkUjzk9DRFyH7Swvgym+XtKlJL
	 2MDX+4PV2eDnavsVDqUNrQPnIBKIWjki2OTB73bqpX0uIBHA0f/CaOkzLzKZwYTzJ6
	 pkCThA71JmnBaw5CsI+EpDGE3+XcDg8FxXkzgAxNG5NFZkJ7mIegD0xxGV8mmYbrXV
	 b425PdzjW/t+e3hC8ioYKdSbZg4Gf7y4WQU7GkZBCgCab+HwtxkouEBi56/hcryuV/
	 FrH8KPTxRvUhQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.18
Date: Sat, 20 Sep 2025 21:06:11 -0500
Message-ID: <20250921020612.596098-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.18

for you to fetch changes up to cf0ed173d27a2a832642aa441eb28a4dca53fd19:

  arm64: defconfig: Enable X1P42100 GPUCC driver (2025-08-18 21:49:51 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.18

The Qualcomm X Plus platform gained GPU support, enable the required
clock controller.
The support for Qualcomm QCS615 platform improved, enable the
multimedia-related clock controllers.

----------------------------------------------------------------
Akhil P Oommen (1):
      arm64: defconfig: Enable X1P42100 GPUCC driver

Taniya Das (1):
      arm64: defconfig: Enable QCS615 clock controllers

 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)
