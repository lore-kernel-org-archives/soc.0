Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E41DEFE8
	for <soc@lists.linux.dev>; Fri, 19 Sep 2025 21:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758318938; cv=none; b=UHu6fwVhXDCF190CkanysTQ29vAXs+cQH9wpId4m3d5Z92Qa/LmtjMiA4dSH7DTenOhZTuZZg6jvrLAt7+W1flEPKqD/aNzxhKlMoH/p6Kvc4X1GMCdwwc8KNkXwYn75uf6x+Uo+uDYjblfhHFI1FgJnACaBV6QNxAOD5wQ24R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758318938; c=relaxed/simple;
	bh=Kfflr/n9x8ObUPUWxY5SiWbDDf6rBC37dCoRqlvYqbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eoK4ZxSkXjq0Es7YyS8CD7P1azj7ZFlUjkEY/df7l524g3I51aHQ84rFEe7NZj95nE2AhIOWEa4qbFtiUxsOdfeH8530LDK58l2oR8iNCMyE4SJ/0LDZet6qj15IVNRJnabnyaPJi3C/o+poWDjfqy5witeiqef2WnzrjM3Mx38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=o99i2EjX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="o99i2EjX"
Received: by smtp.kernel.org (Postfix)
	id EDE52C4CEF7; Fri, 19 Sep 2025 21:55:36 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7C4EC4CEF0
	for <soc@kernel.org>; Fri, 19 Sep 2025 21:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7C4EC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-74c7d98935eso1414511a34.1
        for <soc@kernel.org>; Fri, 19 Sep 2025 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758318934; x=1758923734; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9GhVAJ8zczcdk5RoUmHUOCQ0cenVmOQiaDZXnPFubC0=;
        b=o99i2EjXcMkFa9PruKUHIuUpSo6gLa0VOO5MeOi3H8TIcdhmRiBeLrGX0L+PKkiF4F
         8rKAxFZqdTUqJ8o9gSG6vEOfX+djHvzHhtWHBIwXWgiXIkmOtufu/0dTVUAcuDYv4FD9
         BkOW2v/wIhnu78cRRKDQFnTAHYi4obwveCsRDsVtYbnJd3IcxGgdnt3rxSlpOyLZNvYf
         aQr2b5goX74S8Tb8GTrxjcMEtGISv2ScasYlM0Ve5EerKCcuZdSlbfzqRE8cawVcfSsA
         z5wZ5lt9M1HMvfpFDte9sv36qePp+HzDHebP2LW8jA0Obqh9UjlmrfrP3x8w9rfgRAes
         QE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758318934; x=1758923734;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GhVAJ8zczcdk5RoUmHUOCQ0cenVmOQiaDZXnPFubC0=;
        b=f5NzROQkWsp/lWaX7htFJuzfx2Q0Wd4ttBUBz9lPEeMX9lJYh0wlAOtqbF30IHfU+6
         jeDd4YYpPeIR176uHPDMfjJpgM159vouD2c7f8TVy0XUmrO+1CtAn/JmwonVAFPoSh2j
         KK5o9RI4I6Yt47aDEGOxBZ5sqyJl27+WPTlLqZJZRWOjmLzZmgIpLPnhy8Ys1i/gOBAq
         ZQdT/6/Bze+l/x8y6USn+zEa3hU1IyNNr7wFEJANd5AMvQgBiOXAXFxCNavt7ViY+FXw
         tfm5go3xDNuHIP8NBmGtvcL80b0zmYqxNM7jTCkI50QwO7mMYGPghr1dCVc8DT1ytlXX
         IckA==
X-Gm-Message-State: AOJu0YzE8mt2wMkkuqnPDrCMK7bJwbACuOPKH7+Ry8QACl43PfFdppnB
	W+OxPVqbSKDIZjmDEfBnoCN+F7C5NnlVE5j0+XL08frztOFBgDJGFe7uO7hT1Z/YG27A2jzS59L
	zARZVdmkLag==
X-Gm-Gg: ASbGncss3/HlO8s0uu71i5or7dUN/FsjO3Lc+gGrKHcQ68dPmtyedU9+BdIRFP1rvOF
	htapxDSP2YoOXT+m714MpOhbaPX4SgHx0bLYu0eF5jWzUcPqBd8WZ0ekdNURfIh7d8ge/GhhR8I
	SlOabXGz+/5wlNMvqpTTvytHiA/FmHKTgYunlnXYG6k0SIDaret5z3Us/WtQ1a7TzNxviKsVaTY
	c0hnUAwrMOUuGdVoaF1kt0INjr+Raa2RhyVLN1OGWEs88jgaatayCGUdzvYKDms9SPoKOsQfHon
	UaaHIMc/d3KMqkAau+5ulKC9WMncJ7lZEH8UyUxeNTlUCi/QetztdrOBY26pMFNBb6uO19Yv0yF
	zXa1l4zLDQsZ240lvJ8JX+eJrikfEe+lh+nFOhZxyIg+HziSY+FCN6D/ORw==
X-Google-Smtp-Source: AGHT+IEakeFSJ15e4E3+APHquCTiCy/olIvfzEu180a/k/E2WjZFyGY8R305NCwW8HGY7XD5NOI+Hg==
X-Received: by 2002:a05:6830:6d25:b0:741:3929:31a with SMTP id 46e09a7af769-76f70de94femr2698840a34.12.1758318933696;
        Fri, 19 Sep 2025 14:55:33 -0700 (PDT)
Received: from localhost (static-23-234-83-233.cust.tzulo.com. [23.234.83.233])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7692de28b95sm2926581a34.45.2025.09.19.14.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:55:33 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: OMAP: SoC: updates for v6.18
Date: Fri, 19 Sep 2025 14:55:32 -0700
Message-ID: <7h7bxup0ob.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.18/soc-signed

for you to fetch changes up to bb676996ed583464504123721195e98a708fbba9:

  ARM: OMAP2+: clock: convert from round_rate() to determine_rate() (2025-09-15 16:18:01 -0700)

----------------------------------------------------------------
ARM: OMAP: SoC: updates for v6.18

----------------------------------------------------------------
Alexander Sverdlin (1):
      ARM: AM33xx: Implement TI advisory 1.0.36 (EMU0/EMU1 pins state on reset)

Brian Masney (2):
      ARM: OMAP1: clock: convert from round_rate() to determine_rate()
      ARM: OMAP2+: clock: convert from round_rate() to determine_rate()

Kuninori Morimoto (1):
      arm: omap2: use string choices helper

Miaoqian Lin (1):
      ARM: OMAP2+: pm33xx-core: ix device node reference leaks in amx3_idle_init

Yang Xiuwei (1):
      ARM: OMAP2+: use IS_ERR_OR_NULL() helper

 arch/arm/mach-omap1/clock.c                  | 19 +++++++++++++------
 arch/arm/mach-omap2/am33xx-restart.c         | 36 ++++++++++++++++++++++++++++++++++++
 arch/arm/mach-omap2/board-n8x0.c             |  2 +-
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 12 +++++++-----
 arch/arm/mach-omap2/pm33xx-core.c            |  6 +++++-
 arch/arm/mach-omap2/powerdomain.c            |  2 +-
 arch/arm/mach-omap2/voltage.c                | 12 ++++++------
 arch/arm/mach-omap2/vp.c                     |  4 ++--
 8 files changed, 71 insertions(+), 22 deletions(-)


