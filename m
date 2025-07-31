Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4329A23AB85
	for <soc@lists.linux.dev>; Thu, 31 Jul 2025 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753979306; cv=none; b=hOBhzAw30IB64VMKlcGLT7pj1ISq4TNlL7Ue1W8dDJstWe5BgFOdikrCwX2odVHVGjmEXLeRVRlOFhVNqKxX6sD3gegr1Cur4ORvmHHhSKKr5t4C0W+EwNOOOZUvvspOXZUU5igiZfs6JHwQULSo+CEKCnRnss6J2g7Ey6xSn+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753979306; c=relaxed/simple;
	bh=YtuzjCU41wJEnFoFcwq5nanMAlcjcrWVpheE/tRBn00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UvdD6rV+eDoOTFKMso80QhDD8nHjw5pYOU9OS0YLbaz4AlAqTyKH8QxaqIKp/xZc2mycTvsCXI6HZI8d6CI4AftwhhUwRuH6TFzdvYwZazaJ9dGsUyQ1hd3iSYbhDKnpykyqfwSwSZDdKwi4jt4LgItywJH1q0qb5RIMHvRGiF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNbp5kAU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNbp5kAU"
Received: by smtp.kernel.org (Postfix)
	id D9916C4CEF8; Thu, 31 Jul 2025 16:28:25 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D50AC4CEEF;
	Thu, 31 Jul 2025 16:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D50AC4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4589180b266so6176515e9.3;
        Thu, 31 Jul 2025 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753979303; x=1754584103; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUQuX9EcTmyMXIDhh04yCMIk3QAsrMOgdgEviKTt1/Q=;
        b=DNbp5kAU7PWtydV4WTWMnZlifzcny7HhnCtk/AyQxBSkTLow9erVZPNoJaD6MZgVZD
         biXDfyTtQu+uenNDpqNm0Doaqs8BYAnXbKmrf1MUVVMkVtubJ2ksFYAAIlC5FQ0wYUcM
         b0729Ylq7VqC0LCNI+tQuGN+wdGKBRFssEbKaID+rZa54qVcUiREJqWtBTc7NqA9ehA2
         BcVFVn9Z6hP/RW6SFOu+xp0fNZG+PvZpgeU32tlhsEdclqWAlFBBG0qbqNqCLWMS7ll3
         ZES+H59Z6wk1amQNPR8djoHW9G/CwVyJZtVUuiN8/J/6YGxrDO6LxRy1AlyDcBfAWokx
         B4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753979303; x=1754584103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUQuX9EcTmyMXIDhh04yCMIk3QAsrMOgdgEviKTt1/Q=;
        b=JAds2kbrj43su7H083duKbXtGXioa8Pzglcj52DHaqpOXtv+G8G1KuyMPa7L0dt6un
         Sev4guuAAotEl810/BI4hfja6CvcQcCYMzOeAGnwP3Vnyl1xaGIyeVU12TmXQBFECRm8
         wTphuZtyhQec/y0GXNLXNN+0NDzr/VH6/f8YYFu2lcY6IhIaJEBbkOGOgUbwo/fB1u/8
         3uT0OvqaXgIV2VJ28F2LOsy52rcXAeTlIShM30mWU61j1x6/+XfRWMR7kkjcLGI3wjRn
         N3QrdtroEMxLcj+UIH0T2dr2+YSCAZ2OEEBOrtD+t5Ypl8SPo/lnVMsUfQyRChVqbR5k
         KDkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXeT/BH67I3fBhrYQ0Dn7BdpXmG3BC+IPkM+nrOkQU+e36XM6Tq/xr+dvW6Sp4812B+p0=@kernel.org
X-Gm-Message-State: AOJu0YyFkka4caRuR6iVrDZ/eIfGMnrdR3TDfCEnTEAYaBuxCtkYJM0K
	DE3mYl8qcNejMB26wi3WIX3OcgmZAm0r9e/KouxPwLcsv6xYVACq0Mro34yx9w==
X-Gm-Gg: ASbGnctSQwHkjsoX19NG8W2woV75HC18zDwZqt3iWRFixMKPC1mfuBPTcPCYUPvM683
	aAFh0TRNk8zr9zVJnUDWVhnmSihipwgfyvNyCakpDbts9fQDXWoBt+w/pQfRuUlS1pXDLZu4dIV
	Pgd8FoCWFSRHi6BI4o2glBY8zxUy3qx10TeOS5c1O949ZnNyo2N3EROcG6l+nFxeSzOltWwe5NQ
	QY6Dnpez4+f3KjGzpCRp9faLFxMceaU1vVVc2OFuWu/kApxggNzpj+eqPbOG3ulRgGFXAG48ogL
	dPKbWuIzPpxvFRDU4AKkem3FHawNJp4i+EMTt7WGZ4Of2Yz1SHBKBmgsz95QDZRR80q/wF0mik7
	d9uv/NTPJjBzvpJy0BMbS0XPvgVObUe51ZnkGiBNMJ5sPmNpTuwmJM81G03qtykt+e3rbRx7q4+
	9Vd9ENqKn0TZLcKw==
X-Google-Smtp-Source: AGHT+IHcEzUc5fmL7aR35NqQbifBaImO098SauslIIzWmoLzT9eyyd/1zs4+hdMyqVtFP+GuFPg+aw==
X-Received: by 2002:a05:600c:c4a3:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-45892b94d5emr69940185e9.6.1753979302184;
        Thu, 31 Jul 2025 09:28:22 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4589edfcdc3sm32989405e9.12.2025.07.31.09.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:28:20 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] dt-bindings: Changes for v6.17-rc1
Date: Thu, 31 Jul 2025 18:28:17 +0200
Message-ID: <20250731162819.3329735-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-3-thierry.reding@gmail.com>
References: <20250711220943.2389322-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-dt-bindings-v2

for you to fetch changes up to 6f8dcceb29a9d3169dbe23d3516783139544de91:

  dt-bindings: arm: tegra: Add NVIDIA Tegra264 CBB 2.0 binding (2025-07-29 17:08:47 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.17-rc1

This contains one more bindings patch that fell through the cracks and
that's needed to properly validate the new Tegra264 device trees.

----------------------------------------------------------------
Maxim Schwalm (2):
      dt-bindings: arm: tegra: Add Asus VivoTab RT TF600T
      dt-bindings: arm: tegra: Add Asus Portable AiO P1801-T

Sumit Gupta (2):
      dt-bindings: memory: tegra: Add Tegra264 support
      dt-bindings: arm: tegra: Add NVIDIA Tegra264 CBB 2.0 binding

Thierry Reding (9):
      dt-bindings: tegra: pmc: Add Tegra264 compatible
      dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
      dt-bindings: mailbox: tegra-hsp: Properly sort compatible string list
      dt-bindings: firmware: Document Tegra264 BPMP
      dt-bindings: misc: Document Tegra264 APBMISC compatible
      dt-bindings: dma: Add Tegra264 compatible string
      dt-bindings: rtc: tegra: Document Tegra264 RTC
      dt-bindings: tegra: Document P3971-0089+P3834-0008 Platform
      dt-bindings: Add Tegra264 clock and reset definitions

 Documentation/devicetree/bindings/arm/tegra.yaml   |  13 +
 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |   1 +
 .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |   4 +
 .../bindings/dma/nvidia,tegra186-gpc-dma.yaml      |   1 +
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    |   1 +
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml      |  28 +-
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 +++-
 .../bindings/misc/nvidia,tegra186-misc.yaml        |   1 +
 .../bindings/rtc/nvidia,tegra20-rtc.yaml           |   1 +
 include/dt-bindings/clock/nvidia,tegra264.h        | 466 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 ++++++
 include/dt-bindings/reset/nvidia,tegra264.h        |  92 ++++
 12 files changed, 822 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h
