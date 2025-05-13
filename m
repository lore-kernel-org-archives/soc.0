Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADA621FF43
	for <soc@lists.linux.dev>; Tue, 13 May 2025 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132946; cv=none; b=lsBNGOhycJjAyTCDgjvaQmm0UF0/jqchSjl/RQCPHhU4szHBIu7eDsWwrfAyT/S2TjoidsMZzNH8eKrB7+seDJMe/hzMgRdAa1EtUh/7VCs+4PQc/wdulepV4X7OfHbLQCWG2zSMHzb6HLb7Szwhie/xgiUIkLoxvLTYb/1SgiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132946; c=relaxed/simple;
	bh=pSmfcyWrGiF4xpTJTeN86T0ysr03H5rq6eBj1nDatnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ClgIdAktwDtWxt8bIMDp92+3pscUenrXeGY86E8BM9YFQOE0f21X24/BLZODYqS+pHRFkdTe6DQws/CTKRSw+K6B24ksu2Ar/apptm6R+CZNfgi1R25AvYrOTe/2kM04fHakLbTNvGTyQSd7yP7ZlnZwgSYR05mjsVN5VnsYDZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sd5Dcvc+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sd5Dcvc+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so6618405e9.2
        for <soc@lists.linux.dev>; Tue, 13 May 2025 03:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747132943; x=1747737743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yg1c07mHuEVEndX1mN4EPyk/YfVVe6WLz5FXdYEWUKk=;
        b=sd5Dcvc+lIqaDLy9ThBpLRXiBY1bDLeXgFo2vnHxVpzhPepSJsA5jPJP6di44JTsX+
         eNT7U/KPCH4/jgXZw0jvKzoJRwBwma1d/UIqWTBrknMD3+jQNwxiuB6FWnBNzWSndTtI
         pyyU6A8I8W4K2nBSvCOVRUJoEhtlcIfvcr18YH0d4jtxDh6q7mS3OCpaZJfRoYCr0Xh2
         VPDeN5mIvNDSZq40fNc+tCZPvZp5J2Uj5VN10GpTpVu795EeOFUIViKdQ2iteh6OZd8y
         vTdWEhebJ9SjEca2/6+KxJ3W3+x6OGVVzXCcckdk5Gyhs0+fCeT4eS37EFqVHb7/1Voh
         rESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132943; x=1747737743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yg1c07mHuEVEndX1mN4EPyk/YfVVe6WLz5FXdYEWUKk=;
        b=kQGADCVxe+7cmcHTHIc/ro74jzSxbGvOKhImzuaZxQbmS5EZlb+9dNw/kvZCI+hBHB
         DrbJB5CX3+eTUsSHTyhnRdyAdjUWMijo2gJ/GRwmriFTPoOJl+3m+pxlqNZEUdwXsZCD
         1J6K5uBwrPjOYL8b2Pu7/NAgsrewOnBHXWE0esY2aEweBoZgCXaTjDep7QKZ2TnDta3K
         ow1z6ulVxsuc35gfmBiPrcoWXBf6dExRoJdERKxzRs9FtbbgHLgRNcLxJcnu7tOJRzJE
         CtBsBorh60wvZ691iFprwUL2xZsIvS0uAyt7+GDDWgffPMc989f3vDkxXF+o/eWWYWsK
         UBGw==
X-Forwarded-Encrypted: i=1; AJvYcCXnysLEZapcXKrmsrCdHCZ+1EqfnhE+jiadCGu5Bq7cnhvJpEP+n+4ToWPHWQLqmuWbAvk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9qdT02QJsvDtr0E6amoKEldI+EZ2Bt4RsirxDAYpqpU+KrYym
	bL7QNoYrA//FTPhM4nW3EEvC0REbNQJqU8OOZJvBHurjvcDo48n2266t/Rkw9w4=
X-Gm-Gg: ASbGncuWZAZkmgC/fjsWMtDcpXfY3qR8x4jNtryuNrlPQE8uoRtvDx/jP7kmlwJ3Fyi
	oq8w+iczwNWT2eDumne7Zh2iOIGzFWyk03NqHxum3ZHGROGIDvFuk3BAYtA7N7Ve5Qu/bSCvXbE
	BLH5rgZ+apRL6szen2fvZ/i6rVduy2xNwmEgKmu5y+H27Eb9cZ7x5F88ck6YK4xxmoNXrKKsgjY
	6FkJpghvUAtYKRcFgKH3Bw6A3DxEjvw3QTk2E2Sf+5HFREUdyJiVj44fPa0llYxk5tLtPSmtiHF
	inDmehhAw1z5gRym2BeC/sGG3Q2N0D2tVCWvqJ35Az/2aT9AhtCYGpktLrjVZ2wW2fMczSoOhOr
	6qfE6DiAPH7c28yCQ/FhZUan5Pm/d2gQkdAERlP4=
X-Google-Smtp-Source: AGHT+IFoNiPxCt+CMN4614Hku32Rt1pWZtS1Ab8LgzEA8q/WGFVYaj4V1uUDGQcXU9uLbt/oeGpLVg==
X-Received: by 2002:a5d:648f:0:b0:3a0:ba77:fde with SMTP id ffacd0b85a97d-3a1f64589camr4267133f8f.8.1747132942873;
        Tue, 13 May 2025 03:42:22 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm161002435e9.37.2025.05.13.03.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:42:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] arm64: dts: Cleanup DTS for v6.16
Date: Tue, 13 May 2025 12:42:15 +0200
Message-ID: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=pSmfcyWrGiF4xpTJTeN86T0ysr03H5rq6eBj1nDatnc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIyII5bO9UDNY2UW41YhzGm3W79e2lPorMhsUM
 8laVWkGUX6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMiCAAKCRDBN2bmhouD
 18KQD/9duw6hJzlxO6+orDMVLJW8i9K8mDq48xhYYD9+R3ihDIi4P0VwpwYzTj1V9UGm62DpLQ1
 TbVa4C+bY6Kbs9ZzECfRFcJjHsowemsuuxSTB3juYMXN6gtZmrplovDL+vSRZqtlr1kKQ8dTYB3
 Lk2QQ1SPFsBxsAghduP0jhgtecoLh/BfM0piYXXhL2LtYaOV/ZYQVL3USecXb5gdEbBmcW8Dh4+
 QOhSl2NTx4cKibXliq18QZa74cDUdPVOFyoJp54xu2YdlQAUTSodJs9hzZAAg+0kKOTKZisvzaQ
 xI1Kvn16BVz2c2vAdkEDj4ldOk8MD7o5eHN0/uiZiRACZBducpnUW1fvBWGKvMlXJ6zBOmGaygf
 DNrXGI4m/sDJKfV0YVSDH+lnWexQk6cn+3tL/kS+Nr9+xmVPEKOVry3kqlpfbPDMOW7c4XJPulJ
 bdKm4tMUQIyxja3vOvsZbH5m5D/JLzlC5y9wEm8gqpPkS3GmCIgHf/5fOMe5W1LJbDAEnpIS6lo
 akRuP1GMrDwesERkU7c50LPyO95SMWPIN8PFIaAiBroR326pTIAg9tugvdEoGW+dRj3Cov0JxN5
 8zMa/TlEt+HKeOBQdScbgr+b1yl2z3r1ODgttSs8vbjqMDv2hUqUDPoOfuTAQ8UCI0qyC8Q7PcB JLuiWgou0/eQqdg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.16

for you to fetch changes up to 04e7638dd64af20e4e81b7569abea9673e337098:

  arm64: tegra: tegra210-p2894: Align GPIO hog node name with preferred style (2025-05-05 21:22:25 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.16

Two cleanups which were missed on mailing lists - align GPIO node names
with DT bindings for Mediatek mt7622 and Nvidia Tegra210-p2894.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings
      arm64: tegra: tegra210-p2894: Align GPIO hog node name with preferred style

 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
