Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273B6223324
	for <soc@lists.linux.dev>; Fri, 10 Jan 2025 18:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736535251; cv=none; b=k2wAHk+UOw7rABHlZzs80G2HGpZS23PhLoYLy5pnYo383wcKoCoMV14nmJ8bkMxXCOkJ1dZ2E1j7A2k4HZ8bUD2z1M13FFzCsfsRAD1plQARk57HI2fyVS+vTKPdJZOStVJqXwZxGEcHIrd1/P9IuP6s8qhmSTfkj5jjo6sl4CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736535251; c=relaxed/simple;
	bh=ILhKQ2NtLIQeU0mxhYxB3F58THwtyCqd0wy7ClV+Bfw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=J0PfA4VFwRkzip5V2LrYxRw6fG8Ic8biyPJntEj3lN6Fr8RROT4SJteBP5bzSb8okJsyK3KixQ2amy1nmvqMlbCo0mgeEqVbM0qXz8niDWENRvku9mlOvy+yDsuvNPeullotelaPSZxNOR9dvALyXlwGeGEkvf5lN26qoBCMr0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UI98YLal; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UI98YLal"
Received: by smtp.kernel.org (Postfix)
	id CD659C4CEDF; Fri, 10 Jan 2025 18:54:10 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F20CCC4CED6;
	Fri, 10 Jan 2025 18:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F20CCC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385e06af753so1338794f8f.2;
        Fri, 10 Jan 2025 10:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736535248; x=1737140048; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zf//n/LaJv+Bc7QR1tIn9d7aeT/G2u5n60hqMFCkMyg=;
        b=UI98YLal59jrFRo06IkrbCUBc5rWeQQZ/37zN5JNBiuJjpcTef0wRkSnWY+IyNnDQL
         31YAVmDKg6jgNi2rQ6Zq0pbGpiSOUE8wpga13tj7/u0YOkoW2FHDDRN0DvOYYIoVKFId
         Fv/rzwLctsMXlyw6AlrMH/QlclH/2IGoLda0rMvisakwCTZqnQ+NYxqAwIafCezH5GC+
         P7R3Kd4hZAk2Kt4e8xnP1fkxYEzVfrUlZM/Tw9hpGUavXxuRO2IpleCwShCl/Ulz85b6
         QaxKAKWSpb2ZldZLoPFU7L8Z2hPP1jKVGu6SNsMK5+naIle6mC9YVxCDNCigg+Uqe798
         EH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736535248; x=1737140048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zf//n/LaJv+Bc7QR1tIn9d7aeT/G2u5n60hqMFCkMyg=;
        b=VJja26Lc9LG9MLgj30L/XSu6aHV6+TacjzXWfijfddRiuJSUvwUAR0oKz+Ts24K9tn
         b4C3uxSz0lhXuc4iO8qVpbaB7XQSBA/zQP/8lHDmS71rNyCFLpmJOfInHHJ0oWhAiCQm
         NQiocROBtcx0YgGA8wx1HLabtFCPOIEc4mjX8Uqkk1MtEwGR+5hl23EHlo5bnNSNoprD
         PnUZk1tlqpZ39pPSJgBwyRghtqqPqXGjxorcmOUPhfucfoBDIHbO4pyKoYdd6yrnkR7b
         9GC5egYXoxUtPSCUK/oMMuO4B1onCNJ+I9OJKddrHHCmY5m2JcykzH/NOT7H9NAj89zi
         UPYA==
X-Forwarded-Encrypted: i=1; AJvYcCWpXe+bvfRCb/erO54fooRma4xVbuse0zDaoIIdm/oGVSGeXBKtVzqugto3N5OJBoe9XNY=@kernel.org
X-Gm-Message-State: AOJu0YyarQBmY0VDvZ2FiXcEF9XVR4lvoULxICBV6jWAcGJTBFu4g2ti
	Nv8RXFZB8HY/f2YCs1SQAsrqE98ogG5f0oKIVA+DCk027x8G0+WDGtPjLQ==
X-Gm-Gg: ASbGnctloRNhltJpX7ZPcEfVXUqJRXZ4zvWcUC52fzqRpAScm/Bs8vA+RdomrJolx+C
	9gE2PGTnwUGnrlLSRhRLOW5sYPZXddVKFhSmLGI94vEzkOX+glY+/ZJh+gr3MP4LuZbJwEF6iFr
	un+VJbzlBNAvLumNqd0qaOaLgDq22WO2xfF+5CfR+t4vocLZSbhgrfdNL6jhQvihSrZBg8HEBkB
	WZ7wKZw53cG4kzSbSvq/0ogLLpkHQmtUlaquSudNP+C5vf0w0rM5E4LJYnjyEiMg7DjLoKrVnq5
	VMlpnDq3GM5YefGT21o1gR3Y3DGrezDj573VfQPwKt5wLrlQ
X-Google-Smtp-Source: AGHT+IGZ6hlN+WoHP63J5jrBDfHHz+4clyA9GOi0tEzZYmYd03alnmZ6mmb51FMSnEhVGza4yao5Dw==
X-Received: by 2002:a05:6000:1446:b0:385:d7f9:f169 with SMTP id ffacd0b85a97d-38a872f6d09mr10013608f8f.12.1736535247484;
        Fri, 10 Jan 2025 10:54:07 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dd1957sm59993665e9.16.2025.01.10.10.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 10:54:06 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] soc/tegra: Cleanups for v6.14-rc1
Date: Fri, 10 Jan 2025 19:53:51 +0100
Message-ID: <20250110185355.4143505-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.14-soc

for you to fetch changes up to 836b341cc8dab680acc06a7883bfeea89680b689:

  soc/tegra: fuse: Update Tegra234 nvmem keepout list (2025-01-10 18:51:46 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Cleanups for v6.14-rc1

This contains debugfs error handling cleanup, a typofix and an update to
the FUSE block's keepout list to properly allow reading these registers.

----------------------------------------------------------------
Kartik Rajput (1):
      soc/tegra: fuse: Update Tegra234 nvmem keepout list

Krzysztof Kozlowski (1):
      soc/tegra: cbb: Drop unnecessary debugfs error handling

liujing (1):
      soc/tegra: Fix spelling error in tegra234_lookup_slave_timeout()

 drivers/soc/tegra/cbb/tegra-cbb.c     | 20 ++++----------------
 drivers/soc/tegra/cbb/tegra234-cbb.c  |  2 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c | 17 +++++++++++------
 3 files changed, 16 insertions(+), 23 deletions(-)
