Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF0E21E0BA
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 22:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271802; cv=none; b=pRL9z6gpJ9Ltz0AhRx8M4NxkFnQaFdiHC2IUtxIprb2Xp7Kq5GrltvJTrHMJPdRkA1zlMBa36yZ8bvw9gYZahMFn2eTUQBwerioROHjQirrVmL40oPpVzu9W1+B1k/5HpHIGwKg3fhc8Rc6snLgNvKKcXbcHDDuGpxn/b2pGoUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271802; c=relaxed/simple;
	bh=Ysff8lfY5O5wvaYZOOIF1evBmJpKFGjjjhLAY7PokHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lLCBB+YX11khqZdfoqojMUFtKYsoFm5HPv8pewvHCUF3rkHB2mgaAiNnz5CzApxZvzzY4dKK5ra8DnjAFoUdWe7I7Ky6qwixghfniCxmhYTcLKF7X5CJl0POW2C2+F6q/zeIvG+gVHF/NqIzgfDs6q0TahB+WyDDr8LYHYfXwwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KagsbaZT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KagsbaZT"
Received: by smtp.kernel.org (Postfix)
	id B031DC4CEF5; Fri, 11 Jul 2025 22:10:00 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE8F3C4CEED;
	Fri, 11 Jul 2025 22:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DE8F3C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so1709786f8f.0;
        Fri, 11 Jul 2025 15:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271798; x=1752876598; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku+08PMO7/vjq2Tw85ozrppxDpvyl6Hgmrcst5Ryypw=;
        b=KagsbaZT2lxa66c1DTRqBygnB9dpxPtFFq65uxp5xmpUJlmPzaqJ5SFh5O+O41L2Ec
         LB0qoA77boFDmebHKcOnVFnwJemUvfk3skF3Z10B6N5AD4HzIa3utWW0HvRypck34RpY
         15pOzR+si7au8tMuQaRfLvbiv4bIeC5KfEi449IyHWFmQUdkCC4h3aUZRviYJCtwkbUO
         IIU29SpvJXL8LLyJ6zh6nt/z/dcUJmKdYXheu/BSF5Ym/4hih8J7c9VArKPhKoBUZmuW
         hCN3mpd7jRcSmfiQBeClJIWZtz4LFLEWO7xJRx0x4osom19SxKW86Emd9Er2R6CHf/qD
         kcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271798; x=1752876598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku+08PMO7/vjq2Tw85ozrppxDpvyl6Hgmrcst5Ryypw=;
        b=AQCDoVbNz+0lFt1FjGfdoY526Jky0CHuvGi8CeZgbrOSefwaMkf+rdSwxDz4vEDmsX
         aqNervOvqOlVuBtkccUzW5nPH91H2nOaLkpf7YIOFOyDgdTwkgSd0V9hznR8X2+x4H7C
         dgUB+Q2VxB39jXrtUYzY0seY8de1tQlsiyNTW90kVpAF2Cy8aAplcy+U0sKczS9PGmTk
         r4s3A4FckN4QwlxkVsbiCrv0gwB0zTj7i1UhCk4Y9bWrtacV9a6Q+wmmp6lGcmyOd/FS
         P3VzzQdJb46XzktH+e0jKOm6+Lvy6LAAlBMSQiXBU+tGsY225T9j5lumgpvt2YVQ0jmq
         CXHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTISwFZEBNxgxa9JOT3rxro1MAIr09lYvUSRKXcAQv58rQH1BuigNVOmjtiUwIjZ0anfo=@kernel.org
X-Gm-Message-State: AOJu0YwFznPeUg7hxNgpz7vI5LJxGbiBTTZm81oEbGhWPQ3b4GFWgylD
	uwY8Nc/CMmLUkxl/DU0CRytrUn+2QMhvWDUwf60rF7z5aNjZwd0SK4zj3c3lCw==
X-Gm-Gg: ASbGnctu1D3eMFbq5gWFZuyAoT/QT1hfdHpEpEHrLG67AJhYT34T5poUjx3rD15pp4k
	vHSD3bFm/2E8dBPAdKn6FbpZIhJCjhfrzyysfqr2n+yirBWoN4Mq4KyxJ1aOisFa52VipU3RDhw
	wzuZZ5kTCs4KZX7zWh7w3xM+A6NCSL/Rs0gz+KZhblx2cP6va4IKzVOxNH7hcMvsYvEN2FQyMb9
	UvluZWCuBkEgG/yUnXRABXFc4XGgQfGuumjsYlw2GtRDZiV9mfpoV4bzJSojQpMySDnO3yuJ6Lt
	i/+XxtNxqyE9+X8HKioE3Nwf+kRPsiHEZixPvlVUj7DWg8gwuHI4a2CR7OhY4g1krenjGTwQZe8
	E33ThsI2Dw+pKuq+17Ju93U783uA6jD6IWQUr4/mke440+Atgl4ZNDOIUhg83mqH9xoyVwqY78e
	PkmCG/Spw+DYVorA==
X-Google-Smtp-Source: AGHT+IHipbiPzHtHT9lAlbF3iUj7vcZpxHsOY228G614wvileARaAiUqQeN6JuMPlvDPl0+rJezgFQ==
X-Received: by 2002:a05:6000:2706:b0:3a4:d9d3:b7cc with SMTP id ffacd0b85a97d-3b5e7f3d0c4mr5790806f8f.28.1752271797634;
        Fri, 11 Jul 2025 15:09:57 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d5f5sm5633411f8f.56.2025.07.11.15.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/8] ARM: tegra: Device tree changes for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:39 +0200
Message-ID: <20250711220943.2389322-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm-dt

for you to fetch changes up to 3c2c00572fc3e0b128f75c7ce9c3f70ca457cc3b:

  ARM: tegra: chagall: Add embedded controller node (2025-07-11 17:11:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.17-rc1

Add support for two Tegra30 ASUS devices and enable the embedded
controller on Pegatron Chagall.

----------------------------------------------------------------
Svyatoslav Ryhel (3):
      ARM: tegra: Add device-tree for ASUS VivoTab RT TF600T
      ARM: tegra: Add device-tree for Asus Portable AiO P1801-T
      ARM: tegra: chagall: Add embedded controller node

 arch/arm/boot/dts/nvidia/Makefile                  |    2 +
 arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts  | 2087 ++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts   | 2500 ++++++++++++++++++++
 .../boot/dts/nvidia/tegra30-pegatron-chagall.dts   |   16 +
 4 files changed, 4605 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
