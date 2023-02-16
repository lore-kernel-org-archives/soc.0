Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029A9C61DA4
	for <soc@archiver.kernel.org>; Thu, 16 Feb 2023 16:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B476EC4339E; Thu, 16 Feb 2023 16:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40498C433EF;
	Thu, 16 Feb 2023 16:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676563752;
	bh=Uo8PO7UmbCaciQjMc3h/duLj5lVYU6X0KGvADjsZlts=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=oyVI5AKx2TvgJiMpG/5PUFgnIJ+z2XQWJ7l/D2f/Rwqy8dr8yEqw3gfoa+RFxdA5n
	 9nU3OLqEUbXuj4akHlq+sLyRLkfhVE3K1+a5OdfWiUOli861umaLGENIO7sPzx7HDH
	 mXUChgeOq/vx9CV3CJC070+zXtKAGyHI0ngi0y/cw63B6mOUpOV0S0j2lMjFuNd/i0
	 XUfwjLWSCyx0468n7LxyIZrkoEi6IoaWCGz+XxPXUY57Dy7Z3OtHYD/ZR3SWJnlQDO
	 x/LS7j/1TH5tvb+/eHSbDJ4bYaMthhn3Yzv3qwL3P9sxypcj9ZovchMv8PPjJABsEr
	 mRAGpvE+x7HjQ==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm: dts: socfpga: dts updates for v6.3, part 2
Date: Thu, 16 Feb 2023 10:09:10 -0600
Message-Id: <20230216160910.509065-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2f8ba037c45925b372194df4bc27fca85fbeeffb:

  arm64: dts: socfpga: change address-cells to support 64-bit addressing (2023-01-26 08:27:10 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.3_part2

for you to fetch changes up to 2d050f06485ae987ba57da33bc4f7dccd4fd7485:

  ARM: dts: socfpga: Add enclustra PE1 devicetree (2023-02-16 09:18:06 -0600)

----------------------------------------------------------------
SoCFPGA dts updates for v6.3, part 2
- Add support for the enclustra PE1 board that is based on Arria10

----------------------------------------------------------------
Steffen Trumtrar (2):
      dt-bindings: altera: Add enclustra mercury PE1
      ARM: dts: socfpga: Add enclustra PE1 devicetree

 Documentation/devicetree/bindings/arm/altera.yaml |  1 +
 arch/arm/boot/dts/Makefile                        |  1 +
 arch/arm/boot/dts/socfpga_arria10_mercury_pe1.dts | 55 +++++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_mercury_pe1.dts
