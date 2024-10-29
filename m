Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C822038C6
	for <soc@lists.linux.dev>; Tue, 29 Oct 2024 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730189413; cv=none; b=nQEg5owlk9dmBxE+FES4wzgSNREGvniJc++N2sN6xNJFyG4XJD7NjxcKoJ99UWzuet3GrqcZqX9XlToqYj1QK0RsE4CeJuyYqlyNIlufvIBgoVY/s1aQZ/8+lUNz3gGMhIoYCAE0kOQMJF0T8p0+5LTA5sT+vzlAWtKV80SbJqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730189413; c=relaxed/simple;
	bh=OBIiL49540geMYYq7nS5eOLkYE1Imle7/TDrBQNL0nY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rVEv0faXrG9cMzF0JVa9Y7CA5da7fLfRrAN3DvibjSqsJhK36lz5eLp5vIhz4sLZ2ZTItUoIzcdx/LDTAPIZ6AUygQdRiKlf17oKyBwawPYldopm4CH6Bzcw3Oo5oxa8lHVoh3pxlZL5vSFT9UYEbv6tDupl0DlKXcyY752ZMKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rqaA5aj2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rqaA5aj2"
Received: by smtp.kernel.org (Postfix)
	id 86489C4CEEC; Tue, 29 Oct 2024 08:10:12 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3EDD4C4CEE7
	for <soc@kernel.org>; Tue, 29 Oct 2024 08:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3EDD4C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315b0bd4ddso6418785e9.3
        for <soc@kernel.org>; Tue, 29 Oct 2024 01:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730189409; x=1730794209; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nlHQgxHoo0N+w71NQjPtnfHRpsgGAqUyUZpSjSJNUE=;
        b=rqaA5aj2C1D2KH5ef/NizpxrDz97r3tOhRmCK1o+lxUzsBKGumYmQvybqZrHsZBh3t
         q2b+phFlxtHZd13E0iNz1xIWH5Br+LxLzS2fHXI+VT37Svl+o9+ucjlnquGE/HNiX6PD
         0CeO8eM8EoykkhEQ18dQZsy8J4/XAvlmilzFC1RZlFChL0/PnaapD4gU1dyYlsrJSNPq
         I3Yf+ZXJR0MqqxaINYinRHGIH6DC8bnkuEQdk+PO+6vivsiyRFUXQwUOKndwEYu+NyCR
         fEDeXzekd4O2AiKI/CaL+898nlUn3S1nWY4mI/cvmF+ATUoENRrOjS8YGTwOh6mszYSO
         uAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189409; x=1730794209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nlHQgxHoo0N+w71NQjPtnfHRpsgGAqUyUZpSjSJNUE=;
        b=HJ7Kk23AV//TcwuH7+NBxtk0aFrH2elkiW2l8vNR3Ay4QRATqj6rBQ0lW74F0YOdzJ
         MJW57pMK15SjZf8vK7jr9EXAK+oOFxsZp7kaH15BKNX/WiBrnrEv1niMfLDT5M/gQe5q
         0SNqo5LdmfUux09+BuTIinyBXmHtm41j014x+RP2OL9XUgi25ulF+ZSd3O/zMT1JrOzy
         ydSKcFJV0M965S9y2Wpg8/w86qA4AFDgG+JKG1K285/CdyYRaJJ9BoN4zGc7TejqDwOm
         5nRal7TTGcb6Fxbb3EHQ8796l+UIAbTR5SXb6XN3STG2/uB4DwokXl4K1ivrxWgTbKIg
         gRDw==
X-Forwarded-Encrypted: i=1; AJvYcCUSnxeDX/Y98vg+VbErdhTRCv7TvvsDckudU3ghGOUdCXgw5oU4zgkG5BzBuOrxNHlaALE=@kernel.org
X-Gm-Message-State: AOJu0YzdbyBbwnHffJBJ2C49qcL2kuLRKLQ+UMJ62vnoJwLEY8V/oyW+
	W7iwvRWsxAByqyHllCbRjiuFF3EOH8pGc/L+/LPLUjP2UM96mGDvAj30soe/Gg6DcOObgqJt9i8
	F
X-Google-Smtp-Source: AGHT+IFBTmPkpYxqqzdZgLFMhy6wv545YoQN7O/maEIdRbbG/bFpFO5cny/nfyU9IGP8/iORnhBuaw==
X-Received: by 2002:a05:600c:3ba4:b0:42c:c59a:ac21 with SMTP id 5b1f17b1804b1-4319ac79b20mr37591015e9.2.1730189409495;
        Tue, 29 Oct 2024 01:10:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f784sm165467485e9.19.2024.10.29.01.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:10:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] ARM: samsung: soc/mach for v6.13
Date: Tue, 29 Oct 2024 09:10:01 +0100
Message-ID: <20241029081002.21106-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029081002.21106-1-krzysztof.kozlowski@linaro.org>
References: <20241029081002.21106-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-6.13

for you to fetch changes up to 3a6ad95d97eb62a7b7c804ef7eeb329a1f697d00:

  ASoC: samsung: Remove obsoleted declaration for s3c64xx_ac97_setup_gpio (2024-09-30 12:47:23 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v6.13

Few minor cleanups in platform data headers: drop unused declarations.

----------------------------------------------------------------
Gaosheng Cui (2):
      ARM: samsung: Remove obsoleted declaration for s3c_hwmon_set_platdata
      ASoC: samsung: Remove obsoleted declaration for s3c64xx_ac97_setup_gpio

 include/linux/platform_data/asoc-s3c.h  |  2 --
 include/linux/platform_data/hwmon-s3c.h | 10 ----------
 2 files changed, 12 deletions(-)
