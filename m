Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893A3C636D3
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 16:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 441CEC4339C; Mon,  6 Feb 2023 16:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9DCC433EF;
	Mon,  6 Feb 2023 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675700667;
	bh=UKFTgb9xDyqHxPmusOu5KNqr9Dj4JHkZLfiw7RjfZvc=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=dE6edSiUGSZCmXrqPyqt+fvgZuocx6F9ZYyPoj5ZNuEWQaFSLa8Fb2fTxiruVjWu+
	 2gF71mQWESsKOWLe9V2uy4AFUCKcHhGp92yht3Ey2dnBIaE579cGm06GjNeefooMr/
	 rXkocrYtTvF8sYJiZ2TXDwZAtvHoVvCprTAEyFGfpNRRBIMBVSN3liEBP6lvUu536/
	 uTz123t4/lsfR82mX2As12hRobjRNw/l25LYnj+wMuuP2HujYaVnsZr/kgi2Eq/ezY
	 HPmbSAjglAV3Y9+nPBwGGxaCivndx6JmdE/5XGk1BtEUmd89BGdMdtTiuogz8EA3Yo
	 i8kHG7AAJgYeA==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm: dts: socfpga: dts updates for v6.3
Date: Mon,  6 Feb 2023 10:24:25 -0600
Message-Id: <20230206162425.311593-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.3

for you to fetch changes up to 2f8ba037c45925b372194df4bc27fca85fbeeffb:

  arm64: dts: socfpga: change address-cells to support 64-bit addressing (2023-01-26 08:27:10 -0600)

----------------------------------------------------------------
SoCFPGA dts updates for v6.3
- Align UART node with bindings
- Add pinctrl properties for Stratix10/Agilex
- Change address-cells to 2 to support 64-bit address for fpga region

----------------------------------------------------------------
Dinh Nguyen (3):
      arm64: dts: add pinctrl-single property for Stratix10/Agilex
      arm64: dts: stratix10: add i2c pins for pinctrl
      arm64: dts: socfpga: change address-cells to support 64-bit addressing

Krzysztof Kozlowski (1):
      ARM: dts: socfpga: align UART node name with bindings

 arch/arm/boot/dts/socfpga.dtsi                     |  4 ++--
 arch/arm/boot/dts/socfpga_arria10.dtsi             |  4 ++--
 arch/arm/boot/dts/socfpga_vt.dts                   |  4 ++--
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  | 21 +++++++++++++++++---
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    | 23 ++++++++++++++++++++++
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      | 19 ++++++++++++++++--
 6 files changed, 64 insertions(+), 11 deletions(-)
