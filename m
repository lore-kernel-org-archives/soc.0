Return-Path: <SRS0=NC4W=RC=ti.com=vigneshr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4F4C433F5
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 17:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3445AC36AE1; Fri, 17 Dec 2021 17:28:39 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F182BC36AE7;
	Fri, 17 Dec 2021 17:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F182BC36AE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BHHSYU3058097;
	Fri, 17 Dec 2021 11:28:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639762114;
	bh=k1y6mx/qWLpftF1fkQe6RUQzpz+VeYgeEm3JQpFdD90=;
	h=From:To:CC:Subject:Date;
	b=Ed9esRMvXrNnLFiWzc0bHcKTBBUhkuOgnSNdvBiJE8LCOnQhxnMj2R/NWRpGQKakj
	 rY/5L7HbGegszuH7exVM3478ROjOHNXyDqShLly7+4TC/SAa/RVVwyRD/Vv9vcf/sf
	 juiR2SgYS2beMivBDUe9/cFZaopBo0Ow9u+YmDHw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BHHSYhx114981
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Dec 2021 11:28:34 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Dec 2021 11:28:34 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 17 Dec 2021 11:28:34 -0600
Received: from uda0132425.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BHHSVcE076735;
	Fri, 17 Dec 2021 11:28:31 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
To: Nishanth Menon <nm@ti.com>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson
	<olof@lixom.net>, SoC <soc@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <arm@kernel.org>,
        Tero Kristo
	<kristo@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [GIT PULL 1/2] arm64: TI K3 SoC configs changes for v5.17
Date: Fri, 17 Dec 2021 22:58:05 +0530
Message-ID: <20211217172806.10023-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-config-for-v5.17

for you to fetch changes up to 8d73aedca28cbed8030067b0d9423a0694139b9c:

  arm64: defconfig: Enable USB, PCIe and SERDES drivers for TI K3 SoC (2021-12-14 16:22:25 +0530)

----------------------------------------------------------------
ARM64 defconfig changes for TI K3 platforms for v5.17 merge window:

- Increase No. of 8250 UARTs supported in System to 16 for J721s2
- Enable USB, PCIe and SERDES drivers on TI K3 SoC

----------------------------------------------------------------
Aswath Govindraju (1):
      arm64: defconfig: Increase the maximum number of 8250/16550 serial ports

Vignesh Raghavendra (1):
      arm64: defconfig: Enable USB, PCIe and SERDES drivers for TI K3 SoC

 arch/arm64/configs/defconfig | 13 ++++++++++
 1 file changed, 13 insertions(+)
