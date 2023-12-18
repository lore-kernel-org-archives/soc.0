Return-Path: <SRS0=St56=H5=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E90CC35274
	for <soc@archiver.kernel.org>; Mon, 18 Dec 2023 15:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1337FC433C8; Mon, 18 Dec 2023 15:30:49 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4544C433C7;
	Mon, 18 Dec 2023 15:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4544C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BIFUhBm019772;
	Mon, 18 Dec 2023 09:30:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702913443;
	bh=O/lNwiyrqRQ0n1uTo08WOuGgaaCuE/j73MGKhHOyl6o=;
	h=Date:From:To:CC:Subject;
	b=Q9HTlY+MhBSfd4RVG9YIJ5bDT4IhaByRFToGp96Yfvi3+kZPIp6zFnBN0wucAGi13
	 o8XsyEKh51DooHAQe2xm3GhJoLyK32QzPeIrHK6v7Lwunc4LT2FwBJzevtVrobTVNR
	 gX6EC21Jfwj062hfTK+CAinRZZ8ORHTN+mURNtUM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BIFUhlb105995
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Dec 2023 09:30:43 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 18
 Dec 2023 09:30:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 18 Dec 2023 09:30:43 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BIFUh99101677;
	Mon, 18 Dec 2023 09:30:43 -0600
Date: Mon, 18 Dec 2023 09:30:43 -0600
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 1/3] drivers/firmware updates for v6.8 for TI K3 platforms
Message-ID: <20231218153043.r5psxbjjpccusjg4@september>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driver-soc-for-v6.8

for you to fetch changes up to 2c2235292b33d788a1436f1d2a6108184a657f51:

  soc: ti: k3-socinfo: Add JTAG ID for J722S (2023-12-13 07:52:32 -0600)

----------------------------------------------------------------
TI SoC driver updates for v6.8

- ti_sci: Minor fixup for off by one error in debugfs_create
- k3-socinfo: Refactoring and add j721e detection, j722s

----------------------------------------------------------------
Christophe JAILLET (1):
      firmware: ti_sci: Fix an off-by-one in ti_sci_debugfs_create()

Neha Malcom Francis (1):
      soc: ti: k3-socinfo: Revamp driver to accommodate different rev structs

Vaishnav Achath (1):
      soc: ti: k3-socinfo: Add JTAG ID for J722S

 drivers/firmware/ti_sci.c   | 10 +++----
 drivers/soc/ti/k3-socinfo.c | 73 +++++++++++++++++++++++++++++++++++----------
 2 files changed, 62 insertions(+), 21 deletions(-)

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
