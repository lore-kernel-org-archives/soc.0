Return-Path: <SRS0=8hDI=MB=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F72C4345F
	for <soc@archiver.kernel.org>; Sun, 28 Apr 2024 16:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A602C113CC; Sun, 28 Apr 2024 16:20:07 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CDFCEC116B1
	for <soc@kernel.org>; Sun, 28 Apr 2024 16:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CDFCEC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a58d0aea14cso272800966b.2
        for <soc@kernel.org>; Sun, 28 Apr 2024 09:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714321204; x=1714926004; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FASynAs5IxrMDovqRBLq0gB6byYA6/mpBMhiTARocxs=;
        b=tpvs8xgvewipAlO5TGMDKzLE3gjZITHOGv73Vv/aiKlNcbV6gZ9qDS9EI3uhdWoces
         aOx/hWqMcfxmCf5KYUq3HoIg+fBNfc60J1nZb5MbxbSfZR2sU1UTAZVsynFapm8mQ+Cc
         Ydz4lUplOn29M/3b+STEKEbkAxflyP86roypYisAeMoxXzBXcXfGpF5/13iGjnws8H3P
         YG4pY6FJVXPwEY6Q3fM6ghwdtMFqRY6GKqqT1uTuBXf9Y7RzdGKkyZy1IDon+cQHn8sB
         J87G/Z2T173KdTNfnlQHlM7c2xpXvh+dtjyixocJaLWABretbZSQyy7ENOPfKewrwols
         kuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714321204; x=1714926004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FASynAs5IxrMDovqRBLq0gB6byYA6/mpBMhiTARocxs=;
        b=jOvtCN5FR03SW4sfBNEYCZIJd4SK7ZGFTUnbkFdf8tDUzzE0a7ak+kFn5pe4jF2vqT
         Bb0ZT9LsQXRMApYltI0R1cEgfia4At3k1ujkHNmQTZ+Hgi2CO+fuscsNrUc5DJscLpF9
         iHXdE0a8m9cfoiP954p6/kYwuq06QyT1moPuFqVWDPfIo8g2at763eZ+6H6BNaeLJs6i
         LYxIawlIHIBLPOwIqA/FULYxBLy8C3NSfDrIwJo3rhq0ktNBLTDF+B0o9sf3U/eHGCO7
         i1ne+tfj/O5yXCHsUt3KBI7piMhnDK2F+9h0hWMmzUrEWBMNZYR+2MIVlJ/kIJkeDR3a
         OLLg==
X-Forwarded-Encrypted: i=1; AJvYcCXGE8q64abXENWqgf5kKR+zdHVQ42j96fANOmM9TiOJmGpaGQiNCM6iN6zjHUmh1uBnWg4J38i5q3hp0Xl4Vg==
X-Gm-Message-State: AOJu0Yy2UP9yRso/DLv5Yptc4T+MnCcQ7cxSGWRzMp8RN4chJ82x+Aw0
	7iJos+sbIJlXdsP4FGQrqcEv2HYte1iez/U0y5q/lN0iOzwQoQxe5w1pygMgyNU=
X-Google-Smtp-Source: AGHT+IHUbZG5j4eAjiIEASfxJU33DsXgl8sNmmmfQQbZA+L0ob/0eeZAUp3u39qVBjAlNmwaZu7ueQ==
X-Received: by 2002:a17:906:6d3:b0:a51:a288:5af9 with SMTP id v19-20020a17090606d300b00a51a2885af9mr4805711ejb.51.1714321203930;
        Sun, 28 Apr 2024 09:20:03 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id u3-20020a170906b10300b00a52552a8605sm12886738ejy.159.2024.04.28.09.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 09:20:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.10
Date: Sun, 28 Apr 2024 18:20:01 +0200
Message-ID: <20240428162001.28011-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.10

for you to fetch changes up to bf11908757eeab716536d16a32693b5dcd6990de:

  memory: mtk-smi: fix module autoloading (2024-04-11 08:22:26 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.10

Few cleanups:
1. Correct module auto-loading - missing aliases in the module.
2. Document bindings for the Samsung S5Pv210 SoC DMC memory controller.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      dt-bindings: memory-controllers: add Samsung S5Pv210 SoC DMC
      memory: brcmstb_memc: fix module autoloading
      memory: mtk-smi: fix module autoloading

 .../memory-controllers/samsung,s5pv210-dmc.yaml    | 33 ++++++++++++++++++++++
 drivers/memory/brcmstb_memc.c                      |  1 +
 drivers/memory/mtk-smi.c                           |  2 ++
 3 files changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/samsung,s5pv210-dmc.yaml
