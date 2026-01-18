Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6064CC8F0
	for <soc@lists.linux.dev>; Sun, 18 Jan 2026 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768723392; cv=none; b=IVetrWAm2QwXQ4MQN9Vl+4hfw38Q9tP7Mlzbe+w8Y/pROAgH+pAoV332IIeZ0tGzwqgjTBj7gLwGpktnhCWPwrB5HET8iQ5QlZIJxAPhh3Djr4jW7b874l8xOEHYLpzLPnVQwJMbYCQ+YQss4Y+2Vg0uN4cz2Br+vYkTDoR2lJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768723392; c=relaxed/simple;
	bh=abPb8hIaBHO1pitSFBec5OO0Rd8g4FIfut3VTH1oglY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WqOvHhrnzo4kDWCK7pdqEWi6NKK6bFfEMIgIh7d/3J4c/9pOmKLMrdqtiMH6wlzyi+B/O8z0+BTXfUfl3yrnGzrvJBtJZCkEX2chiDI/gWnNH4lKnbrHscWjQpBWOUB404EuYVDxdQ8WibYwfAbBa2mxQmcIN6iNP7MpxmF6xZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0CZzddl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0CZzddl"
Received: by smtp.kernel.org (Postfix)
	id 0B2CDC19425; Sun, 18 Jan 2026 08:03:12 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 485DAC19421
	for <soc@kernel.org>; Sun, 18 Jan 2026 08:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 485DAC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ac3d5ab81bso3600271eec.1
        for <soc@kernel.org>; Sun, 18 Jan 2026 00:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768723390; x=1769328190; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kj8UfNtBvaeaAbcPqe3cu399aKYUpefB3CwEh0ou4Yc=;
        b=Z0CZzddl0wfsakuly9YioWwzkafDu6FY7nttRq03zlNshfV1RqzjCbGIk4w5lhKkvW
         dyL4MwWIPpn72CxRDCgFabi9UiR5gBQWsJFHVxi1kbJYxVuOQ6fHDbS/aP8TMaRDJyko
         NIbuIyrLUdLUtfxIBQ5HtZTMkJ5vpSG3dMwQCSU2s2oP7uE1kP/TGdhv2FSumGzTPHP2
         eiZFt5ooITJe8srgz9bG6kx3+DURqt+4qsYH4k8FB2TAmaWdZp/k0mF5b6UxEnfLfNdn
         1eRCDVBpnmHKRUJZfR2lp6xaikHMsmENFWzA6B8Tx2rCeKM1c4oVoiC9yCp5jOIILWEE
         cTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768723390; x=1769328190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kj8UfNtBvaeaAbcPqe3cu399aKYUpefB3CwEh0ou4Yc=;
        b=jKxy7ulnAOIIh5O/6urX/d3vO2kGpDz4dA1hJZydndRAaxKDo9evKgwfuL+lChCAXW
         eIaN0OTptfmIiFzB1NnuXoAySRCmYzfcu1ER8tyBGVz892lFRY5H1401WPMFB2sQBL4t
         cAHEmwRqxR142Yd4LSNEHJBlcsIAgSv9hjOgqHlDT57JPGeUsSwu4qZhT+LehqEbLFMI
         i2QOWWrkuGCzJ22Bok0IUp+bBRER4/k7UBaXuMX3+Y6WWsF7Glk2hwLjEz9XmQNM7L+2
         G1PGwComR/wo9QlrlL3Mlryplm2ncbsFfZhdkWeKm57m/ykx0dqgv3qzHX/mJZ7P6BsU
         lIKw==
X-Forwarded-Encrypted: i=1; AJvYcCVFWJrZMu28/5fMoV2cuT8NuooJVWJ3eRjDTLfOJePVW9ARkKnKLtM6nHWZVoGLdhTEK/s=@kernel.org
X-Gm-Message-State: AOJu0Yw9hd04zv9S4wU2pFWaVJrjgEbAELhAK8JISxlpsisttbXWaT+d
	AIO8rXn7Itc+GRchCLWIHSyuq4fC6DBWCBoivqI0ptf9W4CxIZOPENpt
X-Gm-Gg: AY/fxX4lnqttsHdD41SSvbYKIf3yfDgAYzgoSoasuh9ilas6Ozq06FYRCp2QmhV5D/0
	RvnTpbULtO2ZbP4IFLCbSkGH4RfIIcemt1IwomC1EEpMmaDVBc5KJ02wY3fopIBP2Yb6dutxGZE
	bpolUFMLMvGrCuStMroSPn2EAHkixL/+nj+zEZroj9CxXVJKSmsCa6AyyQZxKUMP2OWI3P7Lcig
	VwFr1r25vNi77qbJpWhxibcUiYZV8orcEEA2eR05smTZeVNLw34kW50O+Hhckvoo5MseA9qHgrr
	3w/qx2bf8jRpvo6S6kZU01siLuAOSyZqLdBo8Pls+kCRza9HOMgIsFPrvGJF/xm/YVsNqAGRNq1
	VLv7pT6aK40HIz/8nbsb1TYzCyE2XKnpr6FTNnpkybKGlvR1CxiRmZ/hYNua9CB+xcCzEds6P6C
	duCP+VGUpc9v/gzjzKIq7DThDxol6EGedBKjMg61gm3WtYp89qf84CCSPwghwzqi1xienh9J7Xq
	Lq2JJw=
X-Received: by 2002:a05:7301:1687:b0:2a7:83e:7b17 with SMTP id 5a478bee46e88-2b6b46e6ddfmr6064907eec.12.1768723390082;
        Sun, 18 Jan 2026 00:03:10 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b365516asm8498854eec.26.2026.01.18.00.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 00:03:09 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] soc/tegra: Changes for v6.20-rc1
Date: Sun, 18 Jan 2026 09:03:01 +0100
Message-ID: <20260118080304.2646387-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118080304.2646387-1-thierry.reding@gmail.com>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-soc

for you to fetch changes up to 70f752ebb08c85a5ea19471a5aaf26263e53dcb0:

  soc/tegra: pmc: Add PMC contextual functions (2026-01-18 08:48:30 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.20-rc1

This series primarily refactors the Tegra PMC driver to eliminate
reliance on a global variable, transitioning to passing the tegra_pmc
context explicitly across clocks, powergates, sysfs/debugfs interfaces,
and power management callbacks. Additionally, it resolves a warning
during system resume by deferring an unsafe generic_handle_irq() call to
a hard IRQ context using irq_work.

----------------------------------------------------------------
Prathamesh Shete (1):
      soc/tegra: pmc: Fix unsafe generic_handle_irq() call

Thierry Reding (10):
      soc/tegra: pmc: Use contextual data instead of global variable
      soc/tegra: pmc: Pass struct tegra_pmc to tegra_powergate_state()
      soc/tegra: pmc: Store PMC context in clocks
      soc/tegra: pmc: Embed reboot notifier in PMC context
      soc/tegra: pmc: Pass PMC context via sys-off callback data
      soc/tegra: pmc: Pass PMC context as debugfs data
      soc/tegra: pmc: Use PMC context embedded in powergates
      soc/tegra: pmc: Use driver-private data
      soc/tegra: pmc: Do not rely on global variable
      soc/tegra: pmc: Add PMC contextual functions

 drivers/soc/tegra/pmc.c | 425 ++++++++++++++++++++++++++++++++++++------------
 include/soc/tegra/pmc.h |  60 ++++++-
 2 files changed, 384 insertions(+), 101 deletions(-)
