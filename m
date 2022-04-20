Return-Path: <SRS0=wXmp=U6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE49C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Apr 2022 07:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9336EC385A9; Wed, 20 Apr 2022 07:21:58 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0DB7C385A1
	for <soc@kernel.org>; Wed, 20 Apr 2022 07:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0DB7C385A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id s25so1060066edi.13
        for <soc@kernel.org>; Wed, 20 Apr 2022 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uxmYy8O3B9S8Z/t2A4fXr3iVXi2rAgR9IiSdOI1pb5c=;
        b=j4MlJffbNOKszAngWM2pnsI5+AUS4yrhe1hYMLBt7tQNu1TXEqTLJI/+cMGaadm4qX
         DVWvgylWFQBi4/TWkOkHefBsKemVN1H9R2p5KXp+kCngYSyrKAVCoy0KT2F+18bZGFcU
         GTnlZVE0qm7dg1YC+xszO66TvXEZjT+xNUpl8cCuaU5Wg1mph7ZSsBL04PpaYPCcfDUg
         R9yFKx3CfS2Qt3P7uR+IJdudn1ZO3Duq6Ttl4a2Ll4AQrwGxvoPfHyhTuPVijSvGrs8d
         K6paQYxg0JNv7f9ZEWlrJx4iG+m0DTBe7W3e368zPAgyYRxzcWkk3o5k/gFrVMhJZjqT
         BOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uxmYy8O3B9S8Z/t2A4fXr3iVXi2rAgR9IiSdOI1pb5c=;
        b=idcinNybjV27GTxw51fNKzGs7AlkqIY2sJgxfDvBfGRPeb6MCztjotUwSqHfoWRxID
         o7m6ZLJMgTNxfXMtLXikmd3xwPL+f1c8GxjVUYO7OFeoQa3MT6UCG/Ppf1PdN7506h3f
         1S5hVkxAB1uHc2RHxogmlI359teaM1P+pLyDpJXLLKSVRPRVfQ+59DkwBYEoAf12hbVG
         vZNke8BmX5uKxZQpoI+bLAdkUo0DWO8FQkc9SjoXHuwPM4/VzWfJ79a7Mar070LUUbZ+
         i7Xa/4RfpMuLabyseJJjzHF1MCkeesPyRgOMzf+h3cX1H384u3sHcEMqWjFaI9wXm+PO
         NtQQ==
X-Gm-Message-State: AOAM530eS+TbyoHDSZ4Es/sxaEzoFwHFCs1wucH+voqLgKBHNs3AS7h4
	cT3q1hTX75opf8POrN+PO39TKQ==
X-Google-Smtp-Source: ABdhPJwSy+FJb4H1cp6AcRQOgklNGnvLsJgBDZ3kdwqQ0JHRbbxJeuyMHY/Sv45mSH+JW9f+TfpEpA==
X-Received: by 2002:a05:6402:1e89:b0:423:e004:bf61 with SMTP id f9-20020a0564021e8900b00423e004bf61mr16075680edf.14.1650439316140;
        Wed, 20 Apr 2022 00:21:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm6492106ejj.142.2022.04.20.00.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 00:21:55 -0700 (PDT)
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
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] ARM: dts: various: cleanup for v5.19
Date: Wed, 20 Apr 2022 09:21:50 +0200
Message-Id: <20220420072152.11696-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

These were waiting on the LKML for some time, got few acks but no one picked
them up.  Please take them through SoC.

Best regards,
Krzysztof


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/dt-cleanup-5.19

for you to fetch changes up to c9bdd50d2019f78bf4c1f6a79254c27771901023:

  ARM: dts: socfpga: align interrupt controller node name with dtschema (2022-04-07 21:30:22 +0200)

----------------------------------------------------------------
Minor cleanup of ARM DTS for v5.19

Align node names and unit addresses to DT schema and DT coding style in
nspire, ox820 and socfpga.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: nspire: use lower case hex addresses in node unit addresses
      ARM: dts: ox820: align interrupt controller node name with dtschema
      ARM: dts: socfpga: align interrupt controller node name with dtschema

 arch/arm/boot/dts/nspire-classic.dtsi  | 10 +++---
 arch/arm/boot/dts/nspire-cx.dts        |  4 +--
 arch/arm/boot/dts/nspire.dtsi          | 60 +++++++++++++++++-----------------
 arch/arm/boot/dts/ox820.dtsi           |  2 +-
 arch/arm/boot/dts/socfpga.dtsi         |  2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi |  2 +-
 6 files changed, 40 insertions(+), 40 deletions(-)
