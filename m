Return-Path: <SRS0=Cgkb=DJ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DECC001DF
	for <soc@archiver.kernel.org>; Sun, 23 Jul 2023 13:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD8F6C4163D; Sun, 23 Jul 2023 13:19:41 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B949C433AD
	for <soc@kernel.org>; Sun, 23 Jul 2023 13:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B949C433AD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fbd33a57ddso26768345e9.1
        for <soc@kernel.org>; Sun, 23 Jul 2023 06:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690118377; x=1690723177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cq9s2MRmoeFpX577eLT/PXRHWoFvAvb+qfQGOwk/Af8=;
        b=W0lU3lshIhNR/8v9wa76sGNoC3/gt0Z0TcGHF/M2q51rgSHr0Fel0v6nJ3tqEJDjJt
         J6EU4FkyqOCOwTRmyMYTz8EFGcbEQAmOid+D85GXPZkMn+GqIFI6u31mQEvS3ia6gYkE
         VRyL00WcwDUTtKXOhdn47xSXqaam9KqD0/SNTMhvqGP6qTkrm/niqeQgBh5NHOeJFWWC
         R24IFPBAtM7OdWhPP5WKGZGI/PIgu0OUPXB2QiEjCf7D7vMYntFvHE6VBKxbGgkvgufQ
         m+U80+wXzPThWbrDYlJhlo8hRfhDDMpCGD7AZlN11oAQnn5eRu0ks4C81zzmR5cBBdKq
         ywmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690118377; x=1690723177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cq9s2MRmoeFpX577eLT/PXRHWoFvAvb+qfQGOwk/Af8=;
        b=BSO0vEIq787zbeMvnWCEm1NAkQc40x+PKgK1L8CqNTLL8H45ys5fzqEpW+ANTQo/AC
         gWdOd/Tq3D2zfK1Ze4TaCCoEf8JwgDJa/KCgZT1J1BkvcN0jsMqn7kGm7jT/tOJn13kD
         Pyzk9xPzVguyHYYsKflIGuYC/T0X+6wzXjgZ/Vdf9u6lwek25SZJztI70XtKulTw1fDs
         5oWCwvd2BUGhJOOt+MOp7VnXFve9ioOiTSGUkQqKdglct2zKEoVRihqiPkKNzisV7VTf
         tTMkPJ6PiHsEFKrSOEBb1Lw67aJo+YTlgfB9NtmSHYhSiWD1MQrEuLljmMxpKxnCbzr4
         UQHA==
X-Gm-Message-State: ABy/qLZRhYz+6kh8/EmiOfqsIHjoZcIz+QIrrNwzRt09BW4/ltw9XKug
	neezMBklT+LCp3rO7lGWJhbWbg==
X-Google-Smtp-Source: APBJJlEF3DVK7Nm+ZYwiYQ2FdzbEw4bJ8lmL4Nhtpd0CxQPE5O2W9Bh4hUdzsrZ66YAwaJvSWSixFA==
X-Received: by 2002:adf:fe12:0:b0:317:54d9:eb48 with SMTP id n18-20020adffe12000000b0031754d9eb48mr1484877wrr.11.1690118376994;
        Sun, 23 Jul 2023 06:19:36 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d49cf000000b003143765e207sm9700257wrs.49.2023.07.23.06.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 06:19:36 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/3] MAINTAINER: samsung: document dtbs_check requirement for Samsung
Date: Sun, 23 Jul 2023 15:19:24 +0200
Message-Id: <20230723131924.78190-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230723131924.78190-1-krzysztof.kozlowski@linaro.org>
References: <20230723131924.78190-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung ARM/ARM64 SoCs (including legacy S3C64xx and S5PV210) are also
expected not to bring any new dtbs_check warnings.  In fact this have
been already enforced and tested since few release.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. None

Changes in v2:
1. None
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9fe3870300f2..4b299e39111d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2646,6 +2646,7 @@ R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+P:	Documentation/process/maintainer-soc-clean-dts.rst
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
 B:	mailto:linux-samsung-soc@vger.kernel.org
 C:	irc://irc.libera.chat/linux-exynos
-- 
2.34.1

