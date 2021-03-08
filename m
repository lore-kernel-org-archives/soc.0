Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7819BC433E0
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 16:22:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4BBE16522B; Mon,  8 Mar 2021 16:22:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 481EC60241;
	Mon,  8 Mar 2021 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615220557;
	bh=4pM6PW9BV8u6dvJehZSa10vcwxY3GS8bKwOAVpECg/c=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=N0+Xx1qA5uJxoiiFMHmVv+3LC6JwAMcPOH3J8tO1V6zxIAC4/dieiF6oZBs/eptiz
	 CrgDpNWnfwBChFGY4cVVxZi4IxTi05nf7valx57GsHOySaQFK5Hlj5B48HPNpImZNF
	 X4ot0InmZcwnjQ/xTeaQIW+ky8EzmiTOM4tJ45o5dfMQ20BS/6CnWfrwIn40wkrnQb
	 ZrgAou5Zr6luXRHpLjmyACpPfH5jFX1WfnDj2x9fQjUk0pG1PGLB2BoZTl+uYsHOB5
	 euS6ODypFwZik0muBOYmuu7/VO1nmwYh+yuoqw/RQE35x9sI2rs1VpbeWn0rVukbwQ
	 ULEBO9W0fVHDw==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH 00/10] arm64: dts: intel: socfpga: minor cleanups
Date: Mon,  8 Mar 2021 17:22:18 +0100
Message-Id: <20210308162228.62614-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

This is just a resend of previous patch. Since I did not get replies
from Intel maintainers, I assume this could go via soc tree directly.

Best regards,
Krzysztof


Krzysztof Kozlowski (10):
  dt-bindings: arm: intel,keembay: limit the dtschema to root node
  arm64: dts: intel: socfpga: override clocks by label
  arm64: dts: intel: socfpga_agilex: move clocks out of soc node
  arm64: dts: intel: socfpga_agilex: move timer out of soc node
  arm64: dts: intel: socfpga_agilex: remove default status=okay
  arm64: dts: intel: socfpga_agilex: move usbphy out of soc node
  arm64: dts: intel: socfpga_agilex: use defined for GIC interrupts
  arm64: dts: intel: socfpga_agilex: align node names with dtschema
  arm64: dts: intel: socfpga_agilex_socdk: align LED node names with
    dtschema
  arm64: dts: intel: socfpga_agilex_socdk_nand: align LED node names
    with dtschema

 .../bindings/arm/intel,keembay.yaml           |   2 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 222 ++++++++++--------
 .../boot/dts/intel/socfpga_agilex_socdk.dts   |  18 +-
 .../dts/intel/socfpga_agilex_socdk_nand.dts   |  18 +-
 .../boot/dts/intel/socfpga_n5x_socdk.dts      |  12 +-
 5 files changed, 144 insertions(+), 128 deletions(-)

-- 
2.25.1

