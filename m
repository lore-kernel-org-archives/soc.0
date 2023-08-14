Return-Path: <SRS0=SbT8=D7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF687C001DB
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 11:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9498FC433C8; Mon, 14 Aug 2023 11:42:01 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6BF9C433CB
	for <soc@kernel.org>; Mon, 14 Aug 2023 11:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6BF9C433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-99c136ee106so563847666b.1
        for <soc@kernel.org>; Mon, 14 Aug 2023 04:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692013318; x=1692618118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IhI41MstBcReN+KiXInXlGALbA3TY4zyWt7Hb7Xh6lE=;
        b=Lpb4nuLPT+nK3Cjb3I7qaZ++ML5Oev14P4kQJSedWS5cBuIkkmr9n9aNloPOa4i+j2
         UeqOeFZ7SCDT+TdY2J+EQ9QdhfmGUPf3rm3jIkmCwE+94J02sTZrhJuqXw3Wega+UdRu
         WUKuExc2VvtWAQeVmcUX9KfjwiMmK1Op943+Glqxgr8YQ7b+2lusBy2XYf3d/8YAUDXR
         +0nhT5C9HFNElWfeu+/YqwiHFiWiUXIUFrXPcZ5IKlPd4VG6SSEderykny1k5t0g7e+q
         yK/lcsunSQht5zHYniNTkMrH0JpO0umocmY6WAidBsu/qoHYCzyToAkUTuUm+VGDNBV1
         k+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692013318; x=1692618118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhI41MstBcReN+KiXInXlGALbA3TY4zyWt7Hb7Xh6lE=;
        b=XXGxECxHyXz3p6EdxsEkafvXBn3Miz3FOMHFLIy5yoBqnm+/Tze6VfsZFoUR1fvGpO
         S5rgXeZ+hryQiJoZ0L0+nS/DsEniPanwK6JVBpO0Gt/u2UwYbx04pi317190ZzDM9SaY
         YQV2+uzyf2r+VxJmR98Z7elSowT7/saXgbRfejehWBWZJSUuwnK41CzNjqyU2jWnXVh1
         xW1bx+2+Hih9LxEEzTvmgqftOAQlgsWgXboAulTtap7ekjy74G+1Hl5dkyumbIXdNaXW
         h7ihj/t8BBs7gWvKiKnxitZBh7ZtDB5r5epM1IIc0ERj6ijofjpo5pPGcd6/Rb5vhWqd
         hOrQ==
X-Gm-Message-State: AOJu0YxDKD8jRd4O05GcrTu/9anCoIBv/9nQfBE/bMCoSCDsPF8nEswF
	vVjQ618EEF4ozb4ssiM2cG2wlQ==
X-Google-Smtp-Source: AGHT+IG/eVkW2LOammMu0dK30+SXAixKrT/nEbuJdbKpKu18kGx+4imaPC2iN1beqLcDP2tzU7DPNw==
X-Received: by 2002:a17:906:5190:b0:99b:40b5:1c3b with SMTP id y16-20020a170906519000b0099b40b51c3bmr8604771ejk.57.1692013317890;
        Mon, 14 Aug 2023 04:41:57 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906490c00b0099d959f9536sm2695254ejq.12.2023.08.14.04.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 04:41:57 -0700 (PDT)
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
Subject: [GIT PULL] arm64: dts: various cleanup for v6.6
Date: Mon, 14 Aug 2023 13:41:54 +0200
Message-Id: <20230814114154.26017-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Not much this time - I just two patches.

Best regards,
Krzysztof


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.6

for you to fetch changes up to 1193001081e98d13c786fe0cae407cb747104cdc:

  arm64: dts: lg: add missing cache properties (2023-07-13 08:44:15 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.6

Just two cleanups of missing cache properties for Nuvoton and LG.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: nuvoton: add missing cache properties
      arm64: dts: lg: add missing cache properties

 arch/arm64/boot/dts/lg/lg1312.dtsi               | 2 ++
 arch/arm64/boot/dts/lg/lg1313.dtsi               | 2 ++
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi | 2 ++
 3 files changed, 6 insertions(+)
