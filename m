Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0432BEFE4
	for <soc@lists.linux.dev>; Fri, 19 Sep 2025 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274240; cv=none; b=kel4/9sDulBppunA1yQl+aPUfe9ZOblJUDImtPNNuENGEKuFB/3vf03t00QM4GK+88gFmbXHQzVJb0dqCax0S/Ky3r62aOyOmytgKiLmNZyd/YYu8PSUHl/Kat+jRrL9xAcq2aSvIuR4LvXEzgmCPOAZyp0ftxVDkSJ1EUOkvQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274240; c=relaxed/simple;
	bh=avDTXxWThbmAjC1QHoBfYODid9NjOrfOHkrQc9E/jS0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lvzsjTee2qDCXh/f2BFvIbahAvnw0jIaO1wGUGwG8qAsFoTK/AQAtagdYRTpnWZi+SPKZ5ClGoRB/hk6Yj73Kg/ozPcUhGBT03v1DBc4xTwtyM7zmxtG3OSe4f1e1ghwUC95QUKgcvIP4HOXMT/kDzREmKtt31BSFv03UPkINzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dgp5J7db; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dgp5J7db"
Received: by smtp.kernel.org (Postfix)
	id A9026C4CEF7; Fri, 19 Sep 2025 09:30:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6B1AC4CEF0
	for <soc@kernel.org>; Fri, 19 Sep 2025 09:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6B1AC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so394243f8f.0
        for <soc@kernel.org>; Fri, 19 Sep 2025 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758274237; x=1758879037; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shAUV/4fLe8epMbZhEjkFrhPpzpShVnyKXxo1s/wp4I=;
        b=Dgp5J7dbIAay4CBAzlG0n1TnJAkiq94JPm0Z7QsCnsL3biQl5eleXACUxJeQkXGMB1
         2LCT4tWKirQ4b4515TLNuBomTQ7Q9HTZrdA2yMITBMx103ZjvIvPt6bn+bfZ60rXVNMC
         dZaU4WUbEsTzJFG8wLAAmWYuw734I3PYjeuRCtQQFH7hW5EfWJWuEh7m79aXyubmNIT+
         1hcIsz+JhT9Mp0DmSt4A2r7fTwnhXVdAYagqoX2F5CFfQTDFzUpYRxf6qo7sZNt4Ozjw
         fYqMQ4JeH5OhQTfeUfnNKNpqJhHSAOlGmMd1jSs2Sv4DXGg/bA3Z4dfIaUBz6UKYFsHv
         HmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758274237; x=1758879037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shAUV/4fLe8epMbZhEjkFrhPpzpShVnyKXxo1s/wp4I=;
        b=ZVFqUrvfVU87BZycdJSq/nDsXWc4D2kFiFq4qZblD57rNXaTsnnoJliEKI1LkJtMSm
         rC/lhkd9Us7mNqwN9keH0MMc0HS/ECAmXMY3gBop10lgseCx0xXF8d0uhvi8FEr3htQ8
         VXnKmQxc3MTBGNWlgV93RXh4vayD7KzvmTBPwbInEJuDxVz0uoKXSUS2tAyFLOEzmDoo
         7Ebjssrt3Odd0WWFfID3AVJzsIcl1Nyu0tGBb/oM2iteAQTApOO1XIHIqKCe88jIfsc4
         k39XeQILnjZ2N/+9IciZYUjgTaqw2jVz7orufiZ9464RLw37aW/QaPcQ0nS9koZ9epXs
         ncZw==
X-Forwarded-Encrypted: i=1; AJvYcCVLs0HD3zoFBU4qn/Mm5TYpUvzCYYD0Xjt0Fjymwd77WG25+O701xSkkIVea7bIBg+w148=@kernel.org
X-Gm-Message-State: AOJu0YzsKTvPLoVCNz2U+sHNem6rS3ubUoLUdIvDPzqdGNQBtoLbSQ8S
	v74h5ru0jjbPHa+AmGhK4KvfizQ7LJpe+9zFVd/a7s+oxSmcctSjZsBu
X-Gm-Gg: ASbGncv48lYZaLqSPzC18xLGZSIvDTYEwSr0DcM2oJjp1C3poa8HsYjjUUO8UTA/aHL
	XRP4rTrIMm1PsoUvpOJlfQgKZXEd6735VTfZBtnfZNRd4M4mUXq4PG+SWm0McirtUplnMphX98i
	43PymWw1+6P4aLTmvwXlSkFkACEI8fSjic9XfGzPY/BvRDvyTKNBqfXWpBylVq5usykZfxgB+BL
	cSKEW+5wI3T4EowSjpSoqE9hXDtZbTo4v6cJ1IGU/Jzt6qiQF1JwgcYPPShQUHpmUF+0+OpUMwU
	178QaLNsNhrm7ZV8wOq3QQtCT5iTyIU0tUOaqro/BHeI2z2l7LNQHjKYwpHKs8Ut6Ua6wq7AiRm
	3mbLO1bhngeKURX7OZpC08rSE2PZ2KBhXjmS9jo8bThiNmTvJ50D/nrwrdAHMA1tRgcL11ynUdB
	zJ+AVOJMIPmo7xgQ==
X-Google-Smtp-Source: AGHT+IEc2Z9yh5Xo4qu7XSr+O293iGaa2p4oGxQBjn1/Zv3QlzQilSw5ukGaWfDe5r0j6EsTMEOZxQ==
X-Received: by 2002:a05:6000:1ac9:b0:3e2:b2f0:6e57 with SMTP id ffacd0b85a97d-3ee83da0688mr2182377f8f.36.1758274237120;
        Fri, 19 Sep 2025 02:30:37 -0700 (PDT)
Received: from localhost (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbc7284sm7083373f8f.33.2025.09.19.02.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:30:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] firmware: tegra: Fixes for v6.17
Date: Fri, 19 Sep 2025 11:30:33 +0200
Message-ID: <20250919093034.2747884-1-thierry.reding@gmail.com>
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-firmware-fixes

for you to fetch changes up to 6131690df4adae33e01c0b51b9b78b3e8ed3b76f:

  firmware: tegra: Do not warn on missing memory-region property (2025-09-15 18:28:09 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Fixes for v6.17

This contains a simple patch to avoid a warning in the case where the
optional memory-region property is missing.

----------------------------------------------------------------
Thierry Reding (1):
      firmware: tegra: Do not warn on missing memory-region property

 drivers/firmware/tegra/bpmp-tegra186.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
