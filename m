Return-Path: <SRS0=1Wdk=VY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DECDC433EF
	for <soc@archiver.kernel.org>; Mon, 16 May 2022 14:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15B46C34119; Mon, 16 May 2022 14:29:07 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34683C385AA
	for <soc@kernel.org>; Mon, 16 May 2022 14:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34683C385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id p26so26092918lfh.10
        for <soc@kernel.org>; Mon, 16 May 2022 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hbGO+3R5KiWWt1oc/t55FwaswQ9eZCb2xwGFZFxYLWU=;
        b=wUuLEKuxKSM1tT5MJPrLyVXZrO5olwK54oVn8ZQXM+jBbvsmzOBLEiEJiJ9Q5QlNl3
         E0O/bkVVJrwdgCJ4anBUpExki14oPrSFkxjDERiOdfdwVnNyftlyay9rsr2UvEDSyN3V
         YlkTCZqYwqZxLs82njHeI5rghF/3s25QToQANJSKuAa5tQGIs4wSTt/dIIeBPrn9f7C6
         V0Kr5JY7k+fBOQ2fKtWQMd7Z2pyBXOzPH5Q+dVvm8GxdWpxJ5t5dJ6SU6TR87taq/Mad
         FM18rkJG3cfI4dTSfjcUVhwsrWYFFgZ8d5L4AIZXEijJD7qNG1jejYfY2fqdR97liuDQ
         Pxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hbGO+3R5KiWWt1oc/t55FwaswQ9eZCb2xwGFZFxYLWU=;
        b=z0KDJNteoLo01qZuaVr0yhVlPPbFjVgBOU7C+JiFyY9dU/N1P/pVqpxa22jfsYVMfI
         7NrUexZkDY7Ou2CSFKheQwUMNsgiLneqaYcEdsCnh+Uoayc/peIx76qpXFczoy/IfBS4
         dy3RArFtiXL5zbUlUVLbgr9gunZIuHc/IPmOaPBuMZ3n/ZCmMcAZ/NlTX0V48eARwS3k
         PcagiyvBKjnhsJs9x3wAD/WVHaZfDOtahyOQx3ZVAuAnj4uhUL9QuxGB24TwNR2b8nyk
         fVBOn7HNh+7e0fBWhKlpyiNrqWoEB/0/Y3jf59uke363XZdjoqiEfRtwN8pNAnTrle+s
         8lzQ==
X-Gm-Message-State: AOAM5319CuKbB+qiPAOa4oWLL+ljifFya/NfH2in1bMbQv7ZKdPap7vi
	NXESSa3BeGknnVDAi9f52y36vg==
X-Google-Smtp-Source: ABdhPJxaSVpn0RPRyZPXd260EZu7yPodbYpg9ATkfHOskHWqeTSHU9RXSfKrC0yNWnO0C7PekgnTyA==
X-Received: by 2002:a05:6512:3a81:b0:44a:616f:f75b with SMTP id q1-20020a0565123a8100b0044a616ff75bmr13157225lfu.2.1652711344125;
        Mon, 16 May 2022 07:29:04 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w21-20020ac254b5000000b0047255d2112asm1321513lfk.89.2022.05.16.07.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 07:29:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL / PATCH v2 0/3] arm/arm64: dts: cleanups for dma-channels
Date: Mon, 16 May 2022 16:28:54 +0200
Message-Id: <20220516142857.6419-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

These three patches were sent on the lists previously, but they did not
get picked up. Can you apply them directly?

Original sets:
 - https://lore.kernel.org/all/20220503065407.52188-1-krzysztof.kozlowski@linaro.org/
 - https://lore.kernel.org/all/20220503065201.51818-6-krzysztof.kozlowski@linaro.org/
 - https://lore.kernel.org/all/CADBw62oQbc4a9HxFFmO0E-bDvVvPnUo=raVOaSXZpLkKsNo-tQ@mail.gmail.com/

Changes since v1
================
1. Keep old properties, so the original patchset (drivers+DTS) is bisectable.
2. Add review tags.

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  ARM: dts: pxa: use new 'dma-channels/requests' properties
  ARM: dts: da850: use new 'dma-channels' property
  arm64: dts: sprd: use new 'dma-channels' property

 arch/arm/boot/dts/da850.dtsi         | 2 ++
 arch/arm/boot/dts/mmp2.dtsi          | 2 ++
 arch/arm/boot/dts/pxa25x.dtsi        | 5 ++++-
 arch/arm/boot/dts/pxa27x.dtsi        | 5 ++++-
 arch/arm/boot/dts/pxa3xx.dtsi        | 5 ++++-
 arch/arm64/boot/dts/sprd/whale2.dtsi | 4 ++++
 6 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.32.0

