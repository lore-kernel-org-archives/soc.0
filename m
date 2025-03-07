Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C8F23BCE7
	for <soc@lists.linux.dev>; Fri,  7 Mar 2025 16:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364624; cv=none; b=QycstAsTbK3rx+M3IedvcjnRiHL9SCkOtFR0kDGmTITSK/b1nFzyTL/zeYiw/u8OFKrnwx9HuJYvC5dUik8d37KqXu3/hFRN+j/Z7AMEBI+7VEmX4qlmEYZyOKMgB10GYjTdfqAXG+E5lLfFdtqtF0oBQyIXQAd1V33VnxMTcp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364624; c=relaxed/simple;
	bh=0qnzuf7i/jWMEVzNWemdnSZK4YpcNbKodKiyZFGgWrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=or+73WXo9zFzDIpPURGiHDk/KdlCV8P8maZIDgbR6D3A8FcOVM8HlY+HW7M/V3VEp7ZNOY+KSn3iEIlpwPwLmMBCaXZFoNOIL0Y4p0A3KDfjShYoE72H643et0REfObgd/6ZjnrA1xkbO7+aa/eiZN+uy/IHsaPpefxTZlVUxCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2D7Nc+l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2D7Nc+l"
Received: by smtp.kernel.org (Postfix)
	id BB152C4CEE7; Fri,  7 Mar 2025 16:23:43 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B48B1C4CED1;
	Fri,  7 Mar 2025 16:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B48B1C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43bcb1a9890so20866335e9.0;
        Fri, 07 Mar 2025 08:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364620; x=1741969420; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gzlon5tFuk86yBNYpLrvo8alNNm8HUbC6vvcaymIgY=;
        b=D2D7Nc+lNH4Iy82fBeqSNV8C2vP1ZU6SKfsZH79zER5X81iktPNlq5UeIQO9BYXdj5
         cADBQ7BZoWsGL78lTMEg0eEI7g6u0QgQRd72gTLnr5wp0l5xa/skTKMnOebs8juGUVje
         fORMLhHx1JbhnEGSZJp2wBjpJ7X8Fug7o1uEQE8VjlKN5DQd/E/Znxojm7uwkDjaQgHk
         7g5Nyi45G/1LSsumKR6DFyeciMc/oNjIiVm519VeJdcc5fCuZenNlC5zNXhCGhw8Auda
         NnU7F4QmzgPE1/Q9QQW6dQfeEgm1O6h37nNVxr25q5wat1Ix3fQ7VUNObDZb751TVUKI
         pCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364620; x=1741969420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gzlon5tFuk86yBNYpLrvo8alNNm8HUbC6vvcaymIgY=;
        b=D0ZACEyOuCAbgOxfV2hEHpzefsyuowx7EPX3AjfjiZrwV0JmvzmAV3fCXy37/joH1O
         eD3gUY8eIykw+6uDvhoQR+FvPQLuxUFAdXi9U4HhO7h2Ia1i6HMValO33zzM685KQUZD
         D+6s9QA6BMRLP6YBK4Q1eKinVakmof4Z7fI1ikUH89f8KRbnzj2o1+JUKOzKa/rIzNuQ
         CftmpY9Jqwm4HSAB79IF4P/REyBqAiLzH8PnGSFmwaz+ZBO/eAU119qVMNdZy7O0QLM8
         UEmK8GpdXxMPmh1ivlYBgAQtzmn/Ybc1X4ObPNWYMt8/h6Qcmrff5cckvtQ1tfz9qP5T
         +TuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt3MN+4rqf+1XwYROaZjC6LjcaWrk1z++Qotg53OtrUUyPwnoDW/4DIsM2KpJk49kluM4=@kernel.org
X-Gm-Message-State: AOJu0YzXACeYhNoAiENY8K810qex2qg9EtX0/xjo0uoV5SSEJ65BrcYr
	0JwfQ2Nk4jX4T4jnK8y144LmoIrpXEBYw07s/QDkm9gKwSq2nJ8ICGl+6Q==
X-Gm-Gg: ASbGnct1mo0rBGV4OahyoqPRFd58BapY6UZtHAaGRjLTMAsip3tKeQV5XjdY1yD71ik
	KxFW8QkBMTQKGUS/bWXt4b6Y97h5hl+VOP8R2ou+xY98P1FVIbeOA0DXOtN3xCFtJnUeKutdFo8
	sfHgqqiT7tM/pwCIRjxdC9M11nPHeI/afwsbfdMV3tBvmuOLMmxQRfbvelC4AAILu/yiRSiUUCO
	SBT9iqL74H6O9MDYB47nuE8S3V9k4QLzwzWTFIpjvuUGNqDmo1Y3n8h7jaA7GlEtf+aYS+slsaQ
	uVf+Xs1sxh0F1eYGxgofybtINdhvwHXEa7gwdJyTrkL6Cb+Nf7i4s2oIwcF5I2YblmyiGrcvhKQ
	VFKE4cfnIbDD4775cng6k9Fju45rqHwn+ISVU
X-Google-Smtp-Source: AGHT+IEhX8ZynmyAzFMFULwh+yVEDu1g5TElWPkMZEgTtFM6On/PIukfaMQlBYq9jsNHdbJxeFWLFw==
X-Received: by 2002:a05:6000:2a8:b0:391:2884:9dfa with SMTP id ffacd0b85a97d-3913af01fefmr123803f8f.13.1741364619557;
        Fri, 07 Mar 2025 08:23:39 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8dad73sm57497225e9.19.2025.03.07.08.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:38 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] ARM: tegra: Device tree changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:30 +0100
Message-ID: <20250307162332.3451523-4-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-arm-dt

for you to fetch changes up to 237a868d30e7a744b64479ff98ad86b2e3008943:

  ARM: tegra: tf101: Add al3000a illuminance sensor node (2025-03-06 19:02:23 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.15-rc1

This contains a few patches that add some missing, display-related nodes
on Tegra114 and Tegra124, as well as a small fix in the display clock
used for DSI on Tegra114 and the addition of a light sensor found on the
ASUS TF101.

----------------------------------------------------------------
Svyatoslav Ryhel (5):
      ARM: tegra: Switch DSI-B clock parent to PLLD on Tegra114
      ARM: tegra: Add ARM PMU node on Tegra114
      ARM: tegra: Add HDA node on Tegra114
      ARM: tegra: Add DSI-A and DSI-B nodes on Tegra124
      ARM: tegra: tf101: Add al3000a illuminance sensor node

 arch/arm/boot/dts/nvidia/tegra114.dtsi          | 34 +++++++++++++++++----
 arch/arm/boot/dts/nvidia/tegra124.dtsi          | 40 +++++++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts | 11 +++++++
 3 files changed, 80 insertions(+), 5 deletions(-)
