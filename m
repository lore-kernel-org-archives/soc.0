Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF6A3FFABE
	for <soc@lists.linux.dev>; Tue, 26 May 2026 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807525; cv=none; b=pIw4b+K9+Ira2Q9Nf0tRjoQnIrACGesBfmXI8sP68i9unjnnwLtMRi1S5qC4eMgRUre/zbRQ4teumoGmVuuhu67Z/FcuLE5rjcTe7o8lwRS3ZLtoSVgi2Rm9iNtaPfxbkfGWfKgtLyosPLU3HJ1J9fjAZaIIeJCC3pSF/ZQ32bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807525; c=relaxed/simple;
	bh=Q3qtZLbaAxNe/Ml4Vco9cMIjOM7QZfDDdQCMEVNa+bc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fR2ph+vNTZFQE4Um0rgo2Dg1nOuipD9dK2KIUOv65A0TpHB5FrUzwOY8+3488qmtVBo1HDrC59BBGt9o0Z4NXxcMwVaVoJzgnhY5755A7gTC6R9JThgec4cOVNmREmu2BJwGEDUkkSqyeECKdIJoH5kkPsE9GCdPeKxQleddSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3h9MqkN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3h9MqkN"
Received: by smtp.kernel.org (Postfix)
	id 3D67D1F00A3D; Tue, 26 May 2026 14:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C221F00A3A;
	Tue, 26 May 2026 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807521;
	bh=WnbVx3Wf8n6g8+1K3F3HfJOpAIxDrMkmDGUSYXimutM=;
	h=From:To:Cc:Subject:Date;
	b=S3h9MqkNM7nhIQAdnHRqHHOhGORSU9uOCjaf1rtdfYFp1vrt/v0ykAnPzXICAuCZG
	 vszIoZPShp0ycja1BRp8WG9jZw60mTtiO/zDphA1stmOD7LfQr5UjlkzvvJ1JHYP4L
	 4KwJLnHx6A9YdOI/CymDyR834bOH2q+oBe/NOTHboC2esPGsC1hIckPl/57dISN2KC
	 uUTdnHNkwyx4JuO4jm0/6E1thR7T/7IuBbemaAVnHu4XMs/rNdHHssgEOml/bOZdlO
	 HWzgYF4N6H1Ywnx2EGxu/jxldrmdfeJ070ZINYva1heUwR7IFMTnRWRa9cpC2pqeUZ
	 /9jrRFihLaxOQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig fixes for v7.1
Date: Tue, 26 May 2026 09:58:39 -0500
Message-ID: <20260526145839.3800-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-7.1

for you to fetch changes up to b73953af9bbd5c721c9d92b805a8aea8b0db74b1:

  arm64: defconfig: Enable PCI M.2 power sequencing driver (2026-05-18 09:56:50 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig fixes for v7.1

A number of targets now depends on the M.2 PCIe power sequencing driver,
enable this to keep these devices functional with a defconfig build.

----------------------------------------------------------------
Manivannan Sadhasivam (1):
      arm64: defconfig: Enable PCI M.2 power sequencing driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
