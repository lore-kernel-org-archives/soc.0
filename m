Return-Path: <SRS0=+HJT=L7=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD190C4345F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 18:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89C4CC2BD10; Fri, 26 Apr 2024 18:05:26 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE97CC113CD;
	Fri, 26 Apr 2024 18:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AE97CC113CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3476dcd9c46so1815125f8f.0;
        Fri, 26 Apr 2024 11:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714154723; x=1714759523; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wNp87mCj+UBK8zz9Z1MbjXrA+JcnQ3PEmFlr3lO6XQ=;
        b=Duj5ytmUzwyAOuG7myxOZToiyhleM/RpTUtJ+vaGAS662257sweQSekUPobHSToK92
         oL1KEnZnusFDvGMWPFB8OZRMbgIXLBRPIjHQ6BbocKwbwug3MbjHXxj2PwaEiwWZb5OJ
         P54VhK6afq7XyCP4t2dNanscyswjNzFYOJW2pI150yuZYsA5bWrXUIioYG9JmqE/3uRx
         J0InoRJ864H5C45flXPtwGNrlWUJQZlBzsw13ClZF2Iok536L5WTbidDrHWMr4/2upLa
         jK26Fe6RYfOBApHEcXthtM+6Wi++6yV+0jX80/NSLwZ3gS0t04Uh9EY1TIJ4FGUANB57
         4pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714154723; x=1714759523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wNp87mCj+UBK8zz9Z1MbjXrA+JcnQ3PEmFlr3lO6XQ=;
        b=CRBb3jXj/Qwta72O4XsJ/GLEsW9ENtYVVXEJSLGb1pw7ZfHFSNumzZ0Gqj3kCZxO/f
         WYnqC8Vpsv+8SHEpDt7F6M6vKPbkS+C11FJYPsQI87xAeni+cXE96SHvlshxHevTqzmt
         Z/87PVR31VrMpqHn7y8OmHpXhQjTCLt79VnCD06XJEU6baXstJvsMnL93hMhHTYTNuy/
         iSXbHbwydYicab/fZg2HHn0B0kX3JIU+DK6EUkC/i94NiE6tDO7oggqHKSk72+J0/WB5
         nTn5TVfMpAKkEu6smrGyBd2rpiCCrk/8qnpvqO/u7WKddQya9Nnds7srjPfCGNyUzNfY
         gK0g==
X-Forwarded-Encrypted: i=1; AJvYcCV/oBkTSsX3NMid8F/AiiTDC2TdMVhMdkn5M4AzX5nKs+LHKFeRqdS7nngsURerD/1N7WUW6UvXTDO/mbym7A==
X-Gm-Message-State: AOJu0Yy3esvdFLTe8osRBbCa83mg72bvb77Gn7sRBqhVMC/fYmpIfGwd
	bahwDZuEyXpxdRTXMnWHt8e4pumykxxnllIZwEjZ10SNK0qW4AQUHA1JMg==
X-Google-Smtp-Source: AGHT+IEDgC7qvlhIAo3wSZy9P8BGa3uA2mAt94X3P0agj/vrpfNpqRuUTjDT+woH3TXSvRb7dvKGHw==
X-Received: by 2002:adf:f80d:0:b0:346:cd6f:3fd9 with SMTP id s13-20020adff80d000000b00346cd6f3fd9mr2437261wrp.10.1714154723037;
        Fri, 26 Apr 2024 11:05:23 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h15-20020a056000000f00b003434c764f01sm22911332wrx.107.2024.04.26.11.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:05:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] soc/tegra: Changes for v6.10-rc1
Date: Fri, 26 Apr 2024 20:05:14 +0200
Message-ID: <20240426180519.3972626-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.10-soc

for you to fetch changes up to de024f63cea3ec833bc8a55be2753879e2750db9:

  soc/tegra: pmc: Add EQOS wake event for Tegra194 and Tegra234 (2024-04-26 17:36:10 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.10-rc1

This contains a single commit that adds a wake event for Ethernet for
some devices.

----------------------------------------------------------------
Jon Hunter (1):
      soc/tegra: pmc: Add EQOS wake event for Tegra194 and Tegra234

 drivers/soc/tegra/pmc.c | 2 ++
 1 file changed, 2 insertions(+)
