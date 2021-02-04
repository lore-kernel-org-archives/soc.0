Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E8EC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 05:24:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65CA564F47
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 05:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65CA564F47
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nASVF/SBUYZrj18vuAe/KmDS9nD/BykkwbZSeQV7mEo=; b=Z+fMeAzed+8bHOH5PLhq+RFO/Q
	kRU7bMlpZv3goetdk/UnVOp3FxthtQ0MVmwU3+GqsboqlksXABO4Pujm1nPodvAib56rWX/d328f2
	6mhokNhBp8lvlA5g42BSl7RYWYHw6OfKv+/GwdUulnr4SvnKiOnV1ql/7XMPfwDavZGPgKpWh8wZT
	eQchkpJh0QSks+fgML94bkbLydog7kew6DjbvLzq1wXbeZPOd1yC/3IwXA+Z2KanXQn09sNLyFiga
	0dJGgCIG8zasPYMcbTEZLWVcxmkDmT0fj3XXloyouJ6hiE9zeR8eBf9WzdR1VFrLNS2zruC3mICBs
	mHk+E64g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7X70-00056G-Ky; Thu, 04 Feb 2021 05:23:26 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7X6x-00055G-J4
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 05:23:25 +0000
Received: by mail-ot1-x336.google.com with SMTP id d7so2294370otf.3
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Feb 2021 21:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/W/+DuYXbeC3pcNovNCJ3kl63oZ8C5/BOehNjO/O5f4=;
 b=m65N3SctErjAnUtD/4m3KvA3d+iumeynJSjRG8MK3evlQ+z4gVhkwfI/JYwNxVtiJR
 b1XS/a5KK6+nR+j4xtaNTPZEtYY/IcABiwMVYsA0ztwV3+VDTlBZ3ITDnIkvsN235AjI
 cNcHEXGY+LV4Snvom/ebUvUvOIl/ePpfO6KIaDSv1I7wH1glGyyIlFnMNwzHfgzsIZED
 FLD3w05SyaFluJ2E4uZekeuMD32vrVl/8qlLLRs0y3M+MXnJn1E9Lw9Z2zKTJr6FK1Xr
 X3F9j2vINCIGx6O4+WEvWtPhT3hN8Jo3/f4F3YBdiPFpa5TRtN9pCqGqrVbHNoH4QJn4
 9w4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/W/+DuYXbeC3pcNovNCJ3kl63oZ8C5/BOehNjO/O5f4=;
 b=pxhrgWq7nth7rCCIAeT7ZY8n5vSmrNWUExHV3ODayHy0XfgxdYAILY5fQKHD4Ijx3x
 5z6eJC/mzGrfjEd5B42rV6N4dGia/ZBB4uCvB/UwXbsgmRDlEr5cpQyDk0hpZOhipz64
 u0mncjWKNC1OpbtyZyFj3oJujDTjhFzXtVQXY+AhdtTRHoqH3ShcpUWquHAucdidZW+G
 gUMo6seLkgHanETQW3XWzn2muQPVJTQ+bcPHWTgtvl80bygdpFtLHoYRoZ3BoQKOl2ha
 tsKVPLq9hx3Sumk63uG6MLvNNZvaH8sGKPOAblLdALJSZSyDg9UrZd02p9FPzQ5/FWps
 XBgA==
X-Gm-Message-State: AOAM532f82loiTMvnhr94kEpjBs2jnXZ7JiE6/0dbll+vY+ZL/Hhc+Qn
 1lzOg0fMviwpZz7SZupBOCrw3A==
X-Google-Smtp-Source: ABdhPJykXhmgoPzBNP2RqMfWZC8yooDwyYMsUS+xUpOYJDnWLKYgXEsXbAcczlxei9HvsVjdGBNQoQ==
X-Received: by 2002:a9d:1717:: with SMTP id i23mr4114963ota.179.1612416201682; 
 Wed, 03 Feb 2021 21:23:21 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u73sm929149oie.30.2021.02.03.21.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 21:23:20 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] Qualcomm ARM dts updates for 5.12
Date: Wed,  3 Feb 2021 23:23:20 -0600
Message-ID: <20210204052320.388999-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_002323_659857_F13280BF 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: John Crispin <john@phrozen.org>, Jonathan McDowell <noodles@earth.li>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Samuel Pascua <pascua.samuel.14@gmail.com>,
 Adrian Schmutzler <freifunk@adrianschmutzler.de>,
 Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 Kevin Hilman <khilman@baylibre.com>, Olof Johansson <olof@lixom.net>,
 Robert Marko <robert.marko@sartura.hr>, linux-arm-kernel@lists.infradead.org,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204052320.398ptK71gTDlaWqN8Kx4lzDdnJWf06u7HAj6b911alg@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.12

for you to fetch changes up to 9d1ee210ab8ae610285e5d6db9ea47491fce6dc6:

  ARM: dts: qcom: msm8974-klte: Mark essential regulators (2021-02-02 16:45:09 -0600)

----------------------------------------------------------------
Qualcomm ARM dts updates for 5.12

Introduces the Qualcomm SDX55 platform and the platform's MTP device,
with support for NAND, SDHCI and USB.

USB is enabled for IPQ4019 and the Alfa Network AP120C-AC and 8devices
Jalapeno boards are added.

Samsung Galaxy S5 gains display and GPU support.

----------------------------------------------------------------
Adrian Schmutzler (3):
      ARM: dts: qcom: remove commented mmc-ddr-1_8v for sdcc3
      ARM: dts: qcom: add additional DT labels in qcom-ipq8064.dtsi
      ARM: dts: qcom: replace status value "ok" by "okay"

Alexey Minnekhanov (1):
      ARM: dts: qcom: msm8974-klte: Fix shdc numbering

Bjorn Andersson (1):
      ARM: dts: qcom: sdx55: Enable ARM SMMU

Brian Masney (1):
      ARM: dts: qcom: msm8974: add gpu support

Iskren Chernev (1):
      ARM: dts: qcom: msm8974-klte: Mark essential regulators

John Crispin (1):
      ARM: dts: qcom: ipq4019: add USB devicetree nodes

Jonathan McDowell (1):
      ARM: dts: qcom: add prng definition to ipq806x

Manivannan Sadhasivam (14):
      ARM: dts: qcom: Add SDX55 platform and MTP board support
      ARM: dts: qcom: sdx55: Add support for SDHCI controller
      ARM: dts: qcom: sdx55: Add support for TCSR Mutex
      ARM: dts: qcom: sdx55: Add Shared memory manager support
      ARM: dts: qcom: sdx55: Add QPIC BAM support
      ARM: dts: qcom: sdx55: Add QPIC NAND support
      ARM: dts: qcom: sdx55-mtp: Enable BAM DMA
      ARM: dts: qcom: sdx55-mtp: Enable QPIC NAND
      dt-bindings: usb: qcom,dwc3: Add binding for SDX55
      ARM: dts: qcom: sdx55: Add USB3 and PHY support
      ARM: dts: qcom: sdx55-mtp: Enable USB3 and PHY support
      dt-bindings: watchdog: Add binding for Qcom SDX55
      ARM: dts: qcom: sdx55: Add Watchdog support
      ARM: dts: qcom: sdx55: Add pshold support

Robert Marko (4):
      ARM: dts: qcom: ipq4019: add more labels
      ARM: dts: qcom: add 8devices Jalapeno
      ARM: dts: qcom: add Alfa Network AP120C-AC
      ARM: dts: qcom: ipq4019: add SDHCI VQMMC LDO node

Samuel Pascua (2):
      ARM: dts: qcom: msm8974-klte: add support for GPU
      ARM: dts: qcom: msm8974-klte: add support for display

Vinod Koul (9):
      dt-bindings: arm: qcom: Document SDX55 platform and boards
      ARM: dts: qcom: sdx55: Add pincontrol node
      ARM: dts: qcom: sdx55: Add reserved memory nodes
      ARM: dts: qcom: sdx55: Add spmi node
      ARM: dts: qcom: sdx55-mtp: Add pm8150b pmic
      ARM: dts: qcom: sdx55: Add rpmpd node
      ARM: dts: qcom: Add PMIC pmx55 dts
      ARM: dts: qcom: sdx55-mtp: Add pmx55 pmic
      ARM: dts: qcom: sdx55-mtp: Add regulator nodes

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |   1 +
 arch/arm/boot/dts/Makefile                         |   6 +-
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |  12 +-
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts |   8 +-
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts        |   8 +-
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts         |  10 +-
 .../arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts |   4 +-
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts     |  10 +-
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dts   |  28 ++
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dts       |  27 ++
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi      | 254 +++++++++++
 arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts        | 214 +++++++++
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi      |  18 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts    |   4 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi      |  10 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts    |   8 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dts    |   2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi      |  10 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |  90 +++-
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts           |   2 +-
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi           |  12 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |  31 +-
 arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi         |  16 +-
 arch/arm/boot/dts/qcom-msm8660-surf.dts            |   4 +-
 arch/arm/boot/dts/qcom-msm8960-cdp.dts             |   8 +-
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts   |  14 +-
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  32 +-
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    | 115 ++++-
 .../boot/dts/qcom-msm8974-sony-xperia-amami.dts    |  14 +-
 .../boot/dts/qcom-msm8974-sony-xperia-castor.dts   |  18 +-
 .../boot/dts/qcom-msm8974-sony-xperia-honami.dts   |  16 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |  43 ++
 arch/arm/boot/dts/qcom-msm8974pro.dtsi             |   5 +
 arch/arm/boot/dts/qcom-pmx55.dtsi                  |  84 ++++
 arch/arm/boot/dts/qcom-sdx55-mtp.dts               | 251 ++++++++++
 arch/arm/boot/dts/qcom-sdx55.dtsi                  | 505 +++++++++++++++++++++
 38 files changed, 1757 insertions(+), 144 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dts
 create mode 100644 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dts
 create mode 100644 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts
 create mode 100644 arch/arm/boot/dts/qcom-pmx55.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-mtp.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx55.dtsi

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
