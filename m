Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE0732E6BD
	for <soc@lists.linux.dev>; Fri,  3 Apr 2026 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200022; cv=none; b=PHLdjeONkLQvm0aIiUrOEGmND8xLZFQMbpJTlmyG9tz3PSmzLu6NHjeU8lxd0XR382opOK1a87lpILU+actuKSEJabSymUDyr3qNL3I38s4ADq5kR5h7oTukbFDY+Rphq4F/wPkzE8Ty3bYqQ54+8dbqetooMOXxWgN2HjvHxUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200022; c=relaxed/simple;
	bh=D4f9A0Li/b90UMPoWtEPTU3iwvh/Guo2l5/sorJC2EY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BMxySuQBzW20+CVjhWJ8hPUsGeTb8T6T50fHOZ2TjZKfD64fZJ/K9kR8TaT9YPtdfvolaSO+uTstoy+DrWAQHQD05fVF4C/pnth9eDIjqJs50/TyLQdz9e9MSNNrfgs+nkvQlLTpya87IXW2MnguGakxwazq4jM6XA0X5ZkFMtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=laPXkYVD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="laPXkYVD"
Received: by smtp.kernel.org (Postfix)
	id A2F0AC19424; Fri,  3 Apr 2026 07:07:02 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0571FC4CEF7
	for <soc@kernel.org>; Fri,  3 Apr 2026 07:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0571FC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso1435827f8f.0
        for <soc@kernel.org>; Fri, 03 Apr 2026 00:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775200020; x=1775804820; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cX5VCdirEw7uDW7pBIKifXil6dQCocQ0+NrpOGO976E=;
        b=laPXkYVDwz+Feqx1WZGQaEv+FmsBm7XcEMdnO947o50anXBZiI5d5tujxQbWSwjQe3
         30Clg51VMb29GLdD7Qy+4JlNNsqB8CAUpewRtIJUmV9wGiTP9NhW+JocoW98zQSFhF9Q
         x5PEnDSoHMvkMv1YMVRrVBrVAMwYCPCnNmBVsDXk5we84+8Z2GPB69LpBHT7MimDjNDK
         vlWvr4qpF7D+mwtAR6sdwSWHZe5qT2YeweB0OdlXVyo8o4PofLwt5TkC1+tlatKWiyBV
         0j0m6QpOejJvDlrmW8QG13DrDtp0EkphIPJtmnosb8D0O8jwznSN0/6fMlLak4whWkVk
         UuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775200020; x=1775804820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cX5VCdirEw7uDW7pBIKifXil6dQCocQ0+NrpOGO976E=;
        b=Y9JWk5Q0bDH9f74JbhijMMwIIXFQbsISkn63VJacVgfIwbF0OYdVkvrtd+5+Io1pvh
         HjslU1M5PNbOMCyaiHJFf0dbUHcZ3F2aWWwWYQa4qXlvdanTtlafZBgpijrtCzBJGxH2
         YodZFDpA0DM0hlVkG0Jeq4OTmrW7hMJ7Vxul591vSBMjb18zr8YaQuZ/M2PErJGTi1nH
         WtF7VT/Im4lMvsQ6OH8yJMocnvKNP0yoVAj8JbvXIDGvjs6qBOreWYrlyB7gvUHX1AtO
         6WZWuM6DKoegIkAqqkB+va3JN24LqP/WrI3hkK4BALKN8Rgb59iyLSVHYVgNZew/EyTi
         l13A==
X-Gm-Message-State: AOJu0YzBtnc2wabxkWmOx1HqtjlvG080j8NoR0EQ42N+In/Lhk30EilG
	dOwFNOJcIgY8e9UP9EAbUTjdRnP2GoAxSyjE8YlNbcMzDBb0JoarfNh9Ns+D+8otS41mlDSLTh4
	2t9CV
X-Gm-Gg: AeBDievbnRau2ZFSJR1SK6BqVecI+T4mCqcv3UWzK4LKq/cTuc+OH4uCf+aym3fKQyT
	jhlsPpED7p0Z7GZb9us7yJKIsYuOiQi/B5Xf8WEhmsxyuXD8S05TnyDbG6DtUwpLQPmfx4qzQod
	aIyJWbh3JWemIxOCHXmGy+oBdYFm8d+baOBJkj5f0xWGi8OuzHyKxc9iSqQHGRgMtOzHtQpPqXD
	pktR2gWi+xBvoV5kuKlQaiDyVqpIFUrpHQ2CGwyWz/e2EQB5JAcLSPUOZMLsHKXq1cDiyndp0dz
	v27KTvxX98FZo6VfZkGptW2Vz3rdDHXuxFSo1UmAXTAP0iJgkfGhGWslv12gKurlwaoQF/943CB
	ku/kahP5q8m5hdq6k3ZM+h0NZw5Whs4amkDiuG/DKkn59SZYdVns9RGLanaqNeb+6vzziYlVSun
	/4BbW8aSGNo5Uo8aX8dhyMewb7Z7CZx24wfQrtpOnSHA==
X-Received: by 2002:a5d:5f86:0:b0:43d:1c21:ead5 with SMTP id ffacd0b85a97d-43d292a9591mr2910276f8f.22.1775200019710;
        Fri, 03 Apr 2026 00:06:59 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d27a8sm14717944f8f.17.2026.04.03.00.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:06:59 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: conor@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip ARM64 SoC updates for v7.1
Date: Fri,  3 Apr 2026 10:06:58 +0300
Message-ID: <20260403070658.2554567-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-soc-7.1

for you to fetch changes up to e4ffa98a02f4d16eda9a5faec6792493b41dab35:

  arm64: Kconfig: provide a top-level switch for Microchip platforms (2026-03-18 10:55:49 +0200)

----------------------------------------------------------------
Microchip ARM64 SoC updates for v7.1

This update includes:
- use a top-level configuration flag for all Microchip platforms

----------------------------------------------------------------
Bartosz Golaszewski (1):
      arm64: Kconfig: provide a top-level switch for Microchip platforms

 arch/arm64/Kconfig.platforms | 10 ++++------
 arch/arm64/configs/defconfig |  1 +
 2 files changed, 5 insertions(+), 6 deletions(-)
