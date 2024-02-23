Return-Path: <SRS0=8G8C=KA=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C4DC54798
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 17:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48C2CC433C7; Fri, 23 Feb 2024 17:48:55 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BBDCC43394;
	Fri, 23 Feb 2024 17:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6BBDCC43394
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so102171166b.0;
        Fri, 23 Feb 2024 09:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708710532; x=1709315332; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RrYVnNaRmD/8rrhice/zUEoVqJn7gxBFdzuygNeRdc=;
        b=Q7+3PxBxIMm4WqbUnNw99t9nU15mNZ9nxUaq6L2gQGndTgOHAwZ5KXXX5yY8v0s5LS
         5YxF7QPPS2RIUr5mQZE/CmR8gx0Pibw/x0DzZ2+a6TgxJW/vifBSFTZ3ZNXOMyYIH4zs
         4Tdsn3uwh41xXkRDW8ufvwnzwC6NKjOHBuhyuutDwZZiqO+ss4SyslFJlCG3eN7Hux6e
         1Dxo/SdyXgGRucOipRKuDB2aoexJhXcw3YbRVrHhUNXUk/GgpitIBq9QhFzlH1PwHDiJ
         2+dwa/gwRiOecSxWFNafA/sBsGHjhn3nyLyWRFQMmmRFdZnY9jObOBT1wjSoks9RxWYP
         dlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710532; x=1709315332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RrYVnNaRmD/8rrhice/zUEoVqJn7gxBFdzuygNeRdc=;
        b=P0gXSWlBOG71CuhRr6lKHDctfZevjJw+fq/yoAUmZ7Ywe5zY4SLD8730HCUN0glkiJ
         dsLdFMm2mV02dodoJn9A0nm4M/WYUzhqLc4Qmv6Xh0zjz7uz+Is64D+Ae3eSXTyPKVGO
         IoPRH/ZLw7+n2OxUeYEiGxjb/Vph2DDEz1qY/c0to+qCTgEej2Fgw8b4A4hMH60O8X5s
         l6BZ4+ubns/gYZNen1Wq6jD0U5hnbnyOQFWtf4LNJhEnJtMUdZoOO8QPkcBpRnOb8t0o
         mactXwnUHYu2j3DA+MNJl0rZIQdY4JSwae8iEhp5FMQhrItSXI1DRD0fH8GGURDoe2gd
         snOA==
X-Forwarded-Encrypted: i=1; AJvYcCWw7X5fVer7QnhTqnuaSFWrv2Z9748CahNboYZFdpIOy1HewDyzVSSW8xoU2vAmj/rClmoifBrK+ZXCs/lYpw==
X-Gm-Message-State: AOJu0YyyVe9tmx009gijhVScb0gTVp9qCkM0WqapKbtwDYnpGqdOGzWC
	tPiRHVwAvd4zbeECZySbMuPBtL3PiFd85eQ9kdtP1CRcMji6tOUcxeIgLy7d
X-Google-Smtp-Source: AGHT+IF57rhhVdRqu6RONusoD/RkywTGvxiNFKHjj3MCHgDdawt6/78fxqbN2NNErg1F6RYnU3+Zfg==
X-Received: by 2002:a17:906:8d6:b0:a3e:91fd:c0f0 with SMTP id o22-20020a17090608d600b00a3e91fdc0f0mr252167eje.49.1708710532209;
        Fri, 23 Feb 2024 09:48:52 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id zh11-20020a170906880b00b00a3ec216ec6csm4607097ejb.45.2024.02.23.09.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:48:50 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] firmware: tegra: Changes for v6.9-rc1
Date: Fri, 23 Feb 2024 18:48:45 +0100
Message-ID: <20240223174849.1509465-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240223174849.1509465-1-thierry.reding@gmail.com>
References: <20240223174849.1509465-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.9-firmware

for you to fetch changes up to 1315848f1f8a0100cb6f8a7187bc320c5d98947f:

  firmware: tegra: bpmp: Return directly after a failed kzalloc() in get_filename() (2024-02-21 17:10:32 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.9-rc1

Contains a fix that makes sure we don't unnecessarily call kfree().

----------------------------------------------------------------
Markus Elfring (1):
      firmware: tegra: bpmp: Return directly after a failed kzalloc() in get_filename()

 drivers/firmware/tegra/bpmp-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
