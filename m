Return-Path: <SRS0=tuuZ=NO=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4E0C27C77
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 08:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B199C4AF4D; Wed, 12 Jun 2024 08:40:56 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84B4DC4AF1A
	for <soc@kernel.org>; Wed, 12 Jun 2024 08:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 84B4DC4AF1A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6ef8e62935so259325866b.3
        for <soc@kernel.org>; Wed, 12 Jun 2024 01:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718181650; x=1718786450; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CBqkwyledWDoKomBjA7EooqDlwqm9RQ4FDDh9XT1SX0=;
        b=Syd7PFsqoh0undpELtPUB7MtLqknT0S6iAhnmjl4tlVyD6dT3JSMWmsptxyms5oKDD
         gj3OiuBMCc7/i0DSsQ2aVviOJFehf6bJQ1DidunwSKqIX/MWTCMhChfZacdKPv1syMjC
         Y11rCy6l9kwweqsRHBNm1r99ajBW8pwxrkWcuz//1c3PSfdMenTvO0p9zkF8iwwGY3U7
         PkUJ/rhuBhDkMtE6Y/FQFIIoSq4mUHH7KVoRUoRz6SF3MchCvsJ2Je/tnEeoOaq3oZEj
         6z0dAR/y72Bfb5UXRkXTPYpzyBKD2Qa++jrLEv8TOLkkvy8wd0pg0zprwQvEOzqJv75m
         5OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718181650; x=1718786450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBqkwyledWDoKomBjA7EooqDlwqm9RQ4FDDh9XT1SX0=;
        b=jKNOCGlOBdVD5aS6ljoqLR/PbZl8a9tZGhdVSSvMarAEX98yncOrc7WfCwmOPoDb4h
         LCEbXCW7OnhHYF/967DPu4gj7xNf5De9pJiqD7L+6M0MfMdAUlAhSKyESi0dfMs+aGbA
         JwyPjmf88jJS/iSNDS4IzW6Htj7r+Jn2II5gx7DtXws5O8vGNOBQTk7CoOteRiRdMD9+
         273GDMjTcDvTYxewkPuxr1HcPwYzx4FP7ghvHwkWOpLtvenoKTdwQriJtf4M3jtWaP0+
         t14G7WXi6K2ZealLaiDYSrUL+swxGyKTPnQra/WziVB/EJ7ix+Ak7IqsslxpZyUNKe/e
         jIOw==
X-Forwarded-Encrypted: i=1; AJvYcCVUv9rxjBKpVwoYXDBpOFbmJdlig2UJapP0VNd8XfuDeKm4L1zgC9JjSZ1YJ0x23GKnxfAulxEHQyctP+K3Mg==
X-Gm-Message-State: AOJu0Ywjg79IgSn99O1IRTuIVnqQ72wyYh23If6fD6HvQeecSzmjWCdp
	+YzWCdpGafLYzzwzsCyzheL8lkCSekH74V74QmYh02YtBqQFF1gKRzCOPdyfBrA=
X-Google-Smtp-Source: AGHT+IH75PTOT0paPjqMnY/iJPs4xleR7i4cuMCQyz5XdUYS9YsW2cY6K59sOro/O50yc1412ToTQA==
X-Received: by 2002:a17:907:86a5:b0:a6f:4c90:7958 with SMTP id a640c23a62f3a-a6f4c907d27mr35442666b.12.1718181649661;
        Wed, 12 Jun 2024 01:40:49 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efbcc252esm604812366b.143.2024.06.12.01.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 01:40:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Antoine Tenart <atenart@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Paul Walmsley <paul@pwsan.com>
Subject: [PATCH v2 1/2] =?UTF-8?q?ti:=20omap:=20MAINTAINERS:=20move=20Beno?= =?UTF-8?q?=C3=AEt=20Cousson=20to=20CREDITS?=
Date: Wed, 12 Jun 2024 10:40:37 +0200
Message-ID: <20240612084038.18519-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Last email from Benoît Cousson was in 2014 [1], so remove him from
maintainers of the TI OMAP platform.  Stale maintainer entries hide
information whether subsystem needs help, has a bus-factor or is even
orphaned.

Benoît Cousson, thank you for TI OMAP contributions and maintenance.

[1] https://lore.kernel.org/all/?q=f%3Abcousson%40baylibre.com

Acked-by: Benoît Cousson <bcousson@baylibre.com>
Cc: Benoît Cousson <bcousson@baylibre.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Paul Walmsley <paul@pwsan.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Arnd, Olof,
Can you take these two directly?

Changes in v2:
1. Just add tag.
---
 CREDITS     | 5 +++++
 MAINTAINERS | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index 8446e60cb78a..2721aa9122bb 100644
--- a/CREDITS
+++ b/CREDITS
@@ -796,6 +796,11 @@ E: luisfcorreia@gmail.com
 D: Ralink rt2x00 WLAN driver
 S: Belas, Portugal
 
+N: Benoît Cousson
+E: bcousson@baylibre.com
+D: TI OMAP Devicetree platforms
+D: TI OMAP HWMOD boards
+
 N: Alan Cox
 W: http://www.linux.org.uk/diary/
 D: Linux Networking (0.99.10->2.0.29)
diff --git a/MAINTAINERS b/MAINTAINERS
index 0ab2fbd8b6e8..0a2c9163933a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16374,7 +16374,6 @@ S:	Maintained
 F:	arch/arm/*omap*/*clock*
 
 OMAP DEVICE TREE SUPPORT
-M:	Benoît Cousson <bcousson@baylibre.com>
 M:	Tony Lindgren <tony@atomide.com>
 L:	linux-omap@vger.kernel.org
 L:	devicetree@vger.kernel.org
@@ -16429,7 +16428,6 @@ S:	Maintained
 F:	arch/arm/mach-omap2/omap_hwmod*data*
 
 OMAP HWMOD SUPPORT
-M:	Benoît Cousson <bcousson@baylibre.com>
 M:	Paul Walmsley <paul@pwsan.com>
 L:	linux-omap@vger.kernel.org
 S:	Maintained
-- 
2.43.0

