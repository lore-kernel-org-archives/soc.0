Return-Path: <SRS0=Cgkb=DJ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A74C001B0
	for <soc@archiver.kernel.org>; Sun, 23 Jul 2023 13:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 280CDC433D9; Sun, 23 Jul 2023 13:19:36 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D0FCC433CA
	for <soc@kernel.org>; Sun, 23 Jul 2023 13:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D0FCC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31297125334so2055127f8f.0
        for <soc@kernel.org>; Sun, 23 Jul 2023 06:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690118372; x=1690723172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxKGN5SUivNz+ligYrmWT0BW3UDY3UHFVrq/Gy6pOrM=;
        b=TeXKvpfxHyL7htn+rjDHaupCyknovawCuk5PA1SA7Ntp1u56kIUN32nOA+OjXR5gTT
         aRObbBarli+wBusROTpJiJ9KCfw7rk/o5+UPpjPW3PpNBO8Pmjc0CrVMmT99JBBXSjaJ
         QJyuxUMo/UZtCdEOMlkeqP/QnyYzAGaNwKAq6f7phiRg77CA6fP8L5DXlLCOCVXW0KbP
         5eLrrY08w6kdUWvnu/wVx9JshN+guajvNrH/NiKYd27lCEhyPjIPmhuqWcUDjBvXr7qW
         VatjF02Ai2Y57EcOEhcToGa96XqRmahPBCc9uxMbHg4sIQnm0w0f9BX0I+kYKbrpBzgk
         Fc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690118372; x=1690723172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxKGN5SUivNz+ligYrmWT0BW3UDY3UHFVrq/Gy6pOrM=;
        b=kK+4l++U8t7RtxVaSbVjPKARLCPejzFBgXHdwYuHs62tGOH7QaC3vDsjKzxR+TggsU
         +YeAbpxCHwf7ivsRojxH/ZEPqmYnIk3g1D+JV9mLnl85Sg70R6hIcdL3vELJP9zA5cZx
         30MYvva5NFBLaPg+ydZnTnAD30ZEaXVaveRlzhesV6LvyNTWRixDqf0EFnNGAXnh8sbT
         vMnEjJTxoSXmbI//VaSPaw4AS79ocPUcZaLcCu/OGLCw/UGYWJKF10b9YEnvVNjq0H4g
         CFCstkpIZcedUhMjm3h92BJi/SD9geGLoHAr9a3pMZxkbHcmAQUEqxZAMIvmTWN21w1g
         afqg==
X-Gm-Message-State: ABy/qLaJnnD/kDBFRSzpHNwPPH1eA6QhKHd94wjk22lXhZg2teRZx5Rp
	TrKr0W0VzKJJx8hXct+mRIBlSg==
X-Google-Smtp-Source: APBJJlG7G2NBT/RCN58YIlYPpGzshVCKmMSd3YJ5rW+vc1J8zD/+ky6sxLp75IuhRiCGEBhUE8JiCw==
X-Received: by 2002:a5d:4eca:0:b0:314:2736:ba3e with SMTP id s10-20020a5d4eca000000b003142736ba3emr9328519wrv.3.1690118372184;
        Sun, 23 Jul 2023 06:19:32 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d49cf000000b003143765e207sm9700257wrs.49.2023.07.23.06.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 06:19:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	arm@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 1/3] MAINTAINERS: soc: reference maintainer profile
Date: Sun, 23 Jul 2023 15:19:22 +0200
Message-Id: <20230723131924.78190-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mention the SoC maintainer profile in P: entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

---

Changes in v3:
1. None

Changes in v2:
1. Add Rb tag.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3dfa40abc885..7624eb231b65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1570,6 +1570,7 @@ M:	Olof Johansson <olof@lixom.net>
 M:	soc@kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+P:	Documentation/process/maintainer-soc.rst
 C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	Documentation/process/maintainer-soc.rst
-- 
2.34.1

