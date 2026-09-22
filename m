Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBB554856A
	for <soc@lists.linux.dev>; Tue, 22 Sep 2026 13:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082720; cv=none; b=unbXItnQyeWL7oGaKiVUytyh1u7yKpY9zOx6VEel9ZTiSmkcROpmEj72m37jqruBNBqyBHUY3DnZFBB/vZENrrPDUk0uKo8GirsxA+/bcA5PX63+jBIWtsSCUl43oz+rnyTYgiGMY9SF2qQGZwjFtdkDRHgRpAsMvIcUOYLIbFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082720; c=relaxed/simple;
	bh=Kupu1SSq4AZn/igR8BAuaVCKNkr8SbRGOjyOIVd2Ico=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qTqt6su73o8eBY+Ot5LPEIt5Z/pYz0g9Yyv1FIJ/9hYqyfx+4yoUbgGjKSB0Clb+ufFNZsV13YG8vK3QYL1Hlcdz+nqqckp9fZEu4rmxoTMjg48WwSDNQf56rI9MGqBdp6+AcUYyGJxAIeHy62i/x6WVdgdqLzA1Z5m+EAW5vlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qt49J1jX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qt49J1jX"
Received: by smtp.kernel.org (Postfix)
	id A2D121F00893; Tue, 22 Sep 2026 13:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFD91F000FF;
	Tue, 22 Sep 2026 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082718;
	bh=ienGrWTvdd6zKEIXYDHaFGXqV34LCLMuSb1WZLdttt0=;
	h=From:To:Cc:Subject:Date;
	b=Qt49J1jXvTA9fPhpuKJiow83uONDOaR0kSiTOaCu2O9cGBI8WtyaFMsUvpJ9oYYsF
	 xf85IA2arRmFPIu9YbjpicrI4v+14LsdG2w3CB7jxgAQretvKJ+jmiuGyBEnzmhwtx
	 7K2bdfhN7ivbDAmk9gt1X4ZNJxMNzmTzJIZvccGEAAfp7u3Puq+rUtssTKd2oFFK+4
	 ZMj1+nDgTkuXIB8iEQjOGnLReZ/IpvrviCwlLLpOJKAQEMuDmegLMBwkhMB2fd4CZJ
	 ZkdRsG//fjCaggZIxme5FdmEIatJzQHZ2NY8jedmBuOFJzShN0bQVS8VqjA9E9hitU
	 Dngj0dICNgEjQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm clock fixes for v7.3
Date: Tue, 22 Sep 2026 08:11:55 -0500
Message-ID: <20260922131156.358224-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-7.3

for you to fetch changes up to 55981579b27b6541aeeab81c768f248dba0491ac:

  clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as votable (2026-08-31 15:08:41 -0500)

----------------------------------------------------------------
Qualcomm clock fixes for v7.3

Mark Kaanapali and Glymur GPU CX GDSC's voteable to use the right
programming model.

Fix the PCIE_RSCC clock programming in Eliza, Kaanapali, and Hawi.

----------------------------------------------------------------
Luca Weiss (3):
      clk: qcom: gcc-eliza: Fix always-enabling PCIE_RSCC clocks
      clk: qcom: gcc-hawi: Fix always-enabling PCIE_RSCC clocks
      clk: qcom: gcc-kaanapali: Fix always-enabling PCIE_RSCC clocks

Taniya Das (2):
      clk: qcom: gpucc-glymur: Mark the GPU CX GDSC as votable
      clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as votable

 drivers/clk/qcom/gcc-eliza.c       | 6 ++++--
 drivers/clk/qcom/gcc-hawi.c        | 6 ++++--
 drivers/clk/qcom/gcc-kaanapali.c   | 6 ++++--
 drivers/clk/qcom/gpucc-glymur.c    | 2 +-
 drivers/clk/qcom/gpucc-kaanapali.c | 2 +-
 5 files changed, 14 insertions(+), 8 deletions(-)
