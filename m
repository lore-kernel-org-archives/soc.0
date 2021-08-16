Return-Path: <SRS0=E6oP=NH=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3B8C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:19:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9511C61056; Mon, 16 Aug 2021 21:19:59 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A25060F41
	for <soc@kernel.org>; Mon, 16 Aug 2021 21:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A25060F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-ot1-f45.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so5538909otf.6
        for <soc@kernel.org>; Mon, 16 Aug 2021 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C721tErGQuAbfzenrLJRyttmTyU2USTMFi+mtLeCzg8=;
        b=P9ctwR/5USxYoa5ZdUlRIRy8w5XeIyouOpmQjDRmGXMipxn4vajIvaatoCVCKGWQAa
         kxJoZRGXXuQ/5YxWtLbbxt06Qh4PbRUW+4hkOaSryzwmrZRUtnREJI6DB2pxTwCoBZXI
         p1O3BsDT/1D/B+i/xTPt4QZSJH6pA/U4lSgxkrZyemCp6J0sn1pkN7mmBNGLwTk0lhy2
         D/8MvaKmqix6h0QOdfe9d0m5izFrCEV8pthKmMeOTRpELoi5AZomI19qm/fU//b8CM0v
         y+5YGucu9C//J3HyTPeafP8qJFCJ1LJD1IwnCAOSL0MJemlz9SRtbclLtxkluJ6R/sgH
         Xa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C721tErGQuAbfzenrLJRyttmTyU2USTMFi+mtLeCzg8=;
        b=LVdRyElC7Y/j5w8sfqccwB27qQ/WSHQGRQhwro+2AvYUa9nrLLbkFJT5pReQ3Fhmbz
         ROeDznf1la6gacgI8XFootBCj7bxFfkDGpvc1dXMTnz8O9i9noTbhsfYVqxvCWShH6Pj
         W4r2DW9EMAJ68vxpp2QjTwtmBiSf927XfksxtyFnydHHoE+V0gVaOElNu0qmNtk0Htne
         DacEfBix3jHYfp8qdJr46GyUmpF5Geyn4BjXnN8D/CGlkA9dBw02nFyRb8R0WE1G2I+5
         /8UvQRqSutVH23oGtm06tnvrspfB7zxBub1kJn0ika7KqnwvdHT3wOjJ5Aefn+n0Fgya
         2RnQ==
X-Gm-Message-State: AOAM5323S9mUU+xmFbBotk8FwGhKP9AN0twJaEZ1awDuyUGExwUVGVxs
	hoAQVeJASigwgZwaAOExGb98jQ==
X-Google-Smtp-Source: ABdhPJyFAdst6Ew1Kftpxp0TswRwmSGM7cx4k4WVEKFYtcV4zYaRakJRfx3VtFcWUn8glpceDlaPAA==
X-Received: by 2002:a05:6830:91b:: with SMTP id v27mr134649ott.328.1629148798699;
        Mon, 16 Aug 2021 14:19:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s184sm26535oif.20.2021.08.16.14.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 14:19:58 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Craig Tatlor <ctatlor97@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthew Hagan <mnhagan88@gmail.com>
Subject: [GIT PULL] Qualcomm dts updates for v5.15
Date: Mon, 16 Aug 2021 16:19:57 -0500
Message-Id: <20210816211957.579365-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.15

for you to fetch changes up to f95c4c56d65225a537a2d88735fde7ec4d37641d:

  ARM: dts: qcom: add ahb reset to ipq806x-gmac (2021-08-05 09:24:37 -0500)

----------------------------------------------------------------
Qualcomm dts updates for v5.15

This introduces the MSM8226 platform and an initial dts for the Samsung
Galaxy S III Neo phone.

MSM8974 gains another UART and this is used to enable Bluetooth on the
Sony Xperia Z2 Tablet. Samsung Galaxy S5 gains regulator definitions for
audio and modem remoteprocs, effectively enabling these.

DSI clocks on APQ8064 are updates as the old legacy clock names are no
longer supported by the driver. And IPQ806x GMAC nodes gains AHB resets
wired up.

Lastly APQ8060 is converted to a SPDX header and the ethernet node is
updates in accordance with the binding.

----------------------------------------------------------------
Alexey Minnekhanov (1):
      ARM: dts: qcom: msm8974-klte: Enable remote processors

Bartosz Dudziak (3):
      ARM: dts: qcom: Add support for MSM8226 SoC
      dt-bindings: arm: qcom: Document MSM8226 SoC binding
      ARM: dts: qcom: Add initial DTS file for Samsung Galaxy S III Neo phone

Bjorn Andersson (1):
      ARM: dts: qcom: msm8974: castor: Add Bluetooth-related nodes

Craig Tatlor (1):
      ARM: dts: qcom: msm8974: Add blsp2_uart7 for bluetooth on sirius

David Heidelberg (1):
      ARM: dts: qcom: apq8064: correct clock names

Geert Uytterhoeven (1):
      ARM: dts: qcom: apq8060: Correct Ethernet node name and drop bogus irq property

Linus Walleij (1):
      ARM: dts: qcom: Fix up APQ8060 DragonBoard license

Matthew Hagan (1):
      ARM: dts: qcom: add ahb reset to ipq806x-gmac

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |  27 +---
 arch/arm/boot/dts/qcom-apq8064.dtsi                |   6 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |  20 +--
 arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts  |  25 ++++
 arch/arm/boot/dts/qcom-msm8226.dtsi                | 147 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    |  11 ++
 .../boot/dts/qcom-msm8974-sony-xperia-castor.dts   |  81 ++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi                |   9 ++
 10 files changed, 297 insertions(+), 36 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8226.dtsi
