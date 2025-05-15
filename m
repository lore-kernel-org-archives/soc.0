Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20601218821
	for <soc@lists.linux.dev>; Thu, 15 May 2025 15:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323716; cv=none; b=ObTDbM011aPB0GSaWjDoKv6ems6VjqkWicm+88FMnMfNyWvvpw/4EfoaXkGEoXGxRocMc00Jw9hpJd+HW/4dp+Wa3zUMw2t0x9T+zHrJvfGI+zGvLSsMOMpkteGcc0iQwc9beLR4zLmyIBOfS9Q/HtekIiswYmkQIAaGgcgkZBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323716; c=relaxed/simple;
	bh=xV1dbMZK9MCyNkJXgITmp1T7PFqANkxmG/+ISQAZkBM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iiosYiuMukWTBS+34vbHQ7JPBBVUTCEOyA6Ibk5DsLDXH12YXeh+xd6sAuIoBOvMrElAoJoD6Ga55Ff27m7yi6soTJTEehYtTv5zhnJZ2XOMgyjeXmvjhp5FobZegJ4VWziMeGQk4yQH2CIfkf6DDUBo1SAhAOiR8D0NVvRA+sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/QvkcMQ; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/QvkcMQ"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f6e6ec07f0so11013106d6.3
        for <soc@lists.linux.dev>; Thu, 15 May 2025 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747323714; x=1747928514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEHeE/LsGpP7MauSUuR1G6rmRo9uEtgsUB/PM7XoDEM=;
        b=g/QvkcMQT9X4jMzHCLHNBs2SKE//El8yaQkBQk9Vfc7SgEzCAXiUeDwIJRGk1++JXv
         Nnk7jITfp3QruALqfVKVo4wu4EBSd932uo8GBh1mlMOO9x//Pe1LbA813vIRtg9MoJJG
         maZx17uCiGXw5fO8E8a2wHfQYhonwgORUUn6eC2VaGrSv7mVdtrNVmUBlqh3r9ncDzKa
         2rdbSaoy/PwO4+fFIZjtH8eNxmKuVqz3xv5lSfIgz60QQ/CEGUfYli31zLkaFmATi40v
         PXA23hqjfGdkvuxz188gMoU3wjrtcNQxsZgNpYiriTZ8ARxNjQ2bGNe02CZw5f9Akf1s
         kzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323714; x=1747928514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEHeE/LsGpP7MauSUuR1G6rmRo9uEtgsUB/PM7XoDEM=;
        b=KtkjGgiN1VYzaPk/tscuuk1sfrAnv/GsZT5FfPob886BAPOy764kqKfRkfUb46f68k
         PKzFMsLepsxCPSvHIIfHUDEWUIqzNdRAZs/YmOA9R/1d2318WeamxAbV+MSAxHHBnicm
         pUULBx34Vv7FBZ9EWPiVMiw1qDT2fXFfpr1JnhRXZ7QudP2OIsRDasAxItFiFmJwW6sJ
         EeyFACHNiiChboPX0q9hFFORtAEjMxszyr/wzcCKQRpNgRY//F8lU1rlud3K4fDYr1UV
         uAbD+Fb7ehqNJ0UtSKY5Yv+vWsN2FiU0QFnDi6o2VnrcnxgUKRNaSM61MvbyunjyV7yM
         HtUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYAEroBd6+GjrFhRjEPdiZNIDfXcNAzXjVUN7GweVtiGPy1qSkXFqOYtOxUDZU6LvtqDo=@lists.linux.dev
X-Gm-Message-State: AOJu0YweUTHfj2nfK1GiStB9FY9rOXQnKWZy7ZneQMxiqPlkwy6uwKN3
	eOmVqd8xwoAkhTkiFK2KB/OrXQVqI/o09zQRB5mBISNoS72MvR0K++6J
X-Gm-Gg: ASbGncvYevkIJgpXPnJnTHLEtrnRFb7mRd1uY9tt2709s2oqeW813wx45ko6tt7CmSq
	umezCF8VJ2+vs0TlgVZMu7CSL9ShXlN6tHEIlX5gyhrtPDb22ZD5IiY72SxmpBCFk+xi6qiAw/U
	F71b0H4S3Z4cI0jUS9oXomznwIJITJEhtiY0vzcBXpGj0QEi5jVpuVMBChvfe4lnE8l9UBZNmu6
	U3CfOVqNNTowPEElD+M9MIh/FSgiMauGu7Jj7souH0bEALqg+w1pU2R7JNGC3vzbQ5KR54I0gZ/
	qdzZXWt5bh6jm8qocnF8Enpa9m13KOqKjFHmxa60viRjH0UDHDlHhpvXYOFKTlHB
X-Google-Smtp-Source: AGHT+IGDFyA8q8aqTgi49SZ0JI3d12lh/ntac+FRmn1YMbs2jnYtuoRsDMJOVw0+g1Nr6tlxa3g6Xw==
X-Received: by 2002:a05:6214:d6f:b0:6f5:46b0:7d11 with SMTP id 6a1803df08f44-6f8b093a666mr2699706d6.36.1747323713728;
        Thu, 15 May 2025 08:41:53 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:83e:4807:376c:1d4d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec10c9f0sm95682241.1.2025.05.15.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:41:53 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: arnd@kernel.org
Cc: herbert@gondor.apana.org.au,
	ebiggers@google.com,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] arm64: defconfig: Ensure CRYPTO_CHACHA20_NEON is selected
Date: Thu, 15 May 2025 12:41:36 -0300
Message-Id: <20250515154136.435685-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Since commit 17ec3e71ba79 ("crypto: lib/Kconfig - Hide arch options from
user"), the CRYPTO_CHACHA20_NEON option is no longer selected by default
due to changes in how crypto library options are exposed and selected.

To restore the previous behavior and ensure CRYPTO_CHACHA20_NEON is
enabled, explicitly select CONFIG_CRYPTO_CHACHA20 in the defconfig. This
pulls in CRYPTO_LIB_CHACHA_INTERNAL and allows CRYPTO_CHACHA20_NEON to be
selected automatically as before.

Fixes: 17ec3e71ba79 ("crypto: lib/Kconfig - Hide arch options from user")
Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Arnd Bergmann <arnd@arndb.de> 
---
Changes since v1:
- Added Arnd's Acked-by.
- Added soc@lists.linux.dev on Cc.
 
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 04619fe7e22a..7856db7dcfca 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1723,11 +1723,11 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_USER=y
 CONFIG_CRYPTO_BENCHMARK=m
+CONFIG_CRYPTO_CHACHA20=m
 CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_USER_API_RNG=m
-CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_GHASH_ARM64_CE=y
 CONFIG_CRYPTO_SHA1_ARM64_CE=y
 CONFIG_CRYPTO_SHA512_ARM64_CE=m
-- 
2.34.1

