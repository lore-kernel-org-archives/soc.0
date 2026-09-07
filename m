Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C0519939
	for <soc@lists.linux.dev>; Mon,  7 Sep 2026 16:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798021; cv=none; b=WSpGksRO0R9Uf20gr4opGOY1Vq9YrjaSOR/VvKZTfl5Jmw61Y1vQ1jhDum7NILeH5kvVVhLigcSqGpAhGXDOLitkEsvEYLSQ0AiwVXEiaI2lKiXt5N/IRO4Ben+qScrihRje5ULAFMyBQ9C883jJHiV4wReTBQdjAQyW3YJDTYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798021; c=relaxed/simple;
	bh=sbVDL5RSMYqgpAxVcVYyjtHH7mVbJmdcF9VUb4f1dPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I8RzMBoIzGW5l3HK362nQ4/Dmfmf4jIxYB/bDqgzCllaHSOLmcHM8NrONkvi9e8fCW0Fph+d+ymlIkrQ/PD2qzvbXhziDuVRtiy9L445iwIQX9gW2OzL831abzlVfBzTlPQIlM/iOXj+FQjakX1zFHecddVbIZir07kODxBHlwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4I4zQzp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4I4zQzp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF2E1F00A3D;
	Mon,  7 Sep 2026 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788798017;
	bh=Cw8A5DQf1axmrcHfnWBzzoDZK3C6lKXke5eM/STvWnE=;
	h=From:To:Cc:Subject:Date;
	b=W4I4zQzpu0fTBdaqUoh2PeOEf7nwbfRMVCbYj6qdPxWJPFB9xPtYKy3+u8ptXzFEQ
	 TG9dObe5jMbljHeYQ+KkYmGRUZe+tDYGSCL2OaKNVyTkLaK9xOicnvqklbIVGUVyXH
	 k8JP9UCkYjzHowX8FEpbLXfZ1HfOo7Vf2GYe48Lg4ky3JwSJj6fXTwBJM8wnOA6lYt
	 GvYzEelowiO1fdygocZhSCQoov/cw6/Rgj3pDrLVW0+F9YCn4sutcWgP3Q+QF165xK
	 Hfhx5CLFu3w5djhjK4gbdcA2CGZRx+Li+GuxznGe2kvU3w2EXuiHmTL7Es1OxLOC8k
	 8jr29JfMuhAIQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: fix file access permission
Date: Mon,  7 Sep 2026 11:20:16 -0500
Message-ID: <20260907162016.1148705-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
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

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_fix_for_v7.3

for you to fetch changes up to 5f8cb07d7a8573753c5d31dc76b51cab8e5e9460:

  arm64: dts: socfpga: change access permission from 755 to 644 (2026-08-31 18:08:36 -0500)

----------------------------------------------------------------
SoCFPGA DTS fix for v7.3
- Fix DTS file access permissions

----------------------------------------------------------------
Dinh Nguyen (1):
      arm64: dts: socfpga: change access permission from 755 to 644

 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtsi     | 0
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtsi
 mode change 100755 => 100644 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts
