Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A91487F4
	for <soc@lists.linux.dev>; Tue,  7 Jan 2025 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736237671; cv=none; b=ZWkI+XkXDGtlG06Gw4M9xj8hCmuFttc+zfU7y+QxEM7XYpFzFdUFYO29OvQpcHMe114KYsLw4uBchEAL6Ky8dGL6atF96PkZ1/5niHpewUCWZ3XhEzApr8gbsymSUZJoLJM3oiJRWubgmzp/SiUpN6OV70m0hsDgVwg2IUJJd9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736237671; c=relaxed/simple;
	bh=lFGW5mXyg/vcqXhvP3/bZO2ABE157nUXNtkxFWzJQXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kQlf8O49l5aO4XhBwWJ0oB4686qElli7auz7KQCHvqUaK0UN09HRNrC05kpDoYSWWT74u8a94mzvB0f1eY7YNXEBZaPdxOOsm5DyZoTmGUDDrovuiLAzUl2UYrtTTqWU8t+mtl0nWxb3upIjAO0wivfiV6M0Dt8HzmIfMPIM3Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eQzD1Lhb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eQzD1Lhb"
Received: by smtp.kernel.org (Postfix)
	id C29C0C4CEDE; Tue,  7 Jan 2025 08:14:30 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74E65C4CEE0
	for <soc@kernel.org>; Tue,  7 Jan 2025 08:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74E65C4CEE0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38632b8ae71so10663311f8f.0
        for <soc@kernel.org>; Tue, 07 Jan 2025 00:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736237668; x=1736842468; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5+oROHsI0pGM+lBjY+EF7UPmjz7c08DPed5m+aIOE+A=;
        b=eQzD1LhbBfkLMS5/XJmCSCo5VQIY/BTZEdPVLXI4stXbbw0go7qOy26t6/0vcaA6X4
         dY6yb4N3ZXLDhlqYHTvYWGOGo++GuqogfNOOVEpwn54SjfJpdu9/WDVS2KvlrdGEwYMJ
         8lyqYh480pFoSLRcPv275FZZbxwmaxHfvUuf/XT/LT9uQ9xCmIuifthXxgq7E/q25eOt
         pbhZMA04c+siOULE1LOOQ9hZgsM0TPhVZxlP5yy8TWJkuIKqrwlRSP1xJBf3so/6sPbS
         D8czhYbCTO4i/oGDtRkvFx7c6tOwckm/etIWRXtvmMjcq+yBrQPktUT32MZ8AE+Be6Sq
         R7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736237668; x=1736842468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+oROHsI0pGM+lBjY+EF7UPmjz7c08DPed5m+aIOE+A=;
        b=sAsU2Ns3W5/pIZTNCHYsIO5Nffxsm1HTwt5+9zRSa082ftZMi9cbJWVhwvWPz3w1M3
         mYyOIpy4UXoSjB49NyGc13HARO0KKdbcqi+VXkrcdZj/4ziAidfuEbFKlJygOtldEzGK
         j43a6FTs3Zv4Yrpj4AqwWB8/GovEhBV2OEO1NH0fG7Y+mYRcAPAwhZRoQVe1f1YokdBP
         WSf2Fl5XEag424XhCsQdoSYGY0gaWKVbEtXSeFNcEd+P0ma9X/Xy1Cc6zCZmZj5w+Mv4
         If0VW4o2NylbBjyZyoWP14lDcApeiq1s/HLIkZZp2kEjnF7H6aW9l3y8+wvcRRDqZBBK
         6rEw==
X-Forwarded-Encrypted: i=1; AJvYcCXELe/i7UY3t9jV1yeXLluaJenprDQOHx4ZFLDxvmZ38anwbxN9WSDfDFmcqx2hi1pJHHY=@kernel.org
X-Gm-Message-State: AOJu0Yyecb3IChf0oDg5eRi7mwf9mZm3aoZK47Fe1yTUR3TADqyhgMTx
	RqYLQ1ioL38Gn0rX4MtOEfHIsYxJ94+I1UAsZIJZjrnN+P8/S6tMBuW1SY6E6Wg=
X-Gm-Gg: ASbGncvieUgmN3V5QKBpsyv5BzIdCUj4Gda2n9hF0M68vAP12Ve+SsGQQOFwOzWVJQ4
	pZikiKUy8Q8tFinRP80hM/kWuly91V2K21yDGiShmgCbyNG/Gzw7jMY6WE+gsm+YSD9+j1WAgEk
	52+r+ti59hEfdrj9v75zNTuH4P4LugvBhqRHg6nmSRo0XTLnJXiSgspPkqigxMo/k2oUVPaDYDv
	hxav13ELaIijollKzvEqp09a/L0I218mv3mqtbN2FUXGkkYkUR+wK5jNUuKbtx1FDmrAcISTDBs
X-Google-Smtp-Source: AGHT+IHbtvTzjUvXOSpt74DKXaCeM1TDBc5BheKAfpOnexjqRQXkNQ5Iuxor26lOK06bUMotfiNTYA==
X-Received: by 2002:a5d:5e09:0:b0:37c:d23f:e464 with SMTP id ffacd0b85a97d-38a223f75bdmr53924526f8f.38.1736237667518;
        Tue, 07 Jan 2025 00:14:27 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a75a47943sm3541314f8f.87.2025.01.07.00.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:14:26 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Subject: [GIT PULL] Microchip AT91 defconfig updates for v6.14
Date: Tue,  7 Jan 2025 10:14:22 +0200
Message-ID: <20250107081424.758980-1-claudiu.beznea@tuxon.dev>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.14

for you to fetch changes up to 221984deceee75846b8a132974683d33dab5a029:

  ARM: configs: at91: sama7: add new SoC config (2024-12-08 18:55:42 +0200)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v6.14

This update includes:
- support for the SAMA7D65 SoC

----------------------------------------------------------------
Ryan Wanner (1):
      ARM: configs: at91: sama7: add new SoC config

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/sama7_defconfig    | 1 +
 2 files changed, 2 insertions(+)
