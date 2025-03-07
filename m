Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E5C23BCF7
	for <soc@lists.linux.dev>; Fri,  7 Mar 2025 16:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364626; cv=none; b=El+emR5PqBHFaYgwWx1ePp2KZ3HMixc+NiTIxYyQtFrtHQn/PURX0iM3VrWLSM+YujVohtPqq5RjQKd/uH/AEtucB5YWZBFmCZZH4xv9+xFQ6G73ZIY0WuHHq3jGL6KuEDE3N+En0fSXlsG5ynd4hz7eq+6q4rrDyQjxeCUTQok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364626; c=relaxed/simple;
	bh=BvfJPnPoTJGAMOKyBRjxVZ6zo6K8+m/dLW0B09xMfn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p9j2TOTfJ97jA6dfuwyiEd4WoGsm7FsTbBknjvl1vDjjAkRWY0mx6QddV4Pp6n54zgrMvQadodawYIoR50FCB1e1NCB7nwEVIvhY1kXbS2dyDPioZkDxJRHDqTz/2HSNsDqF1pJL94VjA+zPMDMI84aKUXouWX4xdtWzBnMtsdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZCACY2q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZCACY2q"
Received: by smtp.kernel.org (Postfix)
	id 9FAC6C4CED1; Fri,  7 Mar 2025 16:23:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3AEEC4CEE2;
	Fri,  7 Mar 2025 16:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3AEEC4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43bbd711eedso16158155e9.3;
        Fri, 07 Mar 2025 08:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364622; x=1741969422; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6fFwuKvG8aQ6i524e9kMLuHLTSCjpwest+iUIY2vbE=;
        b=DZCACY2qyXm+ZLz2BvZGP7B0o9Z2HXasX25akF2wI4P36kEzqHsKIMT4j2Fphohjqt
         0c0MNOc4ksusbwLkULcmtJ3QjSKQjzVGfyNWO/WWVAv1YfscDlg+WoyOTnCEVOy+lE4Q
         1aoj+N+jUq0Y0LqUmrWbhxvTLOnHexdM96eLC/RAxVKXwLYOAnAYz2/o8bcRWg/GY7Hk
         z/B9yfFIHrpkUcLNXF/ZzUixfaFdrklVZP21aQAUNFPe3JDjwPftYj3aiHtmcqZdzwbL
         ARhRuluL14UFtaD4hN6vZ7TfftgAr2zc4BLzIkaiJpuBj0SF7xcKosVTaOS7E3NQtYys
         hL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364622; x=1741969422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6fFwuKvG8aQ6i524e9kMLuHLTSCjpwest+iUIY2vbE=;
        b=vJalOL9a1fuLRqE14cd9bIPXAhjr4izQGtfmWkr3jfm8bEVvnvCnu6OgTlVpR1yYYE
         pW+TYKCH2iCOSclcnqMBUG6ev45vmbYWG/k1FLMW40K54kZF7RoE8onMQYmxMtWQAhVu
         Uxb+dg4RiLRS4IR1aU4U4jJvGxiGiJWDD+Nul83TXZFNx3qLvo4OKTXUS/MyW+Uf1F0g
         HDmav/F7biGTLPkRlFQwexPZjmGNlLgWM17ZMYJqXn4/m2gQcnrsKoLdrcnn//RfTS5/
         Lzd2mujhXg6U4of03B18ToroHKLN/0gjaeCS4XsVN+O77GsUR7fLvaZzQPd42ECKS3Dm
         31tg==
X-Forwarded-Encrypted: i=1; AJvYcCVzPe7Pc9VbxjV3q4rvl1RUp9ti4AYIlzqw7EUx3UUkUQJxs5fL9S8SvSoZSnUHK2Zrw98=@kernel.org
X-Gm-Message-State: AOJu0Yz6ylVk4EPKzYU+sttMewaKH6Nkb6UUfZdhinWFimaeyvLJiILE
	73JGkcDOdJSHmSB3AnoSeCAcXqZ2vG8nsjxH9ZAZqxPB6RkdxJv9UVe+fg==
X-Gm-Gg: ASbGncvVkrQYngFD5hkLzyQcGlO7bxw5K1gl5LniHlXic26evxbXuTgbNSjSP0UIkMx
	DdQ4qmnoVBKAqbXKGBTQyt1tK0pvYPed/07qP8pOQcZlGIIPfGyG3zLkSh11Pt3MjKylr00NqC0
	N9Nsy2RD76wxAnofTvc+MQqzMq/lvq88BSz/qsNACbKLnkgwBK+HdFxe/vwcFT3j+ROvo6Kv+eo
	zqVU8M2jaw6+vNGRN76R34nCCkxFhw6bdUcMaX5MaOhHWAPsSCmSxWaRVUv1fCCXlYjUgWTVZv8
	UXEKAfteaBsj649SlGRWjb+slxSjQZOZqFQVdkRHto6D55SUNxnOmz/HbJrm/BluSrf9Eg25Z/+
	AWC4Z+aENcIAPTVzAckQ+AvZMVtF6gWRiAoEJ
X-Google-Smtp-Source: AGHT+IGYSZAdIPByuhfnlGvu8gIwV8NG9QDkn6z6XiamtvDMqZsy7KeQwy/cINDke3X/SNx+z6U0jQ==
X-Received: by 2002:a05:600c:19ca:b0:43b:cf37:c7ed with SMTP id 5b1f17b1804b1-43c5a5e5259mr24255695e9.1.1741364622143;
        Fri, 07 Mar 2025 08:23:42 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e2b8bsm5846199f8f.64.2025.03.07.08.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:40 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] arm64: tegra: Device tree changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:31 +0100
Message-ID: <20250307162332.3451523-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307162332.3451523-1-thierry.reding@gmail.com>
References: <20250307162332.3451523-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-arm64-dt

for you to fetch changes up to c33a71fd0e3644520af7b5926926c06597d6d355:

  arm64: tegra: p2180: Add TMP451 temperature sensor node (2025-03-06 20:35:53 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.15-rc1

This contains some cleanup patches that remove unused properties and an
unusable key that was erroneously exposed. A fix to support GPUs with a
large amount of video memory on IGX Orin is also included.

Finally, some additional devices, such as a temperature sensor, are
enabled on Jetson TX1, and the output voltage of some pins is adjusted.
A fix for the VDD_LCD_1V8_DIS power supply is also included.

----------------------------------------------------------------
Diogo Ivo (4):
      arm64: tegra: p2597: Fix gpio for vdd-1v8-dis regulator
      arm64: tegra: Define pinmuxing for gpio pads on Tegra210
      arm64: tegra: p2597: Enable TCA9539 as IRQ controllers
      arm64: tegra: p2180: Add TMP451 temperature sensor node

Jon Hunter (1):
      arm64: tegra: Resize aperture for the IGX PCIe C5 slot

Ninad Malwade (1):
      arm64: tegra: Remove the Orin NX/Nano suspend key

Rob Herring (Arm) (1):
      arm64: tegra: Remove unused and undocumented "regulator-ramp-delay-scale" property

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi       | 13 +++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi       | 20 +++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts   | 10 ----------
 arch/arm64/boot/dts/nvidia/tegra210.dtsi             | 10 ++++++++++
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts    | 10 ++++++++++
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi   |  7 -------
 6 files changed, 52 insertions(+), 18 deletions(-)
