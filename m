Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4DA3368B7
	for <soc@lists.linux.dev>; Mon,  3 Aug 2026 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772329; cv=none; b=A2qlKVoOAZlaVq8DTzs8/TMUPEkz4PZxiE0hckS19b/8K1Us8qzgvnNMTYCSx/0qxZJQtzzx8rpPYjDKM+GGOgKy4ufsE2pgvuUVX6wP3Jzk59tYiHtbVDP3OqataqGcxBPJUtoRR8zrL6qcDR1y5t44LfxtzoE7DeQDQTD54Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772329; c=relaxed/simple;
	bh=mmQYKq0BtbnhjGj+y3pRQrqUdvpr5FKLB4mQEb4XQEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jd8cggGTDn+Nww5ZDwCX88E26IGIByMvNrE+Mhv2uzWkxRWX9+7288YJKSBweiKJbg9gLZ6IO91z4OU1Wlk5wYwHvpGeJxLDglq2E50bmQbITHjTg1G+JDZOtXis3Vc8rk5Dim4Xoh8EZME29o7AIlVWxvOo3kXQ+YJNNBjApTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KEjFmcXH; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KEjFmcXH"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso2706388a91.0
        for <soc@lists.linux.dev>; Mon, 03 Aug 2026 08:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785772328; x=1786377128; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2QcaSW8eE8D7RoBuOICkCFr3KzY/Y5G0pSnKbTuZfY=;
        b=KEjFmcXHBHkcxNe+Hfb3XTDja0P23yoGxhlV5QcFoBeUQfD4IsoDGIFj4z54Jlh08H
         2RHN9NSLNbanjslxOWWaNQJY9nGKt3lEtmrp4cmrpmw7a0VSfUT/Mf2u3656YNTmigab
         xmB7rQvbjkt6Rc4mvW+VFSJLZ/0Arr1WuEoXBDOOUa5byIdADRNPx6zTjzqVcZYkrnCJ
         47E7vtKVrCuI1EBbGLJAHDOQ94y7YrSfMiZ0XC/F66oKPGI2dYd8zUycENXfQ8FVaaNj
         CVrfCmh4fs57No3hYvWisu7+oSyyXl5NzXsmp6XH3woKL/dHXP7pdOxYDbdUCMl+v0xr
         xhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772328; x=1786377128;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C2QcaSW8eE8D7RoBuOICkCFr3KzY/Y5G0pSnKbTuZfY=;
        b=hxh7ta4bCTqBbqPnX65cApvPoNodeAxVaUOKrGqC60bu3RXiSg29Poub99JrXwWitv
         Yx3unB/3/k5ZU6CtL7c9hF/+hU8NhyGk9jWQLk9EiWG8TozWLlazfdZV/NSCGPKPOi9G
         io1NWSzTJvKCktiAyW4StRZLAw/TE+V7pE3GrBj24ozBwQrdRkhh0VcIrkCaSQCaUSxs
         VTAC5eo1RBmGeBxKo1eWbZPwFCSjR9vn5Lhjs4V/YL1lvIf4ZUqahkYAOOcPue1A19CP
         m31HrLmX4p3zPlQPG4p2AsGPgNYPlKLYfeQe+P9qKmiNV29TtkG+xxV4BSYxIy2YfOA2
         iWZw==
X-Gm-Message-State: AOJu0YweBUMv8gmWhK6d1AiCj4kfMP9Sq+Mmx76CwQQ4GhStQJC/rUBS
	v47sfR4f377nXC6Hh7unyxyY9y8WhqT7//A6pSK+mlhfig49Mb19Ih0BfRAZ2l2Fr2K3OdwrZjA
	reJICVtbyHw==
X-Gm-Gg: AR+sD11QTdgGF1Lkfr837t/zSc3OaoVxCMi62PK6ezRhHxjbuf27FGVVI5rRPqlVXWh
	hmu7neTfQGjhxFMKRA1BxkJmFA7lt6fRd0jWAdx9sGXJRGybE4f0rDSaopl3XM8/tWruDlZEHrH
	sNparaz9JYXtDG9RMGEROzBh4i41Lo31auzM8Ls9o9JZ2WynOHI5aby/riTOVtUe4pdwMyyd0iD
	/PB3RWRgqKXaDxkDfWjjEtSraEDeFwSWDj9vugr8YUrUMRFo56p6hF3h7G3hNEhwdp46D6+Byd2
	nqNBj6p8mdiYDTKxOkhkg4rC5CrY/m4fimYth9CGWk1iJDLXyq1FM81yMdrWn/IX0hHWct4Mz+d
	DgJh915ETETo8Mio27+k+1ApwTBOL5mz8v8lyBdMGSr+gs3bGHJ315i4z3V2bsoLos+C7oP2luR
	eHPff+3576zMiw2U0H0MKObLCpvGmKLbR0X8lbJ5hj6uDigzRz2tEqDLvhWw==
X-Received: by 2002:a17:90b:4b85:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38fbc4a1328mr9585476a91.18.1785772314020;
        Mon, 03 Aug 2026 08:51:54 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-38febe2daeesm42905a91.0.2026.08.03.08.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:51:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: OMAP2 updates for v7.3
Date: Mon, 03 Aug 2026 08:51:53 -0700
Message-ID: <7h5x1rjj6u.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/soc-signed

for you to fetch changes up to 76103814279724e5c98b1c16a730f56ebede9f74:

  ARM: OMAP2+: Fix OF node reference leaks in omap_hwmod (2026-06-29 13:13:52 -0700)

----------------------------------------------------------------
soc: OMAP2 updates for v7.3
- minor fixes

----------------------------------------------------------------
Mithil Bavishi (1):
      ARM: OMAP2+: Add CFI type for omap4_finish_suspend

Yuho Choi (1):
      ARM: OMAP2+: Fix OF node reference leaks in omap_hwmod

 arch/arm/mach-omap2/omap_hwmod.c | 26 ++++++++++++++++++--------
 arch/arm/mach-omap2/sleep44xx.S  |  5 +++--
 2 files changed, 21 insertions(+), 10 deletions(-)
