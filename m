Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF621D619F
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 22:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271790; cv=none; b=N9J5Ut+KJh7WLDK4nc05xyNd7/hqQ280g0hcwlew5SWysDX/V1WiNs1SLPBddMXMI+svCDcxwz8U1FbgU1Kf0Qk9aaUVZnK8pvrtwDzdbnnLlpYOf/r5bjJ1UxR3rGFJDjp0KHKOf3FoZiFu9b0nvLVou0u/hETtNLPKmDTwMnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271790; c=relaxed/simple;
	bh=OF2fvSBQt8Kwt2cLY42rrO9+nYIxWQ7baxFlnrzghvs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fgQStcRd96c0RNqmwmvmIpY2kf2frPIrSVkkEU3yzZaStGQmrrOeNVfNgvPM+3JwjaMu+4fwELsWTbGXurWrpNFHM1+knDjYI8YsTXNszg6q+0fJr4qefxyyn8XBlVOq69eUPtKXPgYkdMJPxQVS6gsXT4Ae3AeXH6hejD1KzjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQTlF1uO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQTlF1uO"
Received: by smtp.kernel.org (Postfix)
	id 1FB62C4CEF4; Fri, 11 Jul 2025 22:09:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36980C4CEED;
	Fri, 11 Jul 2025 22:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36980C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-454f426b3e5so5384085e9.0;
        Fri, 11 Jul 2025 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271787; x=1752876587; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2XRjRf3KPKq6plJUx5qROmCq+MxLh+MWsTiiu/eEjI8=;
        b=ZQTlF1uOYsOHfbaeY1AbEtxSFkF8EZD13YbAsIJDjQkHvNob4Eh8TQk9Y8te/RGndK
         JlYRWH4+cGvcNa9JJj7Ar2ljjwT1B3ZZJ8Bd1Iq7cywOxdPf3Uutfk+2mVKUEd1oer6s
         +Dw1UqnTtRy2HfE7szJsPhQxLFmiDdyak/KS9qHl9b+c4cydM8PNrbuVjW936vJn11Um
         QuXnJW7ZGSryBP3CwBpBt7KzfTeSDyUafS5q/8+ER5Wj0xSNprhsqNaLe4xYNWYcVhLo
         mc4tls88nFPyfzEOFHmrJ14YOQwARg5QD6RLP7wALMhV5ISBsK+oBTKbCE40QMpuCrJz
         7CgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271787; x=1752876587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XRjRf3KPKq6plJUx5qROmCq+MxLh+MWsTiiu/eEjI8=;
        b=KTrlT/Hg9C6rFvWvUO/jk04Eg54lEiferl+ZIOEIlCF7HhXP2mR8we7TWr+3cfqfq4
         1H3GR0zOzdrPIVfYWGRi7K9bMVAB/Jwc4DM2ytX8OhoGheFa3EPz8Akn+r8Uf28Fqp0g
         svTNOexKet25MDDPVYPIkBuACZJJ8hEVpFn3c5rgPXsa0VkJac9XZogZeLWTCzcAMY00
         70DFQA16qacsGv4WBkoCJ5vfIPBHz2dsoWtE5kZLw9Qj3Hd0uqvoKSyjY4jZpJGJzmi2
         wlmag+C9F+ofjxU1hYX50aScTrWZQUkyhcYC3vQO0E9BWTMZR1ISU3xVwWUH3bGFQeIE
         ZvIw==
X-Forwarded-Encrypted: i=1; AJvYcCXUO4iZMAGjQIhj1Pz5NpMyS/0nlM3Gvc5kR+awXsGZqNstypbuc0SnVV+SqxvTRU0lvKw=@kernel.org
X-Gm-Message-State: AOJu0Yz/cT2YgZqWStzFMzZriL/EJCmDQq4lIy6B8DHNHPbr62JBE9T+
	49wnn/oZIiWG03dHSXnMa9IL1/5uqYXwOpfOHulyY8IyvbJWSQdbk2+Ab6umsg==
X-Gm-Gg: ASbGncuMna7M8bVzUPQ0IkxFHljSE5gWD3BAsz95vR7Tkum1BZziEyyT4TGHIMIyVBn
	jn4DIJMXZQsQ9sehJ3Vy9ru8tJomvgc+P0h9L5GKVMhYSteRYy0p7m0sox2cZo/cmna3UsCE7Po
	6hGYBHSXsAMdYCVp/FL5m5v0x0iqoQLkqbxbOTP/TIh++KrOHUQ9uhNRGt93rbJczMlOzsg+oju
	oLHsQg6Hnz78V1uQak1HJZfFEx7cxd5cPR923JBXZWxqTkvIczEddWqQDxvN0+At4DYg2KnKFH1
	6u6vUkHGVuB4Y+hK9DDwoyGHSk6tw0Tp2DkKMaQs1LTK0ZnJds8/VOn9HmEM8gDCds+Na0HglPT
	f0V4EfJxwHfkMZdd7H4Dz/hC5FUV3pWvabx0s/9y7kKZtWM3QLIbQpSh2vFg3qeN6Qsx7k32X5U
	52pIYKZk4Gj9OEt1ZVaBIGZq//
X-Google-Smtp-Source: AGHT+IHrGSJEVHvFUI6eRcGDZsY//Wte+nfUWJkxTasa3dS16xTpTNIVm+Sxvs8R3stSO6Lru3p9+Q==
X-Received: by 2002:a05:600c:8483:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-455bd87a4a2mr37140335e9.4.1752271786729;
        Fri, 11 Jul 2025 15:09:46 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd439051sm59230325e9.8.2025.07.11.15.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:45 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/8] soc/tegra: Updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:34 +0200
Message-ID: <20250711220943.2389322-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-soc

for you to fetch changes up to 84daa158bb5e72ec279ab168892df86a25d3c459:

  soc/tegra: cbb: Add support for CBB fabrics in Tegra254 (2025-07-09 14:29:19 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Updates for v6.17-rc1

The bulk of this is the addition of Tegra264 support for various low-
level components. This also adds fabric descriptors for the new Tegra254
and Tegra264 chips.

----------------------------------------------------------------
Sumit Gupta (7):
      soc/tegra: cbb: Clear ERR_FORCE register with ERR_STATUS
      soc/tegra: cbb: Change master/slave to initiator/target
      soc/tegra: cbb: Make error interrupt enable and status per SoC
      soc/tegra: cbb: Improve handling for per SoC fabric data
      soc/tegra: cbb: Support HW lookup to get timed out target address
      soc/tegra: cbb: Add support for CBB fabrics in Tegra264
      soc/tegra: cbb: Add support for CBB fabrics in Tegra254

Thierry Reding (3):
      soc/tegra: Enable support for Tegra264
      soc/tegra: pmc: Add Tegra264 support
      soc/tegra: Add Tegra264 APBMISC compatible string

 drivers/soc/tegra/Kconfig              |   8 +
 drivers/soc/tegra/cbb/tegra194-cbb.c   |  34 +-
 drivers/soc/tegra/cbb/tegra234-cbb.c   | 758 +++++++++++++++++++++++++--------
 drivers/soc/tegra/fuse/tegra-apbmisc.c |   1 +
 drivers/soc/tegra/pmc.c                | 121 ++++++
 5 files changed, 732 insertions(+), 190 deletions(-)
