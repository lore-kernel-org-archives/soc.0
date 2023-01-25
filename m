Return-Path: <SRS0=cWTr=5W=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19468C54E94
	for <soc@archiver.kernel.org>; Wed, 25 Jan 2023 07:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C14E4C4339E; Wed, 25 Jan 2023 07:58:52 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8FD3AC433D2
	for <soc@kernel.org>; Wed, 25 Jan 2023 07:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8FD3AC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id tz11so45399025ejc.0
        for <soc@kernel.org>; Tue, 24 Jan 2023 23:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SjH36VCeOMEZpzTeh/i/i8Jq/1ehza0Y37Q6ribPPB8=;
        b=l9VJIjTGDqjxRT7ZvVcqn45H8sUJ0Modk7CkqBGKHfcRWoomf3TsanAbzcpKDrjXE1
         BJHOJd5+GnkO+IohnWdYN9V64OW1Zlrj6FvWbWsh+LM/aq46W6ouTQ6Uul/Iet9aKZbb
         fRPyDf+QCnXjG3eUDLcSzA23u/xvPKrOOgz9FU/gYsIIih2l1E1EK/6ZPDOF3QdZxgQz
         RiZXak8wvZPhiwCfppiTnoUF0puirIHO2khoIOblzSvs2BRzROWLAkDcdCADB9WbBB1A
         lZnith80U1r3fbg6k4PgO3V55Y6ukGpChNWqe4OMkKNSbNYDNJxif0AappMm2yGWtXwq
         DMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjH36VCeOMEZpzTeh/i/i8Jq/1ehza0Y37Q6ribPPB8=;
        b=2q6IMw97LxTh5cRhzFPHNGsN+q9389ljFsUmsKTfVOqFTb6oRjNJOXDMDrD+KkUGJJ
         3TDtaEPAT5fkJONHXUkbEv6J3yk11jHSEQ6nTPCS90tE+NyINVeRMWKlUOv4jv/tO+js
         /Pv0uLE6QM7OO/r8bGs05I1NVEYr6b44T5TslklO0XAP1K6GNIGxzKBwM2o/qkfw6k7x
         gprNcPYlZOkqv75ACWWDeUP4WhDr5vDlzQxJsyVYQQaekBeBFIpURncOFyxRS0S2ByQa
         3QbMa3GvOx7yVyGrvGIWHWEJ2eLTCZ54RAnF1uz6+yoSWMESMpuNdx9VgyKrqQRn4olw
         YYVQ==
X-Gm-Message-State: AFqh2kr0h7kIiWdFFBhZAaKe8v4fNIve5rAJjYARFAmmPTQKykKgEUNK
	217eMjzN5phtSIAqaeAmm5+zlw==
X-Google-Smtp-Source: AMrXdXuDdeqz8IA0qOVpr1ri+vbSQP+8NIV5ctFyLFXH8mFA+RYSByS6kuck1+//aOtm8wo78y+kxg==
X-Received: by 2002:a17:906:3487:b0:843:770e:777d with SMTP id g7-20020a170906348700b00843770e777dmr32692207ejb.11.1674633529843;
        Tue, 24 Jan 2023 23:58:49 -0800 (PST)
Received: from localhost.localdomain (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id c9-20020a170906924900b007bd9e683639sm2001690ejx.130.2023.01.24.23.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 23:58:49 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Corentin Labbe <clabbe@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: intel-ixp42x-welltech-epbx100: add ethernet node
Date: Wed, 25 Jan 2023 08:58:38 +0100
Message-Id: <20230125075838.2801020-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Corentin Labbe <clabbe@baylibre.com>

Add ethernet node for the first port of intel-ixp42x-welltech-epbx100.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Link: https://lore.kernel.org/r/20221005105510.3512132-1-clabbe@baylibre.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: please apply this directly on some DTS branch,
we don't have any other IXP4xx DTS changes for v6.3.
---
 .../boot/dts/intel-ixp42x-welltech-epbx100.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts b/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts
index f5846a50e4d4..b444003c10e1 100644
--- a/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts
@@ -76,5 +76,23 @@ partition@fff000 {
 				};
 			};
 		};
+
+		/* LAN port */
+		ethernet@c8009000 {
+			status = "ok";
+			queue-rx = <&qmgr 3>;
+			queue-txready = <&qmgr 20>;
+			phy-mode = "rgmii";
+			phy-handle = <&phy5>;
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				phy5: ethernet-phy@5 {
+					reg = <5>;
+				};
+			};
+		};
 	};
 };
-- 
2.39.0

