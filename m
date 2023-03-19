Return-Path: <SRS0=S7z/=7L=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DDAC6FD1F
	for <soc@archiver.kernel.org>; Sun, 19 Mar 2023 15:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21D05C4339E; Sun, 19 Mar 2023 15:27:47 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7551C4339B
	for <soc@kernel.org>; Sun, 19 Mar 2023 15:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7551C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id eh3so37774486edb.11
        for <soc@kernel.org>; Sun, 19 Mar 2023 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679239663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3viO/SVS1mAUPDADBNw/95UMMSdd5bvS68WvAIfgKs=;
        b=cndUSDcLJ1g+lnvV7RtVfaGzOd2gedLDsXsY9euB+Vuyr2n5qmyK5XyzpEEEMl4eOq
         CcgtWk8HQtNxZF3m1uVTD2rJqvpjtuvmQDB91D2aGX7qD4DHMh/rdnmHqh/NyObKb+fT
         JqXq8/YYeyyDPAR1uq2gKKN+e213lVeSbVx35UqIgvnqV3EsOuhpM7OyNwrf1EBn7C0N
         9fqaA+7/+UBsh/VSd2kU7suBwTvjGpTQ5Y58iwy0AfxKvX0dAGVeuqkSFCjsWO0krrni
         RiLEKLufNQSO62aoTrNDCcqT+0KAnoUs708s9LcZPp2u7AY3xomlkcdr03eBsXnEhyhd
         ig+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679239663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3viO/SVS1mAUPDADBNw/95UMMSdd5bvS68WvAIfgKs=;
        b=i0qUHGEfjV/lwTed0dfNVI2ZPHlvhOHo1ti4uI3YQPla8C02Y3tdGUJoXr1j/TWbJy
         lgFn9SjwG2NmlJq6N8InH2408J/ELSdUcobrwXTUnbX5/tbjcfkHcai2tNd0HFaadoyu
         vxXjwudHnwztH+GjytBh9suYFD7mgynGim45i9FTaKj4xBOn8L1dK9ZPMItIH2URMUKL
         oLzxEg4v67WK+Vmunule2JEToJ18fG7RWIjgr4mk0P9ukkqSOc59MX2E9qGuG+fg4FoK
         KlZoALL/I+0ckIZHo5bCnHGCH6prTNNBRldA9yNEqKR9zR6EyX3v+7BBUv+lC4vG7u+l
         dBmw==
X-Gm-Message-State: AO0yUKWhIqERq5ETZsziL0Bvx5yQYsy0ZN7E3WaquhGdPDcwniZo53/m
	jVoTMcM6tNPdniRZC5NcvclFTg==
X-Google-Smtp-Source: AK7set/47vNe/VBA1m9BQdyDxM2teNI19eB4W2tllqt6sHMM97qWkxhef7FVbfq+zHUFlQQ1+y73Bw==
X-Received: by 2002:a17:906:7394:b0:92b:ae6c:23e7 with SMTP id f20-20020a170906739400b0092bae6c23e7mr5985333ejl.56.1679239663137;
        Sun, 19 Mar 2023 08:27:43 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709064f0700b008cda6560404sm3340857eju.193.2023.03.19.08.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 08:27:42 -0700 (PDT)
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [GIT PULL 1/2] arm64: dts: few cleanups for v6.4
Date: Sun, 19 Mar 2023 16:27:39 +0100
Message-Id: <20230319152740.34551-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

Few cleanups where maintainers did not pick them up for some time, maybe
expecting me to send or maybe because they missed these.

Best regards,
Krzysztof


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.4

for you to fetch changes up to d2e5c16f6c86901040f3bb6b40d1a01ccf1a21b0:

  arm64: dts: cavium: Fix GICv3 ITS nodes (2023-03-17 13:39:00 +0100)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.4

1. Toshiba: white-space fixes.
2. Cavium, Marvell: fix GICv3 ITS node name.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: toshiba: adjust whitespace around '='

Rob Herring (2):
      arm64: dts: marvell: armada-ap810: Fix GICv3 ITS node name
      arm64: dts: cavium: Fix GICv3 ITS nodes

 arch/arm64/boot/dts/cavium/thunder-88xx.dtsi      | 3 ++-
 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi     | 4 ++--
 arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi | 2 +-
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi         | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)
