Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C26C7619A
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26527C4339C; Sat, 15 Apr 2023 10:43:30 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E056C4339B
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E056C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id gc14so6743086ejc.5
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555407; x=1684147407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2p4W5eau8bFWAzOfsvO6/XIL8xZyE8Y7G5G/91OHq0=;
        b=XSqvT0MjSDdLTrS54l9ymoLk0dcAi+uusPHgm963TQ8wCFPSVMSeE1ZFT5wOxDlg5T
         KzeQ3q30t3Y9XN6PVBlq9WJICKGIDYBdlFruiisSKJP5PfpUx68xKyBj8yWyIZnpId8P
         gVNolNHrl0D0nNByF1+1+TT+E/LJ+yhV7hmJf+m5LdtBKshrsr5IMPcz2i2QSFDTNJ2/
         SlUJsGf/MUsg2LWtRPWfnc9rKY5b4QszIT14GBCrS45t+uljNM3nU1G27X/cZ3X7qeKl
         criRn8R2npvBXWn34nDI+taICL7B4ZQl8pJiHEI5G2ZlHcbojOBnvhHSbXcGdKO7M95J
         WNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555407; x=1684147407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2p4W5eau8bFWAzOfsvO6/XIL8xZyE8Y7G5G/91OHq0=;
        b=IfOD7yxji+sH4FceCcAdZqKSAPba7oY+mGZhilqzJLkaaggRZEdVDVfol0jIQ+US14
         Ludp1l19/TrMdD7BCdXEMmH8vP9W3tH8KAo1fkmQnosDCQ9Jx6hgnkoekanAyvF2eUcL
         Sm80hXqa9jupqGDKe8dtye5QKBSWEllS9HF4sZFpSBU/9tPE7yJZbyfbmgKp4nPOnTjs
         a1CgtGAxrM++nI0tc1apvn35hQTKPYxpDA2C5mp4E466IVcYJbIt/5PAor4J2zGdBm5y
         9h2F4jaFqHAmLcIt1PESxP0F3/DU2k3eIQZFlGzx71tGOn70Hd0ZI+UfHb1v1qNRg+EB
         hr4w==
X-Gm-Message-State: AAQBX9cd/6v2kxt//fPaAXZuaHG8lyyDDLgQJo9R4UI6ofuUWD2+wW6l
	76ZS+quo3ARxYZLjWZ+w3T/nJQ==
X-Google-Smtp-Source: AKy350YHGBB50ymOjH++0GwAiv3zGH2q9RmNoc2RqYpIg9DKEFNk7nmLsO7o3uBbLq3E/8fWE0lc8w==
X-Received: by 2002:a17:906:fc2:b0:94a:6874:713d with SMTP id c2-20020a1709060fc200b0094a6874713dmr1476846ejk.56.1681555407506;
        Sat, 15 Apr 2023 03:43:27 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/15] w1: matrox: use inline over __inline__
Date: Sat, 15 Apr 2023 12:42:59 +0200
Message-Id: <20230415104304.104134-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to inline as preferred by coding style:

  WARNING: plain inline is preferred over __inline__

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/masters/matrox_w1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/w1/masters/matrox_w1.c b/drivers/w1/masters/matrox_w1.c
index 662108b1d806..fb38d92b2f43 100644
--- a/drivers/w1/masters/matrox_w1.c
+++ b/drivers/w1/masters/matrox_w1.c
@@ -63,7 +63,7 @@ struct matrox_device {
  *
  * Port mapping.
  */
-static __inline__ u8 matrox_w1_read_reg(struct matrox_device *dev, u8 reg)
+static inline u8 matrox_w1_read_reg(struct matrox_device *dev, u8 reg)
 {
 	u8 ret;
 
@@ -74,7 +74,7 @@ static __inline__ u8 matrox_w1_read_reg(struct matrox_device *dev, u8 reg)
 	return ret;
 }
 
-static __inline__ void matrox_w1_write_reg(struct matrox_device *dev, u8 reg, u8 val)
+static inline void matrox_w1_write_reg(struct matrox_device *dev, u8 reg, u8 val)
 {
 	writeb(reg, dev->port_index);
 	writeb(val, dev->port_data);
-- 
2.34.1

