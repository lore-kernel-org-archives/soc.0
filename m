Return-Path: <SRS0=+HJT=L7=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B959C4345F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 18:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0F8CC113CE; Fri, 26 Apr 2024 18:05:29 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18D7CC113CD;
	Fri, 26 Apr 2024 18:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18D7CC113CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41b847a81d1so6014575e9.1;
        Fri, 26 Apr 2024 11:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714154727; x=1714759527; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XB49tGVq8/oqGDvYcm6xbYCDDcByu96D48kyxbsvgI=;
        b=nQYccyd2tf12P35zdC1MXTGcO3wGBYO0uHe/QqZgxnJUbLXBlQnuprOMHlK7PGRPSV
         sIhop6ZMhhJqhNscgpPc6WqfhxFbPGh519Piky5miWs9VVn+qhUqNtjJk2zt6GK8dRXd
         oT6yJLSR5mDWv3qgtNv8+Jfj/gXDTBslmcn7X4p8ndKVfFD6BFEajGbTMUSVAX7DqURB
         wteEiwwhVBqWV/6uHp9u2jV6LtpBrqX5AFysuXHE+tb2aUJksxstCmAWkAmWtndT1TSY
         HrMvGMraDcyHkZC1EeLCUv/Ulk3YircYLSnMUxtaDFCcinZ6Tc0ThBaCp1TwS3SgPxwO
         HRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714154727; x=1714759527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XB49tGVq8/oqGDvYcm6xbYCDDcByu96D48kyxbsvgI=;
        b=qy0RvJSgBn7sNYTPD+qGUaCsDkd4OAPzsx1VRYlmrZoIyV8rkMAwoyYA0z/Kz7/mUR
         vX99QOq77cX4+PAQvXr1nXdINYv7kKPObgTzndyai8KgM03wXGDuYyEtegUzOgU7a1+8
         oFKgS8jvzCIYlb31pUUtG1XkyzfQ5ZRlGoqJ+pcWW6RGkd8n9FwOUYgH0aVWBQICnBaC
         btguKLBbVRl2MQUUOBvt9lJoQ+TTbLErnogDiliVMM/cSEDTOH3CO6aWh7ni3PXwn3/p
         0iwPN0VscK8aCO9NfnP2JxyyPFXrGZXIWvJBhy/YuZujgc7+QgKmqxgWDENjFphLhVu9
         0jcg==
X-Forwarded-Encrypted: i=1; AJvYcCWJGPAFcdvZncp+zWaqM55DQgAaKRCqL/XeHe1ZXCDYbT2zTQRirqlqmaHCGO4UJEVgKJnzJ9FDDI9E21yf6Q==
X-Gm-Message-State: AOJu0YwLdDB1duXNl/sfuOBX0YY4zUtsNFWN6HScCkK/GtTH917s3LM9
	r3ohNs6IXF+G/7nB3oMkTkeEioE41c2y1mVFyVQW9ztFri8n6pN73ozNdg==
X-Google-Smtp-Source: AGHT+IEVOSuQqh6QuWNOlrA9S0aszuOQjxCnYwdaLsOY4O9O6H5Ry7seW3EvjqEvwKEDjgUIkaX4yA==
X-Received: by 2002:a05:600c:3509:b0:418:de31:7148 with SMTP id h9-20020a05600c350900b00418de317148mr3129431wmq.3.1714154726677;
        Fri, 26 Apr 2024 11:05:26 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c310900b0041a9fc2a6b5sm15091017wmo.20.2024.04.26.11.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:05:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] ARM: tegra: Changes for v6.10-rc1
Date: Fri, 26 Apr 2024 20:05:16 +0200
Message-ID: <20240426180519.3972626-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426180519.3972626-1-thierry.reding@gmail.com>
References: <20240426180519.3972626-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.10-arm-dt

for you to fetch changes up to ff4d7e172100e2c35c92ce96881c3777ac566528:

  ARM: tegra: tegra20-ac97: Replace deprecated "gpio" suffix (2024-04-26 17:45:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Changes for v6.10-rc1

Adds support for EMC frequency scaling on PAZ100 devices with RAM code 1
and cleans up deprecated device tree properties.

----------------------------------------------------------------
Mohammad Shehar Yaar Tausif (1):
      ARM: tegra: tegra20-ac97: Replace deprecated "gpio" suffix

Nicolas Chauvet (1):
      ARM: tegra: paz00: Add emc-tables for ram-code 1

 arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi |  4 +--
 arch/arm/boot/dts/nvidia/tegra20-paz00.dts    | 43 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)
