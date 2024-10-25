Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F152F21A4B2
	for <soc@lists.linux.dev>; Fri, 25 Oct 2024 15:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868763; cv=none; b=r1TBv4RSm0OXXCoGyb5mNnn2PHU8as4NrBcHJcvdnG3RwoHVHWtPv2gZgsT7SfVR5tNNL+9kM8/AfxY/ECJrnLm1GQoNg53gEA0W0mFldHXoY4+ejIDz1EmIjdH26a3xCEwp+WwkgZV4sDzzkM2vGU4GzFYwWVKXdzzetVPmWtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868763; c=relaxed/simple;
	bh=6gLfcItkltgqW9XruEeIVu18tltGP71m8QHjikgtyIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g+F9C7jgTmeHHNpclEgvhNNXFYPtWH4eJ3ois+ZehFguOuMnKalPECOOEjy8ZIPO/TL7SQ7O0+CYyJzKye0scs2uyOhC51a74+aKvbOXcVckeAECRmIGwA7bPXE4Y0VSzW7tZxTxZXAwskuAjWh58tLYtUpEKfZNaIcjAUNxc3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXQha2jT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXQha2jT"
Received: by smtp.kernel.org (Postfix)
	id 8B8EFC4CEC3; Fri, 25 Oct 2024 15:06:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0499C4CECD;
	Fri, 25 Oct 2024 15:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0499C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d41894a32so1655426f8f.1;
        Fri, 25 Oct 2024 08:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868760; x=1730473560; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjNHunCnOdN+Wqqw9EShNJBoIyMpofWELciNyHFIroY=;
        b=OXQha2jTeY6zku1b+COL/8wCcrrsj0WQskNA0tTTGh1aBolg+6McPash0Mv1V+PoBr
         0p/ebfak0DIhJyp5IkaBAuJjEZsNtOeUE45kFfGx2BqHypKimYVqDQVa695crO7l5JHT
         avpZtYUE55oHrNS0l7HhpLnJEraphopu9GPO9fyDf7hLGiHWvzll+GDfOmM5vA2woVyO
         jas+n180kj5+xcYE9+6Mn/Kig04Q+CylI6mfmX+XQ6axw0GpVy/VTaiVELxu8msBp8zz
         Uxl3kXn1MWiWKF05ezRZeD8/1EmNnA0ZvPXsmvlCX2q/pKTxwJRhthWJGygd7+4XJjSl
         Zgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868760; x=1730473560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjNHunCnOdN+Wqqw9EShNJBoIyMpofWELciNyHFIroY=;
        b=AWGfiGK5CWp+RLjf7j2W9jQgxY2s3QAok5iHR81Q/Fo6Nxtz/22zeTRj7wV9EA3rh/
         WEK1bhvdqbuv74USDTxMF5dC3grZszxPp3xrl4sPkDVPQi8mPu8YKR5DEsH/fgL0SP4W
         mvrsX4SWT/B52UK5XzjPkScVnXpECo7ac0uYPgzOxAK+pPtTTRc+tmCrfYY725PaJHSQ
         MFyTBmLWb0X2h5GH+I3F4AEynsBF2MYXzGLzpw5c92luxBqpz0koSEMvEEaMI4VKotKC
         IUBmfyVFTrosNXPwvy5xkSIW23LTqloVJzp8UYRINPe+cfAkQUZwZsoeI4ol+zs8l15a
         8aaA==
X-Forwarded-Encrypted: i=1; AJvYcCU1K9p4twQT82tYeUVVMZeMTkT4S1SdzulFUpYkHjVJztZY74xrbS22jOoF7vr19dz5sKQ=@kernel.org
X-Gm-Message-State: AOJu0Yz8YfDpTto8xbAlGGCArP40TXtAZZjSF55/lIlvu/u7xd/6vwrx
	K0Pvw84Ipajd3pBrSBIirAp8DsCoBm9XZlCL83OFxTlgxpsK1hDdABXXCXoh
X-Google-Smtp-Source: AGHT+IHf8K+VrApDwK2P3P4VzLDOtAw06mB6pfqZu+1G2ln33vZP4xxaLpqz2VXts9l5TmzwFrO2TA==
X-Received: by 2002:a05:6000:1a54:b0:37c:f561:1130 with SMTP id ffacd0b85a97d-3803ac0c1cbmr4825990f8f.18.1729868758329;
        Fri, 25 Oct 2024 08:05:58 -0700 (PDT)
Received: from localhost (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b91f43sm1741743f8f.92.2024.10.25.08.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/3] arm64: tegra: Device tree changes for v6.13-rc1
Date: Fri, 25 Oct 2024 17:05:53 +0200
Message-ID: <20241025150555.2558582-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025150555.2558582-1-thierry.reding@gmail.com>
References: <20241025150555.2558582-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.13-arm64-dt

for you to fetch changes up to 2433e22233f07b2e03034fffcbaf6c26b5838bb6:

  arm64: tegra: smaug: Declare cros-ec extcon (2024-10-24 19:23:01 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.13-rc1

Changes in this batch add an device tree file for the industrial module
version of the Jetson AGX Orin Developer Kit. There are also some fixes
for the Jetson TX1 and new features such as touchscreen, temperature
sensor and USB-C extcon support for Smaug (a.k.a. Pixel C).

----------------------------------------------------------------
Dara Stotland (1):
      arm64: tegra: Create SKU8 AGX Orin board file

Diogo Ivo (2):
      arm64: tegra: Add SDMMC sdr104-offsets for Tegra X1
      arm64: tegra: smaug: Declare cros-ec extcon

Jasper Korten (2):
      arm64: dts: nvidia: tegra210-smaug: Add touchscreen node
      arm64: dts: nvidia: tegra210-smaug: Add TMP451 temperature sensor node

Tomasz Maciej Nowak (1):
      arm64: tegra: p2180: Add mandatory compatible for WiFi node

 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  27 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   2 +
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 544 +-------------------
 .../dts/nvidia/tegra234-p3737-0000+p3701-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi | 547 +++++++++++++++++++++
 7 files changed, 591 insertions(+), 543 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
