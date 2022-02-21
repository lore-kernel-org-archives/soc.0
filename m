Return-Path: <SRS0=uEgb=TE=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F16AC433EF
	for <soc@archiver.kernel.org>; Mon, 21 Feb 2022 08:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F315EC340F1; Mon, 21 Feb 2022 08:58:10 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36667C340F7
	for <soc@kernel.org>; Mon, 21 Feb 2022 08:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36667C340F7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id a19so30397627qvm.4
        for <soc@kernel.org>; Mon, 21 Feb 2022 00:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=/YkJCPAEzy9lvOQKx0L5i2HCzqQLZCPvdJzlwKqKMEM=;
        b=fHdjhnCW9k6koHGoL8t0LOjJFnL9DQxPvu/mqvFIyz74CqTTFK5blmbV8pDrWfCJ2p
         xaGBIItbNHH+AjmvHGPtX0i6hlhwZWjX/48k1q0qQneg7qfoOm/RGvUYPPLLs5jEh+Am
         +MMMyBPVojm5Pfxvz1rGjef4YjE/7F/x9D29k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=/YkJCPAEzy9lvOQKx0L5i2HCzqQLZCPvdJzlwKqKMEM=;
        b=Bqe2UQlRCvCTXYAqM6Ho9IUpVa2l4pMOt/qbja0R+jjFXXgx8CbtFcZA/zO3fztEyp
         ZoPE0+ZveOXdHeEBU+bh/NXoJAJQpEdHqiCs0UQg4CoS+GmdAFLFM2pW9LbsHpMO/hHt
         jIJs/vvP1NOxPE0G6Ym3/1mwoO97YjV79MOAzfTm/SbXO9I2YBim0ADBvOFjvywrdSap
         IXSLaScBeL+DvPSKwn456b9aMYhZFqGLZLzjx7lgdPgzBS8P1NZDBG7T5HG9M2jgHE7l
         qS3kn8dIteBBKaJlbhA+IbcCFGC+98IUYuEI4FbPR8BFrgmjlzYnjrChO5lVvSZjlUip
         3DtA==
X-Gm-Message-State: AOAM532AGtHLQ44Y+JnGVaicWg/H6u5fBm3BQ5fKoMAj50sMmN5KdQ1a
	gjAciBm1qcpQK0v4QwqtmwzhHl/mo0OTzDCSJrSuikm/2TU=
X-Google-Smtp-Source: ABdhPJyn0WKGnhrzzpq1dvCmFMToH/JR7TwORUjkh/VfxntXGt87JDwSK+2FAU/rsYrtr9hW1TgvTzyVhYeQ6BCfaMI=
X-Received: by 2002:a05:6214:d6e:b0:42d:7cb3:aa49 with SMTP id
 14-20020a0562140d6e00b0042d7cb3aa49mr14608483qvs.107.1645433888187; Mon, 21
 Feb 2022 00:58:08 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Feb 2022 08:57:57 +0000
Message-ID: <CACPK8XcLpAA7b_hGea-Wc8H5eu9=YpPZ9b75nYF7rqMzDcMw9w@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.18
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Soc maintainers,

A straightforward pull request of aspeed bits for v5.18.

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07=
:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.18-devicetree

for you to fetch changes up to 43fd3d4d95cee85e187e5c4ef1d991f77d4d928c:

  MAINTAINERS: ARM/WPCM450: Add 'W:' line with wiki (2022-02-21 13:00:50 +1=
030)

----------------------------------------------------------------
ASPEED device tree updates for 5.18

 - New machines

  * Quanta S6Q AST2600 BMC
  * Facebook's Bletchley is not new, but has a large update

 - Small clenaups and additions for Everest, Rainier and Tacoma, and the
   flash layout

----------------------------------------------------------------
Jonathan Neusch=C3=A4fer (8):
      dt-bindings: arm/npcm: Add binding for global control registers (GCR)
      MAINTAINERS: Match all of bindings/arm/npcm/ as part of NPCM architec=
ture
      ARM: dts: wpcm450: Add global control registers (GCR) node
      ARM: dts: wpcm450: Add pinctrl and GPIO nodes
      ARM: dts: wpcm450: Add pin functions
      ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs and buttons
      ARM: dts: wpcm450: Add pinmux information to UART0
      MAINTAINERS: ARM/WPCM450: Add 'W:' line with wiki

 .../devicetree/bindings/arm/npcm/nuvoton,gcr.yaml  |  48 +++
 MAINTAINERS                                        |   2 +
 .../dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts  |  43 +++
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi             | 384 +++++++++++++++++=
++++
 4 files changed, 477 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.=
yaml
