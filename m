Return-Path: <SRS0=scka=OD=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DB8C2BD09
	for <soc@archiver.kernel.org>; Wed,  3 Jul 2024 13:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D478C4AF07; Wed,  3 Jul 2024 13:23:46 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB75DC32781
	for <soc@kernel.org>; Wed,  3 Jul 2024 13:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB75DC32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso3441154a12.2
        for <soc@kernel.org>; Wed, 03 Jul 2024 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720013023; x=1720617823; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hxef9BnQ5f2cy/OEfZu+bfwq/Hh9paD+wGNf8s/kacA=;
        b=F2Cd7iN4qkJxd4e5LHkT5pWcmU2RMUvB7y5z4KgoIEVS3SlF4VymjFYUBpbUyTknvl
         stFvo/ZabLxrHbsaK4kYdBwIAjkN+2G3XSYKSx/aTZvrb9HC2ud1NfZyE0ub+NNwtDQm
         Sw71U1p9q6DTqq30E/0ADOQTt3cl3eEvkZZv/GNzmwI7BfetrS+1xciqKlfLUFitZgbG
         RQr/oWyF6SVfrWl7Mb/pk74v7Z8+ksutFpa5ewnM/tKomutTOia/toq81mYl0BRhpAaj
         GJa3zhPls0iD6qPCEZHRTW+a+fsBlM/+w4iUbWiXG3C3bSxR6QTrDI0L486yhfuFi+8A
         +SXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720013023; x=1720617823;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hxef9BnQ5f2cy/OEfZu+bfwq/Hh9paD+wGNf8s/kacA=;
        b=FpWsShBkf8c5N5aQ3KFGvZ9m13GIOXboD1Pwf3f+d19YOze1FoPlUisfSvA0gIyzgU
         RcKIg8djU5LSE8wXdIUYft95PcyGy5XTLxHvAA2YE9QsN3ENxt5Le/GvLmoICgWkkPnm
         k6X06WHWcGVTgviTDV6vGvM8vuCNP+sPi+3iCUTr4rwSSKyOXWTIBaVpQt7lRNsOfyvt
         qoZ4Rj1B6UtdtZ59wD8la7QXbY7o8gZu/LoJqAmmUet1wpkMYFs2y88b/3iwjrQDzcBo
         0Vfvin97uNhPwwaiIbbEebSepeAC8alNePKvxO/I2CzuHo1fq3A0LX1zjUt9P43ine4z
         +dfw==
X-Gm-Message-State: AOJu0Yxms+w/dj1HNycPtwF6mgqMoSilC9tKSZR/5xnopIuYX+NDJTZX
	zZZcWI0q8Dfn8jLuMAQsMFtX03Avf4k8+IKmBWwUFjd5Qz80q5O0r6BVmO5T257N6AIKXJwQeyI
	4
X-Google-Smtp-Source: AGHT+IEyx6dHlVdH95bBU0MKLdnL46YbGogP64zmYmFFphxFubdMjQq/Vgwz0X0A+nvMirYh/E26zA==
X-Received: by 2002:a05:6402:1e8b:b0:57d:4d7:4c06 with SMTP id 4fb4d7f45d1cf-5879f59a573mr9164790a12.13.1720013023100;
        Wed, 03 Jul 2024 06:23:43 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324fff8sm7231979a12.39.2024.07.03.06.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 06:23:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 03 Jul 2024 15:23:41 +0200
Subject: [PATCH] ARM: dts: ixp4xx: nslu2: beeper uses PWM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-ixp4xx-dts-v1-1-e5149da36f6e@linaro.org>
X-B4-Tracking: v=1; b=H4sIANxQhWYC/23MSw7CIBSF4a00dyyGi9iqI/dhOuDV9iYGGmgIp
 mHvYscO/5Ocb4fkIrkEj26H6DIlCr4Fnjowi/KzY2Rbg+BC8l4MjMoqS2F2S6y36m65ntAoCe2
 wRjdRObDX2HqhtIX4OeyMv/Uvk5EhM1Zrh3jlt+HyfJNXMZxDnGGstX4BV2SWfKUAAAA=
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

The beeper in the NSLU2 is just a GPIO connected to a
speaker, so we need to use PWM on the GPIO to get any kind
of sound out.

Tested with some random beeps by enabling INPUT_EVDEV and
running beep.c with e.g. beep 400 for a 400 Hz tone.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/20240627-ixp4xx-dts-v1-1-cdbbe1150873@linaro.org
---
---
SoC maintainers: please apply this patch directly for
DTS changes.
---
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-nslu2.dts | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-nslu2.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-nslu2.dts
index 2eec5f63d399..2f7c34c649ea 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-nslu2.dts
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-nslu2.dts
@@ -90,11 +90,18 @@ gpio-poweroff {
 		timeout-ms = <5000>;
 	};
 
-	gpio-beeper {
-		compatible = "gpio-beeper";
+	gpio_pwm: pwm {
+		#pwm-cells = <3>;
+		compatible = "pwm-gpio";
 		gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
 	};
 
+	beeper {
+		compatible = "pwm-beeper";
+		pwms = <&gpio_pwm 0 1 0>;
+		beeper-hz = <1000>;
+	};
+
 	soc {
 		bus@c4000000 {
 			/* The first 16MB region at CS0 on the expansion bus */

---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240627-ixp4xx-dts-6da9d0bf1ca4

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

