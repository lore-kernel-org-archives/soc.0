Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78222F2D
	for <soc@lists.linux.dev>; Sun, 21 Sep 2025 02:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758420467; cv=none; b=ZOcLhz952RXLyskOFvEYBJ5ZTGadaHdXVSCYcexZG7rugcBpBVA9fLMMo4X+tsEf0SoZzBdpHJF7gVP0sjePydjsC2Vg9M7UQ+t9ZlqonNAbNJx7I1amJknJ9y0lCCBQoPslPdrW1XVolp568a+4oC70cY4wgkKF1colFP+/y+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758420467; c=relaxed/simple;
	bh=4yHCd5x3C4wI9aEANtmzNfFgw8YiWpvJqMysyL00Du4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Os9Pg8E4+EHdSJxCBCR700XrhiGh/UJ9w3SbPyjujFZE/f8UiSvtPAKeFKFYGI59lCjC58tBwyQnnA0+1nR1qcYqCeTrmsvEY0n7w4TSekoO7MdMvYqNuGxzL1yKbGI/ytWlG/j7u8vLFpnVrqbhIezak0C6EY3H41U1hoqR9uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALsnAczY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALsnAczY"
Received: by smtp.kernel.org (Postfix)
	id CDFD7C4CEFA; Sun, 21 Sep 2025 02:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C2DC4CEEB;
	Sun, 21 Sep 2025 02:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758420467;
	bh=4yHCd5x3C4wI9aEANtmzNfFgw8YiWpvJqMysyL00Du4=;
	h=From:To:Cc:Subject:Date:From;
	b=ALsnAczYl3NlOs92MwF8YkydVva71cmgVowbfCaA5sfYkvyUCyXaFJYD/QGt5APZT
	 dAAlvxE86qGoBwjCc6JxNd9b6VMzLgma/CrIzREGlva3sotYRh5blRqwAcQvE4bLDs
	 pf5FmnysbJRbpL9zhOMlrk3GvyIMFnv/A37uuHBw4+tVBd5eZ2Y4bSvpqvxlIuQh90
	 1vheECRDkmz6tSaoGab1xWvX+dDkpgPeIjPVn5cqbClHJjgpjowbst3z+bJC/ZQyil
	 dyAkjaQLwqANdEnB+/MWX14J/ULwXy3XMZ/WHQamF9Ko8nOYKqZ4G01huijCaJWArz
	 HPBN855WGRe5A==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Petr Vorel <petr.vorel@gmail.com>,
	Trevor Woerner <twoerner@gmail.com>
Subject: [GIT PULL] Qualcomm Arm32 defconfig updates for v6.18
Date: Sat, 20 Sep 2025 21:07:45 -0500
Message-ID: <20250921020746.596400-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-defconfig-for-6.18

for you to fetch changes up to 3e23fc50890d3f04ec8e3670c6927eb239930136:

  ARM: defconfig: Remove obsolete CONFIG_USB_EHCI_MSM (2025-09-11 16:51:08 -0500)

----------------------------------------------------------------
Qualcomm Arm32 defconfig updates for v6.18

Remove a bunch of orphaned options from the defconfigs.

----------------------------------------------------------------
Petr Vorel (1):
      ARM: defconfig: Remove obsolete CONFIG_USB_EHCI_MSM

Trevor Woerner (1):
      ARM: defconfig: cleanup orphaned CONFIGs

 arch/arm/configs/multi_v7_defconfig | 4 ----
 arch/arm/configs/qcom_defconfig     | 4 ----
 2 files changed, 8 deletions(-)
