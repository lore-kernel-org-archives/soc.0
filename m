Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D51FC433C1
	for <soc@archiver.kernel.org>; Tue, 30 Mar 2021 11:04:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7346F6199A; Tue, 30 Mar 2021 11:04:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 074DF61987;
	Tue, 30 Mar 2021 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617102272;
	bh=8dJYjaBl8bSTA5qG93Sb9jICcT3ZEH/X9GL61yw23+Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XBl+Gi+GSGoO9gfZpmH4+sLMUrDGfIUWcJWFbrDH+3j0hm64/p2+8XyMTsfXbpRph
	 GB/1XBOi/fV7b7vuIuXfbtZLMprtNkuBZbQwBgwNJv1dBN9rr5AIOPlbzJLM10Th2c
	 Df8O4ABGSSLQIkuK6zEar31qlkiE62PVUlKP8cnjdZkWOrmwvFElSAPu02OSFg836V
	 PFGQtSPsPWYH747LCQhbrc0Jx1kNeavnWiH99/3UnZWmBg84UknU+kg2NYK9tTJuC7
	 LWsRHFmNRBPDmIKsP9di+932lnnphCs9SnBWOj4pqaAktb2QXbdsH+hHgb9L8vbvrq
	 3DlKPh2VYpbXA==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL 2/3] SoCFPGA DTS updates for v5.13
Date: Tue, 30 Mar 2021 06:04:29 -0500
Message-Id: <20210330110430.558182-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330110430.558182-1-dinguyen@kernel.org>
References: <20210330110430.558182-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd, Kevin, and Olof:

Please pull in these SoCFPGA DTS updates for v5.13.

Thanks,
Dinh

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.13

for you to fetch changes up to 0501418e4439d4ba2644b9d9a52287002fbc7553:

  arm64: dts: intel: adjust qpsi read-delay property (2021-03-30 05:51:30 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v5.13
- Patches from Krzysztof Kozlowski that fixes dtc warnings
  and dtbs_check warnings
- Adjust the "cnds,read-delay" value for the Agilex devkit to 2

----------------------------------------------------------------
Dinh Nguyen (1):
      arm64: dts: intel: adjust qpsi read-delay property

Krzysztof Kozlowski (8):
      arm64: dts: intel: socfpga: override clocks by label
      arm64: dts: intel: socfpga_agilex: move clocks out of soc node
      arm64: dts: intel: socfpga_agilex: move timer out of soc node
      arm64: dts: intel: socfpga_agilex: remove default status=okay
      arm64: dts: intel: socfpga_agilex: move usbphy out of soc node
      arm64: dts: intel: socfpga_agilex: use defined for GIC interrupts
      arm64: dts: intel: socfpga_agilex: align node names with dtschema
      arm64: dts: intel: socfpga_agilex_socdk_nand: align LED node names with dtschema

 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      | 222 ++++++++++++---------
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |  14 +-
 .../boot/dts/intel/socfpga_agilex_socdk_nand.dts   |  18 +-
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |  12 +-
 4 files changed, 140 insertions(+), 126 deletions(-)
