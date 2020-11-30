Return-Path: <SRS0=XW8w=FE=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9A2C64E7B
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 19:01:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6F91B206CB; Mon, 30 Nov 2020 19:01:51 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 205E42087C
	for <soc@kernel.org>; Mon, 30 Nov 2020 19:01:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TFDs0G0d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 205E42087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-oi1-f182.google.com with SMTP id c80so15355380oib.2
        for <soc@kernel.org>; Mon, 30 Nov 2020 11:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFP3MCLy2EXZUBJtiDcAGWbpBsgwcvmKdFz2JF0dZBo=;
        b=TFDs0G0dDo8pJvrVvUZgEZ6YWnppxEFXN1bNY3taZwE/f6cs12KRXZP5OM2KSMSQYB
         kf6uXtYJmWM69CACQCv0+vzpgsKzGrwJBYRWeztj8CETIrCJ7ET7wjIZof+SsggZ0IoE
         R1sSPqLf2lWSn5QWrPLKDRKInJdIT+3eY1kFQXNcPTmZr0enG8qUKSAiU6RN/n/jGvO+
         vlrUKTIICxiNhkcZftLAgFPxx8T4uuKaHNwBvU6N+1hp21c5uBzCoJqRh2LnKv3fTgCi
         aiXu2lppvwXFlHtTU+Br9Rz+bk5d+hRAPqHJNi5VSqlTrJQBe5SFI2Oy2pzYsb6UK5vg
         iJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFP3MCLy2EXZUBJtiDcAGWbpBsgwcvmKdFz2JF0dZBo=;
        b=VrGdAF+LhKW7tFKaKvjEd9PQ7290tu8rbQvBaF83SRFMa+vMZlrZO55laOeQn6gllB
         JaiqCS6CcG3WSqJW5vML4SDVrg7vS3bdpTSLI8HS5LewmltY6fY9Os30HImz0ejDsd25
         nVONuEHupGg3O1FqTt8344/LiRV8xcuVUemTTj8e3OcWHlJ6Uur96/hSjNax/LEaV0J2
         fHCTkAGRj4QEhcVsJveMgM7kxgKSz6uxEYs6Dmm9RkD4qK95RF4RvZbz9cCHFonOoHv7
         ToHZbOIntrvZfYVXmXKBfbywyOyfc/NjmEQz20mmqfOpf0SNtoh82Iqc7amerDoai5Nn
         cKQw==
X-Gm-Message-State: AOAM532VFO32NW0dU/7TMCxNeZgHrp2QNE7w7bJkmQBW1hrJ0he79JCQ
	1K7+bgPcKBubQwQ/LZxPCcxqyw==
X-Google-Smtp-Source: ABdhPJzBrobmA5HZtxJaMUTaf8v8ARuqGjgOc7Dn7ZiIprGRmFJesvN/bfb+4ePcxWJc1r+u6UsK6A==
X-Received: by 2002:a05:6808:a87:: with SMTP id q7mr205963oij.81.1606762909698;
        Mon, 30 Nov 2020 11:01:49 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p12sm9098717oti.35.2020.11.30.11.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 11:01:49 -0800 (PST)
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
	Iskren Chernev <iskren.chernev@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Kathiravan T <kathirav@codeaurora.org>
Subject: [GIT PULL] Qualcomm DT updates for 5.11
Date: Mon, 30 Nov 2020 13:01:48 -0600
Message-Id: <20201130190148.345302-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.11

for you to fetch changes up to 74ab8ccfb8f3133acf8b2a2a7bcfba9c1710960d:

  arm64: dts: ipq6018: Add the QPIC peripheral nodes (2020-11-30 10:46:28 -0600)

----------------------------------------------------------------
Qualcomm DT updates for 5.11

This adds support for SD card, WiFi, LED, touchscreeni, touchkey and
fuel gauge to the Samsung Galaxy S5. Nexus 5 also gains fuel gauge
support.

Finally IPQ6016 gains support for the QPIC NAND controller.

----------------------------------------------------------------
Iskren Chernev (9):
      ARM: dts: qcom: msm8974-klte: Merge pinctrl nodes
      ARM: dts: qcom: msm8974-klte: Add support for touchkey
      ARM: dts: qcom: msm8974-klte: Add support for touchscreen
      ARM: dts: qcom: msm8974-klte: Add support for led
      ARM: dts: qcom: msm8974-klte: Add gpio expander chip
      ARM: dts: qcom: msm8974-klte: Add support for wifi
      ARM: dts: qcom: msm8974-klte: Add support for SD card
      ARM: dts: qcom: msm8974-klte: Add fuel gauge
      ARM: dts: qcom: msm8974-lge-nexus5: Add fuel gauge

Jonathan Cameron (1):
      ARM: dts: qcom-pma8084: Drop incorrect use of io-channel-ranges

Kathiravan T (1):
      arm64: dts: ipq6018: Add the QPIC peripheral nodes

 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  25 ++
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    | 340 ++++++++++++++++++++-
 arch/arm/boot/dts/qcom-pma8084.dtsi                |   1 -
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |  16 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  41 +++
 5 files changed, 413 insertions(+), 10 deletions(-)
