Return-Path: <SRS0=AxmB=N6=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A72FC3065A
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E1B0C116B1; Fri, 28 Jun 2024 21:08:28 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48E1EC4AF0A;
	Fri, 28 Jun 2024 21:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48E1EC4AF0A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-36742cc9c12so684342f8f.2;
        Fri, 28 Jun 2024 14:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719608905; x=1720213705; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYFsmnNucLgksY/hbrNkPuFtGN3fvvq84p3a3PKYmfI=;
        b=MzciKrQnHSCcOPFjKSjuJ86qtahrMgvnKJV5EWa2F8aTchVBfAq3FEEVU0UcKCQuuB
         aZu0JoPMXhec9dxzVV2wHkcfPUS8yW2EuEyK54tZhkcm9SMaoPu9uDk1Sm7O4fhnG12W
         CgzVCma4dtQYdn9R9gSjGli/tJP2sRuNVL+dmx4ih19BtcjRZTuaui/m3WoonXLvY8U3
         hiDp3SxO81Rnwf5Lt3ikArKhd8f/F4PvGY1gc/jMfpsUfDI01GPr89M6shjzL2kQ7SH/
         Rd1KEnSCQNiKHwAw1ok76ol7PPpgvgnLA41Hdg1WlfmtN7jFnDNiOa1RpAR6qNMTc6sp
         obhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608905; x=1720213705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYFsmnNucLgksY/hbrNkPuFtGN3fvvq84p3a3PKYmfI=;
        b=X+ol/F/UuAj48i/j3e/3F2vuVav5XOfudXCgnnQOsQ/jKEXLvOEBxs+Shk0Nfm8Ijz
         9prdbTEnNJZP2ZLvb1vOKWsA5UWz+XJkQDZgYdYYewczqTiDB4OdxqT8qL/AGP5wKil+
         2SURYfeTTmHEYznIy057QBwbFjRfLoL12MZQGzQY/5OyGKtQg27e/QlDQzWX63gmNRyG
         7WxysgIpr7uhSPsZ/OChGf8YnxunjdLwP0CR3mgfiN0e8hHQsrPnGxXPjTJ/ngKlqBIM
         CnxYyW0a1PYGJ5gH8TXPG4qAud27WQaeFDGqLtLm2SSjTS+q4YgfTx7vMr6irUTXV5Al
         mKsA==
X-Forwarded-Encrypted: i=1; AJvYcCWqD/iSPB2sp5BKBMFizy5ekb3CdM4ngQBkRDEqELddJOp/xAWVtbyNzF2z37yPT0iKWn6e+CAuETVCGG44Pg==
X-Gm-Message-State: AOJu0Ywl25MLKLrgDusETvF/h4VgIri7q3GKe0GurnMec+wDRhLJsoHB
	+UCMZJHZO1SgNQ7EFj1/ypZtFrWHYkKqp5TZVtWJBepXUbu2U5gup9q71w==
X-Google-Smtp-Source: AGHT+IHso1pi3hEugrAf4X+jvqXirbmBy8z7JOTxlQbB0GyKAYQDS4Zb2FVI1cR7gEq7dHjByfr+2Q==
X-Received: by 2002:a5d:6b0b:0:b0:367:c4c:1ded with SMTP id ffacd0b85a97d-3670c4c1f8dmr7704028f8f.25.1719608904888;
        Fri, 28 Jun 2024 14:08:24 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af376f5sm51186555e9.6.2024.06.28.14.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 14:08:24 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] arm64: tegra: Default configuration changes for v6.11-rc1
Date: Fri, 28 Jun 2024 23:08:17 +0200
Message-ID: <20240628210818.3627404-4-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.11-arm64-defconfig

for you to fetch changes up to fa071acfefe84dc0a6a612afd1d8a35b97feb99e:

  arm64: defconfig: Enable NVIDIA CoreSight PMU driver (2024-06-28 16:54:06 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v6.11-rc1

A single change to enable the driver for the NVIDIA CoreSight PMU.

----------------------------------------------------------------
Besar Wicaksono (1):
      arm64: defconfig: Enable NVIDIA CoreSight PMU driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
