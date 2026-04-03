Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D88F23D7FB
	for <soc@lists.linux.dev>; Fri,  3 Apr 2026 07:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775199787; cv=none; b=d6NOWTIYcSO8xVjxoH5SfNM+WV55vv9EgqdgtEZ+RjLJTepS0yrJQwSM3WiPyeEQWHsduUVyGBqRMadCemBNsetEngOQNey8spo3gcUgamlQiQeOg6kmyc0ZbwmI8HZofCQAEU1lJ30FkhD4R2rUKdPrfoIGzGxo8tG6Wa8szvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775199787; c=relaxed/simple;
	bh=sDjp8oGfWzm4BKI6BBosvQw91OtlMIXdGLQGjvW3bH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+lFJtKdIwDDAT2NxNz6mAU4UI9tVuLIH1UZdc7ZKq6mKGnVlw9hY7YBzXhmtD0leLX3dv2gPlxOFZBEnQjch3+rKELlzvY/ryZup6RBtaOR8iJryGA7qcdJ2cUlV7jDCuu2SCxekpWpyy2Lj2ynINJXT1ns2/Qc3AepiMnwwK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HOK1qrbS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HOK1qrbS"
Received: by smtp.kernel.org (Postfix)
	id EC242C4CEF7; Fri,  3 Apr 2026 07:03:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 111A3C19424
	for <soc@kernel.org>; Fri,  3 Apr 2026 07:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 111A3C19424
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d23305225so1099992f8f.2
        for <soc@kernel.org>; Fri, 03 Apr 2026 00:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775199783; x=1775804583; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ro+gdRSxkKZsqBhuMAX/TnwJiyqZFyTBN8tQDODJGE=;
        b=HOK1qrbSi9/pcHtEoE9obEPpuU/sN2HgmT6jUqQ7GLrrcea+DsAL2wtVy2/8cjJVma
         9Dvjrjug1NRkw2xQ6HB9fWNO5hUoZ6NIPbbbj+nti70/cko+fFBaxgPbWWFxAIDbd5/Y
         JbfoS7hPtule1M3nFL1OociRN/S/k2YyaBMIlOEq3uvliRnfEEub+9E84C7Ussr8unDO
         eoY3FRi8zcYeg6Gz3mg8RhXA1xgQ+6h3JgQ8mShNa3TGPGZZUtBUi61gSmK70H4g6UMM
         rLgjHvf1+l/RJwCxS+Yew13O+eaeuSbrl6Dix4gTp4KpRzuseJka7RGRysTEuM6g3uiT
         Dm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775199783; x=1775804583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ro+gdRSxkKZsqBhuMAX/TnwJiyqZFyTBN8tQDODJGE=;
        b=B3EWFLkQ15/meHbFZ7swbrFIJpLeMGQnFkphYVsR1aewBctsVqN3mHe+HeWOLXP2uj
         fwA9RAHvaMoXZIINpq3R5e12+yefvp49PvdO6OfGKzvojVjRI1fJyHEko7APtzn0Y3Tx
         J8igB+n0aovNWmhaCboMEg9QBglOGxpHdn/2ag+kdWAqMMlXfdmTokeifJN8dryqBoTo
         upBz/+73whkwkQpDyFq59VEDWhyOTGSHOgUpfpHvAJgIsKLR2JJqpbAK2YyuJ5KPokRA
         HjfZY8cOdV6wId+sWnZdZgD9dr5rCR3YnzagcfPPmRtS9TDFwKiMYd7JIbM+4hOfITOZ
         4Y1w==
X-Gm-Message-State: AOJu0YxHXfs+JqmjWlyFEddAgtkvnfXZv8DVejF0GsRLIdMv+BXg932w
	bvVuIMGjCD2y0STuich667R2uZr0GbrdwRMh+C/22GrAOsQFTR2P3lu8biyoySMIAAQbTEZh67c
	0YEzH
X-Gm-Gg: AeBDievKtnWZTEoYyvfajk7K1Qc4jna9vmcX/iSdMhDA58VyKRcvL5/adCnYGIhBcuT
	15s6XQBK6MvO6GSq+jB0S+5Hn8tO5OIwhRf0WF5KbW1PYZVvNX5BS5RNQrC9cnPn/8JmwBVubQ/
	FbeYVl1W7/R77ife9QanAVWgjpj+j69G3jgbMEFLrT6pe5/Q2nXuLCxAwBbmGyz8CpYiMHT6lTm
	qzGyZGFlL383DKhlrlLwa5kuFJF5BqDVAS+abiBQsQtlo+lOI4ghkyy7Ub5vw6U3HLixY85B0na
	EUCvIbS1BT1nqBeVKS4LfHLIZKjcpJCULsxmSGDxdELaj+QgYq5VCF5UG65z9t4nNtSLwMZsbLe
	tYED8WfYxVM/qAkAOUnBVmKDDVFeHOEM8yONt2mP2vDgVYQeVpMP8DYkZlGITe7IpB6YWaEcWzj
	F/LStm7UPx8R/AUQt1XpW211BNYYVoY4c9S6Ai/3JW53fl5/rVgJ0z
X-Received: by 2002:a05:6000:611:b0:43c:f8a7:3b09 with SMTP id ffacd0b85a97d-43d292c7739mr3320959f8f.23.1775199783531;
        Fri, 03 Apr 2026 00:03:03 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm14118803f8f.21.2026.04.03.00.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:03:00 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 defconfig updates for v7.1
Date: Fri,  3 Apr 2026 10:02:59 +0300
Message-ID: <20260403070259.2552626-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-7.1

for you to fetch changes up to 1f17fce8bf19a48e5e5610c6da8f806eab81878a:

  ARM: configs: at91: sama7: enable LVDS serializer support (2026-02-28 16:04:03 +0200)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v7.1

This update includes:
- LCD controller, LVDS controller, backlight, simple pannel, touchscreen
  configuration flags required by SAMA7D65 SoC

----------------------------------------------------------------
Aubin Constans (1):
      ARM: configs: at91: sama7: enable LVDS serializer support

Romain Sioen (1):
      ARM: configs: at91: sama7: enable config for atmel maxtouch

Ryan Wanner (1):
      ARM: configs: at91: sama7: enable DRM hlcdc support

 arch/arm/configs/sama7_defconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)
