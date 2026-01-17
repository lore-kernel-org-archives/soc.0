Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF04B2E6CB3
	for <soc@lists.linux.dev>; Sat, 17 Jan 2026 11:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768650797; cv=none; b=GXUpojIdiOIKHAT2qJuG0bimCkINV+nkvAMLuWTzHpAJgpK05bWREsVx9MMQaV+ZyPO3huuD5slGQBliExeYUMq1mI4yDyazV9KuYtDXrGIKuUQGj1bEc2kAKSouss0tyN2CYWULbu0UoCBIjlqhArPROxAJEpZpKd+mZsOFL0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768650797; c=relaxed/simple;
	bh=Ek5firaA7WfnkgLbV5p7kBSOKxGkaFmNJcZaCmonqg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ogTC+wfoetj3Ss1Jmte6Zx7JXssa0pke+sWKq23sC49aYHXtRMp9xfR1xM7eVJlL1FyZ5KgVdaaljqVo6zzZald7aZ02xVvPSIMndeeE8ireF4gvNpocx0ZjA82M4QV/8Dd6AAGpkqrVff2iNutEdpeKju7F6ZoglaEa1P2iZZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eDl8RNRx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eDl8RNRx"
Received: by smtp.kernel.org (Postfix)
	id 6BE78C19424; Sat, 17 Jan 2026 11:53:17 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D705C4CEF7
	for <soc@kernel.org>; Sat, 17 Jan 2026 11:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D705C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b872de50c91so446553266b.2
        for <soc@kernel.org>; Sat, 17 Jan 2026 03:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768650795; x=1769255595; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0P5243+rodLfxkc/81GyeliVeBxXMza+5jtgneXbcuE=;
        b=eDl8RNRx5klzhc3Jy31CqnWN3sp182j/5yZykfGvduEMs0cglkMXDbT7+xmFFXMZvP
         uLJiHr/30D3/PqEXXw3zVRqlF9WqJTdMwauHD75ISnXOzE950P9VC9kIaHQJplxB9uf7
         Tr7u1+sdEwyvt1ABftU2ouIJQpzw8mNSzVSL6UnIhRfj0x5fxC7WxYlvCrBbWC3D7v3S
         Tm92/m9kqpGrkWthQWTl1q2gGLptphjAYm3eVbxwURJIw4GuPIUof/AyPqrkafRSIs4K
         LOg4gQcL/qMNZrFdQxaDDHVcd+eG6qPPSkk5TksBGT4SrDKfJlsdYwC4wa/qkwVKIg17
         6Rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768650795; x=1769255595;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0P5243+rodLfxkc/81GyeliVeBxXMza+5jtgneXbcuE=;
        b=pt180na+G8Bgc153CSeaR0U4KAb6809ETn6c0JgW/natQAvaZqnQhQF5NBLOZIP3VH
         UcnqUgJigdcj1EuZ5cnbGP1msa88SlG0c6vVINpUM/q+A8vxi/l7HnSWPCejwYbbg+Pr
         1/POwxMLkmArwwZ3pOOAM+Pb1u/UQFxd87dfx0IY3ZFPNbsRs1st91vMDoONzV7yix6N
         4ZamtQ+3FtFXltsZ5jKR/z3F1A+0uglwm+G705Q4XJQre/ZgUQ9RRKg/pmc4aF6SEvxl
         aD3nYp8ntync8PgwPkQFKIOzpI/yzGye0A43LX3tDzR0KixeG0oNJjZkYGUAf/fixnXY
         Hedg==
X-Forwarded-Encrypted: i=1; AJvYcCU5pvPQ/LYzifg4JIQZnU2Exx+yWdmi+/JGpWEjXQgEfUNPfPH+NHyFr3EP2DbQOEzgJhY=@kernel.org
X-Gm-Message-State: AOJu0YzENZdteHs/emsC9yC8lJrnSHr3lzsGWogdQhJA2YPPGirMEJo2
	TFUxLHxSj2NzTIQQBkMcY30sDqgmUUc1rU8aAfL7EHeRuzy3NyCmSmG1oOeVQ0mnQvg=
X-Gm-Gg: AY/fxX4rwcl8cBytOIHBqCCvMNlhBqcLLvLUB7yVioyx0agyN/h0ffGX2Qlo5yrOBwU
	hyttq5VI+vz7e5tyyb/woCApcR2Jbx1kC7AYkCidxdDPvNop1K6G5sqB4Qqwf72682b8zy/0hth
	/d+KiRfZt97nbuSUytoX82i8jqIqHI2TilTCxfS7FkwsV4PWP4dANJzTKKlszRlqUQFqJMhxLix
	tkt69u55M1kOup0EIs1d2kTA5IdSA+NGsk4w05+dkjlgFbeRB2z8RXfgElAAY+MzGvTfZeVbNzr
	gNNZAuEFP5KxcoX9GtwmA2UZK8hq5BgLhU/UMGI1cvJ34PjGc9xL8INs7i2gACKgQc5TZKZjq89
	Mg09hrwpR69T7/Q8+48cyHK5RS7v8MrxECClDWRn6jCZx6uODQB0cIzcBq4riI3yMQjtNle4iz9
	u8sSCyAlQ0ZQrI4ygyKkUj/pc+7TpfTjxkgYthG+CrsXyJaq4r3TCO89R8GUodWqGGuGBA1MDub
	FYLtNQ=
X-Received: by 2002:a17:906:7305:b0:b87:fc5:40bf with SMTP id a640c23a62f3a-b8792d489ddmr548226266b.5.1768650794555;
        Sat, 17 Jan 2026 03:53:14 -0800 (PST)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a18c3fsm513158566b.58.2026.01.17.03.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 03:53:13 -0800 (PST)
Date: Sat, 17 Jan 2026 12:53:12 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] QCOMTEE fixes for 6.20
Message-ID: <20260117115312.GA255115@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull thes three small fixes for the QCOMTEE driver in the TEE
subsystem.

Thanks,
Jens

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/qcomtee-fixes-for-6.20

for you to fetch changes up to 1c05d9a4cab2abfb93ebce5edaa17752126b6d35:

  tee: qcomtee: user: Fix confusing cleanup.h syntax (2026-01-05 10:21:09 +0100)

----------------------------------------------------------------
QCOMTEE fixes for 6.20

Small cleanups for the qcomtee driver to align with recommended coding
practices for the cleanup.h infrastructure.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      tee: qcomtee: call: Fix confusing cleanup.h syntax
      tee: qcomtee: mem: Fix confusing cleanup.h syntax
      tee: qcomtee: user: Fix confusing cleanup.h syntax

 drivers/tee/qcomtee/call.c     | 17 ++++++++---------
 drivers/tee/qcomtee/mem_obj.c  |  4 ++--
 drivers/tee/qcomtee/user_obj.c |  8 ++++----
 3 files changed, 14 insertions(+), 15 deletions(-)
