Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CB02FF64C
	for <soc@lists.linux.dev>; Sat, 17 Jan 2026 12:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768651447; cv=none; b=DOgTsp1XNHVxft+Y+cfWcdwq7BdrUF82lUgP3Ucg5wAJHmJHXHd8O15vqcSYUm8bj+A+ddxG6LRc97kqjN87ShiEhjtYXqEomUfLJmdjZ6TuMk9zTWv7eh5+11/9KpRRQK2OzdB/1UcprqOUuVr8Lh68/4RmxBagCV+Mb7gvVhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768651447; c=relaxed/simple;
	bh=HsSd+sXUux/dIABdtt+dMC1/mYjNBE96mlk2cgQVmMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gSGb/4Zyn3RAau50DUxJ4IKOGr7/gj+FblvNaUAI4dAZmNz+4VMmo76JWkTKJhFzd2YEJaeheJrmvztgPlxZCGWJKe/8NgvaHnvnVZ4bDbF64rtg3LViZHx0Onk6riWWmta5rlXVRh1JTRP0xoFzgfKoZs5Z88XwfyHv7ZSlnDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0mZZ+VD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0mZZ+VD"
Received: by smtp.kernel.org (Postfix)
	id 34835C19421; Sat, 17 Jan 2026 12:04:07 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61AA0C4CEF7
	for <soc@kernel.org>; Sat, 17 Jan 2026 12:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61AA0C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-59b7882e605so3935466e87.0
        for <soc@kernel.org>; Sat, 17 Jan 2026 04:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768651445; x=1769256245; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nj7efHtLNEBGO8kfZHLQ8akJVqyLIMmEIozQ44ZjMkY=;
        b=y0mZZ+VDQcqMJaJKfE1zvF4CYHggo4ZLBnnKMFnq1SnBdy7Let0qgoUZg0zSbZv37T
         7v3XM6Hm8hAWGI7DhFXT7kHmEUFohezDRm6mGxnA00QuRHqMz4lAIm0igLxFtVn7Om49
         qZBeOZItTAWcTF3wwwk7+3Popn9ZgnbEXxqLS5p7u6V13xKC5hF4wBjCjnWS4qPBZhxe
         Gk4vyed0/F6TrM3R9XIxtxjjFDzLa6LB2hTwN0CFJt9HOPDYE8scoOdKfXk8E2umYmQ3
         /1OGmLsZoKwuJ1vACSAsidseik4ApHoqtuyoDlcL+NH2N37Cj07mvpEeZZ9RV0khgm0L
         xK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768651445; x=1769256245;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nj7efHtLNEBGO8kfZHLQ8akJVqyLIMmEIozQ44ZjMkY=;
        b=ec73T0/QZly8E8SzIswhLHhTpF4RExHQJEoH8fpt9k7Q4EuvmYwersqIXqtrTYPuaw
         vBw4eXY3mGuOywfAnS0Yh7DK0mVz0Fdhrk0iW8vwpo2RdL1dAmxlekkMxlXaiRZJCJfV
         cK1FR58Jn9kmWN89x+wMFrJy4iQ3+CfcbwpXwGMBmbi9TrUvXZIBCteaUiPKoRG7mL0o
         XAWJCBLKCqTlwesJ2tgWgd/UySrK/DkalCgX25ChnWKiFPqwGytilebZLZPF3KRPeAzA
         G9H4L6zPxaepL1OU643/Qc/jslV1Uk1M/8iZVgTrIcwa/cy9PAhTbxjlBScy6Be28eGF
         +BJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM3vcROEhKYeR/pw0/VBzfL9nWMcEpExbiVGSVhg8Zx0hlhuNkdPaIrtWR9Tvx84w8efg=@kernel.org
X-Gm-Message-State: AOJu0YzSupGUNLUVWCcrZ+8IxQX7peC2GfM/jk/nTBorpZsJC2zQSphj
	OBbq3OeNoifw6ubAG9sXo5fXrAU4OBh2mDIH8ABq62Px1v8Rhmsxh83OLdCaerNoTp/sTzdUHL6
	g3wj8
X-Gm-Gg: AY/fxX5VlgIIUZPs8wrrTsxuDaCdFCM+0b535H3oaYtR7Gd0WEoIAIbGl3Nf/mzygvS
	9QjccV12/a+L8OrCchMO12TeZDqeh84ho3k2Jr6Hu1jskZwQVg3Xc6jHGLfq1B5PRLoYd4XhgKv
	6/BR+c0StggIsaECF3oj0y0FXil1AcD51wG6ESR41Ch4Juu+hGtzeDjnnvO+Cbdgk7iNni0Lb9f
	+wlHQeXm3N1yIr5b9lG0CZ4Yep8rp6DhIU0gysTm+ileOd+z5y+/8Vzn7HPgLmzC1M1f05gip9o
	T0Qsk1Q6Mf6xV2T4ixxxDsqDCw13Y9pkI5qoCXkJDGQCqfxz4/fOg07Pfm+Y7TxaHnOSxY9I8TQ
	HeIPYX3cJJym6saj2k9pzYxC7RA2CrL5dwvE3jo+hZrshRsiCubOc4OnhUjU2FRVJckrmfoRtyQ
	2Pw1QnmWn9cYVvSwkzzjJGgGSR9ySYqSUoxAMLIWLxJEDYRfaLEShsomaznEooTa0R6FmbkmuJd
	4RtA0s=
X-Received: by 2002:a05:6512:378a:10b0:59b:b037:489e with SMTP id 2adb3069b0e04-59bb037493amr1321693e87.4.1768651444486;
        Sat, 17 Jan 2026 04:04:04 -0800 (PST)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb9ab8sm15890091fa.48.2026.01.17.04.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 04:04:03 -0800 (PST)
Date: Sat, 17 Jan 2026 13:04:01 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE update for 6.20
Message-ID: <20260117120401.GB255115@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these three small updates for OP-TEE driver in the TEE
subsystem, and for the OP-TEE mailing list.

Thanks,
Jens

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/optee-update-for-6.20

for you to fetch changes up to 94ea7063fae835e800768d3b0507f0994ef03878:

  optee: make read-only array attr static const (2026-01-16 10:35:05 +0100)

----------------------------------------------------------------
OP-TEE update for 6.20

- A micro optimization by making a local array static const
- Update OP-TEE mailing list as moderated
- Update an outdated comment for cmd_alloc_suppl()

----------------------------------------------------------------
Colin Ian King (1):
      optee: make read-only array attr static const

Geert Uytterhoeven (1):
      MAINTAINERS: Mark the OP-TEE mailing list moderated

Julia Lawall (1):
      optee: update outdated comment

 MAINTAINERS             | 6 +++---
 drivers/tee/optee/rpc.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
