Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA921EE7C6
	for <soc@lists.linux.dev>; Tue,  7 Jan 2025 23:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736292311; cv=none; b=GsSZ0MFMPnar7w6/z/7vB01UnN1e/XA/s8eMs2zRg7yatQ5Y8BJmAS1Z+MnJyoH6sK1SX2z60GjVktZF1+ZfVn/acUEtpd9o+SdN/TpiICEJLeJeam1nwQqmzAOrDQAc0469iwhw1Vlu3p99UqWgOMjDsTRGX5jAnuYe95ToAgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736292311; c=relaxed/simple;
	bh=cEGqH9VvxrADKoWN2N29Th6xWngmCgiaV0IQ6N0CFTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vmb14XT5Pt33SLdWJ5i3kmFszCtkZD7reoiyofwylmmxBWJYRriZE5kjZARnbHIa+PIt5VTNUjkijBqCKmxkSiGtjOhryVi8Eckj8cGOZQJ5yC9qKmGSB83L3/Om4DiUeW443uDe1PgIoiLrkPCbx58ry6s8CDumUZN+QMd84hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JyzQVeM/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JyzQVeM/"
Received: by smtp.kernel.org (Postfix)
	id 06428C4CEE1; Tue,  7 Jan 2025 23:25:11 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C25CC4CEDF
	for <soc@kernel.org>; Tue,  7 Jan 2025 23:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C25CC4CEDF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2163dc5155fso235480975ad.0
        for <soc@kernel.org>; Tue, 07 Jan 2025 15:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736292306; x=1736897106; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5HsjqkC0TW1j6tEXS+2YAetbzExkGU2uGb1bwmU0WzM=;
        b=JyzQVeM/G+Cus+ZTn/IVamN/9qFYjYq6sRUPPWPptGwFlIq56Rho0SaoKApX/yO2ZN
         AGUJGhBlgvGJsLFmSynBk4luluQXR47OpNkLpkcM4Q89mexdhTAPC5CmpbRRIXLh1vNV
         Ac/XH/G+K7W3MSRNQtrykprUmmcyHJytyWTO2ZZXOmUMAfMh5CHCOaMVga6JD7hq+egf
         uHEeNNmqU1KUTP45K16xGfJIIhp9NBJRY2BaoRTTuZQxvnG8BPOwdLY10CvHM4gRITUk
         pCh3uaEZkjzJAdpLStOb7uoAiv2qDOQs3LY9hCeFPMPqFfCQAxiGYVdk5LEF1shDMDRs
         8nUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736292306; x=1736897106;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5HsjqkC0TW1j6tEXS+2YAetbzExkGU2uGb1bwmU0WzM=;
        b=P3bEOzlmsDzq61c5mxFJXFfNUA/D4Uny+bXg+2dJCq13j3EM3R+u+bMslEaQsqLEaM
         ga/w0jsKSTpj3IiQGo847YwPtSBpoAYrfLhzaY+IFsvJJTQtzZRGk0r6L2lEcVFJVv4V
         gS2qNmlDSW/7vrj/zAqUc16IyxCCp9RXyhOL4SMtqHYGwvqF/Vzst2GgeUcI4TiKjNL1
         VPyJCPvc4BRlcPU3N5V/lYmgDyJ63WYqXR5lNwUhe7j81bpRQprcAGwca72sUW7ucXOq
         RCBL0ZvgnOXyg06ck1pl5+7yWWnjNocvwZOqhcqoB2XTGO9Eczp12ncKo+KN7cj3nOix
         DQzQ==
X-Gm-Message-State: AOJu0Yy6khIIP077W1OxtLIfzg4yEAMfn94fGa6WL94qVoKSV/uecIBz
	Y1q0Zwecx/x8T7NHeo5vfAwXpdw9z/WQStNEdd6RSn7GrJBKY4BWM9BAOxcJw4fPLAc/odrcuzU
	H
X-Gm-Gg: ASbGncvVXUQsXaT3D8/yWB6Vstz0pIS3KUtf1YTe5wWQuTtajHAY5q1lXTKcMMlsPcE
	vJ8ohf4PyTViLYCiyyTTzw7NHF5hxHzzP189loLdYYYeCQezirFGh1GNrfjZz+XDxjWk/7xkouC
	KPAexV6vTFwlTA6fFrTON+Tv47K1fbfFfkyw61gRqXM3iwyuFXQKNrMJ07rj8HlCr78T/r3gWV5
	zee36q4W6NNMOPV8hA8Mr1fM87spuD497lvVi52vmskEiQ88VAbQfc=
X-Google-Smtp-Source: AGHT+IHVFOR6GkERpP6WR0/FI8WmwY9S92Nz5kINYPVjjjtNFK0rP3anDsgdAdMUKFY2u5SJ/13PZQ==
X-Received: by 2002:a05:6a20:8403:b0:1e0:c954:ea85 with SMTP id adf61e73a8af0-1e88cfa6a5dmr1874365637.13.1736292306314;
        Tue, 07 Jan 2025 15:25:06 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b8e87deasm31264743a12.45.2025.01.07.15.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:25:05 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: omap: minor updates for v6.14
Date: Tue, 07 Jan 2025 15:25:05 -0800
Message-ID: <7hikqqb41a.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/soc-signed

for you to fetch changes up to ad455e48bba7f21bb5108406da0854cf8dede8ea:

  ARM: omap1: Fix up the Retu IRQ on Nokia 770 (2025-01-06 15:12:05 -0800)

----------------------------------------------------------------
soc: omap: minor updates for v6.14

----------------------------------------------------------------
Aaro Koskinen (1):
      ARM: omap1: Fix up the Retu IRQ on Nokia 770

Andreas Kemnade (1):
      ARM: omap2plus_defconfig: enable charger of TWL603X

Christophe JAILLET (1):
      ARM: OMAP2+: Fix a typo

 arch/arm/configs/omap2plus_defconfig | 1 +
 arch/arm/mach-omap1/board-nokia770.c | 2 +-
 arch/arm/mach-omap2/powerdomain.c    | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)
