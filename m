Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8876022068B
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 22:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271805; cv=none; b=RX5hSWSzNx49eyEMoycUnO73xgymIv36t8e5Df/mRmj6YluOsAWZJa5WhkVuE2xmZfJ/goC1AdVQreyI8yjw4NLAMYonVjRsNG3aRepXcPVtT2khugIhSW/5Sn1hZCiVcPniv4X+BOgx45z5WiqNKqzcXsNlitmgREyGVtAz15s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271805; c=relaxed/simple;
	bh=q4eyy1TOD+UdXkmBv/Q78KZjA2myUp8NUt8Yl4W+hIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jJiOBvCV9wtVcRt9qVULzfSr0U0iz5kTK1SZDP7UnB4KZ3hTQusq5qOt5dJ9qTcA0n4fEWQITfH3EwCbfliIes/UgtWXtAwIcgeVoOl2nET+bUXswKn2TRpiT4hgOdpV9rJ6oXb3ndjvHfgbVwCWkmXpHjjoelTR5SxYIjMyojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHRtx2H/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHRtx2H/"
Received: by smtp.kernel.org (Postfix)
	id 190BCC4CEF5; Fri, 11 Jul 2025 22:10:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4DF30C4CEED;
	Fri, 11 Jul 2025 22:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4DF30C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-455b00283a5so5990625e9.0;
        Fri, 11 Jul 2025 15:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271802; x=1752876602; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Gk8E+s9RWyBn5WK+KrEq4ZIzC8Xh0foVp5UKjjOUlg=;
        b=FHRtx2H/8FTQGULxDjIsPVkGyy84FdmF3AqHuPwKN4M8bXwK842AQ5/ZDta+VlFLMF
         vGbvxcWy6odAfIlwjyLMSteeQNlotv4VbI2F0DYyffTL3TAFroE+ByaVBRVxNy6W8tVY
         UrT338icXIIrWjZYlF9RgzJcZjxbY7LBS7jsWzuXHa/o5Crfs42q0zY3610YZGrvNjyy
         aKyS1vFirTyJYzbI1IX9wnTJWx80TjX6Alvto9Ilgw1i+YDafBktEocMNiklM5ZlLjcf
         27ckU+wJHzILChKFPCrC63xeUHiCDOXjwRgGcxevpnFqI4Zy1dhbyXRIL2QsXRNUx1tJ
         CryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271802; x=1752876602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Gk8E+s9RWyBn5WK+KrEq4ZIzC8Xh0foVp5UKjjOUlg=;
        b=jVyuF2feP9eIxx19rgKc+2Qmpr9WL0C4rMfdFhIMGzjWl0xrDFGfxh1/ug/o5Fkr9m
         pZCrt5mayGUMy8SoccjYUuHjs/8Whw3ocPbO7+C7OeEHXUWcNAmgMY7iFzemEwoh2hLq
         V5DzaqYF7RmtA5azU5EDl6gv/KdO1tT+z2QxTWEkLQmTmP/0xfS7RpdHvkTuVWtS0/eA
         EEdrB5DHhV+wH4YWuZdiweAY6ezerO3M2H8TnbZ+XWLNe3lK5Bu+ZxAf72LmpDdvpMyf
         mTTzVZN3g/Rr9WoF611INcgVILQIy/vMIhPWuXxYdKC3vuiWgWcoGz23YPaRKjT+JVm/
         8QoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtKv0RHqMCfuUg2z3hSNLnOOAk49TLNHoWA2v3ZRel8kZwK6RY11N6GwewnQ+HayFCN7E=@kernel.org
X-Gm-Message-State: AOJu0Yx8dr+wSxHm6ANEwR1Lr7vKO0SGsyCXYWHuLqdWP5Fw/MClJkNc
	ph91ja5bFE7NR0dyipgwlF4gQVxnMUAMT/n3BXbK+jLpcArqz9FRfBBLf6IQjw==
X-Gm-Gg: ASbGnct85IUiqSup5ISIWxQVxAty8AHN/6yQ0MoPqLQ9/CCZxAaS406JwTejsUhmwsW
	AuK/ftgQO1fjEvAmDHBTgqgwkHbFU+Cjp6NnyxB3SXqxq3L+t9rQUgpame8DGxv74eIuVpGkSDy
	XYOW23IeqHE4XGDQYvqwCqVFnq1hYtceXztKmIyOrtZQn90Q1G/b5eGF9uJAdiy71NBYaAvsVf4
	qFTAsvcUZcGELMWq2zTQoF4gXKOyG10PMB8y8aJFQCbudnD9ysTvezdnwiYNB80SpvJ5ciz5Gda
	xoEUbI+KQiE+z6fAhqeavTrSAVf5RciSMGJ9GqVf6slGoYpWi+a+4vST59BQ3GS3V3XqzRNIIlm
	Eje4Vrs31e9dum+2BWcDsaGwDUoCm6Ufg6d8uus4m0biX0kbMjrKz2az5cwzazF/PuJTzHrfi15
	ijFSPXkLRJ8tXR7GnCk2Eqr4fc
X-Google-Smtp-Source: AGHT+IHy8K+cMlEn6WaDFY14pAsG9qqBk8/FSdFXqmhoAJtzNEuZl2gUeQ1mPurKUKcz5UGZPQj7jQ==
X-Received: by 2002:a05:600c:4f4d:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-456058e1e70mr909075e9.21.1752271801720;
        Fri, 11 Jul 2025 15:10:01 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454d50df5a1sm97491575e9.22.2025.07.11.15.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:10:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 8/8] arm64: tegra: Default configuration updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:41 +0200
Message-ID: <20250711220943.2389322-8-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm64-defconfig

for you to fetch changes up to bd3b8e53e244fec2255ab037242230847559161a:

  arm64: defconfig: Enable Tegra241 and Tegra264 (2025-07-10 23:16:40 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v6.17-rc1

Enable the HSP and BPMP via the configuration instead of selecting them,
which can lead to problems. Also enable support for Tegra241, which was
never done after support for it was added, and Tegra264.

----------------------------------------------------------------
Thierry Reding (2):
      arm64: defconfig: Enable Tegra HSP and BPMP
      arm64: defconfig: Enable Tegra241 and Tegra264

 arch/arm64/configs/defconfig | 4 ++++
 drivers/soc/tegra/Kconfig    | 9 ---------
 2 files changed, 4 insertions(+), 9 deletions(-)
