Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4CA1F94A
	for <soc@lists.linux.dev>; Wed, 23 Jul 2025 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753261506; cv=none; b=oCdT+GxlUzhDPf49z2KBt6jbPu2xCRHPnGowGp/RFFUNbp2w0dMGdXQ/jMxittlJo3Xo4YT5CKK+09PL64sHqJWKOVVF9swtZKAfgp5dU0TjhNSD4ZTIqfBWjrOPf0T46X1e0z9OdeBaCMc16S4MRwwL44VZZiQCVo2wgnFoHuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753261506; c=relaxed/simple;
	bh=jKxS63Re37hcFm6L5FR0wOlWb0i7sX+Y/k5+Rp76jT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AeO9lgFrDHCaulJVyLLbb3rZLijhc/Qy3ONemOom00gj56gnZ30X3P9+r8KNR343sapSZDLWmh29I25zoIJCZhCpMgj89INvFmwRTVtzoj6S/VB+iFUB/iXZzhN3WyBFcYnoNeRUN7niUZ8Jq6gg/Fa6Q7NjYigyoXLvQRIObjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kNWZ97rd; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNWZ97rd"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-608964359f9so696313a12.1
        for <soc@lists.linux.dev>; Wed, 23 Jul 2025 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753261502; x=1753866302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CoZCnvfP/rwehZqm543p76Ydsjj+4/YJqR0zDLYGaAE=;
        b=kNWZ97rdsuOzWmHH26TMs24y0j2OXvva5k0azGhELiC2htI7/VFGK5f4P6iY/Wbs/h
         L1jdPwW0I/cKe3+sheBQDX+v0RhtRKBHgHr9nOtOxUk4uTRCGFxRHFrRttF6BX21nTi7
         sI+2EqeHIuXkSVuQu1bekDbFXwheH+vf0EKNGITXyB/rT7sxG8vr3bEFeJ/RrQNQmUx2
         Vx3E9rgtkVJ6L3u0tkyjjZ+u76n4CjCIYl5kqRpWgTsCtr0hNZyeFuNs2LGGcbSYPwgR
         jI7TLwr1bP076MynkOUwad+MiO6CYxwiB71fkGzQopxYOEhMBwfrZeOV3yxZkvaaB9Nx
         A0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753261502; x=1753866302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CoZCnvfP/rwehZqm543p76Ydsjj+4/YJqR0zDLYGaAE=;
        b=cdFPwZnY4nn4Mi7QqjPLWEbg1/kjzVL4YX2FMzVsXFvX77sZaGgFmd8k1NmAlOjMur
         pks5myusnxOCivg3w9zMhnGhXZdM0dPojijII6cmVo0gEsB0To9hvtjqt8r5lxvdI1rB
         xQI1I4kaeYXSY0biwgIGkN8M4MbDKE7j5LqmejIrxcQKNoudrzZfNGq0LEhkcVCTafPq
         ZtH9y5rTZbcTZoNxjCyNsxKR4/jLoTD+wVGpEYYsAp1ZM68S7DuqayYRVsEnET20AD7Z
         GkW0tRDFkDMC8hdeZvHfZQfQuYuw0pm8tMIGNIG7A9dJmOt+tx7rWARALMQK9LSYyM7y
         h3vw==
X-Forwarded-Encrypted: i=1; AJvYcCX9my8aqeTsQEWaByYqjTYu7fDCcqeOxWUJv2luR6dVMpSkAEQa/xrv6kVOaIFt1Cbrtsk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiB+ATbCiNgDWIEedGMI2+eELapiGkEkI65Xa527JPanG/cNas
	AgeT7jK5IdfEAOZWP8DOJ8efweFzGT0QVo4hn79lk2AShwy5jhW+GpCHpu8rvid8Bps=
X-Gm-Gg: ASbGncv8oLJcoSdTG3AHwE9B2VOVY07tjKxp5JngOEo0Y0kzfwlAKfFYyk4C/NX6L1N
	ew7m/lu/xW8l6QsAZsrGT8aHxehOXvy4bV+lqpdNlnwVm+SNRxY4dTdeCVHnpvXOc0qlYrgO2A7
	9xlNiY5lkz0UEIk5b9ExXSruFHlVAGXWAf5FURwMZdhyx848VwWIxWU9GgGWT96j4av0zgl1XMK
	Mkqzkmb5GurHnuRjAEh0Kp4G3MxC7QkP70RDIWFYeMqkI8Jv6EM8E8cRYNFqF/HjnDeqeTPoqND
	LHmP2qZqRqgdqGZACLEXVoYuAF2ZS3jw1xZu3XD3eWCVn3F+qlpaXnQ1yuVXmbSkyec3zqaLOpa
	s80NRqfD8J/YlmK2kMCVpaG6av7Y6ud1w
X-Google-Smtp-Source: AGHT+IEfzsllmY1ddx+Lz3lhSzSUYagxITt83zhZt/m63TVAuXGg4evDnAWl67hB8SYpI35/gQ1tAw==
X-Received: by 2002:a17:907:8688:b0:ae3:617a:c52 with SMTP id a640c23a62f3a-af2f64c62aamr72965566b.2.1753261502178;
        Wed, 23 Jul 2025 02:05:02 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af22f6fa6afsm208165466b.120.2025.07.23.02.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:05:01 -0700 (PDT)
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
Subject: [GIT PULL 1/2] samsung: drivers for v6.17
Date: Wed, 23 Jul 2025 11:04:55 +0200
Message-ID: <20250723090455.25295-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=jKxS63Re37hcFm6L5FR0wOlWb0i7sX+Y/k5+Rp76jT4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBogKW3mDzwNTJovQ3V2taqJr+0T0EUFr4aTJQrU
 U2eCAEqgvCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaICltwAKCRDBN2bmhouD
 1yR5D/wLSF3mWxeCh6hr0nA8CzfZto/VRm7x52o6glrfAIZHQ/zaOZ1570ojQRpZeJP5mZm4qGY
 eCpgfc3Cl1f3osmJKLI+ojFPlK2gH/ipqWahqcUL3RsUoLEivfyXNMYgVXTlWkTORjB418lS8G4
 fC+/aTu3X6UgYmwLBP8r10DUaCbsZDfBDbr0mNCU1VMLKphSgTRHrJ7Fg8HVk8mXucjIsd0J/5t
 Wl9bVoa0hc/QJMAZO9hG2pK0KaAuIHgs/9GSO9HpcyHnlMKbMOvg09YptLZkXDUDs2zTlRF5wnB
 NQXTtkM/pqAfz3z9cWqPeRK4OkEILvtOIFeYAIO+qd8n3Pa3B7DyBhlf2r/xLCh6FOKtNtHp1dX
 tk1JND/+6NxXlw4Zt9WkiAj6vA4vu7Do4i1DEdR2dlB/C28jltww4CsTGu48nkO66/6iD1vCAA3
 ZMeQciN0yfxEl7fRNBiHs5JSXdSW8axGHEtdSU8PkD71n0nSR0Fwxf4RY1JSEk7vFdeFJlUUuio
 z03+FSDx3pT2g/B3sbq/trspGQa3YpomiGIBGJvvId9fUwkUa4CHy5DxEbDObIScg4zIs3oZ8W8
 GikDwiW3shZzRPhee2lB943Ur5FpLQDYG1LGPmjsUY7oMlNhTaPs2mEsEmIWjvC7ivChoKGwVrB R22rNCovyB27l2A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Late pull with minor things.

Best regards,
Krzysztof


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.17

for you to fetch changes up to 687d974a218a719f7e729bef9c498ec36f18115e:

  dt-bindings: soc: samsung: exynos-sysreg: add hsi2 for ExynosAutov920 (2025-07-16 10:41:42 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.17

1. Google GS101: Minor improvement PMU binding.
2. ExynosAutov920: Add HSI2 system registers binding.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      dt-bindings: soc: samsung: exynos-pmu: Constrain google,pmu-intr-gen-syscon

Sowon Na (1):
      dt-bindings: soc: samsung: exynos-sysreg: add hsi2 for ExynosAutov920

 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml          | 3 +++
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 1 +
 2 files changed, 4 insertions(+)
