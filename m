Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1350A13D8B1
	for <soc@lists.linux.dev>; Wed, 13 Nov 2024 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731522057; cv=none; b=MzhY8FKLWlX5qCr52rUqcaYk0t7cwBprgV9Mb0kdcynFYLKUFTwCCycr5CEudy99lgbgv4Y2Hoe6QweZJQBkBrv3PZva3UvFongm9OVqE0SWgRcrc5VEg0m3QDXBKV1pMlPFT6Z0E5wwX1FTgGrOPRmqbwBfS89xirm7hX8zw3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731522057; c=relaxed/simple;
	bh=eEVkX6fCXc7n89biTk1zzBqTlnNSwWDh+9CpMyLTivQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VR/9GSZ6UQy6I5h4936OlLJqt94JghFEZSttX/rKQ4cHec5coIBAZfXULvH4qqiviU/baFo53+PrHF3CXK1xZLlWyd8Qayyn4n0LKj7GXVSbL0T/MuinlP4ERvsucc+fcODGlmzitHts4KopM4a7lv+d2aEgIHoECoVHzeIEycU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fauFTZez; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fauFTZez"
Received: by smtp.kernel.org (Postfix)
	id A17B3C4CED5; Wed, 13 Nov 2024 18:20:56 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD017C4CEC3
	for <soc@kernel.org>; Wed, 13 Nov 2024 18:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD017C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-382026ba43eso2222539f8f.1
        for <soc@kernel.org>; Wed, 13 Nov 2024 10:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731522053; x=1732126853; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6A+bblUKXABoYUlPZI2iItdxBnj1Infm3G3V+PNL0sQ=;
        b=fauFTZeznHmYK7pO2TnqCi6SDZ3Es65QGisYhMfaI4dcvdIbAIi3yi1uK1LBju6jKe
         gzz45URywATj2tczi+6BCrcnNmOi6NeEeTGaEHcicuEMg/1/yphhY2IDqarDiYVjsvJo
         nKN21jGMfrLX+heTMhOnBDbijfCI93aGk4WaAlR/ClgutIFdl/Wa//2riVcCojgq7iut
         ucxuxIgdkx5/UFjMvBHJ4+MIcKl5S/KlybO4QN9f/3xkoWbnBbMTm1n7XNNR73seKxpk
         UnKP+oCF4WoycctaZd+bWE4pWfe8dWDn42nGt8yGd0sYxt1C6jZ9+mBpR8/DaBND3Uhs
         9fWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731522053; x=1732126853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6A+bblUKXABoYUlPZI2iItdxBnj1Infm3G3V+PNL0sQ=;
        b=Zn02FnM6dn60tpXewr45mWxdLFE+NGO6jE+JJkNatH0nL2zbycuIPV/3gqdjWLliiO
         yo6JoOPQz28TQEA23NTQdgkT+2yrkNC/veCYPQFq91CswDRwsGjBlrivzhK1Pk49b9D3
         Za77sSZcgnNFLZZI0w10Cu1dBDVYqpx+V1kPt6om5qmeWFxD691bLWwuOMoZITMA8vV+
         AkKn3dI8hL+Xkvp24gGVrxjulEyXwHNZms1pYireTb7mpY/eHV2Kg/55Zn1jlX37Eh/H
         fhvq8fbNUGy1I42wRbNq45zqsvhW/cO6nwuwpQYZFaqrttQmrvnPmayIknFHEoLW7tfC
         zNXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGEruhG7UNwOw1RLRkn31yRKJ2za/6UsFqCO2ixk3gOt+UPneAMJ0wxj7/YjeUC4gcOo4=@kernel.org
X-Gm-Message-State: AOJu0YzPt/Bcw9RX2IYaVqLClsSoLQ8IY8Iz1jH95K12Lqf3BPOqxxFG
	Y3RAvu4TnL6pMDVZ0y96I4YekZEe59LTCr+z9POSzOnodhgrb13IJiF6PPa4TY8=
X-Google-Smtp-Source: AGHT+IGY0nTu58anzCETD2GP4NDW4eKQUgghMT0sphjAndnGpHA51jBOS76Y4AKg75KizUZDCZp7og==
X-Received: by 2002:a05:6000:4619:b0:374:c8cc:1bb1 with SMTP id ffacd0b85a97d-3820833aba7mr5844551f8f.39.1731522052781;
        Wed, 13 Nov 2024 10:20:52 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9978c6sm19009502f8f.50.2024.11.13.10.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 10:20:52 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev
Subject: [RESEND GIT PULL] Microchip AT91 defconfig updates for v6.13
Date: Wed, 13 Nov 2024 20:20:48 +0200
Message-Id: <20241113182050.2176500-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.13

for you to fetch changes up to 07891907687e3cc7e0659fdf5fbdc816c97ddb80:

  ARM: configs: at91: enable PAC1934 driver as module (2024-10-13 18:52:47 +0300)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v6.13

It contains:
- enable PAC1934 power monitor driver for the Microchip AT91 defconfigs

----------------------------------------------------------------
Mihai Sain (1):
      ARM: configs: at91: enable PAC1934 driver as module

 arch/arm/configs/at91_dt_defconfig | 1 +
 arch/arm/configs/sama5_defconfig   | 1 +
 arch/arm/configs/sama7_defconfig   | 1 +
 3 files changed, 3 insertions(+)
