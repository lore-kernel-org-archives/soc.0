Return-Path: <SRS0=zANd=VO=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23566C433EF
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 08:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E80C2C385B3; Fri,  6 May 2022 08:14:48 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E950FC385AA
	for <soc@kernel.org>; Fri,  6 May 2022 08:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E950FC385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id q20so3967043wmq.1
        for <soc@kernel.org>; Fri, 06 May 2022 01:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xpOcDZG3VsHKMRkqd+A+g34iqZmhtRfpCGSjJhC44/I=;
        b=mylpU264xNwSuqHcl7TSS/pfgkflTa4CM+C1PTNplNI4s8FdOsBhLpH14M/HeTEbhi
         DK83CbrTfTd84dHPWLP7m+ZkI/IX3g/XGZkSMECMEsjXZW3xj9qFbJ8dBICPxhAoneJM
         7Rz9F5552e5TRXaOhNuQ+JtNTNtPJFZ/1P0rnW7N+L2JMeQo7EIhEDYM+63BHcPbhR5C
         uzW/u9Xabsn55Z2X850E7RdPqfdQzDpjWlMLkHCl7jyZkdAK8Vb6Z2HjoyEz+1mxj+KU
         Op4mLdD0dbOY0lK6BufdUL9I6sYj1cJ0wwp78BOPHW0+eAviXrsoNnv2m5EDF5ksMuNs
         hfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xpOcDZG3VsHKMRkqd+A+g34iqZmhtRfpCGSjJhC44/I=;
        b=wFXNZyZmublnvkptmU4qTezjxp0aMl7KYSFWsRtzcP3MVMb3ah/faLauXiJbMVrISu
         6OfZ/DXJZrialBEnHquw/WFqE84CmZvVrurtAO9PauE9OkT2ER1M9pfk3Wrmlxub69wM
         VGM8j7DL6ZdCLrHQ+jgW29I8BIlPwZmfZRIDUiw2/zP3H6OtrcrAY3NKbX1PUhbpAP8o
         O3nJ92LPoNVeVZkSC/ZweF+w5uTlJX1Dj57WMmretSb3Yr/2/rKICla9i/7Wfu0Jn6Qt
         k5vbaZmrrkPz/47gkYHXonhtSh2coiJq0tKbdgV7vAN7jppBmZ39cgfQTE4f5rrl5213
         EfXQ==
X-Gm-Message-State: AOAM532cPcYRg4AaARxlVt25oqKnWy7vCZwzBgNbqGtKmmYnBtwIK6P6
	txQPwFWOoLC6RnWik5GgwJ+E/OpjXtNJ7Ysf
X-Google-Smtp-Source: ABdhPJwMarLKCW6zCDyx+rdB95U5y3SehGvBMfkYKv6TJHd5tJPqliYy21laG2ZaVGuCUNYuWEsNRA==
X-Received: by 2002:a05:600c:3393:b0:394:160a:18aa with SMTP id o19-20020a05600c339300b00394160a18aamr8762137wmp.58.1651824886077;
        Fri, 06 May 2022 01:14:46 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb0e000000b0020c6fa5a797sm3059657wrr.91.2022.05.06.01.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 01:14:45 -0700 (PDT)
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
Subject: [GIT PULL 3/6] ARM: drivers: samsung: for v5.19
Date: Fri,  6 May 2022 10:14:35 +0200
Message-Id: <20220506081438.149192-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
References: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Actually only binding changes.

Best regards,
Krzysztof


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.19

for you to fetch changes up to 5fe580196dd9b7d8eb2a99629055bb4ffa00f262:

  dt-bindings: timer: exynos4210-mct: describe known hardware and its interrupts (2022-04-24 16:53:46 +0200)

----------------------------------------------------------------
Samsung SoC drivers changes for v5.19

Make MCT and USI bindings stricter by describing expected interrupts
per variant and expected child node.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      dt-bindings: soc: samsung: usi: refer to dtschema for SPI
      dt-bindings: timer: exynos4210-mct: describe known hardware and its interrupts

 .../bindings/soc/samsung/exynos-usi.yaml           |  2 +-
 .../bindings/timer/samsung,exynos4210-mct.yaml     | 67 +++++++++++++++++++++-
 2 files changed, 65 insertions(+), 4 deletions(-)
