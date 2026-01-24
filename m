Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFD61A9F90
	for <soc@lists.linux.dev>; Sat, 24 Jan 2026 09:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769247911; cv=none; b=LRtT6V1RBGV+cfV7npebzOb1fOVtRyL0BDoySXhlvrybZ/WqWrj7alZuGJsaMv8FodLFN68FVEuI2QoA0buJPVYK5u1MN4yPWgeKniJStrWIBq02oCZrWmJYEEdapbvjcOi5Cp3vL7mI2FftjjkyJAI6PzdBj6aiCaIxtmPJLxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769247911; c=relaxed/simple;
	bh=UaI72oHA5A3ZAsdS80tpp9NjJjisc0GhYfueiSctLiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HRretZlbfVE/CyIUBsuT6ryOOaPAYPsAE+1tUFG6Drn9qTpDsOqgWw7PEqucV7ksxDWH81RA+fz0HyRDQ/gYXstFtchkTCmEfo7himtNtWr9mhOC9/qrZga/TVHYz040XnHw9IziQpx7s6SsLAnOtzUQPFgDmkClaYVA5BvRsgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JP0EnJGj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JP0EnJGj"
Received: by smtp.kernel.org (Postfix)
	id A4A5CC19422; Sat, 24 Jan 2026 09:45:10 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 824D6C19424
	for <soc@kernel.org>; Sat, 24 Jan 2026 09:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 824D6C19424
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so21359995e9.0
        for <soc@kernel.org>; Sat, 24 Jan 2026 01:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769247907; x=1769852707; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lYuJM5xxHyayhgUiamwAETL6g/TQjMXIxfgveswC0ic=;
        b=JP0EnJGjESCBhkjj18+TJXxnQBpxTx9rrvS1yTDao9OyN40cXEzv9bLFcB9qohbl6J
         TrJXXFercXSKmBNjcWICPCILln1Ww0K1IlWk8MAQCLXidJ6s2Nzg2uH98cV+sz20ujVD
         pH9I/8A4a+q84vZlAOdRZ+Rng7DohAxn2hsWHxHWgXQU03CBaK1KbYSWA0lI49ZOfLwe
         vLDt5NQ2vixTYUrNOpsCcHY+yAFPDQtrdQzTy1XR8YHL7/uHPwjwzYydchvDAJSX095G
         oYKTwj/v/9v8hwJpID6rWfARB5ARXHTZpxsSpcrx6N/4SoI062tnxmtbZtNnKS/urHg/
         SU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769247907; x=1769852707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYuJM5xxHyayhgUiamwAETL6g/TQjMXIxfgveswC0ic=;
        b=TsnuPw6w+Jwze4yxbmafCq0fgv5iFBBg34kwIQzRDJszeR6UKTUWNYtJ4OXyMa4ckI
         orGT2N5TQfDsUznsEyGGvK2UEIsBAEeuejG/2+unV4EXV6vg/TIYfjcNJ9lRdo7haU/5
         CxVFzK2sdDVPu2htHYq0NviaQHPimblEIlROL0VS6RHUcxxXCHxs7fnJN0L8Gu2JbWhk
         kcJ4TiBS18TfUPXpszt+30YVfOM7cZzQv8cHMb4GI+24Rqzzrk+TluHlqEM+g/PzaGhL
         hJW7OiuXxszCf3oYkm+Cg2YBHemk5xbS0irsmeOjeqyGd9VEXoQm/D3SATOxGPUmTb6T
         ejkw==
X-Gm-Message-State: AOJu0YyCBiT88tcyfOQ0KmvVWpzaMyETzDko79MV+tbdvKndmcfJQVwL
	XIPpLhajzAiFcypnAZxjSmYdxZqMe8pwOf0StQQvLndsx6bsQSa0GZcQkJSp+Nwx6S+6i4KN5Ol
	nUxqB
X-Gm-Gg: AZuq6aJ5b6L6/+gcPh9yKVKDKn5R7799o60tKDSbozI/dnIx0uxIH6gQcACUPVzC6ke
	eMfFiWzu57b0pqOdRX8vvbk+yLFe4rReF4pKZyeAd/zgJcpDP/HjC040i3DsHoPgwxtIQ99Wt0V
	+dHHvOvnBm7Cl8YzlrdpurZ4QKsyt2Szcan+W1ukOeoNvvR5OoCtZDX2AjD0zxtmme6ylVTsYPb
	9jUETwGhlcgsttZxsk+FBHzK5isXo7YtOSPSknoYeBHt+87ISOJ7MHXarbsmjbEGuGwkcrs0w5h
	LgkLUfltVtw3RvGPGqxeI2i7cEW0cLV2clt8m/NMn8YfkLwWrstZXAg543Io/m/UArTczLK2Taf
	yHZZiTZPu5EV6AherSnggbDEiU7RbrWpru8Eydc1nhO7xtqky0ayAX/zJdoj980XC5FXkhCo2xs
	IyYvpOvUx58v7ftXo8HT1X3nVPe45V/Iu+ZOqrE54=
X-Received: by 2002:a05:600c:8b02:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-4804c8e758dmr87743995e9.0.1769247907283;
        Sat, 24 Jan 2026 01:45:07 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d85206fsm116002915e9.6.2026.01.24.01.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 01:45:06 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 SoC updates for v6.20
Date: Sat, 24 Jan 2026 11:45:05 +0200
Message-ID: <20260124094505.2106608-1-claudiu.beznea@tuxon.dev>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.20

for you to fetch changes up to 0b0f7e6539a7507689445f8a0cace17305272bfe:

  ARM: at91: remove unnecessary of_platform_default_populate calls (2026-01-10 17:35:02 +0200)

----------------------------------------------------------------
Microchip AT91 SoC updates for v6.20

This update includes:
- drop the use of of_platform_default_populate() from the
  machine specific code, as it is already handled by the DT core

----------------------------------------------------------------
Rob Herring (Arm) (2):
      ARM: at91: Move PM init functions to .init_late hook
      ARM: at91: remove unnecessary of_platform_default_populate calls

 arch/arm/mach-at91/at91rm9200.c | 12 +-----------
 arch/arm/mach-at91/at91sam9.c   | 12 +-----------
 arch/arm/mach-at91/sam9x60.c    | 12 +-----------
 arch/arm/mach-at91/sam9x7.c     | 12 +-----------
 arch/arm/mach-at91/sama5.c      | 21 +++------------------
 arch/arm/mach-at91/sama7.c      | 11 +----------
 6 files changed, 8 insertions(+), 72 deletions(-)
