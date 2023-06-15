Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88BFEB64DA
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 16:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9F4A5C433C8; Thu, 15 Jun 2023 16:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68679C433C0;
	Thu, 15 Jun 2023 16:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686846463;
	bh=O7ZtmznWZj+yHXAwy2f/UcdDdY0YWUUSAESCqHxXPlY=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=mPd3oWOYajVFxmpa6viSL51WbdFfeRTf4woBZGU3KgHeqmtP5GrSEpNGJIR32/ksY
	 A8qp62+KZNZWfbrFNQi+jn2g2KYcwXWmYFjYlemO1FhAU8a3Pvnu3pw4L4yvMeHliZ
	 Z7IA+hGg8dTHDPEhFXAm8I6HmvjmyTigQ9AHbypEpUUOIGOzOLo2wY2FXAgUMqz2O1
	 nD9YmOXGroNZ5i4io0bs/mawUpbqcQ0I0vcAANo7+KL7EhEsqVXbX7iGafM1zPmn5S
	 62njXpwcKWgowShhgy/k5Po4419/2TZr+3PdfLdbsPdSvMMxnk+s0TQDP4akuGABrx
	 c2P7l+p2NKBEg==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Naman Jain <quic_namajain@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: [GIT PULL] More Qualcomm driver updates for v6.5
Date: Thu, 15 Jun 2023 09:31:04 -0700
Message-Id: <20230615163104.1461905-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit e81a16e77259294cd4ff0a9c1fbe5aa0e311a47d:

  soc: qcom: ocmem: Add OCMEM hardware version print (2023-05-29 14:42:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.5-2

for you to fetch changes up to 5d85ea2c879781d296bd770f562d33a58161d2b1:

  soc: qcom: geni-se: Do not bother about enable/disable of interrupts in secondary sequencer (2023-06-14 08:00:31 -0700)

----------------------------------------------------------------
More Qualcomm driver updates for v6.5

The detection of split/non-split firmware files in the MDT loader is
corrected. The Geni driver is updated to not enable unused interrupts,
in some configurations. The count unit for MSM8998 in BWMON is corrected.
RPM master stats driver is corrected to check for the right return value
of devm_ioremap().

Support for socinfo version 18 and 19 are aded, and IPQ5300 is added to
the list of platforms.

----------------------------------------------------------------
Bjorn Andersson (1):
      soc: qcom: mdt_loader: Fix split image detection

Dan Carpenter (1):
      soc: qcom: Fix a IS_ERR() vs NULL bug in probe

Kathiravan T (2):
      dt-bindings: arm: qcom,ids: add SoC ID for IPQ5300
      soc: qcom: socinfo: Add Soc ID for IPQ5300

Komal Bajaj (1):
      dt-bindings: sram: qcom,imem: document qdu1000

Konrad Dybcio (2):
      dt-bindings: soc: qcom,rpmh-rsc: Require power-domains
      soc: qcom: icc-bwmon: Fix MSM8998 count unit

Naman Jain (2):
      soc: qcom: socinfo: Add support for new fields in revision 18
      soc: qcom: socinfo: Add support for new fields in revision 19

Rohit Agarwal (1):
      dt-bindings: firmware: scm: Add compatible for SDX75

Vijaya Krishna Nivarthi (1):
      soc: qcom: geni-se: Do not bother about enable/disable of interrupts in secondary sequencer

 .../devicetree/bindings/firmware/qcom,scm.yaml     |  1 +
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           |  2 ++
 .../devicetree/bindings/sram/qcom,imem.yaml        |  1 +
 drivers/soc/qcom/icc-bwmon.c                       |  2 +-
 drivers/soc/qcom/mdt_loader.c                      |  8 +++++
 drivers/soc/qcom/qcom-geni-se.c                    | 28 +++---------------
 drivers/soc/qcom/rpm_master_stats.c                |  2 +-
 drivers/soc/qcom/socinfo.c                         | 34 +++++++++++++++++-----
 include/dt-bindings/arm/qcom,ids.h                 |  1 +
 include/linux/soc/qcom/socinfo.h                   | 11 +++++--
 10 files changed, 54 insertions(+), 36 deletions(-)
