Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA391FFC4F
	for <soc@lists.linux.dev>; Thu,  1 May 2025 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746095751; cv=none; b=dR81xlteHGRHYRJLqjYVNKFU6QVU/iaTjrYLNMZlPUb9/j2U/FXn6bIm/aiaXLz70/dlngKHRdCIx6YvI0GBn5US9kSvdy2sjLL38CqUuzvCvGW4mi/RpuxCUbfyiHrwQPTUjWJR5xAVJZJz/d0gn3If1UVDRNYiF6dGHm4mSYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746095751; c=relaxed/simple;
	bh=vNYmWvhVJQY/AqblF9NK9uhqlpRYbUIbtdpo5XR+1to=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hVrhlhe2MTXbcxiek/cHgmGxQaJNyzAU2bNHp5Vwxakvj7szJIpCIzbOq6haP5UqDW0+ZXE9JJ8gqYXvadewfyg1WaGY1QUW8aTUHYqFXcYTtaUsCfAdDPJh48jA0H2IPmUvjFUIW3GLbh/M0r0HC0QN683txEKpEkUiB8IgTR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f97rOYcj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f97rOYcj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso977405e9.2
        for <soc@lists.linux.dev>; Thu, 01 May 2025 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746095748; x=1746700548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0JnUeJrEz2QMwYoW3OD7Syx9Jdxy3i/s9a5E6cIdqNg=;
        b=f97rOYcjj03tZelNtRoy8fjogH+JnFsPZT2xkgSDoRwmBo0PCJJGsgoYCFM2ddCVHC
         KcegBiNJ/IOjf/N+GeeIQHiw6ragU3zYiA2EbsQ3jQ2PJc6AFmYJuk9r4eecsvzCTi9W
         ZEOEonHnCp67z+UPbqHkat6QEI1ViqYA2nei3LHdoVXhygk6hi6uqKNKLbnykHUx/+kT
         rOFdpDO1uPSskZzZVRkbMSMRn21PdvOs3DwUGA409zKh6V9L6mSVmRi+DxEHoBYjdRED
         vPDqTTAunywlQML2Fpd6Ju+7Y8arbY/ks3hf/3UKtSKAeVNbYC5WXf6Z4XTMXuaAQN1/
         19FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746095748; x=1746700548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JnUeJrEz2QMwYoW3OD7Syx9Jdxy3i/s9a5E6cIdqNg=;
        b=rmanOpeOUe2bJUcn2COfCsLxXGuYX84sdZTCgKdiEIED+nFMJ50lAm30e2JT0+xTtw
         mi4kzKXrqLDjOLznZTElvKhvBpYgyBMo8YrQzQtF1BKzVp31e6Y8gMwOvrdmevsNP6P3
         UMruIehhTT1KBlh+UzcT1kbMIB1vv7sPkmeQRMn4i4dt5p9S0yOXgiZK3zIithzrF1yp
         7+apBfsCu9jX4CQJkqs4H3uovqJ4LekU7GGyMKID2d/PKlgHZzGmgqHnyeFcMQhisahG
         tsl/f1nSGeGEclZ6k4G2MFmuq2uky0LQ9DyotcWhwMxvKPY0Vn4ga1hJBQJBhUuYNIG0
         4Zzg==
X-Forwarded-Encrypted: i=1; AJvYcCVgtyVRZJ3OCoMDnoR94WvDK1DfnkxE+k1ciQ2nlp+I5o13ZqtVDEs8IrF5d0//vmDZVgo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ40NIk+XN1FGwb4XWhSa6TddDy1/GMereo5UhiSXojxG303Mf
	WHLHYJqpbmSU/uNcnyV1AkuXxiZZbMw8w7ZOxRf6yUL8EaCmlVdq0RWLcmy7QNg=
X-Gm-Gg: ASbGncsmEYmqVN0RPR6fWBmXqOqgelolhAZAF4x2A25gp8QllswUlsFCJjhi7ijRR+1
	Obr8KzrPQehPlYRzFbl7DpzIlwlAZpilCOQM6BRFh9bp6FOtKMG6e+IpGlFwtlxohiNMgaarXc0
	QM2O9Q8pkGlZtXe/L+uSVXALwODYH40XSNEyyDbzHfBb1Zdw5E4g3Mw+CsFugImbhpxlyIE+Lcy
	wfUP/Z2iHPxgqbDSj2eCyTPazkrqt0rbjRF1JXPDnBkzNXvSUS/dFVbHWu1abeynPcx1NNY2JDw
	pyX2t6bzzOnsvYlCXlYv3gGPR0W1gMiP+MiiMFYbY9VEYu86lg==
X-Google-Smtp-Source: AGHT+IHpYbP0/kmTUa86knuxCp0uPFuqoZHphNnA+x+8xxOAP7htntUULz8OHSqI0KW/OuRv2E6e8g==
X-Received: by 2002:a5d:59ab:0:b0:3a0:7119:cefa with SMTP id ffacd0b85a97d-3a0900a0a99mr1574177f8f.16.1746095748358;
        Thu, 01 May 2025 03:35:48 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a88218sm486646f8f.78.2025.05.01.03.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 03:35:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev,
	Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] samsung: drivers for v6.16
Date: Thu,  1 May 2025 12:35:41 +0200
Message-ID: <20250501103541.13795-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=vNYmWvhVJQY/AqblF9NK9uhqlpRYbUIbtdpo5XR+1to=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE059ULjeHoIezM1OAEcRIkI9/eVyLkGHFQs+g
 7rpEZaMWx2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBNOfQAKCRDBN2bmhouD
 12nUD/9GGensklaBc7M71nRyVAyLRtoLji6ft/Ict9H+mJZDnuu0b8HD7g+Bd8cQXxq/QEfpTpU
 3eZ2eHhGVRZjLwvIl29slEjPUmSCfJt0/FwGAvs4CS0S4J4Cz/NiemKpg/4e8Eew6EF40LceTHj
 4nZkclCbJ9W5znA6QdShYnsvijNEOLhZQsCNNSEQqIfXdzpnozs/QhftGoV9hT4tAqLSVU2f6Hn
 jmsyfqT4JENOwsmtDN8j9YQYOrs3vGAKzcOcUDfiFbQ8DDWfVE7F1LRzzUR7XfQ/JoplAGqJv5w
 98STFW/3tbErQKmmTxGmJRd7k5b5s81O8DH2VR+kFZ41Iaz7bH5ui2cPJ3ollez7MA8bbP3yZT1
 sZR7s6lOYvLV4sNQ/1v0+JoMkc9F4S2fl3NO3Bm65SW2K9Nu7QGVotAkKCYTLasz0ifE8Rady64
 oPew0HeOVHkHLteSdmusZZmR/o+dlbVXsmqIFZ93b6xs/cb03KGr1uRj8YiVf4swVqTa4zpG/a8
 oNbXpNyOht6RernZ4dKaL93ynESVArjwMoLvKetKMbM7DOXbqThhhUDSABqUfRc4LpEZzAk90FW
 M9IRpcYQOZn2KX/e38M8x0F9wQBL0fY6A9Bk93WsBf7nV/8QLoAgsFBey9UQvZl6Kn7GIBFNNFh fsgUW3E/TP11+PA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Lee,
That's the stable tag for you to base MFD patches on top.


Hi Arnd,
Please pull it as regular drivers pull. Note this will be also shared with MFD
tree.

Best regards,
Krzysztof


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.16

for you to fetch changes up to 2c2e5e908ea2b53aa0d21fbfe4d1dab527a7703e:

  firmware: exynos-acpm: Correct kerneldoc and use typical np argument name (2025-04-25 11:41:03 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.16

Several improvements to Exynos ACPM (Alive Clock and Power Manager)
driver:
1. Handle communication timeous better.
2. Avoid sleeping, so users (PMIC) can still transfer during system
   shutdown.
3. Fix reading longer messages from them firmware.
4. Deferred probe improvements.
5. Model the user of ACPM - PMIC - a as child device and export
   devm_acpm_get_by_node() for such use case.

----------------------------------------------------------------
André Draszik (6):
      firmware: exynos-acpm: use ktime APIs for timeout detection
      firmware: exynos-acpm: allow use during system shutdown
      dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
      firmware: exynos-acpm: fix reading longer results
      firmware: exynos-acpm: silence EPROBE_DEFER error on boot
      firmware: exynos-acpm: introduce devm_acpm_get_by_node()

Krzysztof Kozlowski (1):
      firmware: exynos-acpm: Correct kerneldoc and use typical np argument name

Tudor Ambarus (1):
      firmware: exynos-acpm: populate devices from device tree data

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 35 +++++++++++++
 drivers/firmware/samsung/exynos-acpm-pmic.c        | 16 +++---
 drivers/firmware/samsung/exynos-acpm.c             | 58 +++++++++-------------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++-
 4 files changed, 70 insertions(+), 45 deletions(-)
