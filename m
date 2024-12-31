Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC2F1A2398
	for <soc@lists.linux.dev>; Tue, 31 Dec 2024 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735652140; cv=none; b=cmd+oEgL25zIOm7cROQXZ2LThByB8Hr4h/K3q/nBjqEJec7My7fx9YXZmkBP6ziUY69Bq3SqGWUoY9UyU2sxOgkz9ubzkLLhHaymqre/LXOvTbS0+H82AlURG31XHvrTWbvapQS45qDp4XdQlGKsKWbhwGNghVT8VQrzyIWXZiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735652140; c=relaxed/simple;
	bh=BO7KbDTDSbS7IhVbwNE0FB1AcPFr9LcHOSMj+uO/GE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xp26KjeqsbXUwdxUm3P2bmDaYbGdfSxBil0Nw6gGylFcv0M+WT1K7la/Vra1Ihu6CeSNeQd4PtY/wSYQs3lpRmLLH10/lmXVX2w7+Cubw+Ki3wVukLNc1uiyj4QjMZlqnI+77LzU+BpIcJ8stbWafUqrIW9ZVF64IFHb+G5B2Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aBMw/HZ4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aBMw/HZ4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4363298fff2so14904955e9.3
        for <soc@lists.linux.dev>; Tue, 31 Dec 2024 05:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735652137; x=1736256937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GsdNMVc0Od9bzSY9MWJa5P6XmGCpURdJ6xrk6VyFKhs=;
        b=aBMw/HZ4s0lHEmwkCEVNiMSOyXcFozIp6lgmf6/PqTVKEf1ekJZuoS8u1dRkGMnjIc
         xwp1UqvWZyDYJflfp38dEadZ4CCESnjRdczmsxMiZoRNl6pz8ZheCMjocZwmVdU1FouH
         vk6iNfNtL/hIyxGnNg5pUZZV9IWW2ud/tTj1VQgW/5ukQfkgEYG9QCL44RgMvkiqNKwa
         B3zKu165UKQb6J6trHD1Pg2+ORpZI5xMdwgBCvdFv4y5kjYZsFY5mWN1FbE4aScNMpnc
         b63t9fGmAL+NpPISMQh45JWbohqymXYZdc7x01O6yycQczbb0wy/csuRP4xwp6RMVPtm
         CRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735652137; x=1736256937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsdNMVc0Od9bzSY9MWJa5P6XmGCpURdJ6xrk6VyFKhs=;
        b=G3lt4/QYKeqKL64Yn5zQpxm0rzA+FzSEOnryff38th4iXdD4i0OP9BupbjvYem5Wzq
         FPE2A2iYHeTWLw6/RYMLIvks9jQvD2vg1ytUgv2tRgH5HmRXKkX6vWtEhnBmtLEYby0W
         3ExEcHy+gOMJWEtzME7z6V0RhqJSZA64Lmm5wwbAJOFM+vmyaEkYAmGS99wCWTbdRjNP
         NJIHNy4Zn4RPfrJMLU/0Yj3N0n7otnGtO2F0t+fKfndTE3OD3Qm9tai/BKn/Jfx+86md
         ZzIdyarXZIBRU+TEGRpVQ8ZterHxCwVzHkO5gJdT0Me7vqj3bh30apzpj0cKARSkkzVO
         EVDg==
X-Forwarded-Encrypted: i=1; AJvYcCV1lFxRPKLKxRP+kCvhKJ+0wcY1AfW5hTmGMNEIDXjM+ky1Lz1X/Ih6Ssk5grSmxyXKsAY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnV+O6RvnxJhAqkY17ynAJI+BHh8xfIMh0WtbfzoD3DUvnv79I
	EZE4omkXwwCQKstlwqvsLcdK9JR7JT/0Y7cIYouXvG8mJH+DTurVH+Dt3GONtlk=
X-Gm-Gg: ASbGnctuX9cOABpr0w9UpA2wB40WT4sT5sT0dZwrcossv2mJA0/zHx9WZ9geebKIM7b
	L1m1IrbmVE6gFGb1u1juPKoe19pKCxOxvXUCI4QmwGGvJitTgdHwiPRGjQb0W6HZ50ncSAYBWhs
	FxM0XAqVxCBsPi5e+CJojOttR8WrfjZV9MdRxSVadS1oKsEkeFKFpLzxdPL8rso7ubXW/InUvp3
	/a74zgC7mpsLGxJdF/Vkhkoivj4XQDvCuynLbEMUGji7Pdq4wLVAQgcFJqqC89OZOOi5v8=
X-Google-Smtp-Source: AGHT+IFJtLTSDSY75laSaw82iCzWlTTvp854kRJIaldHGqKGAZQUMof6Uj75ORMinsLw6o7Yz+NfZg==
X-Received: by 2002:a7b:c85a:0:b0:436:90d4:9db with SMTP id 5b1f17b1804b1-43690d40b0fmr73339025e9.2.1735652137238;
        Tue, 31 Dec 2024 05:35:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ace0esm32318346f8f.106.2024.12.31.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:35:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] memory: drivers for v6.14
Date: Tue, 31 Dec 2024 14:35:32 +0100
Message-ID: <20241231133534.136771-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.14

for you to fetch changes up to b9784e5cde1f9fb83661a70e580e381ae1264d12:

  memory: tegra20-emc: fix an OF node reference bug in tegra_emc_find_node_by_ram_code() (2024-12-22 11:02:39 +0100)

----------------------------------------------------------------
Memory controller drivers for v6.14

1. OMAP GPMC: Cleanup dead code.
2. Tegra20 EMC: Fix OF reference counting when iterating over
   emc-tables.

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      memory: omap-gpmc: deadcode a pair of functions

Joe Hattori (1):
      memory: tegra20-emc: fix an OF node reference bug in tegra_emc_find_node_by_ram_code()

 drivers/memory/omap-gpmc.c         | 33 +++++++--------------------------
 drivers/memory/tegra/tegra20-emc.c |  8 ++++----
 include/linux/omap-gpmc.h          |  4 ----
 3 files changed, 11 insertions(+), 34 deletions(-)
