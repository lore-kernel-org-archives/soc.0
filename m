Return-Path: <SRS0=MFSJ=W7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2911EC433EF
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 08:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12C03C341C0; Fri, 24 Jun 2022 08:18:33 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5EBE6C341CF
	for <soc@kernel.org>; Fri, 24 Jun 2022 08:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5EBE6C341CF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id q6so3075379eji.13
        for <soc@kernel.org>; Fri, 24 Jun 2022 01:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ku+g6mH8ZtuEKNgu6VjhrNGoqiS6ry/wCTbIBt3/GQE=;
        b=SrzkAYFywwE4KrBRkZEgbZe97t9oQ6QOcINHeDh+qKi+h/tULRuRL9up5ahQJi0BHx
         1ERpQV3i5md1keFw6ib4iuscoIXbRMc4OoSTfkf/0JuyBuMx2yE5d+VuCZKlb+e2ydAv
         5qFTFHiUB3q+1qqLpxnDIPd/vqeriUMxtl3SOGo73K2fG9EtHuYeePfSheEb8/8ANM+k
         eG4cghoyIplOCn2+G4c+P8N3X+vglkd9sN1Hc29bRaUxH/EotEksy1u7fQBq3yGl79XY
         IsC5muYGdmRxX1LUj98aoURRTymJvls2yUuxwEUs1nF9bOpnmtzupShon/p7TptCzyHp
         /dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ku+g6mH8ZtuEKNgu6VjhrNGoqiS6ry/wCTbIBt3/GQE=;
        b=zaDY6k48QhVSRfaJ/XSt3Eg+BJ4+jkD25EJUBB/49RhYT6cWk6Y73F4xm9kjp5qEKW
         WFveiNqNjplLKfYviylhsnBc3aQr3DBDMjaL0FWgVqOxpaZUqGq3pyk/50moWpTVqAb0
         5ZocWk70l+R5ImQ+qthsJc2RoK6P7vpjDmsLtShjuHYwgt6v/uDpxTwfwuRQOp3hMAMu
         oO/BimPZnRpeCY/k83+qSHu1j2jMIIIOhoOLamG6OdzRHLAuAvS2Gf0uUH5OeXmvKYYd
         cUT+rZmFNka7JGmsyxzNwsJASOi8ITPWxkMiuwowtD0zjM3a9XRUbMqXEZyWUbU+1eT5
         wgTA==
X-Gm-Message-State: AJIora+S5QfQDIxtXzRfDhPWDP33CnQ47vqvVPWoqY4kTjy3xSV9yS3o
	jX2lItFcmEF0QrESvL2dThS89g==
X-Google-Smtp-Source: AGRyM1vDJ1ilNFbcJCloY+qyC5NXLH/wPECYN7/lSbVjCsXgDAbxJtcZoGXGprbeIgu7cqm5JYVB2A==
X-Received: by 2002:a17:906:147:b0:712:1288:348f with SMTP id 7-20020a170906014700b007121288348fmr11899014ejh.324.1656058710733;
        Fri, 24 Jun 2022 01:18:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a18-20020aa7cf12000000b0043503d2fa35sm1383360edy.87.2022.06.24.01.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 01:18:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v5.19
Date: Fri, 24 Jun 2022 10:18:28 +0200
Message-Id: <20220624081828.33649-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.20

for you to fetch changes up to 0d97f2176dec9c1e070215c4e28ba87e036458c9:

  memory: mtk-smi: Add support for MT6795 Helio X10 (2022-06-06 11:11:50 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.20

Add MediaTek MT6795 Helio X10 SMI support.

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      dt-bindings: memory: mtk-smi: Add MT6795 Helio X10 bindings
      memory: mtk-smi: Add support for MT6795 Helio X10

 .../memory-controllers/mediatek,smi-common.yaml         |  1 +
 .../bindings/memory-controllers/mediatek,smi-larb.yaml  |  1 +
 drivers/memory/mtk-smi.c                                | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)
