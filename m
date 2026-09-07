Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9700C511229
	for <soc@lists.linux.dev>; Mon,  7 Sep 2026 16:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798000; cv=none; b=BcjrT9vE1hrVu0irbkBI8hgcA0xbFEaDdSnvfG86vH+m+0ICQmfIH+9VODbrg1JspCNmm6ohjGMquWMaYmzrEM203LhSnlNEU7UGdq3SAP7W4FtZTBZ1OpujADZxxtVB446J/DVFzE5SZYFPtYhxKoLfoa629ZEICmrGwpghDDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798000; c=relaxed/simple;
	bh=gsxQBDgTAXbl9RswFqrHPhOtNeA0CneeA1euV6ONHls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kyb94lRQLIvzi+z8TfQhyASSImWi/f5ceEe3CQ2a/JEb2WYDQ3YhHzpA2e0JJjyXP+KoqU1GxBf58TBl8m1U42aDqlGil+yVBHhd3955dunWniTcN5grffa2TrnclV5PE7M/+ea7sNq/AhFWNg4Fs7d+LpmjsYVOcn9JC4dLBEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCTEsmUu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCTEsmUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469AB1F00A3A;
	Mon,  7 Sep 2026 16:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788797993;
	bh=YnExfoRh2l4WPiz+TeqVQ2xa2VPv5FI8CGD0LOGjjoM=;
	h=From:To:Cc:Subject:Date;
	b=kCTEsmUuN1Xob1tY0cGMPjUvYzzFAk/bjIwaNS5Xvv8U582JjkV2LOWkt3Q7JVNz7
	 GquH90Xz1e2EvNa/wvCSEq3trHl3twDWguFMapJm35qi/z4044KNRQSPUcK/JgR0Ar
	 ud+5/jXxnFJUjF1st+eW+U3PrLbGLtpwwnMDha33BMZy9m8j6w0OYKFWSeupVPgC5Y
	 57v6LnZRlqtcIH/txvtVkcUKODd43E5+9hfgQAWCUPobAUQt9InG+ZtEtQu27Mvxz0
	 GjatLNi97qm/W3Aj/FeuJg1fkBCIexNA43qAW8OxbloXmf6eX+OC5DV1b9UIGtyEsl
	 5V5SSaOZG8IAA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm: socfpga: fix PL310_ERRATA_753970 Kconfig option
Date: Mon,  7 Sep 2026 11:19:52 -0500
Message-ID: <20260907161952.1148669-1-dinguyen@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_fix_for_v7.3

for you to fetch changes up to cfc1e9a543e3589ba200795b6e7fd8ef4314efdf:

  ARM: socfpga: select the PL310 erratum 753970 workaround (2026-08-31 10:44:39 -0500)

----------------------------------------------------------------
SoCFPGA fix for v7.3
- Fix PL310_ERRATA_753970 Kconfig option

----------------------------------------------------------------
Pengpeng Hou (1):
      ARM: socfpga: select the PL310 erratum 753970 workaround

 arch/arm/mach-socfpga/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
