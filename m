Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CE2C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 04:12:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CA0619DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 04:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61CA0619DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xi0LLmxHMHqYhWxDJZttK49eGFQfNPtSJV8xTL0TY7s=; b=a/KXzeKs8LbBlbk5/iYoJ3P8ft
	Tr+qr7+TbVtDBYX1ijWKoa31Seh/gkXnh645C0BlKcyv8rmPhBTUDP4tD8cHHPjZD+IPGAMQQV4CP
	acikTUDSzoazYK3m5xyBKc7yGYxAx09Izb4ZcVO9VA7xqeOzDZVFDZhFOZc7ZIo+iOjWbbuavUZTM
	Rk2S1LB/JmOrmbyuPXrDD3NZXFbd0B9zM8zilLUfwkF4lQpUDxCiltlI1m9szWrpOZ4RqNd74OQIG
	TNkfpo09SgI9+jfzvGZGolnguLh7lPAQpC8s9uWkvY5rmolpX7doUElGNm7aH9NCXqlOiGlz0y0ri
	Isq45Qdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRSCF-005R2q-7g; Wed, 31 Mar 2021 04:11:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRSBo-005R0j-60
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 04:10:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5770B619E1;
 Wed, 31 Mar 2021 04:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617163843;
 bh=CRIgsnvwwULTMw1iyO8MWQDFQ2WdQ73eLpPPYM2yeAo=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BOejjoZUOxbjksZ15DFPwvvo6Qr2HvYyFB6Y0bpbsn4+DJ3LIL0JQYoU5UERU6o5X
 hU4A3gMHY65rqIHkh6o7H3PTjMrguhzvDi6+mudROrSsn4kTrxnMb+2iWlg0Oi9Toy
 GTdSuVhn9ywbkGnN4YQ9MNgFyqv8Bj2HIVu2vze78fc+dprUqGf+DXP2VQI2ti7VnB
 aAvcm/GxeByLrHNI+NLcQni2Dg6i7nJolk2T8XZEsDNNTc4fONX9e45F5g4PtyjV5q
 ACRBl0gno4wVxl8HrcAxd4pz5eRxtj5OzV4fKQVCtFrLFegEAxHCP+0p9inJSdnpvz
 sYv+FDWBeozhw==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] i.MX DT bindings update for 5.13
Date: Wed, 31 Mar 2021 12:10:16 +0800
Message-ID: <20210331041019.31345-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331041019.31345-1-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_051044_656915_E6DD4258 
X-CRM114-Status: UNSURE (   6.81  )
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
Message-ID: <20210331041016.45P3h_d1hrBHb1VgsA7gzun59-bmwMzLZsfZWyBGlsw@z>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindgins-5.13

for you to fetch changes up to 6634b2d252accd3fcdc94a5e0a1319009363892e:

  dt-bindings: arm: fsl: Add the reMarkable 2 e-Ink tablet (2021-03-29 09:42:11 +0800)

----------------------------------------------------------------
i.MX bindings update for 5.13:

- Add vendor prefix for reMarkable.
- Add compatible for reMarkable 2 e-Ink tablet, Kontron pITX-imx8m
  board, Engicam i.Core MX8M Mini devices.
- Add compatbile 'fsl,imx8qm-mu' for i.MX mailbox bindings.
- One correction on example clock-names in imx8qxp-lpcg bindings.

----------------------------------------------------------------
Alistair Francis (2):
      dt-bindings: Add vendor prefix for reMarkable
      dt-bindings: arm: fsl: Add the reMarkable 2 e-Ink tablet

Dong Aisheng (2):
      dt-bindings: arm: fsl: add imx8qm boards compatible string
      dt-bindings: mailbox: mu: add imx8qm support

Heiko Thiery (1):
      dt-bindings: arm: fsl: add Kontron pITX-imx8m board

Jagan Teki (2):
      dt-bindings: arm: fsl: Add Engicam i.Core MX8M Mini C.TOUCH 2.0
      dt-bindings: arm: fsl: Add Engicam i.Core MX8M Mini EDIMM2.2 Starter Kit

Peng Fan (1):
      dt-bindings: clock: imx8qxp-lpcg: correct the example clock-names

 Documentation/devicetree/bindings/arm/fsl.yaml           | 16 ++++++++++++++++
 .../devicetree/bindings/clock/imx8qxp-lpcg.yaml          |  6 +++---
 Documentation/devicetree/bindings/mailbox/fsl,mu.yaml    |  5 ++++-
 Documentation/devicetree/bindings/vendor-prefixes.yaml   |  2 ++
 4 files changed, 25 insertions(+), 4 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
