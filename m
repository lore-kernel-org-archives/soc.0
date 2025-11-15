Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01691FC0E2
	for <soc@lists.linux.dev>; Sat, 15 Nov 2025 09:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197261; cv=none; b=o0zfWhEF/3Ul+CK0f6eUn2tWMuxu6qV4w3Pj0t3GOkpAyo+Rqsfi4U5W/7iTUYi0enKMAE0elgtHCw4flbHi5DRqANUtmSPkmPGi04LHEfHLVs3lrWqNctNZzez8CETZ1/dF4ErA+DVd64fweR++YFVZl8dP34deGzGgmBofimU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197261; c=relaxed/simple;
	bh=yrGG+hMwf6QlqsGnobYEtBrE77rQUzzH4+zd0SjNkcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A6m2G+sGYuO4PK5WX2xPsuCWN/w18YwE+vvXgFUyNX3Hvk0TszJXzZjh6OqEzYTR4Fb8PYG0dTjRmCYQHXit2Ts+BK0uouOq21SUwlCH0Xbr6dqEW0Ci9LW/O+8UUEVaL+kJKv66ZT5z+Sbn45/U8tuU+bAe+uLRxmrzT0OObZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAeSh9za; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAeSh9za"
Received: by smtp.kernel.org (Postfix)
	id 5479DC4CEF5; Sat, 15 Nov 2025 09:01:01 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A2D4C116B1
	for <soc@kernel.org>; Sat, 15 Nov 2025 09:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A2D4C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso1570338f8f.0
        for <soc@kernel.org>; Sat, 15 Nov 2025 01:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197259; x=1763802059; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOVY22gCITksV2gxcyAqD2EMrioeVssa5L5prhcUC28=;
        b=mAeSh9za7sPDSkD++yGBdJQmp3bdkEOf1QvulGUT9hB1acZ1wURIHolaRmcHDAGn0z
         N/7b7kjCguKZARVHghhkaBnIS1o5pqksuiFQNCKsC3On1CSlAzzJn8Ou9bFneT3A2AFT
         dmTB1fZzruPEPTOsLgAKa0UXJeS1itcxxf1h4dJv9W0FYM09ug2YN4WPnULYPF54pAeJ
         PfhLpI71NHZc+VEEQMvp/WlMjH+qe1SmSN+lsLf6NELxRkkrigq8p8EaY5/9EuDdoNn8
         Ejfy1AlWHA7xfPOVKUWyVZ9nlPW3Xf54+13taiDp04ZMdEPeba9juANpAs1Jxl2ntQuo
         3ShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197259; x=1763802059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hOVY22gCITksV2gxcyAqD2EMrioeVssa5L5prhcUC28=;
        b=V0oDrWwI90Os2OBMyu3qu9t3J1FUhz36dr3s+nNd3ScbNMrDYr70AI+D+C7jvXoGLP
         M0tVn6O+OtwLvKYzaQM76hiLGh+N0oFY+D5HfmD1fGSTtBx/gV5aaTapj662Pl3pZtmj
         H+kGSxVB2aGGLMLEAeLDUCBKeVDQBrmaJ3L6YmeOskt/4MkXpYlKrd94a+fmH/ekg89N
         nfCpDN2jQpt3a25LAl8UuZyXjvnJG9m+Gl8m3W7GCPETKfIDqUGhVtBpXqarOtKfu/V1
         2kV0mMwSxEOAbKDuPv2seL6DEb39BN5k2Y7f3yCx0acN5iyOOs+9fhtJ7y2KQ/9/IFVQ
         2LDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQM2C0gCxoyV6stLfJkzVYQsxn3s3EZMwGKUYXGqptmEVhmgV/NBq9iyCoAJ6T1WOUkH8=@kernel.org
X-Gm-Message-State: AOJu0YyS6qbw54H1C7iKySyB7cR5Y9MfGy2pDpjEjIAq9Anrzj33j7OQ
	dW2raa1T0tv6TwUSE0/Phxo/Qse6wnub3trwzFUmj55iv6inudyquc4C
X-Gm-Gg: ASbGncs2NYDHK6bsouwXn/Kk7hIfxsjW4AyLpMpmgjuBprWLYRaR9s3Yiu7kJaOjhYV
	p7NQMjKYAqJ5avW+rawlEPhP8pNLrRmtmejID2tDHXlTgBOfUVbZWuAkZOf8Xdx5+hmpeKC9OhE
	V5GXOS63uMbgnW1302WZEpkL7ADM/R/N9pov/L6N82h7i0e7Nk9OjEjFj3wS/V7VRdqcLfxBQqa
	CK4+WS5t16nnnAkDQdUZnctCn8N46IEQAJQcvkV6D23e6RrtNgKmBQtEPILs3Ho4eBDu2tHGf+B
	7vu0aOAt/bfplrPfEg06KgB2gHAIyUowoa5uKYTtwM4ZkPXnTKVxlJCHOhJIGj7JhJ8N3FNw2Fg
	5A/733gVI+XDe06eN5QIzzTLQzdZsDQl1YGvN4T5pOhmLJMl4IR1m0QFiUjUAZoCuHpeCGKFz0W
	5mpIrfEINycxLo3tX5Ldqo5Cz9u9ZK2iISbMcNRQw455LInYkH3WaUbCcU/Dcqr58iVWvl
X-Google-Smtp-Source: AGHT+IFoaK3lhY6hP5vpOdFQPuE5XMwCFmwtA4zhKi+e0WF3vPhR/3CXQ4PwTkjEDkzYzg1tAlyYAQ==
X-Received: by 2002:a05:6000:288a:b0:42b:3cd2:e9ba with SMTP id ffacd0b85a97d-42b595a48b6mr5302713f8f.33.1763197258729;
        Sat, 15 Nov 2025 01:00:58 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17291sm14874843f8f.32.2025.11.15.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:57 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/8] ARM: tegra: Device tree changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:40 +0100
Message-ID: <20251115090044.3140331-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-arm-dt

for you to fetch changes up to f224e936dad0933a1baa3b7152f48918cdd98498:

  ARM: tegra: Add device-tree for Xiaomi Mi Pad (A0101) (2025-11-14 17:43:09 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.19-rc1

Add more host1x devices on Tegra114 and Tegra124, as well as CSI for
Tegra20 and Tegra30. Support for the Xiaomi Mi Pad is also added.

----------------------------------------------------------------
Svyatoslav Ryhel (4):
      ARM: tegra: Add missing HOST1X device nodes on Tegra114
      ARM: tegra: Add missing HOST1X device nodes on Tegra124
      ARM: tegra: add CSI nodes for Tegra20 and Tegra30
      ARM: tegra: Add device-tree for Xiaomi Mi Pad (A0101)

 arch/arm/boot/dts/nvidia/Makefile                  |    3 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi             |   64 +
 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts | 2790 ++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi             |   64 +
 arch/arm/boot/dts/nvidia/tegra20.dtsi              |   19 +-
 arch/arm/boot/dts/nvidia/tegra30.dtsi              |   24 +-
 6 files changed, 2960 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts
