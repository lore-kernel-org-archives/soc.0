Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06035378D7F
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775078913; cv=none; b=Epo73kgfejKDprrWTkxLOMCkAF/vMSsygmLih/bixCQaxpODi8kyIvsPJD5flOMSOPayUVH6/o8t19lHcs6pfLItyC2jYZyKqvlbJZ7HjeY6RkLVMGHRybyMl/Gwn8MJmXeOr+kaXpbFfo2zynFOFjHtSwVZDQFIKt2O1uXYc0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775078913; c=relaxed/simple;
	bh=WEsLWV4qR6UWZvDqunL5H7vXZXLI1MjhtyEZ4X3JaQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mATD12Z8xYs1wdtQgYid/HRDoTpMwwVSWYEKZ+pHr/Lh8N2zb7zMyXVxv1lPq03O2rauugEHTaK4FGkRtD7DNL3YAvR39eKo3jx3wwt64J1Ii20x1RSUp4vAF77AJDuYgMqO/e1sQXRhnmO5ZEC4vveOtxdwvcShYo5glW+7OJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M39Vtg+K; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M39Vtg+K"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso87420a91.1
        for <soc@lists.linux.dev>; Wed, 01 Apr 2026 14:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1775078910; x=1775683710; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AYPEpP1b00lX0zsw7xL3leAQo4zY3t6/Feqga7nFICY=;
        b=M39Vtg+KzYbynBe/Wu60kmz7hpm1BtL5U+djqrh47U3YKoh69uj2ct4T2gNCQBokYW
         7Xf/3ExzlLn0dxqDFGTGoVu83pI92lnV/EcXUQ21VQOOYFEGyXv1OAHnjVNLsVAVyRjU
         zojLXYVyi44cgXnugQVCvulldl7imTratRSuaSAHQu7v7FjtQrlhI9s/yAyFNToqoeyX
         IJ6Vt+Jx3R9BLC73nIhplFsyt3O5SFvQnJpLniTRFYTWMfYwMxCKioOYyNTlijVFtqK6
         crmP+2DJtiPMrW9WfNJcMaz0ckWpXfXi6LjSz6hPYiSFTcumvXzx8asq1t6Qe3B2Ab4N
         kWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775078910; x=1775683710;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AYPEpP1b00lX0zsw7xL3leAQo4zY3t6/Feqga7nFICY=;
        b=qVe81V00aMc5dYDpb0zacGnf0NXdvthwzivuHR5Z/YAEa0sMfDlYVn+cHV3p0KTpcL
         jcIE9To/U1QV0sExhyw8vRZqhWX58qM2W7vb6fRGHUAjP87Rys6qp8qjcJMaYIfLxweu
         nOqfEEAbguxmO/JHLxWUbmQhBFQ4qQeutiWx3a9vR1tENcy1KBafvdS20wWyJkaaZTvH
         vwIv43gV9PAMQlAh1JxQBcGWjeU22EEmoNOsuF99Y1PANIHlWL9swO6a2yPXqkGpU+ID
         os7eR4wQ4R6iraXQa5j6N7lLa/cJ0UnBbGGV3NYacQ97GThTW248xhG5q0qO28EMQ1tw
         uDtA==
X-Gm-Message-State: AOJu0YzujbqpmIZOFJJVfC9HsEB93ggLubGPEM06mxTkjiYnOwSWN0Oz
	M5k0yfk6vJODwpdMnGUFUkv6KrPwj1WjGPMo/vDsqwdhkcM7zOShfNJBBnDVkG0D0OYBA88wDQq
	ZCe+RTlU=
X-Gm-Gg: ATEYQzzX/5hMXSObn2acNpmRb4aC7+dxUN0jgUJs/DPP3agVD6jhIQ97+TzNKmyZ48D
	y37486YIuwBbhtHNt211uDn1j8ZFc0nIh+emlNXHNwdH0jBFpXQlfrMM1v84LjqNokJFBp0bdF8
	F+EGPo9xoE43hZb34HAP1iJSMatMlRtKLs2C0qy+aVRVuUjIq7mDyhmMg4hI/StDvxLb8G9KZQL
	85z1M2gUz3fZzdZolEMUj6k9It+7bRlUAUZwNOolwQ7LHwrSx14iP4oIHB/bIC0ID/lhCvSPvdM
	JpPcgiEGlhhV0KS2Bp5tUKL+9guQA2+0DhPuGDr2cL56+CNLackwBC+7BJI5AXDC62gbg3iuUx8
	rhoUHYB0DbUGdvH4n/7AD/RK0U7RSJKwRbbMX43p31CKPLgPLoskwuBdIDMd1kGQuLL5BM3/CzF
	gfjTrFTDPvHSKi2L4OwD0Kejxfc/nUAw==
X-Received: by 2002:a17:90b:3f0b:b0:35d:9f7c:142c with SMTP id 98e67ed59e1d1-35dc7052e98mr4367414a91.26.1775078910328;
        Wed, 01 Apr 2026 14:28:30 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe5e519dsm5918706a91.2.2026.04.01.14.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 14:28:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: soc/omap updates for v7.1
Date: Wed, 01 Apr 2026 14:28:29 -0700
Message-ID: <7hzf3mtloi.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.1/soc-signed

for you to fetch changes up to 9ceb17ccd15ea32f19c9066f5f1b340d8340bd0b:

  ARM: omap2: dead code cleanup in kconfig for ARCH_OMAP4 (2026-03-30 14:21:20 -0700)

----------------------------------------------------------------
ARM: soc/omap updates for v7.1

----------------------------------------------------------------
Aaro Koskinen (1):
      ARM: OMAP1: Fix DEBUG_LL and earlyprintk on OMAP16XX

Julian Braha (1):
      ARM: omap2: dead code cleanup in kconfig for ARCH_OMAP4

Randy Dunlap (1):
      ARM: omap: fix all kernel-doc warnings

Thorsten Blum (1):
      ARM: omap2: Replace scnprintf with strscpy in omap3_cpuinfo

 arch/arm/mach-omap1/clock_data.c           | 4 ++--
 arch/arm/mach-omap2/Kconfig                | 1 -
 arch/arm/mach-omap2/id.c                   | 3 ++-
 include/linux/platform_data/voltage-omap.h | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)
