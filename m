Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF67A2750FD
	for <soc@lists.linux.dev>; Thu, 10 Jul 2025 15:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162643; cv=none; b=ZAzL2C48Ckep7jr2O92WAg8a61V6gKl+zR0extQNImvuLQk9zYIYMiscUZvlO1CzyqpFzP/zSrQ4OkUufQdAXMYTvdBOTDY2HL+TNBPI5gBW/xuIxJgbwevdoI4RCR8DpePyTtAX7eDy3DGxDEX1HjcfHGs5OjvId0ewTEZJ/6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162643; c=relaxed/simple;
	bh=TE3e5FsAUhJEBT92C10WueG0f7MngB2CVy4WNOoUKW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Uqt4WT5jpXawmHoU12fvW2FLtXYfG2s7Jge5XYRQf+S672mY3Pk35AJfvH4RGfZLuk97NI9GAlGJllCbmUlGpi8U3bujDJROA5AqeDACcpj19O+bTkJ71JLUti2M63k3TUnp/LEigYAsjpEPiVCsB4SyVbyUtx/uh0ortQYCjPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eh2XwafX; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eh2XwafX"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-23602481460so12273175ad.0
        for <soc@lists.linux.dev>; Thu, 10 Jul 2025 08:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752162641; x=1752767441; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aYCsUZOP5qNPTOsZnio5Vd12LO4J07mmm0n3y5FcLYM=;
        b=eh2XwafXDRUvhTzKfxDDMw7KFwjwJvKgAv0+iAnDYVwfO8raRqlJCTISHpifRg8djK
         yjS4BDQN5vYwLjX8R3qqzB1R5dA3acKDltj4FwtoYIJz5uPCi+koz6x6gEaU/PO2N6ev
         q9V3L2YhkQ+y4OmAkb18P28XoybDrfkMlMISEyYpdFpMUcU1kFyfLWke1AYDLWlsy4TN
         GfSDr/dub+Pa2syvX5hA99QG+HwB+CSPRigSpAe8zoia78cknsZNRooDt2lDN/YCbzcO
         BijbE0gpQVKsShEdeP9YsWib5tKsxNjTp7ZQA0Vd8wGWjdCJwGVkGA3kU8uK/HDXIj+u
         xT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162641; x=1752767441;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYCsUZOP5qNPTOsZnio5Vd12LO4J07mmm0n3y5FcLYM=;
        b=j7WQ4X+6LaPmJqJxtmnxdR2q4quw4VJXW9c+QJ4qxntgpCFMGIFnJ8ZirEPEaCps+0
         F+sFy+jmDhrWz3Tb7NW+CUWsU79YrSa8HRbZkAiEXOtLVoQtYjmE1RxhfabckfHaPgEV
         OE3TiBQe2mrHYdjm907Yh3Vmtg+Mp7/xarz6aJ+KGj8qGgovEb3gGjt1lGwDsh+20gIs
         Vvxi/Ot9lna/TMRavw6UBX6GPikN4WJyfuixjIoE42v6qAwgl9vGg9Gq+OdOHDyHRpPe
         ZpZ56l1nSoH72mS+mVRA488v3smP4sovFDwIWmJ1IXIR+0pdT123EqbefMocv5vE3clp
         htoQ==
X-Gm-Message-State: AOJu0Yyl/xc7U+0ePqrOe4LyduJBwGJo10llmU80+1A8krfOuHdJdMQz
	SPDN8cUVjUZcTFXmaKhVzPkTI96ug6GqEfrkzeVoUeeyhlT1Esw42mMQQ0h/c5nchcgCw7n087O
	A4THzMJWLTg==
X-Gm-Gg: ASbGncvXp/wFxsn/7kaRGQ8vR0ToP7Hj1unHqKaXJgK/YT3slhg0kvn5mai91t0tLGQ
	agQVWn/3Vflaarf1AvKh7QxzAWyuWJndvvDVn6wZE71aE5PIXR2Fu+E7xMapLUbPaqHGCGqY1jM
	hbMIt4D1V7ZvKcLioLcUOMeOzs54Y9DEtmQ0p6An6L03N15lrRCifkAjffWXah7QLLAL2hdHzPc
	h26cI2qtAmMpBXTSB7c8WhEcDYm7jP/iXfy8l1V4JxzBF3HoUDvH9ZFA+ZdRZ1XNnnQHY15EaTr
	XHAfYAPPgmSCYBzoyR9pKzjU8AwOmiK7BKVFaOjotaF6O6pcvYswOBFIiLmiejat4vCQJoA=
X-Google-Smtp-Source: AGHT+IElU/0L8KxnCYNK56yG6cNhASLXsy7y2GFyTBpCgYpyDu8yUDmzKCFyTB8rlNo1biXYsiwnZw==
X-Received: by 2002:a17:902:ea07:b0:234:a66d:ccf5 with SMTP id d9443c01a7336-23ddb31593emr119964355ad.49.1752162640915;
        Thu, 10 Jul 2025 08:50:40 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4284898sm24954395ad.24.2025.07.10.08.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:50:40 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: OMAP updates for v6.17
Date: Thu, 10 Jul 2025 08:50:40 -0700
Message-ID: <7h34b4xcxb.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.17/soc-signed

for you to fetch changes up to 0711a8dcea2a928a54bfb40b064d6cab4b327edb:

  bus: del unnecessary init var (2025-07-07 14:17:51 -0700)

----------------------------------------------------------------
soc: OMAP updates for v6.17

----------------------------------------------------------------
Kory Maincent (2):
      arm: omap2plus_defconfig: Enable TPS65219 regulator
      arm: multi_v7_defconfig: Enable TPS65219 regulator

Li Jun (1):
      bus: del unnecessary init var

 arch/arm/configs/multi_v7_defconfig  | 3 +++
 arch/arm/configs/omap2plus_defconfig | 3 +++
 drivers/bus/ti-sysc.c                | 3 +--
 3 files changed, 7 insertions(+), 2 deletions(-)

