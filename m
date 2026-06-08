Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB053F5BD9
	for <soc@lists.linux.dev>; Mon,  8 Jun 2026 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932068; cv=none; b=YDn18GTZr7NAg9urIjS63ChvidgwJGUxgcT3G3sq8mOV+TmmCMlckVXj9tFEJQRFGVQXuKVveMXsd46YC1qLt/M+5z21AXxFHDl2BxK1MAN5Fe7jTtdssBHzAVnGhx4cvagfNlMPIxPWGQrMFiKuCvdRgXkQUbCsJKO+Pghebx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932068; c=relaxed/simple;
	bh=wdhOAdFxJCsMSsg4Ys+Hv3MlG04dDJlFHq7OT79fYHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WNBrzQ+GEHjkK2ejzmyOGehMg3Iwcq7olR6lyA2nJyXu8lZPk2OUjRnvY/GWktO73Y+tRCnEpqfXqYjtWxyTRonU2TTf1aV7jyeJJmIV5Ru694f8nWYbAAu+0mDA6HyxoL8NYz355P+10PjdYkpQX9RhoeC3mI8ExSepMkJNCVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SbIL/XAG; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SbIL/XAG"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c859a374903so1517952a12.3
        for <soc@lists.linux.dev>; Mon, 08 Jun 2026 08:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780932066; x=1781536866; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sIsYTLOZChveT9EMnGezeFDSrrYGoEXKFgVmBYHPNH8=;
        b=SbIL/XAGBhzvsEkEeNb7VgdaMhpn4nIlCuZ5sIZ8oLgemYwy6PW1E9YqA3NWoNbtDT
         pNDpK6xQhQ4c60HArsLe7QR3UX3B/pDHq3usNqF1IzGYVgk0bhTE/ZpR01w2GZ2m1eEb
         UUmZ0dVKXwlB6kGGkWv0KAwP3KFE9X4QLzs7SctYpd5Vqzjh0m5lmwzYZ/5g+Qy/cgRc
         nn4DejCN3w+inL3C3MgN6eCylgX7HkDTLNfxTMls4SeqnL6ej7buvXNt5bxzuZNHYXql
         pIvwWB/JDUvfiQYzxD/3jPUl9iCqOkHa6olsXTsvOZ5S6wi8D1n6/uw0YHPHmG1l1kBD
         innw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780932066; x=1781536866;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sIsYTLOZChveT9EMnGezeFDSrrYGoEXKFgVmBYHPNH8=;
        b=o92neaOwkddnMBnxqRcPMCc1YPHwFmJ+20m5Efey5VhkyhoD1ARjYR7k971jIK0SUk
         PQ18jRhkxaSiaV/AnfN7CFpleJZmRWAJ+u9+h0Ql8kZvAPv4LNk3jKxnqWTaWx48rMug
         a5LQhffgZCVVxIh8OV0cJ2G2vtEr41E1Rt2ViwUnW++Sn5aXEIowFN/uYsZYtyRPUvuZ
         MViQr0haeLKugbAEdJkRVFNUqd0T3R3QM8sytLflz5mUSqSMI77dMCJ4P8kKJOR0qtQH
         FZPzbigiO5x3PXEVTpS1vrz7m/ExZsUesYv9DmYSihTtGs7UQMe27pD3lw9l5cO0Qu7D
         4BPA==
X-Gm-Message-State: AOJu0YxSriew01EYouaeeE24SkKeNSoR6mDlPyhXoe56IZ4siy8LtwEz
	6267c9LIHB8CGWGlyM9aCQU3EXO4YVUUtGgGF1x1FGEGHulb/9wKCAARP9r1wbCQO7N/+vmdqLM
	Z7v4cadA=
X-Gm-Gg: Acq92OFvJoy1x93qp590uV7//N4fQZXeJXmolL+ZMDhSKKbtn4KWxqunUKmSJmrHwfW
	6nW//ApSuHURJp480JgviZBHcwrd0UB9SCZB8IzI/RsbgXiax8Y5duEBT0aT9tsmiKMFlaStTqV
	Ji6uYbkV7aj6fs5iJBwK2uNF8sbKJoCbUJlek0oDr1N3/Qb0jrinPBNLUldXiTkhE1Yz8/V3HBp
	V2zAUc4g9MFD7ND1lDj4Zih2ESMpqy1tuVjJzuocsVLTQ4bLP2K7CvNa74wfEm/cduN5MFYqPgr
	cL2m6wJWCxl1H/G8qxryhAK95H9eiso4guQUZjdHJRuWwyxXsALnF81aRm/9zL4mfuFvnuAzP7V
	diycYKBxlnh9nPloW5SL2K6N5IYiO8rZr3Gn69arxzjiDvX42DGXKXb04uMuhXIv7HpiEfAFDYR
	GyAF1gOZjTFqbGK55TndltVSNXbBc8BQI=
X-Received: by 2002:a05:6a21:70cb:b0:3b1:882a:607b with SMTP id adf61e73a8af0-3b4ccf6ea30mr17584603637.22.1780932066451;
        Mon, 08 Jun 2026 08:21:06 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-c85df0b2ddbsm15543247a12.24.2026.06.08.08.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:21:05 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: soc: updates for v7.2
Date: Mon, 08 Jun 2026 08:21:05 -0700
Message-ID: <7hldcpm526.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.2/soc-signed

for you to fetch changes up to 2a7a9e20b9e8b5dc4fdef777e67d390dcb3a8ea4:

  ARM: omap2: simplify allocation for omap_device (2026-05-11 09:51:01 -0700)

----------------------------------------------------------------
ARM: soc: updates for v7.2

Minor update for omap_device core code.

----------------------------------------------------------------
Rosen Penev (1):
      ARM: omap2: simplify allocation for omap_device

 arch/arm/mach-omap2/omap_device.c | 29 ++++++++++-------------------
 arch/arm/mach-omap2/omap_device.h |  4 ++--
 2 files changed, 12 insertions(+), 21 deletions(-)
