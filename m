Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21463FDC05
	for <soc@lists.linux.dev>; Tue, 26 May 2026 14:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806870; cv=none; b=UPY2trr0fePqPdmLS8QE1KyE9xDPo7Z9X4E/CZbMAr4s1Sd7qtVj6IQqyKc55JfcvEHB9shzp8Ri36A4snq3S2cQN8NmEG6mo3HymtkhFIFPBZbYsFuk/8dsomdRatrBqqT5ysGGDBtMTp9d8oWd/sP6FYz7tj/lIPDmV6S1EUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806870; c=relaxed/simple;
	bh=I4iPR0pd3rbnXXYvHmgFYaUkKjHHBxISpGkZSsRqE5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tl+dM/VZRdSzDTYi0MsFrOnLVbbDFbUhdnh7nWDxoiU7rDeSd6cmwlA/CvJwIhvNYHIkEnBX58iOj5gZq0h75Q8y5pNpTCSuW20HscyQnaTPB0KltYncjQllwOHo2zLPqgku4N+fUIaVIMsz09K6OLLpMtPsh0U0xQ3MdleiHGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lh4vZZzg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lh4vZZzg"
Received: by smtp.kernel.org (Postfix)
	id CE42B1F00A3C; Tue, 26 May 2026 14:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7A31F000E9;
	Tue, 26 May 2026 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779806869;
	bh=RStObp8O+/IC+7JlVdvjDo5RIZxNBdmJc3V71lTJZUc=;
	h=From:To:Cc:Subject:Date;
	b=lh4vZZzgRdLKEiGvzMmwrV+jjPCQY5ljC12Qr86IUVky0d9FsMx0URhwt5ke5gPph
	 DXwTJU9dE9Ofc+QIKp4msqGRKMJ6OIYajJGKPbCdukBFBHzDbRirU7zCXwySaqMZQm
	 1NvshHT2KDVONdDvRrCpBq/Kc0zgT3bkOCITXqaqZOE1pJQkdVJY6r2Bla0fModpWe
	 SqTl2Be0Y82q+heiGUJv4fBpdYRwCcgUKY4CL81COE9cr/UD1ntVfsjE25qUXmGNz/
	 LfJKusLcTK3DU99she4AuWMujdW1eq69lbmu5ZXLBRVcA6Kmy9hciENmx8+tlu4I2/
	 VnYtEQ6TZCc8g==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver fixes for v7.1
Date: Tue, 26 May 2026 09:47:48 -0500
Message-ID: <20260526144748.2776-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.1

for you to fetch changes up to 462a85f9f887a4fef36550bb76c7f7d7a0fa296c:

  soc: qcom: ice: Fix the error code when 'qcom,ice' property is not found (2026-05-21 18:18:44 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v7.1

The Qualcomm ICE driver suffers from race conditions between probe() and
get() and will in certain cases return the wrong error code, which
results in storage drivers failing to probe. Fix these issues.

Also correct the DeviceTree binding, to ensure that relevant clocks are
described and voted for, to prevent the driver from accessing unclocked
hardware during boot.

----------------------------------------------------------------
Bjorn Andersson (2):
      Merge branch '20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com' into drivers-fixes-for-7.1
      Merge branch '20260518-qcom-ice-fix-v7-0-2a595382185b@oss.qualcomm.com' into drivers-for-7.2

Harshal Dev (2):
      dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk
      soc: qcom: ice: Allow explicit votes on 'iface' clock for ICE

Manivannan Sadhasivam (6):
      soc: qcom: ice: Fix race between qcom_ice_probe() and of_qcom_ice_get()
      soc: qcom: ice: Return -ENODEV if the ICE platform device is not found
      soc: qcom: ice: Return proper error codes from devm_of_qcom_ice_get() instead of NULL
      mmc: sdhci-msm: Remove NULL check from devm_of_qcom_ice_get()
      scsi: ufs: ufs-qcom: Remove NULL check from devm_of_qcom_ice_get()
      soc: qcom: ice: Fix the error code when 'qcom,ice' property is not found

 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++-
 drivers/mmc/host/sdhci-msm.c                       | 10 ++--
 drivers/soc/qcom/ice.c                             | 66 +++++++++++++++++-----
 drivers/ufs/host/ufs-qcom.c                        | 10 ++--
 4 files changed, 95 insertions(+), 26 deletions(-)
