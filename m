Return-Path: <SRS0=AMt0=NF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCBEC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Aug 2021 13:41:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06C7F60EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Aug 2021 13:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06C7F60EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gv7WkAdyAP2xTDnmgNCSCx5FFxijRcTzbLyBnRZL454=; b=h2SfjEurqlQ/n0
	abX3Ezqh5sIk1peEPsWzcS4qHXb7NhbODlfXGc661MrHv0l4aZc+/P5VLlPThhCKnpUpHPjxKNV0E
	qswUFflw8vj+WSKi0GuE3kmt6tVCwk2/TXdWI/cUeQGEaJ4Bn/Lso4YzBAIXT7RHywy8dUJLPGBJJ
	WNuP+mfM0xu6u/vNMXXMaj7qrJFHMZCFuymDRRs9TEO0e9ldoqQ32k0e3bKILEEwxkJM1SuJal4rV
	ttPPI0HmT+o/aOjyDXIhg8JLhXDPkX0gmoLmxpdhZq803qyEwurhZ34SE3CMz5FrQ7xDs62jqFyxN
	pMbbyeT3v7DBMzg4F0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEtsb-00ECtt-Km; Sat, 14 Aug 2021 13:39:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEtsV-00ECsv-7m
 for linux-arm-kernel@lists.infradead.org; Sat, 14 Aug 2021 13:39:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3749760F48;
 Sat, 14 Aug 2021 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628948350;
 bh=0BI8Cf8cXNjZtl2BGJ0xZotV/euLVb17InFI8CNieIY=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=c2INEHk9EcmhOaqX6a43j8KrtUOt8DXepKOcZgez5yzboCf1tMU+O2m7GSDMFjmhg
 CeTXjSDjvCepaonZxf69h2EYHQBD+kc5R6lZovte5sxEOg2vajQw1AdckaOK1TRyKB
 AcZAyOC2YqQU4Uxxl3aoBA4ZlFvGtBV0vmIaAbySaDzF45oKuC2mExDG44e3w2U0kU
 BdXgF2+1J8VDjYoJaMUC1Omntd/XiYREpWxZ8BgKHatpfDJWc+vNfDyYCg99hikksp
 3C6hwq5fL0Td0l4Bj+Zr6QckNo/Ka5jqoKdBDfIbM8gMBbblr5aG/43o8STAXTJiRV
 BRlQRVjeMGkpQ==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] i.MX DT bindings update for 5.15
Date: Sat, 14 Aug 2021 21:38:50 +0800
Message-ID: <20210814133853.9981-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210814_063911_339999_6DEC72F0 
X-CRM114-Status: UNSURE (   4.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210814133850.DdURBq5MkTAl2mT3wjDcz24NqpGTMcszITzy3ZwUJBE@z>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.15

for you to fetch changes up to 0fdedc09af18d231aa581331821c9ab6ef0903f1:

  dt-bindings: arm: fsl: Add Traverse Ten64 (LS1088A) board (2021-08-14 13:52:36 +0800)

----------------------------------------------------------------
i.MX DT bindings update for 5.15:

- Add vendor prefix for MNT Research GmbH, SKOV A/S and Traverse
  Technologies.
- Add compatible for Nitrogen8 SoM, MNT Reform2, Traverse Ten64,
  SKOV i.MX6, SolidSense and i.MX8M GW7902 boards.
- Add compatible for i.MX8QM JPEG codec.

----------------------------------------------------------------
Christoph Niedermaier (1):
      dt-bindings: arm: fsl: Add DHCOM PicoITX and DHCOM DRC02 boards

Lucas Stach (3):
      dt-bindings: arm: fsl: add Nitrogen8 SoM
      dt-bindings: vendor-prefixes: add mntre
      dt-bindings: arm: fsl: add MNT Reform2 board

Mathew McBride (2):
      dt-bindings: vendor-prefixes: add Traverse Technologies
      dt-bindings: arm: fsl: Add Traverse Ten64 (LS1088A) board

Mirela Rabulea (1):
      dt-bindings: media: imx-jpeg: Add compatible for i.MX8QM JPEG codec

Oleksij Rempel (2):
      dt-bindings: vendor-prefixes: Add an entry for SKOV A/S
      dt-bindings: arm: fsl: add SKOV imx6q and imx6dl based boards

Russell King (Oracle) (1):
      dt-bindings: arm: fsl: add SolidSense boards

Tim Harvey (1):
      dt-bindings: arm: imx: add imx8mm/imx8mn GW7902 support

 Documentation/devicetree/bindings/arm/fsl.yaml     | 29 ++++++++++++++++++++++
 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   | 19 ++++++++------
 .../devicetree/bindings/vendor-prefixes.yaml       |  6 +++++
 3 files changed, 47 insertions(+), 7 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
