Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023D325782A
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 16:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763397340; cv=none; b=uwL+xUGCLJJaZqbUcNBrghpwnVzgyW9j1jyIoi2Bno8ThLnlI3eKymAeALoiLX/DUXOn+D0Hum2uVPFr76azyccwI/HZXFsCtxHV5z3Gc9/nRHjOm/MVDMPjuCmM4PE7Kj/Z3hbXKXYs+NHWieLFgvNA1wtpu+nuGgZrGoo60Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763397340; c=relaxed/simple;
	bh=5XeG1dcBCrmsPQd/vLVvKD1FX6zDYG/YEnA74dWLnRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pm4ikIoo9vQ+ZrnUQghUlq8hQtRyeXazID6yup1Le2KuxDokzrI63/L9VjNiigyWASuEC7IQhHBJmI7SZrDKbAxMCxo9XS9Bgn0l91pvr7fGFUSqf61ov7oG1snOuHTP67GIUQESqYzFGeHU+Z0H6Ym5BuHS4Sj//jRM7+wsR74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cBLhvWPF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cBLhvWPF"
Received: by smtp.kernel.org (Postfix)
	id 9851DC4CEF1; Mon, 17 Nov 2025 16:35:39 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0280DC4AF0D
	for <soc@kernel.org>; Mon, 17 Nov 2025 16:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0280DC4AF0D
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so2308396f8f.0
        for <soc@kernel.org>; Mon, 17 Nov 2025 08:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763397336; x=1764002136; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mcDSXa6wO0VwMtbrXwflFakufSl+A3K9Sb6+lWFUaj4=;
        b=cBLhvWPFiOWn9un56DPzwHMC6HVTlqdfl3YuQfOCvZ5FKgloGfV5tZquv20iXw/Dxt
         ACjod7Qln057SWGx7VS0j9rYURauoq7wqWWjPPkJrn61x5y9rlOJFf4jf+XNh+uHcnI4
         8D8sY4QjdD1qs/uuA/UgOx7mTqB6jd+rtsGrrmqhOtCZKK/fYVLlWI9b0JPwx9SXWNwS
         bEfVXP7bjZ+rqhRn9HIRfc4W8BwvRSYk1+3mCVxAorF+XxMi1aLDyk0X1/6SdiK164sv
         sjGVFZ4NU00rX8HPE28sdzmdiKY3MK+AG7WA0J63Kd5lw+94XlpS5J1yIk8wB6xFfMcD
         vQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763397336; x=1764002136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcDSXa6wO0VwMtbrXwflFakufSl+A3K9Sb6+lWFUaj4=;
        b=djgRBq6Mj7s40SXnTKnuSabcP3fDcvB2YAjldXLQJ6p44dCnlCWAe/9O3ZUZmCB1oq
         BqYZPQ+rrq3CyxIwvXNLXVLVhRVl4go+Vyl/LoG8oaSq7DutiCFSKerzqm/HWYb5jbdQ
         0WtFKH1d5ADNY+oSIV2rLKfsKQjXkBecO2N9yqVopzsdTZQAg662s2IvoeFDNXN4g9LF
         1pcLFcpZTRO6e7I1vDiKhFVbDtDrvvs5q0HPyiPSuhBwO/+Ozs0j3jdS+6CpnOVKaJHO
         Q+b7DZX33ONhfN2D3i+ikC9zWycV04XZMBdfBkkEo7KAnYM2qZfkTvw0HvoJJIjdgUg9
         AEyw==
X-Gm-Message-State: AOJu0YxvwmsDMUOQxK48h3Q9Rx2vH2058ntlyXrtoLgc50NWVLhuANfw
	GMAD3sp95Y+kU1OCQug+7ETyRMdBixYAMMbELvsRAbO8UgGf8Q5KQds4Ximcb+vmUVTgkwYwynZ
	Upyb+oX4=
X-Gm-Gg: ASbGncuQjLfiiS3R9Awr1bqLoWS8eBAEQ4vJPfj31iY8M3xWQfuLurln7qZ0kGgi99v
	L7h4dTpCf5Q4RcPjd7q5IMdEkNlLhOVmENE+8nI3nc8Ljtt4VP+bgUxuYszkQjx1t0Ejg7KvoMb
	orv/T7a1jLgGhX6lrU+iJftTeI/T9lNYgRuEdUGmglwWS9Q78yoBJI6mCSBU9FcXzkUgNCPBFJY
	VKVnJgLjY9Kc0cuRou2Yqq5TShFlYzDr2TgPc70a8B9T27qH9XwrhpUo/YYckwObbwA1OKtIiz3
	uK/wPvuYkipGMPp0+bUbQ1upEYBqzTRaDUWCFnUQeSMta7/cfynimNVtLfh10IfHXI9GuG5N7Fx
	nON52JThAz68sCX0bfDVGvAqclbLauCqRJlLQ/KMjuL4w7cKBqMkSHQ7UIup2FdJsc/SVydUIGM
	ODcaVkNCinHILm56IvIvbBToKAMq1XbA==
X-Google-Smtp-Source: AGHT+IF5T7Au6ooMk3nR9R2A+BmiQ8HwY2tnu+X67pk/ismWsgHxgTwDEBSxjBtKs4VbUsEg1VDXqg==
X-Received: by 2002:a05:6000:26d1:b0:42b:2a41:f20 with SMTP id ffacd0b85a97d-42b58db7a16mr12599558f8f.18.1763397335690;
        Mon, 17 Nov 2025 08:35:35 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f1fd50sm26904384f8f.38.2025.11.17.08.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:35:35 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 defconfig updates for v6.19
Date: Mon, 17 Nov 2025 18:35:32 +0200
Message-ID: <20251117163533.209608-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.19

for you to fetch changes up to c1c654b5daceea6143a31292ec0e4f53cac2083d:

  ARM: at91: at91_dt_defconfig: set MMC_SPI to module (2025-11-08 11:06:23 +0200)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v6.19

This update includes:
- CONFIG_MMC_SPI is set to module for at91_dt_defconfig

----------------------------------------------------------------
Manikandan Muralidharan (1):
      ARM: at91: at91_dt_defconfig: set MMC_SPI to module

 arch/arm/configs/at91_dt_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
