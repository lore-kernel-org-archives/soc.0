Return-Path: <SRS0=Y5GS=6R=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ADAC636D6
	for <soc@archiver.kernel.org>; Tue, 21 Feb 2023 00:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 530DBC4339B; Tue, 21 Feb 2023 00:34:04 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 340C7C433EF
	for <soc@kernel.org>; Tue, 21 Feb 2023 00:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 340C7C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id p1so1214917plg.7
        for <soc@kernel.org>; Mon, 20 Feb 2023 16:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vM4LltyuIgqh4IWG61Za72fqJtQoI3IaGkrf91MSj2g=;
        b=TNb9vn8h5BXqzArQxsQtEpt5KuTtMdMTEr/mjMUrZptbTBPkk7h23Ruvl3qSE0UnQy
         8MShrARiJw7gnYOnml4ZlOBPrmILJgyRy8LgWZInmyynnjPuCtOqZ74DXG+L+6aPgqzj
         TF4I1qk1HqdvG1HCSzeDpvDStrCGNGQ/DJe3lv2406kZRY2PMzjV19bV6kEufuPLQZTu
         GucHcA0nMzXOyXVLkNAo7K/IuyVSv4kzzynyvKhByKYoQHuw0Mfms8U1MZwOLesfjcZ1
         keqmqUvZ3310Izh0iaX4du5N56UtJZlJ2Dkt0oYqcWqP/snoIlw37BXaVqiaMOUPa9Of
         5oPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vM4LltyuIgqh4IWG61Za72fqJtQoI3IaGkrf91MSj2g=;
        b=cjfaqKz2hp0gWqUvJonO2rmL/YePDaOvgMCzh0vFATXo9Wd75WuGSjEDn6bnV5fYiS
         eeY4lAdZevcBhj0MKvSr0mUuu2/1YpPOd6Hrn/Fwz+aBzXCMCzuTyt0nqCmVLJPCAJIH
         kYYLadS+nw4sMlV/FKRJw3CacrWuZU1+lEBzzG7GdJg9gWmdCVj8Veq324/kojANqkLK
         VUotcaL53Lm4wxC3YqOQq9YGi/o712VjaNerbQBapKeAeyrhDg96TSPcmdmBY5+4cM9c
         98EWFbGD46sHwG0YmTMJdP3lbJ1e+GlCjzEOZiXnlU4CCHvIzBln6uEGvdPWs1/s6bcE
         XR1Q==
X-Gm-Message-State: AO0yUKV3pAyoMpgTas8B82drG87nY/lXl7Wo4alrXeejQIrrw2CWAaBQ
	aNmU73G4HAleUs/d9DcRYXhTfQexYA0=
X-Google-Smtp-Source: AK7set8zQKYMwXmnIsgp8qxbxwnccuQnI/NzigWD6Wxb/RMTh1CaTmYPusbB6dvqUro/E1x/L1jPtA==
X-Received: by 2002:a17:902:d488:b0:199:2932:615e with SMTP id c8-20020a170902d48800b001992932615emr5937728plg.18.1676939641017;
        Mon, 20 Feb 2023 16:34:01 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id ij24-20020a170902ab5800b00189fdadef9csm4540294plb.107.2023.02.20.16.33.59
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 16:34:00 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] ARM: dts: aspeed: p10bmc: Update battery node name
Date: Tue, 21 Feb 2023 11:03:52 +1030
Message-Id: <20230221003352.1218797-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eddie James <eajames@linux.ibm.com>

The ADC sensor for the battery needs to be named "iio-hwmon" for
compatibility with user space applications.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Link: https://lore.kernel.org/r/20230202152759.67069-1-eajames@linux.ibm.com
Fixes: bf1914e2cfed ("ARM: dts: aspeed: p10bmc: Fix ADC iio-hwmon battery node name")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Please merge as a fix for 6.3.

 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
index 0f9a4f0a5571..a5be0ee048ec 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -124,7 +124,7 @@ fan1-presence {
 		};
 	};
 
-	iio-hwmon-battery {
+	iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc1 7>;
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 456ca2830a31..c3b0cd61ac85 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -244,7 +244,7 @@ led-pcieslot-power {
 		};
 	};
 
-	iio-hwmon-battery {
+	iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc1 7>;
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index e1b5d44308fe..7162e65b8115 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -220,7 +220,7 @@ event-fan5-presence {
 		};
 	};
 
-	iio-hwmon-battery {
+	iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc1 7>;
 	};
-- 
2.39.1

