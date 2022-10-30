Return-Path: <SRS0=8O1E=27=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AD8C38A02
	for <soc@archiver.kernel.org>; Sun, 30 Oct 2022 21:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 690C4C433B5; Sun, 30 Oct 2022 21:09:07 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BAC1C433C1
	for <soc@kernel.org>; Sun, 30 Oct 2022 21:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1BAC1C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id u11so14675334ljk.6
        for <soc@kernel.org>; Sun, 30 Oct 2022 14:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4rhNzxOecpQ1JpgzYBAF8DJtdEFpcPQfpYXBW0TUud8=;
        b=LgBUP2Q12DY9UYAAaKG1x8wM2iUaJduH6i0IwF2pU14M6Z45fwG0142mFGi/cjXXm3
         nRkMZ3gPiBQ0IOEjMJgKl330lCPbZqlfhZc/2Y//TiPp+MEtLqHZAomtYsuYFxPOsJgI
         gzrYQc5TKFZ27/faUTxqBDzL60H+75BBPIQ8MgttpHBvHWVqTr0qzduBZVwToGGzXhoI
         gr00I70bdkLBAZz+/JwA9Wo7UTraJ8Mv6h3BdJQUa1+xRMuY7r+ECB+4xtJ987Y/c3vO
         +tKI2LKvEZvt41Gk3pLl1FRXd2LOfEtjOXgsByJnbZhr2/br8y5SWmNg4R7dVtDeI/DX
         yfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rhNzxOecpQ1JpgzYBAF8DJtdEFpcPQfpYXBW0TUud8=;
        b=eupRgATB2rN07+dKB63FqpOWKrxxa6JdbYJvjn1dni2FcJzblvmAlMBG9NToq1AAlB
         E2e8npUvcaIzG/ETXFSBhiv6Rb5ZIJeaxoWqlfeZ87jduxKiRBq4ieRdYepA0nyMcdsj
         OlNbefNUfGtoRc54hlg7KPRm36/80ro9xB/UHzycozlvbUNor0jkHx5vQEbFGUNQcfPI
         gTb6aXL47wKnvjBgRyL0GqQkmuVSyl882enEaqSr82WLoGIZ6OQmIXXucBhYqH9mhMxQ
         r34zc4AxQZW3madbY5pCmQeWHYlD//y3J2c3K7qO/hA/BXPK+EmrK6ORsTiSz4WjS7jC
         zMng==
X-Gm-Message-State: ACrzQf3NIxmSPMsdbEtXPEWtSvPgmIYcAGcxgECuWDtAuSnpsm461elv
	W7jw8N+KKst3p/mYIjxRSzslmg==
X-Google-Smtp-Source: AMsMyM4jVS49zl1ShsALyG3LdRyib0/eGBhzLCFKG3CYDFb18NQtCzPW/JSZs7Tfo4HdIzmr8X7FLw==
X-Received: by 2002:a05:651c:491:b0:277:5279:142 with SMTP id s17-20020a05651c049100b0027752790142mr1226446ljc.507.1667164144038;
        Sun, 30 Oct 2022 14:09:04 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id l10-20020a056512110a00b00492aefd73a5sm952480lfg.132.2022.10.30.14.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 14:09:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org
Subject: [PATCH] ARM: dts: ux500: Add trips to battery thermal zones
Date: Sun, 30 Oct 2022 22:08:54 +0100
Message-Id: <20221030210854.346662-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent changes to the thermal framework has made the trip
points (trips) for thermal zones compulsory, which made
the Ux500 DTS files break validation and also stopped
probing because of similar changes to the code.

Fix this by adding an "outer bounding box": battery thermal
zones should not get warmer than 70 degress, then we will
shut down.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org
Fixes: 8c596324232d ("dt-bindings: thermal: Fix missing required property")
Fixes: 3fd6d6e2b4e8 ("thermal/of: Rework the thermal device tree initialization")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this patch directly for fixes.
---
 arch/arm/boot/dts/ste-href.dtsi                    | 8 ++++++++
 arch/arm/boot/dts/ste-snowball.dts                 | 8 ++++++++
 arch/arm/boot/dts/ste-ux500-samsung-codina-tmo.dts | 8 ++++++++
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts     | 8 ++++++++
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts     | 8 ++++++++
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts     | 8 ++++++++
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts     | 8 ++++++++
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts       | 8 ++++++++
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts     | 8 ++++++++
 9 files changed, 72 insertions(+)

diff --git a/arch/arm/boot/dts/ste-href.dtsi b/arch/arm/boot/dts/ste-href.dtsi
index fbaa0ce46427..8f1bb78fc1e4 100644
--- a/arch/arm/boot/dts/ste-href.dtsi
+++ b/arch/arm/boot/dts/ste-href.dtsi
@@ -24,6 +24,14 @@ battery-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&bat_therm>;
+
+			trips {
+				battery-crit-hi {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ste-snowball.dts b/arch/arm/boot/dts/ste-snowball.dts
index 1c9094f24893..e2f0cdacba7d 100644
--- a/arch/arm/boot/dts/ste-snowball.dts
+++ b/arch/arm/boot/dts/ste-snowball.dts
@@ -28,6 +28,14 @@ battery-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&bat_therm>;
+
+			trips {
+				battery-crit-hi {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-codina-tmo.dts b/arch/arm/boot/dts/ste-ux500-samsung-codina-tmo.dts
index d6940e0afa86..27a3ab7e25e1 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-codina-tmo.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-codina-tmo.dts
@@ -44,6 +44,14 @@ battery-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&bat_therm>;
+
+			trips {
+				battery-crit-hi {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/ste-ux500-samsung-codina.dts
index 5f41256d7f4b..b88f0c07873d 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-codina.dts
@@ -57,6 +57,14 @@ battery-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&bat_therm>;
+
+			trips {
+				battery-crit-hi {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
index 806da3fc33cd..7231bc745200 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
@@ -30,6 +30,14 @@ battery-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&bat_therm>;
+
+			trips {
+				battery-crit-hi {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
index b0dce91aff4b..9604695edf53 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
@@ -35,6 +35,14 @@ battery-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&bat_therm>;
+
+			trips {
+				battery-crit-hi {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
index ed5c79c3d04b..69387e8754a9 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
@@ -30,6 +30,14 @@ battery-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&bat_therm>;
+
+			trips {
+				battery-crit-hi {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/ste-ux500-samsung-kyle.dts
index c57676faf181..167846df3104 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-kyle.dts
@@ -34,6 +34,14 @@ battery-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&bat_therm>;
+
+			trips {
+				battery-crit-hi {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
index 81b341a5ae45..93e5f5ed888d 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
@@ -30,6 +30,14 @@ battery-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&bat_therm>;
+
+			trips {
+				battery-crit-hi {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 	};
 
-- 
2.37.3

