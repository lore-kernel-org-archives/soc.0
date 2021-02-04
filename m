Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3DAC433E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 12:03:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58B6364F4D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 12:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58B6364F4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZHlmPewFyYHRZ7O50cLOvpW+Ot1V2bQfdayBDV6I4Q=; b=AiYrb2+h6+nwcBK8xEYOl/ihGL
	XEUUpSZA7tk9hasBXq4kkb5yoplbRInPFMe0VS6XLQXFCZ75XrfrbNTH3dLeT4b5mh5CS5FYWo+jE
	VhJL7m/BBvUKsfMuzptNoqRnGHKa7XeIrASRur+FoyTpZQd1OkWAzbTOd7HN5RbNuxDAMHteBT/6S
	rtgtHLd8ERlRrozuV8+yD8uH6wqSfCskiHnd68wSvKNW+iGfwUlCFUM2eGC5FbaGs9PPEDo5y4U2i
	FZw5fT44HhS+W9QADdIZ4ZCEkSNPu+zncrg+O/VgXApo4n8WieoKS9l7C+8SnZwgCC/8npyN7JHhP
	ae0+hXqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7dKy-0006Ax-GO; Thu, 04 Feb 2021 12:02:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7dKt-00069q-AA
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 12:02:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C405E64F42;
 Thu,  4 Feb 2021 12:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612440130;
 bh=RcGGIp9xfs8dsaZP1ukqwn4bIAVqGwF1a2ZA0v0PO74=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lyZw+RdKqBxLFBdsmryPTgIj0kYSgovyR+phnQbmog38i3pGWcFsHe5Jkhcm3QNzt
 fI8duguPmibuVXL+t5hdKDpreVGuHCn3xNlaTN+rpiTWN6gZV2qCO3lL9oRaU9Y8MB
 qS3nbHISngvYjQPbbWTt4JbNVNgkZ6qrxPYCIkM6yp23F++ZCXNsupTKt6yUxAPJeF
 6jkrHoXHLol4XjEmpgVu5O6ZHtNYAdm2yuUK9TWCbT4XqzdYmiDUde2a0FfslNZyU+
 WOzFz5GStBdPfXmqGquhYDj7lZtItPgSuZ+V/3gFlZaFx4BEnSYI8n/rTTXBAZ3UXv
 yzDNgewnzrfqA==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Subject: [GIT PULL 4/6] i.MX device tree change for 5.12
Date: Thu,  4 Feb 2021 20:01:48 +0800
Message-ID: <20210204120150.26186-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204120150.26186-1-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_070211_543568_514C30C6 
X-CRM114-Status: GOOD (  11.12  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204120148._dNol3NYi3eWpX-VlZ2K7H8BSlK5evOzvNUStvbPZdA@z>

Hi,

Tag imx-fixes-5.11-2 is merged into the branch to resolve some
dependency around imx6-sr-som board support.

Shawn


The following changes since commit 82c082784e03a9a9c043345f9bc04bc8254cf6da:

  firmware: imx: select SOC_BUS to fix firmware build (2021-01-18 15:49:07 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.12

for you to fetch changes up to 498f8aee6ec000392d918ecbcbeb1b5ee3132006:

  ARM: dts: imx6: RDU2: adjust audio devices nomenclature (2021-01-30 21:52:31 +0800)

----------------------------------------------------------------
i.MX device tree change for 5.12:

- A series from Oleksij Rempel to add i.MX6 based Plymovent, Protonic
  and Kverneland boards.
- A series from Andreas Kemnade to improve UART support for ebook
  readers.
- A series from Fabio Estevam to update imx6ul-14x14-evk device tree for
  adding GPIO expander and camera support.
- A patch set from Lucas Stach to improve ZII RDU2 support, enabling
  WDOG, tuning I2C drive-strength, RMI4 and UCS1002 ALERT.
- Other small and random updates on various boards.

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: imx6q-logicpd: Drop unused clock-names reference

Andreas Kemnade (4):
      ARM: dts: imx6sl-tolino-shine2hd: correct console uart pinmux
      ARM: dts: imx6sl-tolino-shine2hd: add second uart
      ARM: dts: imx6sl-tolino-shine3: correct console uart pinmux
      ARM: dts: imx: e60k02: add second uart

Cory Tusar (1):
      ARM: dts: imx6: RDU2: adjust audio devices nomenclature

Fabio Estevam (4):
      ARM: dts: imx6ul-14x14-evk: Fix SPI chipselect polarity
      ARM: dts: imx6ul-14x14-evk: Enable the GPIO expander
      ARM: dts: imx6ul-14x14-evk: Describe the KSZ8081 reset
      ARM: dts: imx6ul-14x14-evk: Add camera support

Joakim Zhang (1):
      ARM: dts: imx6: add wakeup support via magic packet

Laurent Pinchart (1):
      ARM: dts: imx6q(dl): Move 'port' nodes under 'ports' for HDMI encoder

Lucas Stach (3):
      ARM: dts: imx6: RDU2: reduce i2c drive-strength
      ARM: dts: imx6: RDU2: enable RMI4 reduced reporting
      ARM: dts: imx6: RDU2: only trigger IRQ on falling edge ucs1002 ALERT pin

Mans Rullgard (1):
      ARM: dts: imx28: add pinmux for USB1 overcurrent on pwm2

Marek Vasut (1):
      ARM: dts: imx7: Mark timer with arm,cpu-registers-not-fw-configured

Oleksij Rempel (6):
      ARM: dts: add Plymovent M2M board
      ARM: dts: add Plymovent BAS board
      ARM: dts: add Protonic MVT board
      ARM: dts: add Protonic PRTI6G board
      ARM: dts: add Kverneland UT1, UT1Q and UT1P
      ARM: dts: add Kverneland TGO board

Philipp Zabel (1):
      ARM: dts: imx6: rdu2: enable WDOG1

Russell King (1):
      ARM: dts: imx6-sr-som: increase at8035 PHY gigabit Tw parameter

Shawn Guo (1):
      Merge tag 'imx-fixes-5.11-2' into imx/dt

 arch/arm/boot/dts/Makefile                    |   8 +
 arch/arm/boot/dts/e60k02.dtsi                 |   6 +
 arch/arm/boot/dts/imx28.dtsi                  |  10 +
 arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi |   1 -
 arch/arm/boot/dts/imx6dl-plybas.dts           | 394 ++++++++++++
 arch/arm/boot/dts/imx6dl-plym2m.dts           | 446 ++++++++++++++
 arch/arm/boot/dts/imx6dl-prtmvt.dts           | 852 ++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6dl-victgo.dts           | 852 ++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6dl-vicut1.dts           |  13 +
 arch/arm/boot/dts/imx6q-vicut1.dts            |  17 +
 arch/arm/boot/dts/imx6q.dtsi                  |  20 +-
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi      |   1 +
 arch/arm/boot/dts/imx6qdl-sr-som.dtsi         |   2 +
 arch/arm/boot/dts/imx6qdl-vicut1.dtsi         | 803 ++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi       |  42 +-
 arch/arm/boot/dts/imx6qdl.dtsi                |  25 +-
 arch/arm/boot/dts/imx6qp-vicutp.dts           |  13 +
 arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts  |  18 +-
 arch/arm/boot/dts/imx6sl-tolino-shine3.dts    |  15 +-
 arch/arm/boot/dts/imx6sll-kobo-clarahd.dts    |  13 +-
 arch/arm/boot/dts/imx6sx-sdb.dtsi             |   2 +
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi       |  54 +-
 arch/arm/boot/dts/imx6ul-prti6g.dts           | 356 +++++++++++
 arch/arm/boot/dts/imx6ul.dtsi                 |   2 +
 arch/arm/boot/dts/imx7s.dtsi                  |   1 +
 25 files changed, 3917 insertions(+), 49 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-plybas.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-plym2m.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-prtmvt.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-victgo.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-vicut1.dts
 create mode 100644 arch/arm/boot/dts/imx6q-vicut1.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-vicut1.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qp-vicutp.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-prti6g.dts

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
