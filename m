Return-Path: <SRS0=/KAC=J7=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703B9C43460
	for <soc@archiver.kernel.org>; Tue,  4 May 2021 19:35:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3A815611AB; Tue,  4 May 2021 19:35:07 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C3D8613CD
	for <soc@kernel.org>; Tue,  4 May 2021 19:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C3D8613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id z6so10648373wrm.4
        for <soc@kernel.org>; Tue, 04 May 2021 12:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LfKwDo8azWN0Gbc7/pIjGO8T4exsCKBX4Y2Y1QqmWes=;
        b=05o7ReA7rAKHmkd0VqX0nWa4Encxngxhb46pr43kojkbSgBP0EaRdX+231RbnE7zwV
         s4y9y+xh22lXXGpOg43Ruv9YkwYPEsdd2QJWzd2BjIAk4Bz1rvU6vJG0Rzi5t4iHdgZl
         oP1ALyF3di75NUU8tOAsdX0b8BlG+etuwHXMISnRlIUis5NNI5YPGRp3YYHM+vq2tMoa
         q8mWAOCNZ737fuPJY73g+re2opNW22UsDdP341L8hgxvL3UQWhWIpjwQp6HzQcvjPOr6
         0TBNYVrTFUr4iXI80KvYUV4zDsnoZ4ba5hOHpo+PABpIVXlej1HeH/SxnF8u7zxP1Qyh
         V8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LfKwDo8azWN0Gbc7/pIjGO8T4exsCKBX4Y2Y1QqmWes=;
        b=B1+OcgWl9NvFpKju12dlBtBlZVKjMbF/y1SZLMeoaohMkkPnrXgF1bae8DqX96FV3h
         j/8t/34PZ52mxVOJSCpI+7femOGqnVWnYHwslzxUB4e7YIi57+JMvTu4ExdFCpQh5Z4j
         C3J4rqMyUGRbU+sWSwEI/06XjS+Q+RCIb7f6nnzjHE0gu2qKYn4ZbRjwArkGDqS/g80n
         G17Xd8aeFqD8RG6Yy1tZ0zlJS8oIX3XqrtyRlVSoxzDnrkorrjmSqpBpXxB1siC49cST
         U4I3m0c9vHJkmwhgZxlC1SBXs0D851S4cj3lphTPfXCl6l8M0wBa8ewcuU3NXczvmEu7
         DibQ==
X-Gm-Message-State: AOAM532urKF1PGg3crGG2Gb9QpQBDo9JkLjYXpzH1kLhJyX/UsiaiIF1
	I6IKuKfcplC4xkuH4KKcvFLfmA==
X-Google-Smtp-Source: ABdhPJxWg+HSorQvF2RrlLM+c8v0lSWRGO+IpTTDPUTnfP8IIx/z6CvDhSGW889Qo1o4XqTfgq0yNA==
X-Received: by 2002:adf:ef90:: with SMTP id d16mr34040195wro.359.1620156904727;
        Tue, 04 May 2021 12:35:04 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id x8sm17072136wru.70.2021.05.04.12.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 12:35:04 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	kaloz@openwrt.org,
	khalasa@piap.pl,
	linusw@kernel.org,
	linux@armlinux.org.uk,
	olof@lixom.net,
	robh+dt@kernel.org,
	soc@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 1/5] ARM: ixp4xx_defconfig: add CONFIG_SERIAL_OF_PLATFORM
Date: Tue,  4 May 2021 19:34:53 +0000
Message-Id: <20210504193457.4008384-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504193457.4008384-1-clabbe@baylibre.com>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My ixp42x-welltech-epbx100 does not print anything on console without
CONFIG_SERIAL_OF_PLATFORM.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/configs/ixp4xx_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/ixp4xx_defconfig b/arch/arm/configs/ixp4xx_defconfig
index 0d6edeb27659..e3bcf2bed25c 100644
--- a/arch/arm/configs/ixp4xx_defconfig
+++ b/arch/arm/configs/ixp4xx_defconfig
@@ -152,6 +152,7 @@ CONFIG_INPUT_IXP4XX_BEEPER=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=2
+CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_SENSORS_W83781D=y
-- 
2.26.3

