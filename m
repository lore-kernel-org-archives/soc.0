Return-Path: <SRS0=u+Dz=FU=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B835DE92FFA
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 09:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B901C433CD; Fri,  6 Oct 2023 09:28:29 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BF5FC433C8
	for <soc@kernel.org>; Fri,  6 Oct 2023 09:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7BF5FC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9b9ad5760b9so329243666b.3
        for <soc@kernel.org>; Fri, 06 Oct 2023 02:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696584507; x=1697189307; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9oMQ4sfKITrqglJ7HukYbUVCwdr/XxwFy7LQhh9sK4U=;
        b=QG2mbrjHoLN6GhoAv6CN/W1XY/mpIW5dqLUnxRmjBsy39rgMagW+bHfHQK7B6DyZSM
         01BsDGcHvLEvN/8CRE6WUCR5LC4fMxpQVC9pEn+Rdab7/dR4oisqbhEfDhk9sBZv53D2
         gfznS5M8aPjScsB/+oIb7mVA/1o9OMNoezNzLUP4Z7TPYs3dH+JZG/bCcO3RkfS7/EXo
         sUIvyrixWJ/TXArUrhOFLCgeHczsLQ4TTP1Ah9Gi3p92uVaHmXezRvNlDhlwb9BOnYzK
         Ndno20wR4BPAZA9uYoB6wJovbdc7zkxXEqgVo8a3oavOLILvk0g6TEU9nHFlX6FkO1d0
         QsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696584507; x=1697189307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oMQ4sfKITrqglJ7HukYbUVCwdr/XxwFy7LQhh9sK4U=;
        b=HmbMC3Sn2mzVc03GYDdef3SznQrW1h3MUDcoarhoGE9V7j11N27hhcW5gS3VVpQMIR
         Hck826RNIHcZI15Pg+10RDIor8ErkNFhyNyqOaEpv/f7ze/EVVFT37ESdbyAk2UvbmEn
         +Liop2Ixweaeo8Pj2FFbSdlE050hxP8SIeJTn844LOWx5T6A3O69+phkxZ2tf97kgFIH
         Mtx4tsT53CPTVO7NWAdc/3i1pEN/Tsms7qeGkOOfa+3ife2oeVlVQdu4/IY0lrDH6URt
         X7ulVKs3XuQYoPbzKaHjmVMZdGWji1MiTyp1/N+mI/kJbemEEFD5qn3nHzpo7FWsfqgr
         MXrw==
X-Gm-Message-State: AOJu0Yy07lmQ61V1Xg2JEzJdbLDGdOcaYTjr54vghNWZ57cvUY5qtikM
	mjKVIkeonP+NIlTkYz0FCE/nFg==
X-Google-Smtp-Source: AGHT+IGpxsusnlFnvTn4ZM0ktTcxxo0I0Dt559z6iS7MDTS1MwPqy0hAbGZ+L98X7zoY9l/NctcgWw==
X-Received: by 2002:a17:906:1097:b0:9ad:be8a:a588 with SMTP id u23-20020a170906109700b009adbe8aa588mr6450602eju.1.1696584506696;
        Fri, 06 Oct 2023 02:28:26 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id u25-20020a1709063b9900b0099bc2d1429csm2573006ejf.72.2023.10.06.02.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:28:26 -0700 (PDT)
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
Subject: [GIT PULL 1/2] arm64: dts: minor cleanup for v6.7
Date: Fri,  6 Oct 2023 11:28:22 +0200
Message-Id: <20231006092823.94839-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Few patches which were acked by maintainers or slipped through the cracks.

Best regards,
Krzysztof


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.7

for you to fetch changes up to 12ca3ca8cf06d803b3690ef523ccf5ffd0b23a71:

  arm64: dts: marvell: minor whitespace cleanup around '=' (2023-09-24 20:56:14 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.7

Few cleanups and improvements: use lowercase hex for unit addresses
(Bitmain), add missing spaces before '{' (APM, MediaTek) and cleanup
whitespace around '=' (MediaTek, Marvell).

----------------------------------------------------------------
Krzysztof Kozlowski (5):
      arm64: dts: bitmain: lowercase unit addresses
      arm64: dts: apm: add missing space before {
      arm64: dts: mediatek: add missing space before {
      arm64: dts: mediatek: minor whitespace cleanup around '='
      arm64: dts: marvell: minor whitespace cleanup around '='

 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |  2 +-
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |  2 +-
 arch/arm64/boot/dts/bitmain/bm1880.dtsi            |  6 +--
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      |  4 +-
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  6 +--
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       |  6 +--
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        | 48 +++++++++++-----------
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     | 12 +++---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    | 12 +++---
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts       |  2 +-
 10 files changed, 50 insertions(+), 50 deletions(-)
