Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C040D25DAEA
	for <soc@lists.linux.dev>; Mon, 10 Nov 2025 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776840; cv=none; b=ShNm/9HL0TrXltndyrFAzkm9bazm7OJC7fv2XtPDW91mEvwl0J5Z4qudvP/CqXHWWNmFzAttYs/SRI+kf4iZ+j+0vWDjNOi6bAE/kcxWPew4FWMoZhFvcRtPpIoTfR7aJ3uviylR+aI5RRZj35oUL01Ov/BU9J1JLCVgRIrd08I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776840; c=relaxed/simple;
	bh=prTJ8Oc+m1RLqjNAKESRe03pqfxl99t8fUIb/LcjQWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S7tlaZEQeiv/i4NLS42bf/J/8SkZ/P/iZEpWmTwZf6RZ13d0eA9riwSWe8MZ5ABILiDE5cWupnZH1z46+Ce6tQN656+1bQ5/0fGh0vw3Yc4zdLlWrUO0RCLg2YDpb03+I8PivCMvh7UddsKYdyaplLNPtniC877oOqdEN6abBiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oopm3mkx; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oopm3mkx"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b2de74838so198658f8f.2
        for <soc@lists.linux.dev>; Mon, 10 Nov 2025 04:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762776837; x=1763381637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+J9DK7umCkB0lH75JtGcDU05puxofKEqqEJe5YRpEM=;
        b=Oopm3mkxoqgaL6ncBH7XMNnAJQ4v4i+z/fuoSWnVyXVRrDbGxcYJphrW46XV4xFo9O
         tGHHyj+GCnexyDh4nclpKeo3wmLbgPSnDKKRgMwHqVawRDylNnhwNKrTGkNIt5cYjEnE
         3CJBawahmvk3XQr+Mb+pX6Klk2000Q5kBcyvgeWC1G4QN5k7XNueAcIulgRng+QwD+VF
         owgxO94s996UrZZQ5Uog+1tXoWRFuAtG0MpVimNfPjhMy9fsUxHeiQPi5QNz4G5VGRGL
         p1Ro+A8qR0vlEh1rpchw/Y6CHL4aS838Fm9pgvpCdXvpvqS8zchY4VwY0/avRasqb/4E
         xHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776837; x=1763381637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+J9DK7umCkB0lH75JtGcDU05puxofKEqqEJe5YRpEM=;
        b=qmdDWmc51H8GEhNb6Lej4cvMStszuTG5e0QKw7HrZg5DJkVIXjGUPB7O9/FtpdjAJN
         Q/eSwxSYwl/aPIAoIrx5+SGl2ph64t1J/isxDBuxKLF3Joc9OJ9BvT51x+gyC7Hwavtq
         Ktwrk8rakz7elP5jcR1h+sW783vuNhFmCtlldLcN4gauAZA2htECRe+Rg8LYZOTDLV3o
         88w9XNAyFeKFomSqI4m1tymlDY2my3dXwy+NiJsKtLOY8cv3KFt1VJdz0BZUC66Gi4cu
         U7T5hHC37zQDk2UEcsRDq4h66j5hsNQvMLw8J6ryQztSx/22kNqd9gazwbP5GMBa00Uh
         5oHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlcLaow8UAybzG1f9ai0pRquw9FrYimW0rStJBvDdkOYuC9fkOwKt0t+eJOKZZVXH9MUI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxG9jxpxxGkVsMpSSwa1yq150joRmJRfy9vyZZStTBNmJJ+SBGK
	juw8lfMvM5KuLTJeB2ENaWp3Ca6mC3mLNB3jCvf0SKGiQvTrDfcgIBcSrpT5P37M8vE=
X-Gm-Gg: ASbGncvNVy9f9FJbN4G5eqHRIDOj/5P2UNu/qS9z7Ba2YQw5+jxjYAYI2z/fSR/Ppow
	9dT2bAmKnTsnw+KosGx/GaTUkHnGArkXn/4g139X1R4OAo2zDeJ24+f5GQ77LwWnoAczOsiqrpl
	V1xkAY8hGYQN+fHDdqejb0FWRgceLFmruccnQu8KtEAVTR+gMtdNIT01um6+pSCGIJbioumekP1
	bgxTKMPIE/a9ZOsA3aN44wHUOOQirdkZpOw5TLXxW1Ct5YR4eHexCRjDbF8uuSDPeHUCsL9j1va
	aq5c88k4NS8m1mAuOML5+ZPyBvzHsU/qgvWU/dN2b5i2Z6Y+62YzQA2LyD3KFfQVDbm93gKitLc
	x/gFpLdV+xh5Ii2vc8/oT2kfVdQzVrPcmWdR+Objp1yPeUwMIzG3E4SVxOPgEIG7Dhs8z02x6jO
	9bZAoE0Zna6B8=
X-Google-Smtp-Source: AGHT+IHXmMAMgHGLYPHdNXeuo+MZBbEjpXPzE5xhKoqUU5naZQ2bnEDU9zb8O6kz0C5VmdKT1m/FAQ==
X-Received: by 2002:a5d:584b:0:b0:429:b4ce:c333 with SMTP id ffacd0b85a97d-42b2dc20b7amr3337629f8f.3.1762776836988;
        Mon, 10 Nov 2025 04:13:56 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm24922667f8f.41.2025.11.10.04.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:13:56 -0800 (PST)
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
Subject: [GIT PULL 2/4] samsung: drivers for v6.19
Date: Mon, 10 Nov 2025 13:13:40 +0100
Message-ID: <20251110121344.120785-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
References: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3147; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=prTJ8Oc+m1RLqjNAKESRe03pqfxl99t8fUIb/LcjQWk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpEdb54uvgcIsvJkyeUuAsVPO83CjVSmDVgud5l
 2LOf1gbAw+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRHW+QAKCRDBN2bmhouD
 1xCwD/9fQop5LN4wvcGWsg5PtGyKeubevwoDlObwaQN/15SYy87W6CxtCNV9dU/3SM3XPUCmLxy
 uawL7DFzPR6UBCAz7+k115KcJsrWJ58J8ZN/sq6svzOwBU2eYXkGWaO4eAGEyfYWgX/of3DDa0n
 Z0M0AifAC5lkYD2gnppGvNQUa+xIUelZD3jB3ObaZ265L76q8gtLdwImZ1ab5ceJ96tn+eypUgi
 qDiOaWZUFR2ymvuY69ivf21U5/MkM5X3862NhjhQH98JHywbcdB6XT98a+OZRXo0z88cD54OPKU
 uqHXlZEEF4OzDd6/qys4ESBxMzYUEwvDc7k+tZ1phMgORBgkQPl6D1jOjVrO+ZWgdhLwMMrk2WL
 cuEqbXgxdL8MhDOMfrtFoKTsMklYtQUXyBqCH/3OB2hyAFdjeeZt4xsL0j+fWLC1bQ5rD7M4zbP
 rw8+XEqZOLWKVa3wjMDlmg1PsLpsfZrcwjI+Yzf/lIVprnKmBkCtLxSaMCBoNvUhIyj0gkQcc8i
 7G3LQKWCYj7DM+f4RvdbrixjruolAA+rJHNQ0jEa2OVlRB8czyUHKOqT42Itll2JM32X0VcEzxe
 PgJc3iP3M1JZ96vJkm6qgZyuIy3IceO8y474AgSC6FERBGdNoEEoOvR+BpCltuZ5eV7S8ANZldx moJ9/Njf6RuKBSg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.19

for you to fetch changes up to 81280d39a2f9e7dc12056db889da52cce067b1b6:

  dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode for Exynos7870 PMU (2025-11-05 08:20:21 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.19

1. ChipID driver: Add support for identifying Exynos8890 and Exynos9610.

2. PMU driver: Allow specifying list of valid registers for the custom
   regmap used on Google GS101 SoC.  The PMU (Power Management Unit) on
   that SoC uses more complex access to registers than simple MMIO and
   invalid registers trigger aborts halting the system.

3. Few minor cleanups.

4. Several new bindings for compatible devices.

----------------------------------------------------------------
Alexandru Chimac (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos9610 compatible
      soc: samsung: exynos-chipid: Add exynos9610 SoC support

André Draszik (4):
      soc: samsung: exynos-pmu: allow specifying read & write access tables for secure regmap
      soc: samsung: exynos-pmu: move some gs101 related code into new file
      soc: samsung: gs101-pmu: implement access tables for read and write
      dt-bindings: soc: samsung: exynos-sysreg: add power-domains

Denzeel Oliva (1):
      dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 compatibles

Ivaylo Ivanov (3):
      dt-bindings: soc: samsung: exynos-pmu: add exynos8890 compatible
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8890-chipid compatible
      soc: samsung: exynos-chipid: add exynos8890 SoC support

Kaustabh Chakraborty (2):
      dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
      dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode for Exynos7870 PMU

Krzysztof Kozlowski (1):
      soc: samsung: exynos-pmu: Annotate online/offline functions with __must_hold

Peter Griffin (1):
      dt-bindings: soc: samsung: exynos-sysreg: add gs101 hsi0 and misc compatibles

Tudor Ambarus (1):
      soc: samsung: exynos-chipid: use a local dev variable

 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   2 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |   2 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |  23 ++
 MAINTAINERS                                        |   1 +
 drivers/soc/samsung/Makefile                       |   3 +-
 drivers/soc/samsung/exynos-chipid.c                |  18 +-
 drivers/soc/samsung/exynos-pmu.c                   | 138 +------
 drivers/soc/samsung/exynos-pmu.h                   |  37 ++
 drivers/soc/samsung/gs101-pmu.c                    | 446 +++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        | 343 +++++++++++++++-
 10 files changed, 863 insertions(+), 150 deletions(-)
 create mode 100644 drivers/soc/samsung/gs101-pmu.c
