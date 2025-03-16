Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889DC1A2547
	for <soc@lists.linux.dev>; Sun, 16 Mar 2025 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742136148; cv=none; b=HQHwPU08Wmz0mh0+qQBBKeYuCbShDwSlLzhzYuaOvSeYWmpF85v5yZw1PSsEYyGco7ABSSwqt45Y0HUwLc0V2G8ucdnVHTpbGd1Zkcwamoc+PQ+3d2RjKpeJTNboS0fAanVg5RoSjX/46LwDCvCrspYNUzDtbBODd+qLYZitKxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742136148; c=relaxed/simple;
	bh=hAwIMSzK0uCAG8yRC35L5MzxIb1ccJ6Q76LufHUuaYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WOY72nCzAzFazaWimzR+rojvm3DWSZv2Yk3mQugi3JsU9aZnZzF+DL6W0XwpjQOSJ/ygb56FFGuYzL2IvMUOt7RpPUA4dZ8Feg4ABcr+o7yHwXTg+jBblPAKXDI4xSNAaDYTRmfybpOp8W4eLCsdTfsXCh3fbBuWkHgqojx6h60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q5bh1IPj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q5bh1IPj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso429114f8f.2
        for <soc@lists.linux.dev>; Sun, 16 Mar 2025 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742136145; x=1742740945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJriuSV/8IJe5ycqkpE6UDdCuNRLNCnL4O9Y8I+CLA4=;
        b=q5bh1IPjdjgU/01WKuG3IIVo1Lq9G/X27j6/TFf7WmvNvx493KfjAw12EsfR2LBk/m
         FUunIc257I2CTzJ7XJ6cCFZ0Vquxqkiy/iwLwPysVSkHRRM8HnWIkcxM6Gy7rWLPtFQc
         56PfksMQD4v49KyHa//qo392IKbiyQEi10sW4dGldFp1ULP1twiFjTNT9aW/P5/whYSR
         UNDQGO/OEG9HYd8m95OAQ3uE15SAFVI4XTZ+kg7q40tHSseWKLHUcG2WM5U2NBgsDiic
         5GAetceXVRrWmCWrbTUA0vcDdh5M4HO8TYKfPrc40C2ZrLzP5VhbDqOtHgf5GUX5D/VW
         WCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742136145; x=1742740945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJriuSV/8IJe5ycqkpE6UDdCuNRLNCnL4O9Y8I+CLA4=;
        b=SXg2DBfKpAVIyTmgJFjAEbb8SSOEIY7inzfa2iKdpVR5L3OqDax9IFgm6k/QLXhIti
         CgFMu220CM9r6SsJ/IhngOMFGDkGn7jJX1Y9+qNz8l/CehL6ZEMmKWq/yhSChJoOrAbZ
         Hla/9WwuEvhIT5aBG1UFk9A58AsA1tQHUp7a9zQ8rXSzM9QPLtq3gatA+h3Nmn+BN67L
         O2EaurAp79HDTRPbVuGIFT0JwvSLrpQdTJ0Ww8EU84K9+8doGQKXR7mt4zMsWJPoMD1P
         w/WjWKC/c0VNwOi4iBdWiUeg23DA3kJ7RdW6Bh75RDRYrUYV27PgBdv1nGWz4CIxFFY/
         VqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgmUZ7xGK67NaErVNH/GalpCYIKF3tN6HOjvPmD6wn5eeHVgrBRoNCsGq3puSKVzUNpYo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNTkHWrV3cQ0FETkJcX6hIYmy9hTHWk/qkrqGWVb3tKKtw1TEn
	RYmJOng6mDBNbcaUftY1Kpv2iiZvP+/3tGQp57MGpPODuiqZTOulpTIcbpa7Ftk=
X-Gm-Gg: ASbGncveNiRQ9fMMTUmP3C+deh3whCTzvVV78AfUoU6lGrNVa8K8DaPpbMlkOFVFiU3
	gfRYyX2Bhi7Bh3hdk75aC41PLENEMLHxF+RV+1ZZTvL8c1Y0Y0XE49JZtQ99ITm2CaXwuqE37Su
	qglyr4yLA/g6TmQasfLGQrleVfECwiRDRtvSvr8wV/GdKyd3oWTpb2tL/q9z8/PzLkI9YG/chdX
	GeJmK7sYD/HKcTAl/ol16sjR30zR/XdVg65lJpifTcA3f4NemHfh7eieQ+6eFRHkYuYUU/zarSh
	mWcyWwWnonyTUkcnmRZ+MYswtoHweJfjWaa3XTJ/27ONjvMSiXcsiwK+uoYnxDcvRjUh
X-Google-Smtp-Source: AGHT+IFN+HWoJ/RvheSs9Qe6ufnnQM/Id6b6C6RXmbLnvuIy+0v8jxxH3K/QTk+P9kPHsJxT6hIFLw==
X-Received: by 2002:a05:600c:4e8e:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-43d1ecca06cmr40418265e9.3.1742136144846;
        Sun, 16 Mar 2025 07:42:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb62d7sm79591825e9.6.2025.03.16.07.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 07:42:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] dts: cleanups for v6.15
Date: Sun, 16 Mar 2025 15:42:20 +0100
Message-ID: <20250316144221.18240-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

One ARM and one Loongson cleanup. I gave half a year for Loongson to explain
the spidev, but no responses were posted, so I just applied the patch:
https://lore.kernel.org/all/20240717-preacher-sandal-2aeffa322b9f@spud/

Best regards,
Krzysztof


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.15

for you to fetch changes up to 854a080f0b73ff966a813ec2dc53891831daa28d:

  loongarch: dts: remove non-existent DAC from 2k1000-ref (2025-02-12 21:48:51 +0100)

----------------------------------------------------------------
Minor improvements inDTS for v6.15

1. ARM Cirrus EP7211: Align GPIO node name to match what bindings
   expect.

2. Loongson 2K1000: Drop incorrect spidev description, by pretending to
   have there something else.  This will have impact on the users of
   DTS, because spidev will stop working, however no counter-proposals
   of fixing this or even explaining this were proposed for half a year
   after the patch was posted.  Therefore drop incorrect hardware
   description, hoping affected users will come if proper one, if needed.

----------------------------------------------------------------
Conor Dooley (1):
      loongarch: dts: remove non-existent DAC from 2k1000-ref

Krzysztof Kozlowski (1):
      ARM: dts: cirrus: ep7211: Align GPIO hog name with bindings

 arch/arm/boot/dts/cirrus/ep7211-edb7211.dts     | 2 +-
 arch/loongarch/boot/dts/loongson-2k1000-ref.dts | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)
