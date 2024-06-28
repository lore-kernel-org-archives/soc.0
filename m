Return-Path: <SRS0=AxmB=N6=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8676C3065B
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B269EC32786; Fri, 28 Jun 2024 21:08:27 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D83CBC116B1;
	Fri, 28 Jun 2024 21:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D83CBC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36742cc9c12so684336f8f.2;
        Fri, 28 Jun 2024 14:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719608904; x=1720213704; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3M10gHSCT9ZqfkPRyeEbI6mG0gmimMjtXBAckNGKm00=;
        b=mbOR47a33zZwkZxCFtZCwPBP7ddhaAp9lvCa28R9+lNdMMN4KKDIXkar5Z+T9umORR
         4rCaBf+ezJ+mKn/jrINnrI7Na1bsJEICLwTTMNSJk1hHndxZl1ZmJcE0LVzaWpLAOnTQ
         Xr0ko3lVoUAzEkfmT9y/6sMh8lz3Rkc7ACiME/y77q3JjEZQe3dKdEqR7GuaYJ0ZtGme
         ZqSLiLsPpsCKmyhJMvdcnUCC3Eudf1xMYc3qqi30wrMVP0S8kH8W5PXCaGZJo4emRTZl
         at/HuNRSseK4MLP6a04JIk8vtnCJki3XwrdKwfFNsWPN2AUeOhrEVlGNR6CqdHbEfP4/
         s2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608904; x=1720213704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3M10gHSCT9ZqfkPRyeEbI6mG0gmimMjtXBAckNGKm00=;
        b=Ho7VkAB7AupAkHiIkd9zVnqIcDAvXwxPs3hklSGyUjiGIc1wkQae352Vtj96OVk7gE
         XFaNF5zKHt6Zlij3UmdXrI56S4ciCMFuS8Q/GlfbXXRYcOBDiRn4xHxfReYCHCwtU65b
         rD+8gTkgVKQf56kKFcpaUsbmYrxLWplS3PNEXcfbF0rpO8796NtsN/F9NVsJ/VODnUY9
         zzjTY72RvJ1EMiwCFjffRmv4LquEJqdc72d+PQhMvgHEYZbkM4QZ4svVqAbtph8unSkG
         uFFw1YObrH5yvtKznk+Y8jvubP9rsfJtlIw4uCVln3FbTXxHTFs+ajeA+mMjo6ITlPXc
         bpGg==
X-Forwarded-Encrypted: i=1; AJvYcCXx/EsDPQEATptYkx/R0YyT0fnTU5UC6CPbwnBvHrYZe7CAJMnSu4DXBExPtN1MsH+yVfsAokG2ZkXo/yl2ew==
X-Gm-Message-State: AOJu0Ywv9Y5Qo3SCWS3zdsaKPq0dVFYz6roTi/G90TSUU4QmCwsfL9e7
	+vbpNZNbD5BQDaacUno0BLTZlZV5GEyVfpjDj/NT9FdLcC0ldPzcKhuXcQ==
X-Google-Smtp-Source: AGHT+IF7SyDvrv2zWQD7p80W23YSTxsrNmRRTwZzenMNxlVj3/4eQc3NnaWtkwyNsf6/mXLI4fyssg==
X-Received: by 2002:a05:6000:1811:b0:367:437f:17a1 with SMTP id ffacd0b85a97d-367437f1a74mr3282034f8f.13.1719608904001;
        Fri, 28 Jun 2024 14:08:24 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10302fsm3295473f8f.93.2024.06.28.14.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 14:08:23 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] arm64: tegra: Device tree changes for v6.11-rc1
Date: Fri, 28 Jun 2024 23:08:16 +0200
Message-ID: <20240628210818.3627404-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240628210818.3627404-1-thierry.reding@gmail.com>
References: <20240628210818.3627404-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.11-arm64-dt

for you to fetch changes up to 5e4bbe52207c3927dd2690e46bdbef6392d7bde4:

  arm64: tegra: Restructure Orin NX/Nano device tree (2024-06-28 17:37:19 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.11-rc1

This contains one patch that reworks the device tree structure for
Jetson Orin NX and Jetson Orin Nano, which are both within the same
family. This restructuring makes it easier to extend both platforms
in a consistent way in the future.

----------------------------------------------------------------
Vedant Deshpande (1):
      arm64: tegra: Restructure Orin NX/Nano device tree

 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  | 77 +---------------------
 .../dts/nvidia/tegra234-p3768-0000+p3767-0005.dts  | 31 +--------
 ...68-0000.dtsi => tegra234-p3768-0000+p3767.dtsi} | 28 +++++++-
 3 files changed, 29 insertions(+), 107 deletions(-)
 rename arch/arm64/boot/dts/nvidia/{tegra234-p3768-0000.dtsi => tegra234-p3768-0000+p3767.dtsi} (90%)
