Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE92334DCFD
	for <soc@lists.linux.dev>; Mon, 16 Mar 2026 07:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646915; cv=none; b=chi5HhpIc+Z5KpEw8JA6SefPlAJQleK5geEeaxqGD+3+JJnzxFYLP09FaTCevDrcYH0s45TTs+Y1v3khXSoeXoL+slRUsC2vFk4uLg2Vxp9b+TthScXdxKOP8tsWW3WDTstAn/jr1/X8cnP/ohG807EQhG/OmXi2Hja5T8JiD38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646915; c=relaxed/simple;
	bh=+zvclJsj6P2p7cnxkJrMQ65XYWfboyRRpd059Hp5mM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qamZe06eSMZFJGkZRUL28zGXnP4PTN/djL3M+AYxHQWOusqF3GZzAe3hm4ftkOY2RGdjfyvftrUFvevqrWCBPzJhEBc/x4fXRSMnbfXUfPRd5ddc9iZs0wgexf3NIkYXQG16qnhXB63udyVwEU1+ao0vWxmEhSEyYdUBRb0ftKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D3I2L+cs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D3I2L+cs"
Received: by smtp.kernel.org (Postfix)
	id 88D8CC19425; Mon, 16 Mar 2026 07:41:55 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3C96C19421
	for <soc@kernel.org>; Mon, 16 Mar 2026 07:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3C96C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a12f88d839so4351771e87.0
        for <soc@kernel.org>; Mon, 16 Mar 2026 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773646913; x=1774251713; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X9f0vpOSz6vqueLKXbDkbiM4ufWrBYHfcY6Ykd+DFfA=;
        b=D3I2L+cs+6aHl4aNxTXM4jkOYfoSAiKcprKnmexrQk2d+fh8/BMdHzYvuNvTwWA4Ta
         WnXzmOR1Kt5cxeSmWol1g0A3Cvpg0HztC4TgDvGMHVYLht2KbuPwvQ2kkchdQ6MZ7FoL
         9IeF/b86aCTLF+6N2PPeZ1Ro0vD0GK+PF/Oj5fyeXXm4zAJSnPQ8nocRl7X3yTiMgCM7
         NKjTzbnARHBdGD0B9XJOEQouT7P0i+/G7vOK5p2OhM8Qy0tKvMJiqxOKoeENYGSvW8wn
         WMY7awiAtf2NXMiS1k6ewGzwDJ3IvYo0hVw9aQizIUWWU4oJByvwQutcG0Is3kQP95KG
         jNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773646913; x=1774251713;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9f0vpOSz6vqueLKXbDkbiM4ufWrBYHfcY6Ykd+DFfA=;
        b=D8YMEJgHuSdSL+8zYpiJvKw/jwLL5YALf9+vGMuWu4dyNpruQLwrz7wTlCUx4Hka7q
         rzzMe6bUXIkVJpZQ70/yH5JN2ZcyW15IX1vkKlzDCV/pksQHcpT6sm50dbQUJsgKvYKG
         aWDFfnaUroUpSit16bUMqTxvaFpIaxHyOgejhpqOlnTiPWRmSEoBVBVHKldRGUkAvRbw
         ehcaPUuqXtV26Om4L7BPjLcwCq38AJPjCDJD1FFy9+j3QGxwPQ/YqyUQWBQyKScru8YP
         FO5YlS/I5lQfaz1rWCfdqzPr9dKZwnxNiBvBWeLRwL72N7dR5wCEVqOw7rVn3t/bXv7X
         upCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR00f2NoQjVdITyFY+02VtBxbfOL6fOQlrKqUr7SceUotzBdUdlTDDnCzMLpLaLt+b+LY=@kernel.org
X-Gm-Message-State: AOJu0YzMQH9SDltrs6HxKTgPryZSnOpqSFQKH9FZjBcJmS9iLXYrgIl7
	2KHUk5MEVYe/lD7SLFbrGS7z3h+ZHfVPQBLHzREwxOXyVEwW8wvzzaW7MntVEzyRQaE=
X-Gm-Gg: ATEYQzzdgzw+dL2C5dcoyQFUxOl3wo3J0e7fZ8WM5qpkvqkrRo41BrTUxqMbPYGnsOv
	saiXqVChI5EZIB/D4vyZ9toXxOniRvuk6nI+K3U+6APYoxhhB4jrYC5CwuXSwQk+yRaF/okNpbf
	XSwGqwYfOnC8KGoUe5q7b+5to9c+E5f01cYO9ypawLV8p/rraMtPaea79Wy5UuF/BJ2QoOyHzFK
	MRPwz1mz05Z0CSKrdBls1U61l8f+eHcrbm/dHP+YgCPxcvFPQt8/01UNE+JqbTgtWNpyvu6jTWC
	g2epNwzV+rQPvo6SML4iP6AN15Dd2+3eP1/XNQT8xsZXwSdR1gR2dCOqR3TS9e0DhPV2FuBmi6c
	3JYQzQGd2VbH5qnGBtVSmwNMxlsYfoDoR4qwAmu2qOyvsBHLYGaksq9O4uaEmW4FGYanV9IzJcW
	ygz63lywSAgZfHpF38m5BVDvXSdydd/JJUegSNLOB6DUYph7mOLvqFnS0GGq6ozZJCNApYo2UyT
	7RXttbTRr92RvLVW40=
X-Received: by 2002:a05:6512:3443:b0:5a1:2738:faa1 with SMTP id 2adb3069b0e04-5a16271006bmr2643778e87.17.1773646912633;
        Mon, 16 Mar 2026 00:41:52 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a171a41c8csm97838e87.62.2026.03.16.00.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:41:52 -0700 (PDT)
Date: Mon, 16 Mar 2026 08:41:50 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE shared memory fix for 7.0
Message-ID: <20260316074150.GA2474723@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this patch removing the refcounting of kernel pages within
the TEE shared memory helper. 

Thanks,
Jens

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-fix-for-v7.0

for you to fetch changes up to 08d9a4580f71120be3c5b221af32dca00a48ceb0:

  tee: shm: Remove refcounting of kernel pages (2026-03-03 09:03:04 +0100)

----------------------------------------------------------------
TEE shared memory update for 7.0

Remove refcounting of kernel pages in register_shm_helper() to support
slab allocations.

----------------------------------------------------------------
Matthew Wilcox (1):
      tee: shm: Remove refcounting of kernel pages

 drivers/tee/tee_shm.c | 27 ---------------------------
 1 file changed, 27 deletions(-)
