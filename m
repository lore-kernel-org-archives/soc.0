Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1C2C433EF
	for <soc@archiver.kernel.org>; Fri, 11 Feb 2022 11:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED122C340F1; Fri, 11 Feb 2022 11:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79463C340E9;
	Fri, 11 Feb 2022 11:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644578758;
	bh=9md1dgH3u1nEudeCKhOmpmaniNxGfmPJI2IqKnrnxhk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dZw7A+Hi1lzNj5HbMaX5p15eVuU5zywVrhlmKuO1YC1lZUnnCtejVMWZi5xLWw0bW
	 +S2ngX/zIA5tbjHIU/y4Kawv9ii3G8Lg5q9qE8FFSgpx9Rj2w+51/d/bnDARf4+jCi
	 7MSnXZsnRJybF2K9daOuHRsW9Ls1v9SVl2Vl1ZBnf2AnPhaNODPvlVk9x+O4VOJ0DP
	 OTOhSWgoQjOrQ1p7xFOyND9OkyTni/hTZObaB5lz5KD2h490KUTEN7ELlPVZCexZ9P
	 8qLt+RAFZIu8ER8ec48G3we9LyXvKNGueAHklnGEjcLrJSmxs8BAAh5LqjvQynyKYc
	 HBF/bAgJyPRPA==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL 2/2] arm64: dts: socfpga: dts updates for v5.17, part 2
Date: Fri, 11 Feb 2022 05:25:56 -0600
Message-Id: <20220211112556.98940-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211112556.98940-1-dinguyen@kernel.org>
References: <20220211112556.98940-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.18_part2

for you to fetch changes up to 268a491aebc25e6dc7c618903b09ac3a2e8af530:

  arm64: dts: agilex: use the compatible "intel,socfpga-agilex-hsotg" (2022-02-09 13:18:48 -0600)

----------------------------------------------------------------
SoCFPGA dts updates for v5.18, part 2
- Add the "intel,socfpga-agilex-hsotg" compatible for Agilex platform

----------------------------------------------------------------
Dinh Nguyen (2):
      dt-bindings: usb: dwc2: add compatible "intel,socfpga-agilex-hsotg"
      arm64: dts: agilex: use the compatible "intel,socfpga-agilex-hsotg"

 Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi   | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)
