Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEABC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:21:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5D5460E97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5D5460E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ChElg73ZWfNdQLJp00lgu0LyEaPIB2tWHQULUP7zmKk=; b=3rzg7cx9MnLFXK
	cCdCTF+cQorsi8dXoeuDpScPduEC3Rz31QFZvLLSqp2ANIIg7owJ6J5+ksH6fPZMn8WVgMGcoOPdW
	u3VzSs9FRCytK33Eb78bkZllXi1BZ2BrqIOR4MzuObXD0e4fQXmnZKqixAZLk0llp5ukIZnwccu7v
	E8J8P8nTlVLcaRleKuyYCtE4GtMopawX1VlWC6H4cRw9yOAJBbjkRViqHEDh30qSGzVnlEhRBnLmv
	+9KVhGAflgiNqTRxztXRPb4TPPJbXb0weSoo3yKPvAN0HCjv2Oj3sdwSrJNS9p2w9cnz4UimUjy07
	0uBc3chZesyuOM9NoQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFk1i-000K9w-U8; Mon, 16 Aug 2021 21:20:11 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFk1b-000K6t-9i
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 21:20:07 +0000
Received: by mail-ot1-x335.google.com with SMTP id
 l36-20020a0568302b24b0290517526ce5e3so15132529otv.11
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 16 Aug 2021 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
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
 b=sloYZNUtoQyx65sU3b+qYVVsKhp/4pSJ2JsBmlZk7r+QCg4ADjd4zThTuUfQZ2lZD/
 FWeie4hYB7zwsIxCnvM19lYc+J9Zp18PSolc+b6WSFXhj5p7lKj39gaooFp8I94Y9xHz
 aoGOd8fXaBEK1FfHace/77o5FDD5fl+IG/Vwma3l+0N29H0oNsJdjCVmfrh2uyyNbZ4B
 aIuJoVS3pdO6x4OLHkJZQAr/DzmuxWR4JfStEpawXWXEuvttJPOGzmIUrHE9iEW3lS1e
 i8yRUl31vRvG58JYv6skyAR2dxXf7APZ8z1R6OsTeY74M00LnzfUlBEj6azc1VJDUxbk
 1+SA==
X-Gm-Message-State: AOAM532/r9SALPjKVuQAeyoYR4Uj+h2H/VnYbqVXZivfCejHKwU4CKAK
 ym/7CY/w4LyL5hvlnUaGf9o5PQ==
X-Google-Smtp-Source: ABdhPJyFAdst6Ew1Kftpxp0TswRwmSGM7cx4k4WVEKFYtcV4zYaRakJRfx3VtFcWUn8glpceDlaPAA==
X-Received: by 2002:a05:6830:91b:: with SMTP id
 v27mr134649ott.328.1629148798699; 
 Mon, 16 Aug 2021 14:19:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id s184sm26535oif.20.2021.08.16.14.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 14:19:58 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 Craig Tatlor <ctatlor97@gmail.com>, David Heidelberg <david@ixit.cz>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthew Hagan <mnhagan88@gmail.com>
Subject: [GIT PULL] Qualcomm dts updates for v5.15
Date: Mon, 16 Aug 2021 16:19:57 -0500
Message-ID: <20210816211957.579365-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_142003_374862_F28914AC 
X-CRM114-Status: GOOD (  12.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210816211957.E-G0IkpPk_0MdIIKBlESxTNbI0gQVcaq61auNapIqe4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
