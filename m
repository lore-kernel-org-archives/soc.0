Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CDD374727
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769107310; cv=none; b=FwLdZOUAGVAl0dNTyz13iH0AYXXvRvwXzWN5vncuMmrCbvHaBO29Jx4Cwwk/Wa+cUoqIemYTrNJv/oBb+Kugr6EkwtD8Qa12BnYKHtbN+oz98IsixW7Fuii+oi+VyEZ5W8EK9CCLI6+SIbbiNBKIdevR0SGjuA5NJ0oSd/CwRsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769107310; c=relaxed/simple;
	bh=c8xIZqGOelDr8vR/kdjqqtA9Lii7KFTLqLW4/OAPLg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eYVEZStwvqt8Qc5ExVJynQAd9/E/lZpU+s6JBBsujYBtCvSW+9c7TeXVsw2BhXVXSlrvgUhGXmf18ABp5/zna6hN40QZcnLTlnwcwmEfoS1JbYshMewHtAwVVlVdxc7iFg9i5PGRloKRNCZdx0RBbxzCYRucyrSbAsPRXdfvE8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=m9iR8NqR; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="m9iR8NqR"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-823075fed75so671166b3a.1
        for <soc@lists.linux.dev>; Thu, 22 Jan 2026 10:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769107289; x=1769712089; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IqerNtZd/2eIPu0s74sVae5mDkPG9QDd8bnivU2GUiA=;
        b=m9iR8NqRIDArr06pBAy49fGCievii8LCN8ftqvJgfySIks4Ccc7cgTVQ1aX8iM0nUd
         MW9NdSmMLh9siA/wvhNV6YBk/4xGNFQlMXHo6qewkXE54enUeSxA6HdtbZjYNlj+F+Jk
         PkQNmwlcqLbKVaK2OhBmNLsu0k3JDFjrLxP6ecjZAwE5N65UcjYGMo1U795ho68iATKc
         xriNWA2uoGFiYQXU0taX8zA06Wx8xdXYjF4RrRts6astBxhkm8Eg5Dmfl4JIjifkOQ42
         ncVutZquyEG1rHwGsJmefHcRVqHfXEPQ/3JGVmhsQWuIc0CLSfLNVn24ShJ3pjk1JhBo
         F+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769107289; x=1769712089;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqerNtZd/2eIPu0s74sVae5mDkPG9QDd8bnivU2GUiA=;
        b=R139fsJ4c+anPaxEE6kC4cKt7rA7yCATtaQc/HhW0fpCWVtJNLtyF7feYNVf6kKeM+
         +Xnwbwh3jfqdg3xdn2lgn3BGU9dbFWEtTrU7asskx+oqdkKcuwbueJlo06PoinEtpm0g
         fMS13pdGpBoy13Q334Emq1rL25MOqnJvxdGj/AmPZyMRzHQ9rfFbIUqpQk8HTVPTKOA4
         uEB6bk2gn8Y8H6b9tvojJFL5VmUWbl5Dv6fjqq/WqSrtFQ+B5kuFPv57ZzEhcPG9ybCT
         gYyJ3yWI0LclGnqZly6yT04sEk5285iVBYpb2/z75tgq/evRM3Mk89GqnTDZ4abudTxM
         YXsw==
X-Gm-Message-State: AOJu0Yzl6emu5VWg1AtHRSv8Lg2Z3h0YN4STTcq6ttOVBM2J1U3epnwu
	gQHazxCKy62NAgtmXWXE7UCEiAjQhonm3yatKvEIDyF/Owqg7mpyW/TKdlK/HZWuo8GdvHIyFKt
	y3djNJ8I=
X-Gm-Gg: AZuq6aL4SfWrVUCFs74HfUlUQEtyBLAxbPM5vZhAGX1un1gbznDiv/mLM4vQDSfPHaY
	bD0ohNdGnYtcsKFM8yv6wHT3G9+GQphYynkq61HO+Izg5OB6ZxQmXW1VcCgOe7IdnP13UFotX/0
	jtpH9h4VPWT+EekhBrhCG2ADeoof8ltEE0eAeoPBmQbgL9v/7bBKP5IBHTVedflkb92/BTg4kZF
	omz4kWrFSlm1Q0G3eaLxqdRDtDLj5qz8OGr9kTBMR9dzRvzJJ+vOfCuD/OH7uLziuk5KLdRGG3C
	x0Kak3PowMRL0Y8YeB6c+ZWUxRIhonAYniFjrbAhkrD2TAEhxQbUfH9VOs5qKAlu1HgfZ8J6FmR
	TlS3cdXMDgERSxtCK1jT+ZENrD+HS7eSPFSz+AF0vv/LDPAKazisDUyjKUpbCbt2IufQLnBNyZk
	mtgYvsfooxg0wUdVfKnnU=
X-Received: by 2002:a05:6a00:2342:b0:821:8629:ef70 with SMTP id d2e1a72fcca58-8218ebb62f2mr3358968b3a.0.1769107288788;
        Thu, 22 Jan 2026 10:41:28 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871f2c0sm60366b3a.31.2026.01.22.10.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:41:28 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc/drivers: bus & hwsplinlock updates for OMAP
Date: Thu, 22 Jan 2026 10:41:27 -0800
Message-ID: <7hy0lp5w2w.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.20/drivers-signed

for you to fetch changes up to 3bd4edd67b034f8e1f61c86e0eb098de6179e3f2:

  hwspinlock: omap: Handle devm_pm_runtime_enable() errors (2026-01-14 14:36:55 -0800)

----------------------------------------------------------------
drivers: bus & hwsplinlock updates for OMAP

----------------------------------------------------------------
Haotian Zhang (1):
      hwspinlock: omap: Handle devm_pm_runtime_enable() errors

Johan Hovold (2):
      bus: omap-ocp2scp: fix OF populate on driver rebind
      bus: omap-ocp2scp: enable compile testing

 drivers/bus/Kconfig                  |  2 +-
 drivers/bus/omap-ocp2scp.c           | 13 ++-----------
 drivers/hwspinlock/omap_hwspinlock.c |  4 +++-
 3 files changed, 6 insertions(+), 13 deletions(-)
