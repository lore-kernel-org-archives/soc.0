Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E449143756
	for <soc@lists.linux.dev>; Wed,  9 Jul 2025 19:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088533; cv=none; b=MHXwcOSIIYuYvDXnV1XB23JNbxm7BUcoNC1VA10VxPuiKPwSMJ3Lj7+bkpiS2iw2Jr+5J1C+cZx86+FALs25oIS/p799o1n9J2USANVlrnEtGYyByGW6Ku0gtuCmJ6t/Rkh+jcJFJtDn3GbBx4ksPp+6iCamhEEkBWth29SQXVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088533; c=relaxed/simple;
	bh=Vg3SYFcxbZhfxzHwdzewVgAiginzpLipvsLFtGoX06g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AncCl4iP4aw60hVSgrIuvRFuhvW8+tZ6fPR7sJN84HvZHYdsbRiSFs9SjC5Op4qzJbwqnudqhP+Kt2uPZf+6WhvtAzZ8NVSAm2ucyAWg9PO0oGUAJ6wCfuBcGunmqHrga2zFNTNhn2SFQqQQrvfAYZnBwEZRviaXDPe/pUqfBj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p4t2n/mh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p4t2n/mh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b39c46e1cfso33716f8f.3
        for <soc@lists.linux.dev>; Wed, 09 Jul 2025 12:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752088530; x=1752693330; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IOUI37vOvArNOMfbDlU1r5BFH53BMkpjGIGFBJa2WR4=;
        b=p4t2n/mhQYrQ9sCRhBMqLxd/7Lfwh97asL2IUs9OoNrwBa8dwO1zd3+Nd4qWouPxsD
         g4wZ8z1R7JJX78niJY3ec2AN4uoOLyv6piW1XRu/EUKbZGQTtp4u9A87bQWRN5v2VjKH
         ausXcLj+rjZf+dsmn8H/1yOnSg7b76AU2YqzEZBozJDXvcW+w/UfJdhM0BqSFOLBozP8
         bQwwobs+im4rUBm35lexYHWC2cGmYopjogmU48zLvPELWInzMT2Qw9lQSOODtq/x9p2K
         LfzjXzTYI9TMHRsBvdjxZQVmGTNfbEo0urdfMwCuMbhNoDEThWCkjoNbKQ7WrhD5RZv3
         KGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088530; x=1752693330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOUI37vOvArNOMfbDlU1r5BFH53BMkpjGIGFBJa2WR4=;
        b=mYOPTZW3o2Fgn+ZbTiBMKjuC+ABCDadgQzlnUpxcSpzTFO2Nhsagg5gi3IIYSpCUTV
         etL4dTgmtlbNnFEdb0tLzWONjjM0bo6p+knIbbhR63EFVTraDVInrjGHBLPkQCNNYWsW
         Roie/iyKvKFORJLGXsoMOq0J2U00phVyzYQXCTJXr+Q1krxtCYto/B+W+is8oP2XKytr
         wXBQet/DpX5y7wJMq0wE1t0XMrV4PrZRW/ceKO9TdE6Z2ruVT6++nrqFcIzzOk9HQr3G
         8belyGCoywqA/zsYnwt2MUx2PBdknCVMz+lKa7W0/n3ZhwnHY3H4fTqaYfBu8QwHPQ20
         XSgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/55fnkyOQEwnxjIFMnWJuFFDK3pjJ0JJSsCs4WPLv6ZuUc3owTXF4rnmrFkrIgKuaUnI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbXxbiAhyxvPZc6PjkX/+dM7ar9938kl9dDJOEAzAYQxDgFxQi
	hTPU6+z8+9a5YAT1mkCG9MBf0NodtIKUMrYOyHiUwwDSVz+5uusLKEgJ252uDvngk8Y=
X-Gm-Gg: ASbGncs/ovEC/Af2CqkF7/8apLwicQZkSOBojKAx/hWm8WBgX0+hzbkADL4amPbGyNV
	LsnjbSPtukuhuVc3MTjqbfAMogHzMF+Bl3BWHgR5ZX4m6R+xtVwisTI4qIThCQnhexAy3d5btGD
	AUWfqINSJdiF7umHhvwgJe5JjK/ef3MOuboMBZ2v5wcmXHTD95jg86gTSPI393hmZFMf6orCVFv
	WVU/Rt6bYtsbvArvgcsWRb/wCQwcS43Dmg8X3oQvmEAL/lZG2qhc1hczoOWPIWnOx0MxytXah0Q
	FKFgYUx3GwFFCzin06SJShLwWXz+DqIlIkmcWJoh6lj55qXAlHsNpDIwdVHJr6pIw/A2suciMi0
	=
X-Google-Smtp-Source: AGHT+IF5fQuSnWVC1+1FSPZh+mnfL3zRfmekTmST3Oxxmhd4JajNQiGduP450T3HuQ8hjxFtcBtDTA==
X-Received: by 2002:a05:6000:2888:b0:3a4:d4a0:1315 with SMTP id ffacd0b85a97d-3b5e44e107cmr1444727f8f.6.1752088529780;
        Wed, 09 Jul 2025 12:15:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285dc08sm17159588f8f.98.2025.07.09.12.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:15:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] arm64: defconfig: for v6.17
Date: Wed,  9 Jul 2025 21:15:20 +0200
Message-ID: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1262; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Vg3SYFcxbZhfxzHwdzewVgAiginzpLipvsLFtGoX06g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobr/LrlRRiB7NlTXa7KpRiF8ppNyVSL6muQZyc
 U/nnYOJbbOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG6/ywAKCRDBN2bmhouD
 1631D/9+mUsRGRHWiIdpYnSIndM3CR/VSb5CpOedsp/WMUAxCfvyYm+cNPdqWe68MxqUBliQTxh
 1luK/jO2yNlAMjmvD96Q/UOLXSlS4g7NdpSePbKoaT3isLHiX8n972jvmX1pE684SlPD+rAl8Wt
 BflVWx59w+n0qWa66Hc+lMgBw58NXoJ2daiG2t2w50XLSdskrcF/Oadi1bwI5f00HEywZMPxKnj
 QkquXmlnBi6dyHdHfFGHu3c7k/Zjg9Qcy5F7ut+IOUC4wdJkHSsnAS5xgRC9nnjB5holPin6heD
 ozlaZ5iKoM25cHC3GxOJnmDjQBaRrMbb7vIdJkEVuQlr5HAFmKbPiZHusiVlJgVYMcu9nt4Axme
 fGeQkPXLKa6wxYWeS9QI+IrZEVm/Oai3bSurC/PZeyvoJu1w6pHZebKXR3FoPsLR0klnTkGBbL4
 zenZDZRqCT6Nq0kS8FAy0rAIyPykug3COaM4NCi7WsbJWpHXhM4hlrLXG5Rqtxo63beki5kfn3K
 yOoWXlfEQ6J9zcesgUhIyAFhgqvATrlJVJG318inhKHYbiR5YgeWikUbEeJGNlwgXDb6P2kITWk
 y2Hpg1qxObvXjVB6wKFdAVf++28TEW/v9h5UVrsnsxt4X5nEidEK+72Amfzl0J6zxKZ1N1/gLw+ ol9EG7e7CPuRbbg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-6.17

for you to fetch changes up to a7d7aebed4005b9c287f9bd9d22c273da63c9028:

  arm64: defconfig: enable Samsung PMIC over ACPM (2025-06-30 08:03:28 +0200)

----------------------------------------------------------------
Samsung SoC defconfig changes for v6.17

1. Multiple SoCs (including Samsung, Apple): switch sound to module from
   a built-in, because it is not necessary for booting.  Also drop
   redundant sound codec options.

2. Enable PMIC drivers for Google GS101 Pixel 6 phones: MAX77759 and
   Samsung PMIC over ACPM protocol.

----------------------------------------------------------------
André Draszik (2):
      arm64: defconfig: enable Maxim max77759 driver
      arm64: defconfig: enable Samsung PMIC over ACPM

Krzysztof Kozlowski (2):
      arm64: defconfig: Switch SOUND to module
      arm64: defconfig: Drop unneeded unselectable sound drivers

 arch/arm64/configs/defconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
