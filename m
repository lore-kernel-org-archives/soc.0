Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5D023B63C
	for <soc@lists.linux.dev>; Sat, 15 Nov 2025 09:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197263; cv=none; b=TE11A8E1h6czxX4LFrYZYz+0pDLDcQ3FxRBfNP/Bn6uAHzHudRv+dah/PJBLLNpERyRX0BoL0dz0v1h3AXXPN44DbTiHKN0LRmN2L3yT8mrpvlVMcuVaWwNlgaYrbbi6pHnvWmLmeOHaPXZeC9q9u/11offWuTvfPqXNMf4QoS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197263; c=relaxed/simple;
	bh=lNTm5B7eG5zTTcCigkqPBKpQFdVecZr6eqltPBKgCno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AD5QZoNMVDQeVZmodH0tR/YTeJETTgSNC+cKBUj8ZlVP7Iq/NdU0C8KJK32b/kPOq2bW7Ihyu9RaZsNsjcuXT/lyCKNfX/Mn/D9hfQPN8HF+5bru+S6uJbaaKdU7DY/A+1J2gFw2OCZgIIgZam+qd/tAPxcdpXHI4if3ccanwK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izXhufVa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izXhufVa"
Received: by smtp.kernel.org (Postfix)
	id 77FA3C4CEF5; Sat, 15 Nov 2025 09:01:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B56EFC113D0
	for <soc@kernel.org>; Sat, 15 Nov 2025 09:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B56EFC113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so451815e9.2
        for <soc@kernel.org>; Sat, 15 Nov 2025 01:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197261; x=1763802061; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otQqz4O6TNg9CZvBwxUyiMUDuV9EeqUVPJurKYQsz4A=;
        b=izXhufVa7maCO5AccVc9uF/r7MopNNbeWiO9dX+Pr4RwGLqUmyURhap63wddFYRQkP
         8KLv1SODIuLUyimHqgyrtLSugkbbFWUiHMw2SHj4nsmedfn0yVKWlHG0R/kswIv7shBe
         mv8vmr/S9Vsd874AomVZBEPqgPzzBpSGiHPXkhHkOM2jboMtFMWCh3pJl2qV+PvMfClN
         NZNiF/+1oJAd+sS0XXfejhIOUWLibIkdLubVQnv3BNJYnDq5k3gbRaA2UI53PX7OMHhb
         +8e1mMHK4OtKaVObjnFZal9d3InHiprJwOf+zUm1dVXueOBWyItGWeL03vbOfK1pZ/8U
         q/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197261; x=1763802061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=otQqz4O6TNg9CZvBwxUyiMUDuV9EeqUVPJurKYQsz4A=;
        b=Ge3vyJeVUwRQP7DNl4VVy5PcIUT6vo9A5Xy5LC7xBjdLd5MNI6Vvpx7bJIPPBGzO4T
         lFX2MEOEc+fxKPZMZ/OYB4EMQoBy1unyrMPzioMEutybaQU1pi48ZqHFFxlwjAoSrGEj
         x4zrZCCxiT3MaKMlmhz8Pkejm3gmBdYdV5WHSL2E7wIQ7nGCX7BGbj+XRaDeafTnse49
         JSKn5ZgNpCcySZ+o5aeYSbeiC/CE/X/3viDtZKWhnp31v8wwAfE2nKci4PfEi91A2J7b
         bFpwlw9iiC15pe9DVommc9owEV9gtvJBib1hdDgtMuFionUJ5BfIzIyh+OcAcdTABY0D
         PZOA==
X-Forwarded-Encrypted: i=1; AJvYcCV0QHC3uXe1AEbhxsLFkvTTuL33FmNm6VgAtW5mpjnLtIdTmz1/O+Mb7J3dA7SLuswQq40=@kernel.org
X-Gm-Message-State: AOJu0YwP1xm6yZ0vd/aZWW77paw8DrDT+0X2L9swp700n7a5WqvNv/U0
	L4cthKh6LLUYZXyY20zR/ET8QVyqUp5ZUIefX6W5FbwaiHp3PqF+3BWL
X-Gm-Gg: ASbGncuh8PF6Ij17XP2zj+Sn1Y7xG6coJemr7QMJsfiFpvCKP4nv24RlT86VragO8XU
	n6GJokMrCq+rgDzLkTV7PNuq7wXn/XISUKbk8PoyKo59i/kNyHe2epErxJ6apF5gG6osK2cmpzM
	H+25Mh1OwJLEMSpbEm+jhn5yowY3CdDHPrxnurdvu+y+9t+ukfWPccRt8kGOc+FYVeVW1I5nXOi
	KLVrLzVIJHMxGRlQnFnxCemjc0xLZoa8NoBJr+wNQof6IB3655HXejaP+F1r7PCs0Wr/4AjoJje
	HJFbszLVVbPQCcbthsy1huOkybo2150vwEc5Q/aB//CXHqyiUFWlXVmE8M+SGSQNA1Y+dVoPTAc
	Z1xWY92IB2EL25PbjNeRj584Gf6zVE/UIjx3DoC18gNU7W/xvpeeZhpYxSqPDQfImtNMqZbTJMu
	cAd92vE0BviIzUz91vTxhAkJBoEf55I0uMmjaDolRH+NLhktn7sk2LZF74486TYDWT/gIK
X-Google-Smtp-Source: AGHT+IH1PM8xyj5yEL7gAjaZXMZK2RgMF06dvQKC4vQfddhPGZGy34EPxlJte1WyAuPL9BFCTP4JhQ==
X-Received: by 2002:a05:600c:4fd2:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-4778fe4fa18mr57188215e9.2.1763197260712;
        Sat, 15 Nov 2025 01:01:00 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477975022ecsm32259215e9.4.2025.11.15.01.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:59 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/8] ARM: tegra: Default configuration changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:41 +0100
Message-ID: <20251115090044.3140331-6-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-arm-defconfig

for you to fetch changes up to 23a29a81b44e3a7a139fee4d3eada5f299d8985e:

  ARM: tegra: Enable EXT4 for Tegra (2025-11-14 18:05:14 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v6.19-rc1

Enable ext4 by default on Tegra to restore systems booting from MMC.

----------------------------------------------------------------
Jon Hunter (1):
      ARM: tegra: Enable EXT4 for Tegra

 arch/arm/configs/tegra_defconfig | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
