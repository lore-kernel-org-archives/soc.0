Return-Path: <SRS0=7ELp=DA=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73D4C0015E
	for <soc@archiver.kernel.org>; Fri, 14 Jul 2023 08:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4871C433CB; Fri, 14 Jul 2023 08:47:32 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE830C433CA
	for <soc@kernel.org>; Fri, 14 Jul 2023 08:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EE830C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fba74870abso2884842e87.0
        for <soc@kernel.org>; Fri, 14 Jul 2023 01:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689324449; x=1691916449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R8aePuJNV+aTV/P2+d1zYFy1JBvn+SWePZ58r04GmFw=;
        b=Yv7wNCignVQeQHx68i0XxK3/6GnIxCb5iM+IxeTjplbMgzS5ZtFIEB/aBTEjPcsGQo
         K/mpiJeUBlNHm0kHoZBkiohGUSSm9+Mi5FNldcjIcQ+SQT40x7B4nquXzDbdPBQ2XsK8
         qtlpvESK5DwpFP1JToV9AYRDC1pzj2EjYxTpiAP/XHu4om4/Bj3gDlzec+IDfba3rAf9
         CbRJlFJiSnhiK3K4BfH96M9QQyyC0o7KoBemZildDs7MP1wT6ZoOSuJ/EmNIqxeFWmrE
         JqqZ/T8CUFWgiljdQRkmtema9Scy91H9ikRBceYOsDNjn+eqfm4T+VSrYT6c4xbIfNij
         53Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689324449; x=1691916449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8aePuJNV+aTV/P2+d1zYFy1JBvn+SWePZ58r04GmFw=;
        b=JmGUINPOQtvI36HPGRbe2idYMTLtgX31zAP1ec58qSBav+mM96E9DDUm8NRHX9tFzt
         G5vUJNGVrn3ejdxzvoN7DaNTGQ7QZMDsbHb6jbXX6ZqXyeFl3wmcytq+zTjhqRwfTLP8
         C1fHDwN0qwQ/HcTTJqUDI++sAJ2pTa4KNiIf06hurPtozGpN5Zzc4LCJdoREkpYTCUvr
         4dH9vlCtWV/FOSfjHpuUNH/4emSXYbAH+OiPZdpZVQ8jBQ4CpdyVZCw2IMWGr9Uhy9ok
         F4OUIvhiwKrlogvY3YoxOFfr4Mx3nAvqqp8/KlJ+1Z3vFDh4T1D5nMNlJYLR5rKZXYRi
         5JTA==
X-Gm-Message-State: ABy/qLZkDdEX6OfsSl+Cyau4kQaR3GcG+myzpt5X5IsviO7JSozyT4s8
	D6Y+GRAlEcS1ZrWXlc0ddtogsQ==
X-Google-Smtp-Source: APBJJlFjG7pdcW2yr/b2fsXuHegMrNjuBRaWxyLYGHZw7UwjJRO5qo5VVUqBvzsKR8P2U1WefMFewA==
X-Received: by 2002:a05:6512:33c8:b0:4fb:7666:3bc0 with SMTP id d8-20020a05651233c800b004fb76663bc0mr4290710lfg.47.1689324448797;
        Fri, 14 Jul 2023 01:47:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w24-20020aa7cb58000000b0051e0f8aac74sm5480662edt.8.2023.07.14.01.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 01:47:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Nishanth Menon <nm@ti.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] MAINTAINERS: soc: reference maintainer profile
Date: Fri, 14 Jul 2023 10:47:23 +0200
Message-Id: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mention the SoC maintainer profile in P: entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f646ba70a01b..b61289fa7891 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1558,6 +1558,7 @@ M:	Olof Johansson <olof@lixom.net>
 M:	soc@kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+P:	Documentation/process/maintainer-soc.rst
 C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	Documentation/process/maintainer-soc.rst
-- 
2.34.1

