Return-Path: <SRS0=HPtB=SU=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00743C433EF
	for <soc@archiver.kernel.org>; Sat,  5 Feb 2022 23:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C55AFC340EF; Sat,  5 Feb 2022 23:55:21 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2751C340E8
	for <soc@kernel.org>; Sat,  5 Feb 2022 23:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2751C340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id q22so14166296ljh.7
        for <soc@kernel.org>; Sat, 05 Feb 2022 15:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5JpO8nSCWJ5pgptNli9YTAFT4dwCDnKUHXT3U/sWX34=;
        b=jeH1FymdtDrFt4JFK2U8rZPl/qhXcuT4lIIWA1/Q8bbL8go6L/+z4LwPC12T9mD7WZ
         Vs2unmWHAxo7ah4tkQFHWOpdZ0+Pqa4KbTOBsb10Zq4kkpsZRpUmXMW9eT/jjPCAGKHa
         Dif+MELfHTijFnd5qqZAkWMqnP3j/u7G7Nv//eCFKbHKhVOS5beoMDUjpPk1cez+Bz3U
         ePPtNUNg2b20GxRRIU4yVlGDs0dM9+I9IccZaTU6E6r+rrH4mfK9SMTStdgmgbsEMYR/
         cpmyHlD20cK3z0Z+jqF9hnMPwmtB9u2KTtQCqbgHkZKNw3BpZeYCfo+XduTKnKQB4rfo
         R1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5JpO8nSCWJ5pgptNli9YTAFT4dwCDnKUHXT3U/sWX34=;
        b=UaIi+uXVz1nO7PPSNCICrFuUA9lKmZS22HkzPjwEdSlyKNB3tOeEIJ5y7AWPfPt4/g
         601Lesv63+79TqGm0cbV4lKey+byp6KEGrnYkSTb1/lvl6+iXhD7WAG1T2C3rR/zOIrM
         Yvm5l3JodaKrWlv28wyQM+dDUz6JvbAPoMyyF7qeno0AHyaw4YHnmBocefdyIvLKRmMH
         pCWYCGaYJlH8A7hHzBljCeLKOfRVxnrWRdFIUg8JDN53c/nO2zfiSiPDv7LagQGzMlZL
         ds7vCBzIB9RY093b0pEUQP9+funAPl8fe7gJbEBma9PQzaCG8GZbZNSoN8FL3XQPiRXH
         wReA==
X-Gm-Message-State: AOAM532QSgBSmxgb2/XZEvs9rv+Fh7cdQtd6kj1ac15g4rRx3TO3yZt3
	EGRVvX6jt9g45pFCEl5aTlNY6A==
X-Google-Smtp-Source: ABdhPJyOsBz2Y4FU0mvX5RK+wfUe32KmfN65duRJAv+4ri3J7IvpqWW/+gG2JqOLCtvIoyPWnzUOgw==
X-Received: by 2002:a05:651c:a12:: with SMTP id k18mr4206115ljq.156.1644105319159;
        Sat, 05 Feb 2022 15:55:19 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m12sm893906lfj.90.2022.02.05.15.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 15:55:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	stable@vger.kernel.org,
	Stefan Hansson <newbyte@disroot.org>
Subject: [PATCH] ARM: dts: Fix boot regression on Skomer
Date: Sun,  6 Feb 2022 00:53:12 +0100
Message-Id: <20220205235312.446730-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The signal routing on the Skomer board was incorrect making
it impossible to mount root from the SD card. Fix this up.

Cc: stable@vger.kernel.org
Cc: Stefan Hansson <newbyte@disroot.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: please apply this directly for fixes.
---
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
index 9d09dffc1aa5..1129b5049805 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
@@ -207,10 +207,6 @@ mmc@80126000 {
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			/* All direction control is used */
-			st,sig-dir-cmd;
-			st,sig-dir-dat0;
-			st,sig-dir-dat2;
-			st,sig-dir-dat31;
 			st,sig-pin-fbclk;
 			full-pwr-cycle;
 			vmmc-supply = <&ab8500_ldo_aux3_reg>;
-- 
2.34.1

