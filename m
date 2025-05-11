Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FC825B1D5
	for <soc@lists.linux.dev>; Sun, 11 May 2025 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746981518; cv=none; b=Km78rwGSfUrOaA3w0xv+raehJZO1PwGeWdGzB3D57R9atnQXaMJ9TAq36lcH97SVo6jRTxKnAinCdJRyhQ6N3zoEaCQS/yHyfCInoFVZP8S2U6FFRwXrWbmR8pBJhOODJDPIFMisSrag+yzu/9i+dHEDhFuYh8Wm15SuAYWHwjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746981518; c=relaxed/simple;
	bh=b7A3g+7FnjZX3AlWNAwMCgAvb5XivPBGGZzWPE/YAA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V0VEuoUzXiQXwfVXeC2SdJaUBp975hmn+FvRde8Ft8RDWVF9dCE/7mflrPru5Z2PfsHiItiVaGICM28jUI8LgFhG+8IM8ISh4PJNjMbu5qt9gV2pZEOzn57Y9Vw7hRuXnt70mwepLs23Dll9/HrlN3KyL7GDpfWG18Q6FXm4DOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2LoMIUNa; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2LoMIUNa"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7410c18bb00so3924775b3a.3
        for <soc@lists.linux.dev>; Sun, 11 May 2025 09:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746981515; x=1747586315; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=48hZo8VzWZdHTpogELRWbdlbj5PPFuDYOO57nCwCu9Q=;
        b=2LoMIUNaCaqwL7HuDULMRobX0x0TVDhALAOjvGp1pdWAR75vyEvSU/ZeeZ55w2MLki
         3zAYtrGiz2MeGrtdJyjJbqjzDcqNBpvz1FwA2IWfqwtZ+GxIlMkgSx6jh2phEQNEP4Wj
         7JZFA36NSWzO623W0xSZ0aesfuaNYbbqv9XofHyW8puH5agTiSy278Gcgki1jjy9craT
         8mxJ30E5ZlfvPjhORwzBwopmmpvQ1ktlqvwWEGC8Xi8HAosdFyyoo/OydzEmKsZOgYfa
         xhklD6IzILZotNkjCfYZhr+HuVbzT5HUflefuC/G9O32gvMIc+9Je2bbqQhLCBMydV+z
         JCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746981515; x=1747586315;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=48hZo8VzWZdHTpogELRWbdlbj5PPFuDYOO57nCwCu9Q=;
        b=XYkGShajMb1ncb9Zqe8qGR/w7lrqmBj4qjWkwObKS/OPY9yfGMRkGlw99U2S7UTcv3
         LIWEiB+0uuF2TwizC5gxqwEdbNJ4RS9V5xS+P9bGsL3WNHJQx+PGPedbMj1CMt+Xmwhj
         2Sjb9wxRfpZyZdmXlr0MV14YttnTNK3GlhrctdKJ80Yy7Bn20J7u1J933+5UN4T8y6PR
         cVA+tHsEhHEioD07cxp34eOewO3TGtiPMDnUemWBUD+eWiJS3P2QCbYD2t0ZCFOEeBwi
         SqRsICGhAuhn9gjMYgJmxWQbY4t5+ap0nT/lYxXUvFJo25UFkYy/iaxYSA56xAQevu+L
         rm7A==
X-Gm-Message-State: AOJu0YzJj4hyWzGbzaNxhR9lTIUengBvecyqblNrBC08EQ2ZfQF1ytCk
	H6/rcNw9r6U+ncNky0YjMyJKZFtE3VbccqXhhF1JdjOYl+LgVClQ00KMCFIHr+gcc1hZTVUviQ7
	gJCFYtDrq
X-Gm-Gg: ASbGncvnItjE3XmXd7sLRPv/BNpqVbiBMjl6gdmzb8fGXa7KH2LYxkCYn9oFyy8/lWn
	WqvqU9GrSF5JMxw0jO/JoOlzvew/WGsPzS9P5fabsTv5fS+t05GG+vvwQXbU346O7qtDuU61Wp8
	UtKTV44QAR0Wi84Ko0cHm0RtNpx5sw03iNj+l9GwbK0rNnM2Y1+Yt2L8objbgLpz23G5mdij37L
	qMF3sjggRwWxBTm9a0URvy9MeT5y4+7/gYvXjhLmR6O3kcObBKlVl8AdKfhuG24G1uPYmoZe1rc
	lwYEeKKnFjFHuk+NL0v8zLGryFh1MPJCIviBjssTkEjYjDEGpA==
X-Google-Smtp-Source: AGHT+IENxnkeTCU2mQLGBVkl8Moj68KA+2IRRcGPD6paLo/iLVGUVJ6hgM0VpDWjUGKVZhQfNHz1FA==
X-Received: by 2002:a05:6a00:2789:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-7423bc0d8dcmr14402736b3a.7.1746981515436;
        Sun, 11 May 2025 09:38:35 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237736d51sm4776797b3a.65.2025.05.11.09.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 09:38:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] OMAP SoC updates for v6.16
Date: Sun, 11 May 2025 09:38:34 -0700
Message-ID: <7ha57jrtkl.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.16/soc-signed

for you to fetch changes up to 47fe74098f3dadba2f9cc1e507d813a4aa93f5f3:

  ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY (2025-05-08 06:15:09 -0700)

----------------------------------------------------------------
OMAP SoC updates for v6.16

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: omap2plus_defconfig: enable I2C devices of GTA04
      ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4

Parvathi Pudi (1):
      bus: ti-sysc: PRUSS OCP configuration

Sukrut Bellary (1):
      ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY

 arch/arm/configs/omap2plus_defconfig        |  8 ++++++++
 arch/arm/mach-omap2/clockdomain.h           |  1 +
 arch/arm/mach-omap2/clockdomains33xx_data.c |  2 +-
 arch/arm/mach-omap2/cm33xx.c                | 14 +++++++++++++-
 arch/arm/mach-omap2/pmic-cpcap.c            |  6 +++++-
 drivers/bus/ti-sysc.c                       | 19 ++++++++++++++++++-
 6 files changed, 46 insertions(+), 4 deletions(-)
