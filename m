Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560052F8BFC
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400427; cv=none; b=b9+XFEuBjjINKKeoas5JyEMUM7bx4RhUIa4rbPdZWIKsoAKPJpFBnZFbdnoxhCKnwrET+5nWcOPH7kcBKKOVZ83lJZxEPhzetPpNN/dEeXk+Gh1JXuW1WNjCYGNGXZL9J9QCNlNpOanCgbYua1L+oQW8bxhtm7xCTVTGrUr+cno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400427; c=relaxed/simple;
	bh=e+A06of/5QsUNeIsn58UZBUaJZQdKa6DKys4F7BcAJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MM7HEab2RAWGKrWxdHXZNyhz2RGfS0DtOk8eVSuqb9BxXBDSrhYG53uvFUuiNliLUXDCwY0+G4GVQermTVL9I5i6TA9h7i9fDBFykquGInFLUz+pjJb68F7OHoDPfwBIamjd8w3uHSYcMImeBrLLJTEWZ8fgOwIk1VDvsWji3P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dfYbovAR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dfYbovAR"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297e239baecso50595735ad.1
        for <soc@lists.linux.dev>; Mon, 17 Nov 2025 09:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400424; x=1764005224; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6rbKBgmKTQtWUUeEbXSUWDvuJjTtNqK/XhptsEjZldg=;
        b=dfYbovARb50mbyTqjkPUff3L0SZYdv77fJmPQxQYu1c7bHwydPIK9132Di1EA+LFCJ
         eiPNeo3shHzK146/ZGtRKLj94iELQo3lh83EXf2/uqgCmKoINwcTqL6ojsYJ4EaJkCUD
         CGpc4HQ6BEvC5xJIB3fHtJy0k35sxhAMRFQCWaMO6FBojE91yULFeeGIIRHTJMk3S3/3
         1OZMi5ysKqrAqzYav/unIlw06rcdKb5s6lH064VBEPA/hPwLJ/8DZASec3wK6BswWWNg
         4iPci6DsE7k6GH4XcH/82/xWAey4lhHPE4a0DUHZBInJx6aWDF28kfZfg92R7fY+UWWS
         XzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400424; x=1764005224;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6rbKBgmKTQtWUUeEbXSUWDvuJjTtNqK/XhptsEjZldg=;
        b=c6nIaTweODnMBf2q7X7g8Ep6H9nfzKDIoB9ABSpOvELK2iJKvN9HEnPvcU/H00PREP
         Bt5abEbyrr1lXF6trEnJNwuGb5ji+/uUPNyKAprRMpx25Rj33DTIRIO8h5QdM4EMJpPL
         yQQbLn0F8tIbPbzt7j6PeCllTzNKKawE9s0H8bVgowKzp4Omj8iaVicD3RljbFv7+bNW
         ZRQpojPybHJaIXdjIkNhz/lGf9TK09nXpUmYBJh6KNr7ctxvIyBSSib6hIwRISgnpNOW
         X7qa2TrEZgkgWHFPkA0FV32djGjwoUmMsmXzNTNNmvCIyjuBX5s9IGzU0Liq+JCM+fkt
         NCzA==
X-Gm-Message-State: AOJu0Yy9bI2T1vN5bfvgdvr0/zgCktqcZvoYfK4SOj7R5oDZ2zhXDZfN
	H7GUedUaELfXMz6aNUAgnbBtMkYTgFgxhqlImtsmfeD8rTlbXSWt9V4OmYoAvr2Op5pYLJSfCv1
	IJczoobs=
X-Gm-Gg: ASbGncuISvPxR2e9ztYxl7Wd2wSN7DVtgeA/OESSgccOs/P3go1KZV1wuFQQCRiYxiE
	56JeVrE4TnCdPC7hhyMXuqyrs5SNHP7rlVnqlYahhewLAeIngYGzH5GiCNDiEuKxZydzVKh/nJQ
	MGmzNuz8jUHABQun9dKJMNRCb62kBR6pNeCIDH1ztG5rrbjUsqvm+R6EX8zzneJLRfAZW9kzUOk
	C2fgVwCaqZ6ViQZCeJgdqHeWJOX5I+2UaDqniKSIyuAtLJMORI3xGgQn/uWB9nXBFGYmbQG+0yo
	m6OUnHicxc/PKuC1w5lRo6UHEZyRI9zGbIV4QqgMpTEY53Lf4gR71T99ySZXLX6qpCdhbY97q7N
	KZHD3fbrymJuolM0wilD0wZlMYqkhZvKugCFBkBBnZVLsE+y9OONyxmJo7sxIPhMPxw646AuzFw
	==
X-Google-Smtp-Source: AGHT+IFA0UUsyMIJqov1zn7h2UMQsI01nWNIxprKp+P66lGVB1wQy6f1ak+AtImwdL+V+x6WJmuOzQ==
X-Received: by 2002:a17:903:191:b0:294:fc13:7e8c with SMTP id d9443c01a7336-299f552c33emr1059985ad.13.1763400424299;
        Mon, 17 Nov 2025 09:27:04 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29864b00fc9sm121055215ad.40.2025.11.17.09.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:27:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: omap: updates for v6.19
Date: Mon, 17 Nov 2025 09:27:03 -0800
Message-ID: <7h7bvolgd4.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/soc-signed

for you to fetch changes up to ae18c465b3ae0879a023b4a89c032064afb78234:

  ARM: OMAP2+: Fix falg->flag typo in omap_smc2() (2025-11-04 14:47:46 -0800)

----------------------------------------------------------------
ARM: OMAP2+: Fix falg->flag typo in omap_smc2()

----------------------------------------------------------------
Ali Khan (1):
      ARM: OMAP2+: Fix falg->flag typo in omap_smc2()

 arch/arm/mach-omap2/omap-secure.h | 2 +-
 arch/arm/mach-omap2/omap-smc.S    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
