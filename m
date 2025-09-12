Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B455A305973
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757685295; cv=none; b=pi4DEvhEpVZIwP5EllvDmdEtVHEu4C95Rv+KKoxkDk1I1r8zRfwO88MX7BqxJ1Pv8UxZjM93MkKJKd2wF2wkPqubrJSXhstQVTo+87oE4jwhMICmqVH8G22KuMIS5XRmSC7xrnMEjaKgu827GhNRPsfAz0rur4FQqsZL90ohKTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757685295; c=relaxed/simple;
	bh=+R3H1ZTHIpjD/7gpvZo0O5OPpiEvSR7fzcYJIZTMjmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KHWJXFjD+CB1T9YoEXmE9054jy/qftfqMEDLNnE8XZPlKEeh85Bn4lv28bUMWpjeg98NI2ZxNv6d7f6QNPw90FjQBfPsEZJ8MeaXsh4HOqTFAek9ulo0tn18mERibYAw6KSZfDfZ9ugnfSYK/8GBjrre3SV8C1MazBcfduzQUcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DGpDVTGn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DGpDVTGn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e753a310a8so261982f8f.0
        for <soc@lists.linux.dev>; Fri, 12 Sep 2025 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757685292; x=1758290092; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3tTGGzjAuGZXQWRu05vrCKimfXwg8uSaYFn3EC8TDkU=;
        b=DGpDVTGnXN6UO9gjKmYNjLygZnf9kzh/VSjlygAYy7qaP+Kf7IPHX2acZA/HsX6gLM
         HeLzA8iiUsgWv+Cqr5gdpsvgDdSLZ5ksYkvqDo1GeMVnpcLexPPbgOBoYSeegbgUxR4I
         1GAAt6VEMSa72PxdQFXI1xvtDhI3RQBiMjOx9gSwZPlMZBisnW7C4vF6px+iaMrfhmxR
         rVXWJxTUKdlriqTXoVnlFCej2YhAD+2Fumt/UnfI8oBKUmDyh9sKbsJdAL7wOC94N5Vx
         wRCbAezRbsf4IhdiygZt2PgzswgdCNimpG1w4hQw30yzZ+X8MWWl8lGc4K4frlFcNJm9
         Y+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757685292; x=1758290092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tTGGzjAuGZXQWRu05vrCKimfXwg8uSaYFn3EC8TDkU=;
        b=hoI5CVRSx9CxPPH36CkF4UBZ9h3MVzFWW+LvgSneCf66Pcc7CD82T3FhouI6tflDTQ
         VCoprkFoZeRk9+h6gRazIbIcju69IXahGp/BgNB2ec6x+F7Bwa4pf6Gk8zkGT8vsBVP5
         1boj2Mfi0l4LozQkdq2SqDQazRmzmdqNLshzMPc0f24UWItsq0Rqg/YlwEuOe4/uwnEe
         yo3RHBSTZSh8GUXXdh0p6nukEfnPGoOwlbirBkjgcGnIK3brG9aUBTcqflITAHjmVi60
         zUP7Q2oRWt6oj/xaUuvI1O8QKpHsIrMHSL2o2PiCmOvGksWZouKoWuy9g/icqJTJL7TO
         56mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEbnqP07GK9gTA32tsBE3PMwDhsHIGoo+2CFXKrYE6MJOLsnd/TSpfvubQhfL4+YKJ5fU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4AzQTKRIsdvwfOIN44DhweTqQqAI0hjPYSm8PUjnQ11YF8W6e
	VffAeywU8RtPSI/Q9lSOVtAeyoUaXSTr8lFCYS25umQfGDwu+mDky57wnZpHPiPCj0k=
X-Gm-Gg: ASbGncvQ70/8A3dbpz4mpumQR4+Feq6Cs8QQYxDPCb46HJe5h7VVRPE0dSztVVbn9EM
	fKEiWifVEaJZhM2IQ5jozcvSNjI1ULSAJny3FB1yKnL2jEM5HD9fn2/HiISTgUM84nFRbRwDswH
	PjWDjhAfZl7CuZ4ATJMjjwkH90769FsHF6uHg7H1YEjhvxq+Q6Pmam32Xr3oBNfvctca1QVChB2
	wXgQfarLxcwwZoaw7Bpw+yCPTYdXjeAG4VZONTJJ+hBYMMzjz6S3duzGV6wr/OZcT8w0uLChrp/
	7Lz+QnrC0H8UFGKEPwnhAA5p217JCXp56ySRy1DlnQO4GNuA5GGVlY3+3JB5l9mNO4HaPM0pBJz
	2I7yGBPqgZnLo8ckw0UowlvbNtUFv0KWptXItTOEzjWNu
X-Google-Smtp-Source: AGHT+IHa2d6N+I2Uzmdt0WNUESJkvL2LyjiN5VutHgQP0qs3PTN9Sv+qvKSGg2es7vfBpKw/dNOTtQ==
X-Received: by 2002:a05:6000:230c:b0:3dc:1473:1a8d with SMTP id ffacd0b85a97d-3e76553700amr1475966f8f.0.1757685291885;
        Fri, 12 Sep 2025 06:54:51 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd329sm6749615f8f.31.2025.09.12.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 06:54:51 -0700 (PDT)
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
Subject: [GIT PULL] samsung: drivers for v6.18
Date: Fri, 12 Sep 2025 15:54:48 +0200
Message-ID: <20250912135448.203678-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=+R3H1ZTHIpjD/7gpvZo0O5OPpiEvSR7fzcYJIZTMjmk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoxCYo+Pv5PhFkoqL+D2aJfApilJiP0CroSyKj8
 yHoC5S2/9KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMQmKAAKCRDBN2bmhouD
 119+D/wNTh8XCX0eJ1D+00tjKjvAUyIG70Ce8hwuspf2+Y/ZmUzzUZi3xCB2ExpCgMZ1SEHF0bS
 LJmEYKHjPexn37YqQs/O7V84sqOYJoCisxXUk5Gp9JM0SzUJ6yqZ9M4KoeJuq4PVd4x0cCl2DDv
 oFV+r6qKgwWyh/EVqokjUXqABdJhpGz9M2Wn1sSWRF5n3gujv3K/Sx1TGsbZgvbXxQWIQ58CxrS
 m/Tey1RNtLzTnrkorRlHcxbEDYt5fojnUgci4ebJIlG7c08f6N7vW+D+LTJYHK/FPy603PsxjwS
 XMmGu9EzyvflPL0r9IZfExuXIl+cv0FZ/ZWgHcnC8HGYwGOVG1ryDfcfRLo4GBcvx8vUGjBYFzL
 TU59zS2BkyaxpD6Cqh0Y6vTQdBb1eMjknAhDzouj27ZEETVsl637qEXAsFns6XigH6VVhJ4Nxfv
 FKTYKG6wNttNaCrQMdChdPHCJGrJhGwZ5gWFmeg9YoubQfFiqFLHASrdVyOSW0Jeu4OaZXO2NM1
 LHVnFaiNFHCP0JicZ51wIUqzoZCIUzVQwapxAfZaTrzhOurAdWWSSQQlJcijQTd42DZHnWaB2jN
 ZTImPN0hxyAK5KV3rExKxZoyfMhdIbnw73yrMA8atLu/Fg2x9IQLgmljorXpmViDqRq3698QMod iaNGtFLV2DD+xAQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Samsung SoC driver sfor v6.18. This should be my last Samsung pull for this
merge window.

Best regards,
Krzysztof


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.18

for you to fetch changes up to 1da4cbefed4a2e69ebad81fc9b356cd9b807f380:

  firmware: exynos-acpm: fix PMIC returned errno (2025-09-11 11:27:05 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.18

1. Google GS101:
   Enable CPU Idle, which needs programming C2 idle hints
   via ACPM firmware (Alive Clock and Power Manager).  The patch
   introducing this depends on 'local-timer-stop' Devicetree property,
   which was merged in v6.17.

   Fix handling error codes in ACPM firmware driver when talking to
   PMIC.

2. Exynos2200: Add dedicated compatible for serial engines (USI).

----------------------------------------------------------------
Ivaylo Ivanov (1):
      dt-bindings: soc: samsung: usi: add samsung,exynos2200-usi compatible

Peter Griffin (1):
      soc: samsung: exynos-pmu: Enable CPU Idle for gs101

Tudor Ambarus (1):
      firmware: exynos-acpm: fix PMIC returned errno

 .../bindings/soc/samsung/exynos-usi.yaml           |   1 +
 drivers/firmware/samsung/exynos-acpm-pmic.c        |  25 +-
 drivers/soc/samsung/exynos-pmu.c                   | 276 +++++++++++++++++++--
 3 files changed, 275 insertions(+), 27 deletions(-)
