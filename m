Return-Path: <SRS0=JHH0=AH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FB4C77B7A
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 14:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9EE38C4339E; Sun, 16 Apr 2023 14:32:54 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5996C433EF
	for <soc@kernel.org>; Sun, 16 Apr 2023 14:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5996C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id sz19so608363ejc.2
        for <soc@kernel.org>; Sun, 16 Apr 2023 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681655572; x=1684247572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxPwmhTn7R8qcbvvXrEOzUT6iY4Cfl6bwCwS+WC5Va8=;
        b=jRcjXg6jNI5pjujR/dVJj+LQpcy/81Qohbx/vk0NeKE/+JJSu4YD+o826383+s0OTJ
         G+srA2g+4s8lELCqwy4n466Ip06tbeoBQDAgd1Fg2chSEnwPThZz0KDuGcyLQEj/xzsM
         VxvIQfA/RZpK90xvfRkeJid59BhrRkzSCfJCG9cOAazSrwDz2osvpMJdQt8li1pb2jSB
         y9/8RZp/30ZZGsEpp9u/Qn1ZkpvFKxpKm6Dvg+PQ/A6sl4EcUi+0+fruNo2eQR4gc1l9
         VGH5fq3Baf8Cwep1ZSX3tILq2EbswDTIqt6xGjT5SL8n7Mk4VOpLVrQtCmzqbLOBboiU
         mWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681655572; x=1684247572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxPwmhTn7R8qcbvvXrEOzUT6iY4Cfl6bwCwS+WC5Va8=;
        b=hAWusiOOduSIMyatjsYggT7gPiwSFxj9574vDoe+faRhlwO3MSrTQQS3ZBCxgj4/et
         jWwuOB3qGUWgeWFfw/ZiLP0LM08GhzqnTRYJ1tI/DD1c02qK+IgKgodVevo5jxPHwY74
         ZclFOj1gOW7Qb+LQlABmxCsVIsoG4lHKHoGZ/9p6luc0z8nl80iDrPRbKeIs3OTqCQs7
         WooTHATvOcLHYyqYBmF+2FhjA0e3QvvdfqgtHk6CG0m9ttdkiqWKxAeUv0PoPhyoEQvq
         MfGWgeqk4cOgVl0W8h2oR9Q+Nz5DwBe118rNM9sIi7f+KoyZAOL8FuETRJhPdfWW4iWW
         hCkQ==
X-Gm-Message-State: AAQBX9e3oKvXN8VBcmxz85OIXYTYSfeKlB08ZykIiv9pbCTRh0SfwAnm
	rOE/7xbFcq/evr5TW0x2teIRmg==
X-Google-Smtp-Source: AKy350bxYnhx5lTuz3nhlAXOfqrgCFlsA9aSriC++51hMHa6zCQKlPTLANk80um0Va61/aHij0j7qw==
X-Received: by 2002:a17:906:17c1:b0:932:ac6c:7ef9 with SMTP id u1-20020a17090617c100b00932ac6c7ef9mr4599921eje.22.1681655571849;
        Sun, 16 Apr 2023 07:32:51 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ba4d:301c:484d:5c9])
        by smtp.gmail.com with ESMTPSA id g25-20020a17090613d900b0094edfbd475csm3663271ejc.127.2023.04.16.07.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 07:32:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers: late pull for v6.4, part two
Date: Sun, 16 Apr 2023 16:32:48 +0200
Message-Id: <20230416143248.308942-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 69d170c4c28ba0490bd42630cc09d7e1834bbb3d:

  dt-bindings: memory-controller: Drop unneeded quotes (2023-03-31 21:53:15 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.4-2

for you to fetch changes up to 3ec0e1ea4770e40575bfb2bb4e9ebbbaa3c80d3f:

  memory: mtk-smi: mt8365: Add SMI Support (2023-04-10 18:57:15 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.4, part two

1. Tegra210 EMC: correct reading of MR18 register.
2. MediaTek SMI: add support for MT8365.

----------------------------------------------------------------
Alexandre Mergnat (3):
      dt-bindings: memory-controllers: mediatek,smi-common: add mt8365
      dt-bindings: memory-controllers: mediatek,smi-larb: add mt8365
      memory: mtk-smi: mt8365: Add SMI Support

Diogo Ivo (1):
      memory: tegra: read values from correct device

 .../devicetree/bindings/memory-controllers/mediatek,smi-common.yaml | 2 ++
 .../devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml   | 4 ++++
 drivers/memory/mtk-smi.c                                            | 6 ++++++
 drivers/memory/tegra/tegra210-emc-cc-r21021.c                       | 2 +-
 4 files changed, 13 insertions(+), 1 deletion(-)
