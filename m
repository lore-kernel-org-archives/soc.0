Return-Path: <SRS0=FYTr=XZ=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D0EC43334
	for <soc@archiver.kernel.org>; Wed, 20 Jul 2022 23:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68D47C3411E; Wed, 20 Jul 2022 23:11:15 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10F80C341CB
	for <soc@kernel.org>; Wed, 20 Jul 2022 23:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10F80C341CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f51.google.com with SMTP id r22-20020a056830419600b0061c6edc5dcfso15262884otu.12
        for <soc@kernel.org>; Wed, 20 Jul 2022 16:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PWbj+WdashVU5oWstvpqXfj4EqNczmYpHmyzxnmVob4=;
        b=NRDLscyIJxUh++e16LUmbeGMzIF3XUqFrkWSFkTTz+OB0jjM0EJ9MgPI97I/79dWfx
         f5JfBoOg9HS+RtC2ucaQxsBn1ibi20+bDZP4EHZeoYcDMBIOkgAqd/BCkrxteg57bgnQ
         pdVS5TWDsj8AGzTW0gxbOgiZkmfYNKLWF8LK2/551GX37jaQ074RR9EP8QZzn4QPxenh
         LItYj1fFppy5lOxtKmErLfhlauoD3l283y/MMuFlSEPuN/JhhtcOEFurnir1J+gx530Z
         pSpidCQ29E/dZrxbq+Z3yeFx8329JRggv/8qJfAwjDmSb0vS0zA5y4AYNhdDgDjxabmM
         WOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PWbj+WdashVU5oWstvpqXfj4EqNczmYpHmyzxnmVob4=;
        b=sbAA4XqCQ6K4pGyAzLuvU3RwZ9Fhs38xmC/ZGvk+4pPWVJm10Rq2TkJ4lyJoQuSMHi
         HnmkD0yeEfZR61niKTjCLg/+9F+FhqZxqLzufzDUCv5mVXkDW33o/81F39qMJ5a/Wl4k
         aXleQ2BLOhn3f2URqxq5D5sTgxG5ZswwmOY3bkv+v3JeAS7R0V+90fO5ZUwBgukeF5q2
         i4T43oyTrh0PBtjOqQxr/PZVB/RkcZ5ozOId4Qd9EXDcQmSSVFwQVuBTYkB9HilkSXQE
         z0I8giIx7nkv/ZR4EN/KM83/Z9zNb9H/Q8MSqThjUSDZwfFgMudnrb5orXR8OsL1EpIO
         bdxw==
X-Gm-Message-State: AJIora/at3ilyI0vzTz7buT2m1f/7AZDuN+6r0PKtKpWkkk7Ga7B9H/h
	Ehiwn1BAx6pB1wWfn5MO2awuPg==
X-Google-Smtp-Source: AGRyM1uVaxwaNIyQs36PmfqQl7+MUh123utCPioKOiWOQj/Ta/xyBierJyzhy+B43fXyB3OJCBMfRw==
X-Received: by 2002:a9d:6385:0:b0:61c:81ad:8817 with SMTP id w5-20020a9d6385000000b0061c81ad8817mr12191172otk.218.1658358673129;
        Wed, 20 Jul 2022 16:11:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v188-20020a4a5ac5000000b00435b646f160sm165522ooa.5.2022.07.20.16.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 16:11:12 -0700 (PDT)
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
	Christian Marangi <ansuelsmth@gmail.com>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [GIT PULL] More Qualcomm DTS updates for v5.20
Date: Wed, 20 Jul 2022 18:11:11 -0500
Message-Id: <20220720231111.2114025-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 864cfdeb76735909a9afcc314416ccaa1ce82a1a:

  ARM: dts: qcom: msm8974: rename GPU's OPP table node (2022-07-06 16:04:22 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.20-2

for you to fetch changes up to aa7fd3bb6017b343585e97a909f9b7d2fe174018:

  ARM: dts: qcom: add rpmcc missing clocks for apq/ipq8064 and msm8660 (2022-07-18 19:13:44 -0500)

----------------------------------------------------------------
More Qualcomm DTS updates for v5.20

This adds an additional GSBI, hwclock, smem and tsens nodes for IPQ8064,
in addition to fixing up and improving the existing descriptions of the
platform.

USB interrupts are reordered to please the Devicetree binding.

The Light Pulse Generator is defined for PM8941 and LEDs are defined for
the FairPhone2, Nexus 5 and Sony Xperia devices.

----------------------------------------------------------------
André Almeida (1):
      ARM: dts: qcom: msm8974-hammerhead: Add notification LED

Bjorn Andersson (2):
      ARM: dts: qcom: Add LPG node to pm8941
      ARM: dts: qcom: msm8974-sony: Enable LPG

Christian Marangi (11):
      ARM: dts: qcom: ipq8064: add multiple missing pin definition
      ARM: dts: qcom: ipq8064: add gsbi6 missing definition
      ARM: dts: qcom: ipq8064: add specific dtsi with smb208 rpm regulators
      ARM: dts: qcom: ipq8064: add missing snps,dwmac compatible for gmac
      ARM: dts: qcom: ipq8064: disable usb phy by default
      ARM: dts: qcom: ipq8064: reduce pci IO size to 64K
      ARM: dts: qcom: ipq8064: fix and add some missing gsbi node
      ARM: dts: qcom: ipq8064: add speedbin efuse nvmem node
      ARM: dts: qcom: ipq8064: add missing hwlock
      ARM: dts: qcom: ipq8064: add missing smem compatible
      ARM: dts: qcom: add rpmcc missing clocks for apq/ipq8064 and msm8660

Dmitry Baryshkov (1):
      ARM: dts: qcom: apq8064: create tsens device node

Johan Hovold (1):
      ARM: dts: qcom: sdx65: reorder USB interrupts

Luca Weiss (1):
      ARM: dts: qcom: msm8974-FP2: Add notification LED

Stephan Gerhold (1):
      ARM: dts: qcom: msm8974: Disable remoteprocs by default

 arch/arm/boot/dts/qcom-apq8064.dtsi                |  27 +++-
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts           |   6 -
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts          |   9 --
 arch/arm/boot/dts/qcom-ipq8064-smb208.dtsi         |  37 +++++
 arch/arm/boot/dts/qcom-ipq8064.dtsi                | 162 ++++++++++++++++++++-
 arch/arm/boot/dts/qcom-msm8660.dtsi                |   4 +-
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  30 ++++
 .../boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi   |  30 ++++
 arch/arm/boot/dts/qcom-msm8974.dtsi                |   4 +
 .../arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts |  32 ++++
 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts |   2 +
 .../qcom-msm8974pro-sony-xperia-shinano-castor.dts |  30 ++++
 arch/arm/boot/dts/qcom-pm8941.dtsi                 |  10 ++
 arch/arm/boot/dts/qcom-sdx65.dtsi                  |  10 +-
 14 files changed, 357 insertions(+), 36 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-ipq8064-smb208.dtsi
