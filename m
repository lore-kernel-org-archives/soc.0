Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C9310E5
	for <soc@lists.linux.dev>; Sun,  9 Mar 2025 18:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741546573; cv=none; b=fYNHRKphKjJzK5R9vCqhoon+63vvRiRZLzOLNrwdHpLkvw4Vl//3MSIXTN3gBlvHIRuqNqBq54j9O62zntFHcrHy6/7ieYosOy8jZ5vRJdJplFshxbTlMJS0yUxdJjdS1VKCdxgA0eoCEhqvdH5mxircfQkKiRH6M9LRaAWq+CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741546573; c=relaxed/simple;
	bh=kUxIzjT34djjsSWrouN9kcaq2cVWYfP4zf9wrxF60YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n25iYMSE1fJKC0jnwp1IADypbS52OM4l+FXZ8GPoZR+L4m3LrnbkDpU6bsXkeWPNZuhbY8Y5F4U8ICX83mLXy0JSvFMDnUL0onXnGHIdQwuOhcChZjK3UC70YQqq55bEmBDVtDjYbdPa9sRvGAy6V2jyTWJ7ygZ7xOMkb/iU+IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nw3uWdh5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nw3uWdh5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cee550af2so675385e9.1
        for <soc@lists.linux.dev>; Sun, 09 Mar 2025 11:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741546570; x=1742151370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csnV4M7t8mG+4gzOzlbb+RIrtUw1t0+Fx7m4dlnVHBE=;
        b=Nw3uWdh5HYxGRKuHqmj/VF8IPHvPuHPl8CAsSReCs7YYUsbpVm0szKPPtC8855ima6
         VCbl4oJ/dKi22tt/CsYNHCP2qGHNe2aO8OJn/c4T6bFD2cT6lXVpvBFgbFdouRuXP18W
         wzyquqTgTjFL6YVvEgFc9GlS6XhMxGz10alOkkoOXutBeLgjHMJDB2UfJsuCbcRADbsw
         1IWEnZqzONMm3nw+8GsdmD3NRO+KLKhP1pr8Qo7E1joqDXfQZDA0NqVZJALsPyT6bcnN
         XFZdI1SsCBzwIK3PnIJEdgOfdmWD0l97hvfygPpiP3I8gruw1GESO3H9/QudXUp1qUTU
         LHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741546570; x=1742151370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csnV4M7t8mG+4gzOzlbb+RIrtUw1t0+Fx7m4dlnVHBE=;
        b=qn7IxPNDqB2R8j1LvW7br3mBKuTYZ7oNINj3LsktPDy2JNwu/OfkDSrUSqFF6NPBVx
         9mgPQNPdAfZ3DtR7zgEC8e1T5ayW+isCgY1x8EDj10RqPLvr4/nKT6+wwje86b4DLsGK
         R5XLToaeqbtMUyYsQuyaL0BwGAgz/+lkmK4E9rJuAgkGq9pcnvgFVVUZ4ltRrqAzEVa/
         h4oWn5r4dGNqfm0/o+KM/FEihxPn9vDNVTjzTyBmSWaQnF3oPcE5hXSNMbP6zEyIm5NA
         WxsE1y7rIY4P+shfH5+T5Ux4ta0EYy2722T9q/oF3IWsEoq4yBq02thqSDcdBukynHsM
         4X2A==
X-Forwarded-Encrypted: i=1; AJvYcCX/d5LrQ1o+Cv7Figt7AhG35NJjZ5U2F7mcFD0FVBGfglZZiKepAttaR9qxQ+SbauKI+Z4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrhFipgMnEyCmi4zOs62IWHaFtDIKZiIrL3jg5GeebP324oO7j
	LrNwgTiZk6scYNzIiMKo0KmKu97GZELXvMwaCozgvkxlsn0nvcefq3nCy2qQ1TrnbUvFvCSUsZ8
	9+4s=
X-Gm-Gg: ASbGncvieTuiUzFTZ8SYdzOk0fIYq6KD8t75jmLXltz7ODyBobPINPjxsuvyTacj2Y3
	5ofVDAZmd668Dwy/fL46ZIrwovDAB3sjiPi4kG9Q143vsl1PjgR0PU/Og124g7zHuaafm61M/fP
	tAdf6/kWNO/RXxMDZoIK+bzYCA3wNI/gZa4biCvViqBNgwhPaCXcnqzi7kJ9BwxVzTtXq9m5T38
	aQbrBBQ1ZtvbRjH2KrUqt5nwJsRQqNfYOdR27FPB3U5sP7F//jrkIaOslWvB/etA8ZRVwyY9Pf+
	7GFhHPSu2I69WOHoIVZlzJkIART8HRfo4/un9TY7OikYdqHhrdFv2F9Z83Q=
X-Google-Smtp-Source: AGHT+IHOjQZl6au5AX9pwx89qj1PiY9uUWPbWjZhcAqE7l92MV4Sd5wk3pnxNKw3T6EVY3vWBvszTg==
X-Received: by 2002:a05:600c:3588:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-43ce6b12816mr15245875e9.2.1741546570242;
        Sun, 09 Mar 2025 11:56:10 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cee22c13fsm44263945e9.40.2025.03.09.11.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 11:56:09 -0700 (PDT)
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
Subject: [GIT PULL 3/4] ARM: samsung: soc/drivers for v6.15
Date: Sun,  9 Mar 2025 19:55:57 +0100
Message-ID: <20250309185601.10616-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
References: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-6.15

for you to fetch changes up to c8222ef6cf29dd7cad21643228f96535cc02b327:

  soc: samsung: exynos-chipid: Add NULL pointer check in exynos_chipid_probe() (2025-02-15 14:37:19 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v6.15

1. S3C: Drop linux/fb.h header.
2. Exynos ChipID: Check if memory allocation succeeded.

----------------------------------------------------------------
Chenyuan Yang (1):
      soc: samsung: exynos-chipid: Add NULL pointer check in exynos_chipid_probe()

Thomas Zimmermann (1):
      ARM: s3c: Do not include <linux/fb.h>

 arch/arm/mach-s3c/devs.c                   | 1 -
 arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c | 1 -
 drivers/soc/samsung/exynos-chipid.c        | 2 ++
 3 files changed, 2 insertions(+), 2 deletions(-)
