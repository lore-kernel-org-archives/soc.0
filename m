Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3B12CCC0
	for <soc@lists.linux.dev>; Sun, 14 Sep 2025 06:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757831978; cv=none; b=g5AG8jZkD9oUZ2A494ukHzVtxyTNg6k4gWsVf53hlBhY5zmdOyWM3QegCNn9fy/erduCBXXVWPemBU5+7YerRp9MR7IT7jexKZkMmEIP73gE1suA8JYlt9uVwedOh10CVan28nmlptARLBLCjwdrn+YmzylUSydbW5hCFqe1fCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757831978; c=relaxed/simple;
	bh=FBMpkEG3xuVEi6X8+YIzbjr4P6M5NPjehQ/mvrGD7Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kcCd1Dn2ZJj532hPwvp+fYDjYbcBjTnnQC8knQEghq0O11z3izT31n5KUnq408+/uoOioG14UaWfMoX+O1FXOTYjBp+GQqqZrcYTZNJfPVFNQ41hLHm8Fn1odERQH0eXFudbMyvr0QOC5vCrT7/H5vRQecUCfC7rAa/08WuBu+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXMYvQN+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXMYvQN+"
Received: by smtp.kernel.org (Postfix)
	id BF90CC4CEFA; Sun, 14 Sep 2025 06:39:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03395C4CEF0
	for <soc@kernel.org>; Sun, 14 Sep 2025 06:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 03395C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so28047015e9.0
        for <soc@kernel.org>; Sat, 13 Sep 2025 23:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831975; x=1758436775; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iROJ2tx36gbrZBejvZUL/Zr/rsiyI59LCcbHtmzoHL4=;
        b=BXMYvQN+PwB2TcZo9BB1+qX8QqLh5cwJKlYFFYYN3SKM+Z8KOLKuIGtiJb77jjiUT8
         hnwGUvEkf8/9kBpkvZdlnpNeYXV7jgAb6MBqAMrVKfh9sM2D/eL8hbj4J/DfzZ/cosy9
         6dM3mhWfr0UicHq0662Y7+kRKb44NJzapTfdgKQOhjkT/CtgEml1yoMfzSp47q4cyu67
         zZG6bnYmXB+ODJTC1b6cAr2LOAMRlwkcZO4iAWAW8800z5PtFZWZgzheUB59KOar1c71
         wXZlW4MhBIyZRfkbfNGpl0oc//QTjVT/A1posa2IAkyuhsgNOSBpvPf+uDwVMIjLgDXX
         aR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831975; x=1758436775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iROJ2tx36gbrZBejvZUL/Zr/rsiyI59LCcbHtmzoHL4=;
        b=JNlV0GY2rLwzup+LdG4bAVLkG61fuH1wIuCUzSxvyJnVXhNSvdoisu37BTb+FpKYN6
         pUtVWDRcYV4SRlCX/wycwDHZpLPqy71mT40Dxza25wNaG2QtGZimoIKG8AeW84Nd3err
         O5jmGdJKeVOvvFX/+1tCE1V6lzM6Zhh4Tr1IH2iGvUAgutLaPKf0v8JrKXpj2PyqanHq
         MXZGlyI9fRdW2whHVrxPOJsPSShnhK+drWH+QZUtYfrDvgjMOfeuHShjOs8Z20bQUNlT
         rUDIbABqXYpSpY07tgXSXHVPi22JMn2cEWhuHZKPe0FKddAaG60G1KbLMQiTQaMUBrnW
         pt9g==
X-Forwarded-Encrypted: i=1; AJvYcCX3a/gy3sFf5KVxMz6YPiqviTHYx4AwGQIKERH5/5XmX5YNpSZca5TmTPvZQGkTNho93HY=@kernel.org
X-Gm-Message-State: AOJu0YweXqpIBJnnV5h2XnLl+tT+jM7RQSjBrig4MR7J8hJOT9WfX/dB
	HBe9OWEuh9HqqLefOHn6r4/TfUTUkAGjGOqB0x3lAEHKGJREI7+tUW988S4I4w==
X-Gm-Gg: ASbGncsnw5+QmfDCgcj11TEgyXZrhFWrZCtewJsfdFnrHxoVP665TrBrSj3cwalDxfM
	XhqEVFvhslZTUL+mpVEG+9d9rhJeKt4BV2vgsERr2HKZOKbOFIZt/74+PZNNQ+hikvHsHw5UYg+
	+9y58/F4FrFHpsePoaU6ujq796YsdkGKzEENEdx3Vp1VnvFuTyLh8JdAewosQygOAjaLB7QaQX9
	VB6TtNO+x1WZE3YuvkPZPwLHlpkU46Mzwp55NXYuVUmRk/vpiTZCjt05CVMlpVnDe7yrMGvhI+v
	ghDi2AJ7zN4QkRiVmizD4Ue/1FU4aN4DwUQDNx3GR5GqU3MxU0oXlZNdxHItipmaXswPS/Jsk5a
	A+twNcUZMiwy1ck/Gy5e5PAh8qeVVpcCWBbICjbyhsCQWHAcr5FgXRO+hx/jHs5NknWSE7PPAq4
	TfA4sKvBa0mCXuKQ==
X-Google-Smtp-Source: AGHT+IFW+rB6aGFLs4VDxuSN9TMDXFvYUKQVvW3JHgJgSZD/moUw8NiHIlbWSVkHBC+L1vElMhYi0A==
X-Received: by 2002:a05:600c:6610:b0:45d:cfa4:ce10 with SMTP id 5b1f17b1804b1-45f2128d4c1mr71751335e9.10.1757831975159;
        Sat, 13 Sep 2025 23:39:35 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e015313a0sm66917115e9.4.2025.09.13.23.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:39:33 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] ARM: tegra: Device tree changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:39:24 +0200
Message-ID: <20250914063927.89981-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250914063927.89981-1-thierry.reding@gmail.com>
References: <20250914063927.89981-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 04f27a0fda6b6be104531eeb95d07ef1b3a72af8:

  dt-bindings: arm: tegra: Add ASUS TF101G and SL101 (2025-09-11 18:28:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-arm-dt

for you to fetch changes up to 73e23d3bd7220847c3b1554ebe29221f84a01e95:

  ARM: tegra: add support for ASUS Eee Pad Slider SL101 (2025-09-11 18:30:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.18-rc1

Add DFLL support on Tegra114, fix some issues on Transformer and P880
devices and add support for the ASUS Eee Pad Slider SL101.

----------------------------------------------------------------
Jonas Schwöbel (1):
      ARM: tegra: p880: set correct touchscreen clipping

Svyatoslav Ryhel (4):
      ARM: tegra: Add DFLL clock support for Tegra114
      ARM: tegra: transformer-20: add missing magnetometer interrupt
      ARM: tegra: transformer-20: fix audio-codec interrupt
      ARM: tegra: add support for ASUS Eee Pad Slider SL101

Thierry Reding (1):
      Merge branch 'for-6.18/dt-bindings' into for-6.18/arm/dt

 arch/arm/boot/dts/nvidia/Makefile                  |    1 +
 arch/arm/boot/dts/nvidia/tegra114.dtsi             |   33 +
 arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts    |   61 +
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts    | 1251 +------------------
 .../nvidia/tegra20-asus-transformer-common.dtsi    | 1268 ++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts       |    4 +-
 6 files changed, 1368 insertions(+), 1250 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
