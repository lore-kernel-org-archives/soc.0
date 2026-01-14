Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F7C395DAB
	for <soc@lists.linux.dev>; Wed, 14 Jan 2026 10:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768387333; cv=none; b=kG3tKeaDZah/SNYgH9l+AhJubK1+9jp2GZIM5EWpdauG/C/WTYaDfnPYRRp/exCqn6F90vRowlfcoBepvYJUq+JesidU2lsdsolJ02naIuOEg0OrJ+ImHWfl52D4cceNTPIzles7ptU3H9uBPI2VBBIirnKJNOQnf6l3YWyYJNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768387333; c=relaxed/simple;
	bh=VT7DOvjdxtPOj2gJoKppKfNP7ldOsZKbj2A0ZLIynJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C7mHM0lHWNZ58eTSXELD0c03Je6K8Nzw9Z7Os/SxYAn+kWLv5wThFCYPviQTktpUgBTg8BbNvV6EkUFfr0flW4Gq3tMTogIERGFkX6ARhXGH9atO7voGAlAA+Udf/ttGuujrCpOiSUMdByL+yLhNDFjVcZlRcT96aFY0+83tozo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Yo0iqkMC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Yo0iqkMC"
Received: by smtp.kernel.org (Postfix)
	id 4EA45C19422; Wed, 14 Jan 2026 10:42:13 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 278B8C16AAE
	for <soc@kernel.org>; Wed, 14 Jan 2026 10:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 278B8C16AAE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432d2670932so4162514f8f.2
        for <soc@kernel.org>; Wed, 14 Jan 2026 02:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768387330; x=1768992130; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6OCciJM5VLSPu4v6eWfBVWzdmWj5wTJ4JKpa9kVLeY=;
        b=Yo0iqkMCZqwziY2sUW/On3u+IQqZxRtZjLgJX7xO4zE4kGhIpxjA70rQHrjkYEbIH4
         cplvHzCU1D0B6a/hxKTWh4XlU3La51uITgKVh+OvyZi5vGvxbVOpziz93vquBWZv9L8Y
         RZZY8skLIA9zmXK0gDRGqYn4QVIuh7dbeo/D6YSl7U1Dd0jtD4IRTnuYs4Qk/JdBt3LH
         1eCG/52ncerTe1MhiIbGZjyG0DnDCoh+0blBAttr3wj4TGi0SSwxLqqBOWEHtK5ATCch
         j9OulqW9rfOJX3fuEyyPDLcrCGzUVcqT4gkcaH3SnsBaSH8JGCFNyGRMcMLVReffmTEM
         h7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387330; x=1768992130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6OCciJM5VLSPu4v6eWfBVWzdmWj5wTJ4JKpa9kVLeY=;
        b=uObBt75n/W4ENuYX6mH4isGEqWO7UmNCgbJ1f4+ttZHTPajMsmHxusPbPuMz7Na2Sx
         i5TMpPH0AbtF/rhVsI+5MYbN5TArFTNgB/fs0X9y6C/Dg+3p+cmBgmRVLi1TqM7LzadE
         nx7Ze3E3OZZjDyUGrfQHuWb4duj2hEQAKU/B7k33FiCc6dGwmLm+wPtEu1ZJJ2kuwNFM
         oFwe5DL7r8v7/y1AQwP+ddf7ifzYZAo+Pg7cuFWnKwxPBNgFy8E5VfP1WrHttruJPFAj
         daPwzLuEudJpbS0JQH6WKS0K6SLzdRDobz5t6xDlN6ntzruhIj1G4THmT1oo2PCzmo2L
         NXRA==
X-Gm-Message-State: AOJu0YwvVUKZhFZnjZdEY+fZ+aNnhdPnSOxB6V1vJ/uW28pAdY5xMA1a
	0Jvc/21WnChjbyuaK5w68EwCWWzaViIKkGjipDa4y8SRnoUeQbHpTnA47xY21uwkrHOJfPq+THf
	StXWL
X-Gm-Gg: AY/fxX6alCIclB5JaIKHjR1NWrudr1KAV6G1namoDEpQ3VdyI9RNy3Tx00hKni0dbN3
	+0QaCdYaoqMp+UyEMj0RKovIV2nwnARP/a97RoRh9qgCgprBzpvqoqeJ8EBrvkEELSdZ8oBrFJC
	AH4dyuYzsKLkYLU3ODVHkiNJWa+mGGZmgdMQf019w/LL9tyS7fN52BqmKZARJ+TLckbLQJrZtNk
	3HlroEtqWv+bf3xhe3d+QpNIVf40IlW27m+nWyzxOW6MtRZKcJPeadkJyWe0fY6oTpaJ/THVHoD
	04amxk511mpmMLAlcXVplVHFoy7N90vlzAByd1DhleokxpJMNgE2x6B9+eWvn+klUK4UmkKjz9i
	zCjlJTI+KcLMI1y26aWCdET9+cRH81NF0JmuxlzZ4Yla1ueDnCmxZN+qxIh20uoT240egStPE46
	dFK/9aXDQsguzFsKG1wI2sCA0qK+h9g2DMPEBL0DU=
X-Received: by 2002:a05:6000:2386:b0:432:84ef:7160 with SMTP id ffacd0b85a97d-4342d389602mr2053586f8f.12.1768387329838;
        Wed, 14 Jan 2026 02:42:09 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e6784sm50818905f8f.19.2026.01.14.02.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:42:09 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 fixes for v6.19
Date: Wed, 14 Jan 2026 12:42:07 +0200
Message-ID: <20260114104207.2033174-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.19

for you to fetch changes up to 94ad504e67cd3be94fa1b2fed0cb87da0d8f9396:

  ARM: dts: microchip: sama7d65: fix size-cells property for i2c3 (2026-01-08 09:31:55 +0200)

----------------------------------------------------------------
Microchip AT91 fixes for v6.19

This update includes:
- fix access to the PHYs on the Microchip LAN966X PCB8290 board
- fix the ranges DT property for flexcom9 on the Microchip SAMA7D65 SoC
- fix the #size-cells DT property for i2c3 on the Microchip SAMA7D65 SoC

----------------------------------------------------------------
Hari Prasath Gujulan Elango (1):
      ARM: dts: microchip: sama7d65: fix the ranges property for flx9

Horatiu Vultur (1):
      ARM: dts: microchip: lan966x: Fix the access to the PHYs for pcb8290

Nicolas Ferre (1):
      ARM: dts: microchip: sama7d65: fix size-cells property for i2c3

 arch/arm/boot/dts/microchip/lan966x-pcb8290.dts | 1 +
 arch/arm/boot/dts/microchip/sama7d65.dtsi       | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)
