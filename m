Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADCF30CDAB
	for <soc@lists.linux.dev>; Tue, 31 Mar 2026 02:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774924581; cv=none; b=Vd6g5e0/Sikx3Wk9rDf6UaMgXx4uy4QzSys0RNG+WdSW9XAVbEvGwMCES7uJ6yTD7+Ybill1Iu1nyG5Xp83QqVJ6Wm92s8bpaXhIRjFCWv3OiVbfo3sTWWk6jtsjB/vD5YsfqGAkOpQww/PEWQC/P41HRUaCr4cc1GzITaAR3Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774924581; c=relaxed/simple;
	bh=ay7yo9lrEKKlSLW7472SnaQqrDPRw0aD215tIRQQEF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NAZt1GA1AkmQdP2FkoopJRIp2c1ROwT6/94fLP/9XOoZ0N+OYFZsA2KiOEW1XRdC4bQUBvPuonnWcPHGtS9jB1R6GqNrPtY9rVWmrmfVg0iOCLxiD9pImLR/NVDejERwQotaqupT3umi4hd69/SXYHPHF/UZ5g5ho4/R5sD4V+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cki6ikCC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cki6ikCC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3677CC4CEF7;
	Tue, 31 Mar 2026 02:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774924581;
	bh=ay7yo9lrEKKlSLW7472SnaQqrDPRw0aD215tIRQQEF4=;
	h=From:To:Cc:Subject:Date:From;
	b=Cki6ikCC42aDEsIaizE+ooo0bU8J568itU2yT+vWvJZUDd1/D8rxJqWpYR59WbxH8
	 YPrH1m1DaNsVRyM6C+oUSrCleg+0ZSXvjWRYyTF9o8b5Bp6CG8E+LJk9RoaJPctl9V
	 +FYbmZIM4JlDvT5r2TbTQFm5CQ24978myxHuvHEeRSdUia00saI1EOt+VixS11dvT8
	 V75l67M2LnThSeAiMRCQdvFzf2EwcRKA7sApzgW3NF7kEu+neBxNKeplaMhna0n60R
	 QvobH15rnFn3q16nLrjjVNOoJLkqpicldHzwa2+2Qispd1CGZZENKZfnGTSSTEH6fG
	 XgfjW9Swkga9w==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: updates for v7.1, version 2
Date: Mon, 30 Mar 2026 21:36:18 -0500
Message-ID: <20260331023618.258887-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change from v1:
- Correct the commit message in commit "dt-bindings: intel: Add Agilex5
SoCFPGA modular board"
- Used b4 to apply patch

Thanks,
Dinh

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_updates_for_v7.1_v2

for you to fetch changes up to 625af11fb9885f202e028ea5afa0037f3014e376:

  arm64: dts: intel: agilex5: Drop CPU masks from GICv3 PPI interrupts (2026-03-30 21:27:28 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v7.1
- dt-bindings updates:
	- Document fallback compatible for Stratix10 SoCDK eMMC board
	- Document compatible for the Agilex5 SoCFPGA modular board

- Add emmc support for the Stratix10
- Drop CPU masks from the GICv3 PPI interrupts for Agilex5

----------------------------------------------------------------
Dinh Nguyen (1):
      dt-bindings: intel: Add Agilex5 SoCFPGA modular board

Geert Uytterhoeven (1):
      arm64: dts: intel: agilex5: Drop CPU masks from GICv3 PPI interrupts

Ng Tze Yee (2):
      dt-bindings: altera: Add fallback compatible for Stratix 10 SoCDK eMMC variant
      arm64: dts: socfpga: stratix10: Add emmc support

 Documentation/devicetree/bindings/arm/altera.yaml  |  7 ++
 arch/arm64/boot/dts/altera/Makefile                |  1 +
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    | 67 +-----------------
 .../boot/dts/altera/socfpga_stratix10_socdk.dtsi   | 71 +++++++++++++++++++
 .../dts/altera/socfpga_stratix10_socdk_emmc.dts    | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |  8 +--
 6 files changed, 166 insertions(+), 69 deletions(-)
 create mode 100755 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtsi
 create mode 100755 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts
