Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB86EED6
	for <soc@lists.linux.dev>; Mon, 17 Mar 2025 18:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742235966; cv=none; b=gepCGFzYycSKCL9L3/u77Vl/+E2ai0HUrmo+u0Qy26MjD8nJ1lja4EDvrpFUqTjBm1n0E0j1h7w1j60j5q2DJTouaRYOk36H26fdk0phr2KnjmOxHAzZJ+ofIqzih0E4RCYRJGsNpvi/d0BcwmH845fIgGAwY+xCmSevL5/QENs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742235966; c=relaxed/simple;
	bh=J/mr4I3uvI8W0Y1yAOw9cp7AhbUIUPwgEeg0HhkM+Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f6e53rXOELPugfuq46+eZ1B5EI9ZN97RGcHbJMgM6bl8nAT6/PZEHsrkY9ZpVvrWZdKakwT+6wNpoKQM7gyidwi/EffQv57dSM0CDJFl9mKL++Bh9lgSu4AG+f5JlcKCxU3yE8C1jBnlfvviPk683zHk1gFrsCmNKr+4sfQ6u/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lyiwYxcA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lyiwYxcA"
Received: by smtp.kernel.org (Postfix)
	id A8A88C4CEEE; Mon, 17 Mar 2025 18:26:05 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB414C4CEED
	for <soc@kernel.org>; Mon, 17 Mar 2025 18:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EB414C4CEED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-3014cb646ecso2789085a91.1
        for <soc@kernel.org>; Mon, 17 Mar 2025 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742235962; x=1742840762; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rYoO63O9hT+LgEGrGAhIiJ0zo/hJCz6kwWX13GuFt04=;
        b=lyiwYxcAdrtfI+K5L+0Mis3OXr7Ib4CzRyBQhLJu9SKS+YBqoryFGPG9EozkO/F5C0
         kA0Njf3WhYapNlj/NIichTyX7gsi0QQKUDV/O2R0Bsiov61l6uDd+eJFetfsw1N3LVkm
         oydoeEdAS3XmPFRq2eapAtDzAFHwum7By9SOnAgEdD/hLeIHhz21AOLJ6x6D0Lx3zgif
         p3Wt9JNrOIH7DZKBGDU9Gw1zYMmw+rl7Koe5UDAiF5/Ot889ykbKKYOEK4FG+AygtlOh
         WFFeDqbpf/TnI/tEdO0gOUYhdUiE9tVMUnMyOptfo1eoAV+C1twDGQRUOX2UYJJdeoAt
         ihqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742235962; x=1742840762;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rYoO63O9hT+LgEGrGAhIiJ0zo/hJCz6kwWX13GuFt04=;
        b=K1mlCF3M/h5NZbKr0Q7/Q3Lg+Y2IIIQBwmmnYd7x0+8ITqPK9m1pfYJCv+wdPgl18A
         l+RKfHdEsr5IcoEZkhmb1Kpvr22Vvp5YqyRDdG8pG/rGSosYU7RhDC28SKLAbJcDWo3O
         fjrud+d/YbrqEGUUiThXuajIBJa7zzoNZ9ZPIsicW4hWV9MEJp5eYNhLWV7J3aF4aR/s
         Xq8xVfUV9oQmnIxOvpu+M6X85R5mgCBWDPRBL2l7gS1y4wocPGnQ9wdCd67DnL920y1n
         Qzb6O3JDe+DFGvUfkFf+l7NVoFsJ3DkKgbcKuOoG0OhM5Jji6u6LWicCnul7Wi0z4sYK
         rJAQ==
X-Gm-Message-State: AOJu0YzCMrNQMvm5HCPZQwPgLuLcpHSmSiVEYL1/ZkR7rmNC8WjgpCMB
	wFjTjSAU0ZyRfp6gCbWDDw+/xbsNdyI99RbbutQwt2CCOcvVmZ4ded15FUE36JYDFEpwqJV3Cn0
	zDCrGrQ==
X-Gm-Gg: ASbGncus7E/M7a7+DpemC1wd8vmsTJD0cLQu7TNrrWcWWZOyz9OxqoRqy36Ru1G/CT8
	wstqDphPqLt4Vw2HdB5xQ4N3Efu+qZXoIpAbD7VfqMz75sXCBBVXWasepIIc6Vmmt9VSdNwsMmD
	z05EL4t4NM8LAyf1IqMSMFZxQhsPHZawVTthq91eLQCbzOm382x6XYt2XCPuUUsEJcTi/dzO7Nz
	HdUYovks7wjNpVCIsxabYkH8Z+BBEMcYWfS+zpuZ0JhtjDaYSRN10/Ct20RB1ff63pYg2viUNw/
	wY247RXcqKY5JLMicvcldL+RCRA/GrSwIH348DjmtQw=
X-Google-Smtp-Source: AGHT+IGDo7UUMQx0KC2YYaD2K5Kwkp8RdeTOtJ+4dyeCTYAd0srXw/4KjI/PQ4Ty5nvijUZdv54Y0g==
X-Received: by 2002:a17:90b:2cc8:b0:2ff:7ad4:77b1 with SMTP id 98e67ed59e1d1-30151cb4ab1mr17747816a91.2.1742235962013;
        Mon, 17 Mar 2025 11:26:02 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301534f47e4sm6410538a91.3.2025.03.17.11.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 11:26:01 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: OMAP1: defconfig updates for v6.15
Date: Mon, 17 Mar 2025 11:26:01 -0700
Message-ID: <7hcyefqzt2.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.15/soc-signed

for you to fetch changes up to c2a5f8c4f28ffea8c93d10e509c5a6e61172cdca:

  ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP (2025-02-05 16:31:37 -0800)

----------------------------------------------------------------
ARM: OMAP1: defconfig updates for v6.15

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP

 arch/arm/mach-omap1/Kconfig | 1 +
 1 file changed, 1 insertion(+)
