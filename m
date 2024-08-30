Return-Path: <SRS0=qcKZ=P5=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F34ECA0FF8
	for <soc@archiver.kernel.org>; Fri, 30 Aug 2024 14:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE1ABC4CEE4; Fri, 30 Aug 2024 14:11:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 258CDC4CED6;
	Fri, 30 Aug 2024 14:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 258CDC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42bb9d719d4so9875645e9.3;
        Fri, 30 Aug 2024 07:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725027010; x=1725631810; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46Pu2xVDjmRb9SN/gPNAiK981pmTCgVH/Qk0A/m2lQQ=;
        b=cShBOj7zFKvIP8MQu2ZZykz1pjtGmCHVGTahkwC92ax+5111ZPTaKiIrS7uY0xyCLs
         i3FB+q2Ru2eGGFOQgjVGWNcyiuAxJimrNqzEZuQazYFnXeWqA2yM+2bgbI5xaoGnOTNs
         m1t8JBy027+oXFP4ytP6eWc/StLwlCwj77lDrDKPTiC+ML5/qFD+yEep9wlwwo8mX4De
         3qL2a+1w/FRMSOs8nzKFVDN5seESUqiLxBqdCskuFRF9r3HYihOfrvF0isguorZvCUPb
         4XWPKiC0fzcKifO/4ybO+OeGZ1GrKK7hbMZE9xpxa4U4x6ANITdj+XpS71B+cMvfKysI
         O1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027010; x=1725631810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46Pu2xVDjmRb9SN/gPNAiK981pmTCgVH/Qk0A/m2lQQ=;
        b=ls6QhEqspPIk89RluEdG8keyVl1I1JtV4CBgS63pjkhezYb38P8Fs4FVFMa/1fhCpr
         HuM6aVrhSKL4+4RjBR3KHBTjfijLz+3jRwS9nPQkyuYIS/U7J6kCSI+QfxNHoR7w82LT
         OHRC9lpFkctSVom+qoFQMYFaoVjEcF60NKJKEjhWFFcRnxzdhpLwBKP76Azja5LCv5qR
         TzXd1jXMnj7+eb9FGv8frrnoO5sIjd1Pe9JBS6ruoncnPY0D80ayJSd/6Mk06mcNnhWW
         gjgRfowbOPr6fZJUqTZ5DEqDJEDylfX+r94K5sZQ6hlOUBZyjKEdjjPxQJQjsXcZLWFb
         jG2g==
X-Forwarded-Encrypted: i=1; AJvYcCXkpqM67S+oeanOsu4Fkk7veDVyuik29A/RhQ60A032Qyq8/zu1eMIPwY34YWxYq38XyzU=@kernel.org
X-Gm-Message-State: AOJu0YzMft9x3HiwE7tDmanBzo7IxfLd0ryTdh7n7kzq+05EwmCy2jEd
	KmuST2idSTSGLo1qDm1TjK89AWNAHp5LCWBAWXy1Nqyp9zwzUoa/E3BhpQC/
X-Google-Smtp-Source: AGHT+IHdqpa68NopTVYj97JqK4wUDRPTK3BbA49Ueuq1PtVx0ZLZYybcNApVCirOtMkqMJgkrJfRoQ==
X-Received: by 2002:a5d:4682:0:b0:371:8bf7:d51e with SMTP id ffacd0b85a97d-3749b5448f5mr4645312f8f.25.1725027010005;
        Fri, 30 Aug 2024 07:10:10 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27364sm46931365e9.34.2024.08.30.07.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:10:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: Default configuration changes for v6.12-rc1
Date: Fri, 30 Aug 2024 16:10:03 +0200
Message-ID: <20240830141004.3195210-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830141004.3195210-1-thierry.reding@gmail.com>
References: <20240830141004.3195210-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.12-arm64-defconfig

for you to fetch changes up to 12803ded10b88b376026c544f1ebce62c44d64e0:

  arm64: defconfig: Enable Tegra194 PCIe Endpoint (2024-08-29 17:41:58 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: Default configuration changes for v6.12-rc1

This contains a single change to enable the Tegra194 PCIe endpoint
driver by default.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: defconfig: Enable Tegra194 PCIe Endpoint

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
