Return-Path: <SRS0=8G8C=KA=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBBEC54E4A
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 17:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BB28C43399; Fri, 23 Feb 2024 17:48:56 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99442C433F1;
	Fri, 23 Feb 2024 17:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99442C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3d484a58f6so160073766b.3;
        Fri, 23 Feb 2024 09:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708710533; x=1709315333; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCIQ4/ulGlcNxPa3K1zhN2WVh/iOiWmpWx/RUanbjVE=;
        b=eoQ7wY7OAMKMev1Q4jf+OcV0Bp/VS9YExD8T3uFWw5QF47Y7WR9dk5s7Py4vDrVzTp
         83efu2q8o8Wf7SrScYTBbChzbcN4erqK5Bbnod3TbxtxE/oHtOO+CWNXighMVlzGITV+
         PYwKrvccVpmM3MGOjJS1hX8d2hsQOVfayg9/YH6OUEf+Eb8vqOQGW2takmDPNKSFjA+Q
         jwvCQoD5mJxd8JYCjuwC+MZyc4JH9yNhqmr/7Y+nnWW5I+XuBJakvX4xyKK6mvoO88N6
         rt5F3rLs1s/XNB3QJHveRhgoYNDaHX5EONNUTCflKyJiPkyBpWz22tbgWAtVFjSlvvEQ
         G/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710533; x=1709315333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCIQ4/ulGlcNxPa3K1zhN2WVh/iOiWmpWx/RUanbjVE=;
        b=Mp9F3GAJFW4gC8ASXDG66kiKyTX8IE+dp1AFbb9VeRXOceuqkzSfE9ROK+Vxjxe9s0
         bAxAthiXnPzpyMtjPf+fmtGFn/gOZ93O01yCTF9XgWPL6tx1lTXEdtg7z+K9PHM4Dk1X
         cW39NtdgGBsggy8mXj37JVWhxD9H2+jve7RsOT2jvpj2H7Gf0qL9vZ40asEiySp0K5q4
         GVGR6USC7hnXwGsGFeg5H89+vIQPtpSn+ZtMHkFjJii37lrYxRKdGQmY9cMWGeR4oEoi
         BFEEtpgwhLo8nZR1sD4XncNiOFK3+niCVvcgf1JnGurW7/9lwP3+aWsPBv/bF08lhreU
         3ZgA==
X-Forwarded-Encrypted: i=1; AJvYcCWZuRGIPvInMRQOEHLnRHJOUhdE7sAqJq6hSqY8mGdvAbuVgtqcfYy7mGRd9zkkWQMcY3cUwGNaHK7G9L4mXQ==
X-Gm-Message-State: AOJu0Yzxtk//5C15K/0PD9/HbYABnapYLgvDUlDEwr/43sT0SCfR7XB3
	PzzkIMhMgz+sOpky/mXClfv8ISZbYkd2zemVYYIefRjaYxAUourtHyi5QrgG
X-Google-Smtp-Source: AGHT+IFCdHlfDvpD/xE/JE4qwczLKirwa+8R4nIjK4wIyZVrgNq1q90NwdbzTuXQ/mRTEFScPS2jDg==
X-Received: by 2002:a17:906:4813:b0:a3f:52fb:f93b with SMTP id w19-20020a170906481300b00a3f52fbf93bmr344273ejq.12.1708710533072;
        Fri, 23 Feb 2024 09:48:53 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s11-20020a1709062ecb00b00a3ce60b003asm7163067eji.176.2024.02.23.09.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:48:52 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] dt-bindings: Changes for v6.9-rc1
Date: Fri, 23 Feb 2024 18:48:46 +0100
Message-ID: <20240223174849.1509465-3-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.9-dt-bindings

for you to fetch changes up to a82242d802c7cea66aa6630707c60a456657d1c2:

  dt-bindings: arm: tegra: Add LG Optimus Vu P895 and Optimus 4X P880 (2024-02-22 18:14:58 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.9-rc1

This contains device tree bindings additions for LG Optimus devices as
well as cleanups for the PMC hardware block.

----------------------------------------------------------------
Maxim Schwalm (1):
      dt-bindings: arm: tegra: Add LG Optimus Vu P895 and Optimus 4X P880

Petlozu Pravareshwar (1):
      dt-bindings: tegra: pmc: Update scratch as an optional aperture

 Documentation/devicetree/bindings/arm/tegra.yaml   |  8 +++
 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    | 58 ++++++++++++++--------
 2 files changed, 46 insertions(+), 20 deletions(-)
