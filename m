Return-Path: <SRS0=bw02=5T=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FDEC25B4E
	for <soc@archiver.kernel.org>; Sun, 22 Jan 2023 12:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23D62C433EF; Sun, 22 Jan 2023 12:15:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 879DBC4339C
	for <soc@kernel.org>; Sun, 22 Jan 2023 12:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 879DBC4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso8766716wmc.4
        for <soc@kernel.org>; Sun, 22 Jan 2023 04:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1tGaV/vVqSe7j5jHscTpb4g/SPxvj1PFsDHZ7F3jeUE=;
        b=BkYrz6odRMNCNMp9kPc0Ffg9qh8Xex6eIYZ/Zw3lR9wRnVIXDY2K9fQSj6mgdI3hE8
         4X/r1EdLYgTwZg/82E+CTSUEQbDv1qvbCwFxN98iVd1HfgkjySgyqUBq5jumi2U3890P
         IONGlbI7SK4anAurrWgToBfAtvH2s4zUvyMf8LY/RJFpjel35GNiZzMCRHqxznZaw/DE
         MR+/ldN/UqFC+0NSd5t9bGcl2jEblcsP0cMfVK57MJK++tJtU9dl1Lub7hhOTRo4DG3m
         gTGcvVJBdW99T/in0Ejhar1d5pFYQ4Z0+k1sX602/x9ve0EWXK5zNZ8Tv6QXiuJSSNCj
         D63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tGaV/vVqSe7j5jHscTpb4g/SPxvj1PFsDHZ7F3jeUE=;
        b=GA+MtlNXrE2qoBPjWQfqgR6QV1mpmPmR72vMMD3328uuIt/3nFwwynrkAdVOs8Sr5T
         1dxuMq2gJp+/G/GSbwQgEC2A0WBXHX6KfDgixWuIFM1rKuR6WZw670NUABgtAS0T1Y+h
         GoEqxkVo8Gre0iO3oBSQmIh04rPZnrzJkUNOcXweWTCur/3Itgp8btyBlyXIK+DBkgo1
         V2VDolKHyrFOZi2rzIRl2AiDlIQKHtNkdg6FMpIw7R58V0cDnucj8rvNMrJvOEVH4kx8
         Euhf+9AmZac8iJgLfBKp9xRj52TL3ZCT4MXIbpu0HLenRAsIX+M6gkYwGQsV21whZxpX
         +kKA==
X-Gm-Message-State: AFqh2kq3Qod6WWDQCPf8wVy6gKz1M5DhMIdSwOjYP1R1556FSROKaf95
	QNKEgIoIGUzr7oQ6IVUPT83uKQ==
X-Google-Smtp-Source: AMrXdXu2ngAApBUjdl+X0iQODuuOctW1xFD2HBQEjn9ESCYNGbuk/KECrZmQ6uFWU+OoL3ix2RG8nw==
X-Received: by 2002:a05:600c:1c2a:b0:3cf:d0b1:8aa1 with SMTP id j42-20020a05600c1c2a00b003cfd0b18aa1mr20036181wms.0.1674389745818;
        Sun, 22 Jan 2023 04:15:45 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o28-20020a05600c511c00b003dab40f9eafsm8543663wms.35.2023.01.22.04.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 04:15:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] arm64: dts: Cleanup for v6.3
Date: Sun, 22 Jan 2023 13:15:40 +0100
Message-Id: <20230122121541.29312-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.3

for you to fetch changes up to d0931f1d5e9c1655cfa8128edd14e813b4044801:

  arm64: dts: hisilicon: align LED node names with dtschema (2023-01-13 11:38:56 +0100)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.3

1. Drop 0x from unit address (microchip).
2. Align HDMI CEC and LED nodes with bindings (hisilicon).

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: microchip: drop 0x from unit address
      arm64: dts: hisilicon: align LED node names with dtschema

 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 12 ++++++------
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts    | 12 ++++++------
 arch/arm64/boot/dts/microchip/sparx5.dtsi         |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)
