Return-Path: <SRS0=uEgb=TE=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0D2C433F5
	for <soc@archiver.kernel.org>; Mon, 21 Feb 2022 09:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33425C340F3; Mon, 21 Feb 2022 09:00:50 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76609C340E9
	for <soc@kernel.org>; Mon, 21 Feb 2022 09:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76609C340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id d7so30381223qvk.2
        for <soc@kernel.org>; Mon, 21 Feb 2022 01:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=0Ahs+cDwQvswkjE1AQJQGIfl7mZccggQRa1W61PiCbY=;
        b=DVFTr3tsih8k+NVj3Rr+HrVdd9/FNuPe3HCuGogg4no4HktsAguGvBjNezfhPRZfwK
         Ljaes34V9PTrIdFtnPIZl1HBzdzSeYtUai98AEnudCYqG/CagFT+NIX8yXryCif/yxqQ
         YCtdK/Rnq8H6w/1iGm+9Ot4Dky2bzOm9CwjoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=0Ahs+cDwQvswkjE1AQJQGIfl7mZccggQRa1W61PiCbY=;
        b=Rh/A+DL/GLjlUqs9Aw2EDPfW27qT03yIPkosasfbg6ym9pB/pNXkxWykG7pMIqowg6
         ZYO9AwJ1Eb6jEpMLjWadr3TvMr0d+Z+3r/4t41FUQHf25lazMx+3tF0axk/mKl1VLEO4
         yrHCuouxTypx+WUxBACP44FBroR92HCql7jhQPAz537en0S6w0yy02zggPjq1wE87ryf
         7A/vl4MityfvBTNlFzGkN6QuOsggcMvlCdjUGTshp1jccXpZDL1daU0TCa+VGRPBARuA
         zE79K26ZfjXXGTR0en0RI/uRpwASGBpiyv7JxARrewiX5c9QhEaok/holVRCJi/qFVQ6
         Ecxg==
X-Gm-Message-State: AOAM533HtgWFEeN96RpTjyE9+eU3YhiAUqTS9rQ6GcD5Gq5YdveI8d2W
	WLHw2LGIEWmFnjJfn8YT5lfMwVmVUO0ITZ5SMYHJARqCKro=
X-Google-Smtp-Source: ABdhPJwU1kvHnWnyffE5WbtQAcJTJtF7koSZweL4/Gfmy3Xv0Fa7uBg5Jqa7h8nY8gH8pt0dN71kkDjjgBr/4h4IX3o=
X-Received: by 2002:ad4:4b63:0:b0:42d:a3cf:1b55 with SMTP id
 m3-20020ad44b63000000b0042da3cf1b55mr14392384qvx.130.1645434047528; Mon, 21
 Feb 2022 01:00:47 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Feb 2022 09:00:36 +0000
Message-ID: <CACPK8XdjF6dG04hR+iMpUP8=LSJi5x-hRivgCGDaY7o_461eJw@mail.gmail.com>
Subject: [GIT PULL] ARM: nuvoton: devicetree changes for 5.18
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Soc maintainers,

Something a bit different, some Nuvoton changes for v5.18. These
changes are from Jonathan, who hacks on the legacy WPCM450 platform.

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07=
:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/nuvoton-5.18-devicetree

for you to fetch changes up to 43fd3d4d95cee85e187e5c4ef1d991f77d4d928c:

  MAINTAINERS: ARM/WPCM450: Add 'W:' line with wiki (2022-02-21 13:00:50 +1=
030)

----------------------------------------------------------------
Nuvoton device tree updates for 5.18

 * Additions to wpcm450 following the upstremaing of the pinctrl/gpio
   driver for this platform

 * Match more of the platform in MAINTAINERS

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
