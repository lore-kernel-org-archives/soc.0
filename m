Return-Path: <SRS0=YtWc=P7=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971D5CA101E
	for <soc@archiver.kernel.org>; Sun,  1 Sep 2024 13:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A42AC4CECB; Sun,  1 Sep 2024 13:31:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E666BC4CEC3
	for <soc@kernel.org>; Sun,  1 Sep 2024 13:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E666BC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42c5347b2f7so11723815e9.0
        for <soc@kernel.org>; Sun, 01 Sep 2024 06:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725197473; x=1725802273; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KKML1XFuJYNcX45a0fKAIAbJPLB+HlmRG3LbnZuY+RA=;
        b=XSyM5w16SXzYVygI7X/lOj6fYk9pVknHfAWlxs2tHVjiUSREu0f8ROCQ2FRvsAyhwF
         AIFNPg91FJtnldIdeuGARqygpElc+0JylGDUZBvzrECZPQWCsaQ19832uLmieoMbBoBn
         Vuqx+2h+U4T6V/PcLSQ0ErzCHm6Ucr2LPEJReV+A19dKmKwrJHslkBIdgGKXRsB2JaPv
         Z3lcJal209QkklOxLTFnNyLKeSBRJN2bUv8PfD8V2zDFogUT3LyCASvSvMULmx3Ie9gO
         hA1Jf/RNjz6zNJ+62IFiYJFzlkCqNg7PhDbbmxBPieAnyJzL7k2n14XYu42cGAF62HIi
         JFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725197473; x=1725802273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKML1XFuJYNcX45a0fKAIAbJPLB+HlmRG3LbnZuY+RA=;
        b=etWh8w1q+ExyNw8lAVQbZlcZrklPhnQVAmbavvGOsl3GQHeF3sgzhwrHmTJheLpmSO
         0HXB6O7CLpRvXjr1BniwbOWz0IxUrmZa9QXmeOI3y3y46vSxB46l0LsfYBwuwFc1SzJj
         yur+tqno5vy1Jzpt0CLFMvvTO0+CAZ3/bIKGgrQXeLSiNhXcqMgvQkn1E7GZj/BY/SV0
         OHR9Ye/Ujfds28xlvvkpxUm39YeYyR/AlxnvBWg49gsET2r0601oNB3mqGUitBTUJlVu
         T63f41luSJSiNpsVdaoOlPZPKI1CNFKI1CJncQ2xVWNRZrzcH9ae9psR8Nffv7ygklDv
         joAg==
X-Forwarded-Encrypted: i=1; AJvYcCUc9MplwrmJ9xjZctIV+yd7FAYV6xUqIP/Hdxs7FB96budxqmjK86G1TTZVORPdSSn4f70=@kernel.org
X-Gm-Message-State: AOJu0Yy5TnsE6LNm2rs/mhBT/FCp0o7mgPrAaIg5JNDSBm9od4QrSIqM
	WZt8Wu+YQaytQirq5oaCgv7OALZckgZcmj7CbH948zmj8V8Xs2cDVYKGZCqXlcc=
X-Google-Smtp-Source: AGHT+IG2vTdU+RLkDxN4q9SvEFwCPlK7gL5FYCgB7ZN/CIB84x+oBRayvnVV0So2O1Qu33CsttPZcg==
X-Received: by 2002:a05:600c:474c:b0:426:6e95:78d6 with SMTP id 5b1f17b1804b1-42bb01aa1fdmr92382395e9.4.1725197472834;
        Sun, 01 Sep 2024 06:31:12 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbef54b23sm69120515e9.44.2024.09.01.06.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 06:31:12 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 defconfig updates for v6.12
Date: Sun,  1 Sep 2024 16:31:08 +0300
Message-Id: <20240901133110.2038675-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.12

for you to fetch changes up to cffa8c8026e17e21c4b55ab2f83e9891fd0c1ee2:

  ARM: configs: at91: enable config flags for sam9x7 SoC family (2024-08-07 19:18:15 +0300)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v6.12

It contains:
- SAM9X7 SoC defconfig flag enablement

----------------------------------------------------------------
Varshini Rajendran (1):
      ARM: configs: at91: enable config flags for sam9x7 SoC family

 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)
