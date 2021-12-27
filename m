Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FD8C433EF
	for <soc@archiver.kernel.org>; Mon, 27 Dec 2021 10:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6431C36AED; Mon, 27 Dec 2021 10:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23603C36AE7;
	Mon, 27 Dec 2021 10:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640601406;
	bh=k764ftaabhGWz9kUxCYgX5/lHxZGIcSWPTjfKiC2Q2g=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Kss8FTnh6/D9IFSmoCLWmoCnarUPJnUhvW26dNMVcH6rI/4ou+H15XhPmPy+hijUJ
	 kKrICb/3VIvmegl7O8cWct6fC4tRaB/m3KmKb2lO5A+8bJ/v800YhZ2ow1b0FkBVNG
	 hJnnoRyRSOFXllTBw6ZcjWJ8s6RWRJlMjSgwAjqbwbCkdd/6WRSczlr0Ndea+IK5q4
	 1kd0bKwVWcaYtkw+IylU+mgKG603VB0ylgcGmZ+aUqq//TK4UPWycNMnOoUirqG6tq
	 1YfctLQYXj++kHyp8+bnvhwEn2tbbUOoM737csR2W5mQSH54gEOXy9q6cFH3yqaLeH
	 ijO2sHvpwPriA==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] ARM: socfpga: fix for v5.16, part 3
Date: Mon, 27 Dec 2021 04:36:44 -0600
Message-Id: <20211227103644.566694-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd/Olof,

Please pull in these 2 patches for v5.16. The reason for this dts compatible
change is that the commit 98d948eb833 ("spi: cadence-quadspi: fix write
completion support") is already part of v5.16, thus we need these 2 patches to
be in v5.16.

Thanks,
Dinh

The following changes since commit fc74e0a40e4f9fd0468e34045b0c45bba11dcbb2:

  Linux 5.16-rc7 (2021-12-26 13:17:17 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_fix_for_v5.16_part_3

for you to fetch changes up to 36de991e93908f7ad5c2a0eac9c4ecf8b723fa4a:

  ARM: dts: socfpga: change qspi to "intel,socfpga-qspi" (2021-12-27 04:20:06 -0600)

----------------------------------------------------------------
SoCFPGA dts updates for v5.16, part 3
- Change the SoCFPGA compatible to "intel,socfpga-qspi"
- Update dt-bindings document to include "intel,socfpga-qspi"

----------------------------------------------------------------
Dinh Nguyen (2):
      dt-bindings: spi: cadence-quadspi: document "intel,socfpga-qspi"
      ARM: dts: socfpga: change qspi to "intel,socfpga-qspi"

 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml | 1 +
 arch/arm/boot/dts/socfpga.dtsi                           | 2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi                   | 2 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi        | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi            | 2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)
