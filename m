Return-Path: <SRS0=qcKZ=P5=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEFDCA0FFA
	for <soc@archiver.kernel.org>; Fri, 30 Aug 2024 14:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29078C4CEE6; Fri, 30 Aug 2024 14:11:52 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9567C4CED2;
	Fri, 30 Aug 2024 14:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A9567C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-428101fa30aso17010535e9.3;
        Fri, 30 Aug 2024 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725027006; x=1725631806; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0vfLLVvgVR8/+4UUPNZ173tGMb5xNPNr2QMLpkcyV4=;
        b=md2xYtusbFaAEtqLC1/loGtL8K3gBPlZpVPuJ/yRa/8EnkmmYRkETSHYE1Csz/WZMh
         3iOAbg4SJ0C3RHwgrmVtUe+lGcoO4kl9HNIMVjxqCz3b2IjkN9pcDObs98JqmnZ0r3hP
         XloGdzI+pdnNZaUb1kvIdce43gcw20OSnUu1TW9jD5HoZgqPeVII39ldZSDPgosb/Qm2
         yeo1/V7bnWDs5uyJvL+xdoPH/mojgRSPkUmKLL69pDqTz6XygnAkVfUkOPj6VXkueaDk
         0MIEoWYVu1dgv4KoufFjetDMrx6yd7jaEzAvHkVXmkyIeD5GyCJTs6FijuJo3Jac0NL5
         iRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027006; x=1725631806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0vfLLVvgVR8/+4UUPNZ173tGMb5xNPNr2QMLpkcyV4=;
        b=UxK5yc9jaO3SUqNgEkbCQnp+Zb5GEbMStmBLeuhsLsiNu2yPTS95wrsAOCPF3W90pA
         ZAgL6T3fN5+01Vc/aVk/O110ujgbt4bUWeymf6EPb48bfuDDP0xga6G5whbQD944Fd00
         T5JhEwD5iYzxXhXUjaVPQHP7BOAMkhz5hNnG4wVdpfOaPGx83KVHuK2NN+0WG/N6LFf4
         RUQx6cS5a4R0mOhwNpKxy+WixXFrowvb6PSbkYOyrsgLg7q8XxgMOn8MNFs6bGkEtMh/
         /Gj7264J9DcaVxO6FS5VVRNmjWgIOUsxP5KxQsTwmolNY9cf5Rt+GTfE+qA1HaGNncMv
         7hBw==
X-Forwarded-Encrypted: i=1; AJvYcCVpCrq/0A6lbF18ToPzB17oO8GKwCRKwCKu4yiBtUQo+pow62QpPu03ySsUmLI+rUz/9yA=@kernel.org
X-Gm-Message-State: AOJu0Yx/40LtoO+WKaQB19VorKUZ4nOZbn5AFamDSx+64J8bg1KRxkv+
	NdrAewf40dNqJ9+abvAJzGPdJ70gOtRbkoNfQBHj66spJyPGy5IjsaQ8hDKF
X-Google-Smtp-Source: AGHT+IFCnbU8gUpa2S/G+byJk01/HZgK3g0uAHqhn2xulkoTkl8lDqCYGCg1Bj/TJbcau1BPqm8iKw==
X-Received: by 2002:a05:600c:474c:b0:42b:ac80:52ea with SMTP id 5b1f17b1804b1-42bb02c1098mr49627755e9.6.1725027005702;
        Fri, 30 Aug 2024 07:10:05 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm82113565e9.47.2024.08.30.07.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:10:05 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] soc/tegra: Changes for v6.12-rc1
Date: Fri, 30 Aug 2024 16:09:58 +0200
Message-ID: <20240830141004.3195210-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.12-soc

for you to fetch changes up to 4d57a840560c3ff04fed07a06b3aec7cbac4bff0:

  soc/tegra: pmc: Simplify with scoped for each OF child loop (2024-08-29 17:43:43 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.12-rc1

This is a single patch that simplifies code a little by employing the
new scoped OF helpers.

----------------------------------------------------------------
Jinjie Ruan (1):
      soc/tegra: pmc: Simplify with scoped for each OF child loop

 drivers/soc/tegra/pmc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)
