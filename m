Return-Path: <SRS0=/kUF=HW=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866BBC4167B
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 16:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D7E1C433C8; Mon, 11 Dec 2023 16:24:47 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1176CC433B9
	for <soc@kernel.org>; Mon, 11 Dec 2023 16:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1176CC433B9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33330a5617fso4917382f8f.2
        for <soc@kernel.org>; Mon, 11 Dec 2023 08:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311878; x=1702916678; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0Lj2p0v1sl5yq86/3/9+bEkk8+V18FXO5bRu94y79I=;
        b=gGO03I9xqum9YsaEpMsNZ0Q9XDswGHBy9oFQ1mz2aHJmCGnoz4i+FeHfWaCIGkj5hN
         AJBomPqKho7J40QmzIQd7L352fxuMrkhpbas1o05eqP5mX4NaFGzm1aLGKySaNbw24AT
         JZj1kxb8191xRNNmR+2cmfSn2I1UeNosDJzCHyrNzYPYbf6Qw4L0E7l2DBnoP6d+7Jp2
         NKK6918E4t6tvr7MOsIyOiTUAvB+tJqNZnsFYNooAGorZozW8zp+LEqlLHSdp44Vmi1V
         7pIplUWYo6+XKCECCDAbeUuxIDaH0Jbb5rmovXtPoIftwSzdODeCkbLEHx0vLfKOk3+t
         y+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311878; x=1702916678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0Lj2p0v1sl5yq86/3/9+bEkk8+V18FXO5bRu94y79I=;
        b=dyo4xSJ80IYdOSibDLO3E50tva7IZr0uYPrpMJRndOaFEQxXIMqFsj85d4gDUSmzPT
         Atz3ghkXV0FSX7AB+TTiJpphcfnJteoFMabxzrbwZj/6Dn7ZxYq4GrpUoodl1CZHbKqL
         XuvSR2KyyFHisQShTZxLkHQFQBdpoPpGSsfqHKVuoobKNnJWTdOUqluxO94hY4X63f1f
         lcZe2lQ6DhLzzYjkeKTe4BGkVdW+KiCDTDGXc7KsTz5ZHD3GePpNf6kl1Sdj9GXF8uSh
         H44qBuHCGlE6iBYcwHcqqztohcpne9tKHEmoRh137terdR9V9Uh4mrZqzM6TUYGxmgDW
         /amA==
X-Gm-Message-State: AOJu0YzNIxFGwTYPoJlJPfMFYki7p0rBqokRI6r8zyH9rGtTuySSodSE
	HMelSDARNDWEcArZ2cN4DBsIZQ==
X-Google-Smtp-Source: AGHT+IEJ1wyxwuNA3PXmuuz2u4iY6o6+Ee5/vHbf2Ow+1e6WSS6WhSW8nRIGDlzcwK4PBfpljzk9Yw==
X-Received: by 2002:adf:eed2:0:b0:333:295f:1039 with SMTP id a18-20020adfeed2000000b00333295f1039mr2795311wrp.43.1702311878601;
        Mon, 11 Dec 2023 08:24:38 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:38 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v7 16/16] MAINTAINERS: add entry for Google Tensor SoC
Date: Mon, 11 Dec 2023 16:23:31 +0000
Message-ID: <20231211162331.435900-17-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add maintainers entry for the Google tensor SoC based
platforms.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98f7dd0499f1..b731d6b9876a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8990,6 +8990,16 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/firmware/google/
 
+GOOGLE TENSOR SoC SUPPORT
+M:	Peter Griffin <peter.griffin@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	arch/arm64/boot/dts/exynos/google/
+F:	drivers/clk/samsung/clk-gs101.c
+F:	include/dt-bindings/clock/google,clk-gs101.h
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.43.0.472.g3155946c3a-goog

