Return-Path: <SRS0=F7Uv=N7=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2282C27C4F
	for <soc@archiver.kernel.org>; Sat, 29 Jun 2024 17:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 696F9C4AF07; Sat, 29 Jun 2024 17:36:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B5BDC2BBFC
	for <soc@kernel.org>; Sat, 29 Jun 2024 17:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1B5BDC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42565cdf99cso15801885e9.3
        for <soc@kernel.org>; Sat, 29 Jun 2024 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719682596; x=1720287396; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cRZLqheC76+KtGADt5dC8ZBCfaAYtac5FzEMNMifjW4=;
        b=ZUnUxb8aho1m/n/f66IEqEA2agMptk/pOTOjrHirLys+hP8gWHWcehyjWtLcKWfy/T
         yOyVVbX9Ag6pxyP0snz45mNvtrfpsDEsx98sqNIXUhxzILJMxZP6lvYyHE8SP0UXyoMX
         BVwEHnR0OXeFlzk7+uN9ebcU3UBhYeEERcr7heodD5ZfEmbOrfVjzM4iHZefUB+42iap
         UGGzwRE5QfllpAo+xDFglUHI9cL808QbAL/Lvo8h6rAZVFglqUM57h6o9axkPjSmR2/k
         vV+CKkAl/e6lI0TuDMd7uuMm0j37q5kvaoGkd5MCb5yLJXWt5DsWD6GRxy7cRQXuex2f
         93Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719682596; x=1720287396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRZLqheC76+KtGADt5dC8ZBCfaAYtac5FzEMNMifjW4=;
        b=frrnHK4Oaq1OsGvor0O4Vu9scH19KcCH/7qFr+kfR6gc1xsDW3D85yCbMxfFmC1H4H
         ype/c2WwECh8QghzRXr3TQzKqV8VjrHfiCTzRmdcz9Oe+Bh0ToLSzk3n7K5KQNv6zDUe
         zJnzzCkKSVyoC+tTqptvM8CrQaDs7CjWQm16E/0GBB9zD3o/hhw5y2Yh9d60wzlQk8VE
         sX1kO6wRAmGSHCKj2FaQmi15+Q47Ic02/tQDJalhhndfYqB8Eqzgcr8Jwya/V107W9D8
         swPRI9BmVgTdG2CE+fywOV8D8C9/7Xy4Xw3W5kykaGIGxj7S0YrlLCIqcwi+/cFuMG2q
         FDoA==
X-Forwarded-Encrypted: i=1; AJvYcCVcADcY2N1sGlxEpb7EK2yyfumdjuoMSufVPVLNaYN3i3oBxpyMQk1935m9TPii22BXfPy6IV9lXpa+SWC+Og==
X-Gm-Message-State: AOJu0YzhklLhmw25kINh71dAqMsJLu7mwhCRbQoo2zCOxt+VH8zFWg/v
	+AMqufyGoDTcE6yFSAGWDicrnY5ld4W4QwN5iEPgfvbB43DdmbwWy1Q8kboFv9E=
X-Google-Smtp-Source: AGHT+IH+UrYnL8ldVpgeAn5Rt6NgCYC9txnHk/w6D80pOj7QI7GH+wizU/cpt5DLAes4Ra1eXlaB/w==
X-Received: by 2002:a05:600c:4a07:b0:421:29cd:5c95 with SMTP id 5b1f17b1804b1-4257a00674amr13009135e9.10.1719682596224;
        Sat, 29 Jun 2024 10:36:36 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b061095sm80024755e9.23.2024.06.29.10.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 10:36:35 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 defconfig updates for v6.11
Date: Sat, 29 Jun 2024 20:36:34 +0300
Message-Id: <20240629173634.664081-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.11

for you to fetch changes up to f919a823b15303f167655eb69ad7b58fb4d0b92a:

  ARM: configs: at91: Enable LVDS serializer support (2024-06-09 15:52:37 +0300)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v6.11

It contains:
- Enable LVDS serializer support on at91_dt_defconfig

----------------------------------------------------------------
Dharma Balasubiramani (1):
      ARM: configs: at91: Enable LVDS serializer support

 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)
