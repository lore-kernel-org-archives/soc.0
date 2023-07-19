Return-Path: <SRS0=Ao5Q=DF=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8287C0015E
	for <soc@archiver.kernel.org>; Wed, 19 Jul 2023 14:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D223C433CB; Wed, 19 Jul 2023 14:33:22 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C02DC433C7
	for <soc@kernel.org>; Wed, 19 Jul 2023 14:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C02DC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51e5e4c6026so9886836a12.0
        for <soc@kernel.org>; Wed, 19 Jul 2023 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689777199; x=1692369199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=me1tA/8BMNe18uM5MYD2lF7qBGxRDWqKn8M9Ck3Z2Ac=;
        b=QVGAL3gwk97MJMgiDHCYJ8wjpSiVzT/mtr7lB1Q5/tvSt/KyR4gsS3WsYQTVagh2dg
         riRAJotPhzkb+aEJMq2ZUEaSL881W1eP+plGKUKWLpwRGT6fj0CLLa5aoSAn41rdyiTB
         kuvBO+Flz2HEQZAt9XYvK3XFuZO5E+oXxanE46xzU1h/nEYWVoYT24X30bYmihoFhf7F
         ql9JkL19h2im+NWFI06TVvE18e+OhCNI3BAXvpbiTh+en0Fx8GOD6Kdi61NXaPoaGFkf
         RQPa4QxYSCpCkwrBdHKofMR3sDxgjK9rMCnHWXcVC0QcQzG3x8uLiIL17TwGQzn8hSdt
         hpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689777199; x=1692369199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=me1tA/8BMNe18uM5MYD2lF7qBGxRDWqKn8M9Ck3Z2Ac=;
        b=kvHCH3ECjjWm3ohXwYfoEFhlMoqjNMRKPqAk+UqC2L7jBQrFOH5z8jPs4P0LUpnfr3
         VWkUWWC7qLUhomfFzM8QX+tbcSf9AA3DbmtnaVKrrNN30ZMZiifBEQrjywvSl/A+dMmD
         ADhprYpi3DA3l/1A7WLU02gVkIMduBzDmCqtmzmgR2Gt3z6pgHjLZH8gwVQM96V3jIeA
         OjCus1Q27W9xF3tg3cwr7Y7989EM4Of2UTXPHUKxCruvX4EgwiIS3g0q6ueUJZ5efaYL
         kzQ4O8Dje1cMPP61Bdo4bsiqYC08v2M5Vq4emfT+PokuPWFzOz/588qVYqrBW5Py3/jo
         c5Ew==
X-Gm-Message-State: ABy/qLbD25v74Xu4PSuW7NIq0dAz5BXQtnpTRL+IbkOtToaWBnG/wEnM
	OhlR26M3CDyzM1K5Aq7DOX3dqw==
X-Google-Smtp-Source: APBJJlHjqimEB9KgibSCvGrF+kWBxeRpB0ykcHOFq2/ua4YG+ANhFtH7/tsnMuNURi7d9m1BNiZeaw==
X-Received: by 2002:a17:906:8603:b0:992:54dc:9cf2 with SMTP id o3-20020a170906860300b0099254dc9cf2mr2040726ejx.62.1689777199268;
        Wed, 19 Jul 2023 07:33:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906374900b009893650453fsm2454597ejc.173.2023.07.19.07.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:33:18 -0700 (PDT)
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
Subject: [PATCH v2 3/3] MAINTAINER: samsung: document dtbs_check requirement for Samsung
Date: Wed, 19 Jul 2023 16:33:09 +0200
Message-Id: <20230719143309.204766-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org>
References: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung ARM/ARM64 SoCs (including legacy S3C64xx and S5PV210) are also
expected not to bring any new dtbs_check warnings.  In fact this have
been already enforced and tested since few release.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. None
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a70c32790427..e7b923d2fd55 100644
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

