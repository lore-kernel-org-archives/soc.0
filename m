Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C973C433E1
	for <soc@archiver.kernel.org>; Tue, 30 Mar 2021 11:04:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 19B4361985; Tue, 30 Mar 2021 11:04:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99B0E61987;
	Tue, 30 Mar 2021 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617102273;
	bh=DFcQ2RFcw6wv+dmxb0wZbs4myIc1RRn6c/EoDE7s2SU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eYL7z809csbZfrjbIZs+Xr07zTKeWaLVvoF0ZxeW8NfIxGyLAzZ7JdxjNGrJ7D6y8
	 w7G/DslF3M02borV6YS6lVneIH3y/p6+zRU4W+1OfKXTfHSNp0hb4furAaCZQQG2e+
	 tM+a7iwX7mKKqO06Mst11cHV0j+9riWHzEttqsaCDik6nnvP1q+wvHMThy4yk7znMX
	 F2mOThLxxQMm1Gym5ziSLp2eZkJ0Td2EScL192uifkf4s4Qa/5niFW4o8RuKKHJQ3W
	 mQCL1Iep5iQcCO/SWuNQMRjL/ABtM5GtOBejrfIOiAIDNmZLZgrE3/IU2HNsp3yNnO
	 3wwNcoaLcQ9YQ==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL 3/3] ARM64 defconfig update for v5.13
Date: Tue, 30 Mar 2021 06:04:30 -0500
Message-Id: <20210330110430.558182-3-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330110430.558182-1-dinguyen@kernel.org>
References: <20210330110430.558182-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd, Kevin, and Olof:

Please pull in this ARM64 defconfig update for v5.13.

Thanks,
Dinh

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/arm64_defconfig_for_v5.13

for you to fetch changes up to 40f90f4763e26cc4eb04b37766b7fd3f5952b516:

  arm64: defconfig: enable Intel's eASIC N5X SoCFPGA and Keem Bay SoC (2021-03-23 12:58:46 -0500)

----------------------------------------------------------------
ARM64 defconfig for v5.13
- Add support for Intel N5X SoCFPGA
- Add support for Intel Keem SoC
- Add support for Designware SPI driver

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: defconfig: enable Intel's eASIC N5X SoCFPGA and Keem Bay SoC

 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)
