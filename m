Return-Path: <SRS0=7l46=JQ=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34D1C433B4
	for <soc@archiver.kernel.org>; Mon, 19 Apr 2021 15:09:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A8FD661284; Mon, 19 Apr 2021 15:09:58 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A9B61007
	for <soc@kernel.org>; Mon, 19 Apr 2021 15:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A9B61007
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-oi1-f179.google.com with SMTP id e25so5785157oii.2
        for <soc@kernel.org>; Mon, 19 Apr 2021 08:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vS+oM0Q5xkB9I7vlQooWPj4X4O5Oih53m1IxzKg1wEY=;
        b=lBV3eh4yMGcw0lYrX19B5UryCJpgZc9mYX4RoQ+eV5iLvRUyGWNmkVoEUxVo10/CpU
         RKSpIfB3BW+jTHV0UDGn3AC/AehaoMK+eLufxsbj8qzpIKOjVyUobRYqRMjoNsdTS0RT
         se71ePt3uhsv6htwRrZ88bnCv9AsAEGoUuRekcRctF+hpnG9nAsztGtmEaeKhdwm5uI8
         NdRyPLSWfpHkv0vzth897yblwJZ1URldSaDltK755WW98yLYp92JGLAuX7Ty9xK/qVJ0
         IzB/XwXHm1yE5bmuDaZIlN751yKBRvZAGvY2o29531LpOyNnX6RK4D3FQp1moQa2hBrO
         Nryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vS+oM0Q5xkB9I7vlQooWPj4X4O5Oih53m1IxzKg1wEY=;
        b=tVFcJLfs9gzPV8HfXH9dNXrBfJb12QZwV+bIYsvguXpwMouvqtiLjtTfDtsbWUl4rq
         vsTamHyCGeCeZSIrxXuxvio+GQWNzc4sWVusZbwmy8Illd09azw4VsV8vcxb8dZ9uFxE
         bpRP4qLleqRglLFK0tz6YlOmQ6WyTYJyQjLM71eJghRTNe/Ty+Z9u5hyblI/npLyrMbm
         Q4WHs5g09gIc7yYujt4kGfqxD5DF+4B2CaRKZhn0EAzv65Y3MsE4RveN85Lw+UQ5OmRO
         0eDvV4sNUYtMgRdSSRKesQbEQQ3tTzbeUqNl6xz/YQC3W4z343N+BP9CKnUWs6w/DJFH
         xqhQ==
X-Gm-Message-State: AOAM531lQbzzcQ0x8AwzQVIpK7y0WNTBmUve6KSc7u1JfTAuLfJX9ysc
	VNH5Mr7ujTgyQXVpMD2CG3RrYQ==
X-Google-Smtp-Source: ABdhPJzOvIG9+263Vs7RPSxqh9TNbUCMKdLwV0N+9EFcHrqfJ6XnLxq1gGEaTygCtEX/rfCwxG+TXg==
X-Received: by 2002:a05:6808:f08:: with SMTP id m8mr11644084oiw.127.1618844997831;
        Mon, 19 Apr 2021 08:09:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x13sm3492048otg.57.2021.04.19.08.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 08:09:57 -0700 (PDT)
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
	Manivannan Sadhasivam <mani@kernel.org>,
	Alex Elder <elder@linaro.org>
Subject: [GIT PULL] More Qualcomm DTS updates for 5.13
Date: Mon, 19 Apr 2021 10:09:56 -0500
Message-Id: <20210419150956.860423-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 885aae6860fae1eed38f5cc1ac09a40e4896a38c:

  ARM: dts: qcom: msm8974-klte: Add bluetooth support (2021-04-06 11:53:16 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.13-2

for you to fetch changes up to 06ad53efeb496d8841169ec0919ba6852c7852f6:

  ARM: dts: qcom: sdx55: add IPA information (2021-04-13 21:35:56 -0500)

----------------------------------------------------------------
More Qualcomm DTS updates for 5.13

This adds CPUfreq, interconnect providers, IPC, remoteproc and IPA to
the SDX55 platform and then adds board files for the Telit FN980 TLB and
Thundercomm TurboX T55.

----------------------------------------------------------------
Alex Elder (1):
      ARM: dts: qcom: sdx55: add IPA information

Manivannan Sadhasivam (14):
      ARM: dts: qcom: sdx55: Add support for A7 PLL clock
      ARM: dts: qcom: sdx55: Add support for APCS block
      ARM: dts: qcom: sdx55: Add CPUFreq support
      ARM: dts: qcom: sdx55: Add modem SMP2P node
      ARM: dts: qcom: sdx55: Add IMEM and PIL info region
      dt-bindings: firmware: scm: Add compatible for SDX55
      ARM: dts: qcom: sdx55: Add SCM node
      ARM: dts: qcom: sdx55: Add interconnect nodes
      ARM: dts: qcom: Fix node name for NAND controller node
      ARM: dts: qcom: sdx55: Add Modem remoteproc node
      dt-bindings: arm: qcom: Add binding for Telit FN980 TLB board
      ARM: dts: qcom: sdx55: Add basic devicetree support for Telit FN980 TLB
      dt-bindings: arm: qcom: Add binding for Thundercomm T55 kit
      ARM: dts: qcom: sdx55: Add basic devicetree support for Thundercomm T55

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 .../devicetree/bindings/firmware/qcom,scm.txt      |   1 +
 arch/arm/boot/dts/Makefile                         |   4 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |   2 +-
 arch/arm/boot/dts/qcom-sdx55-t55.dts               | 281 ++++++++++++++++++++
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts   | 282 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-sdx55.dtsi                  | 207 ++++++++++++++-
 7 files changed, 776 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-t55.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
