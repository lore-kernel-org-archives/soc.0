Return-Path: <SRS0=AqXq=PS=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905C3C3DA4A
	for <soc@archiver.kernel.org>; Mon, 19 Aug 2024 03:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58818C4AF0C; Mon, 19 Aug 2024 03:56:54 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DFC4C32782;
	Mon, 19 Aug 2024 03:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5DFC4C32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-202318c4f45so9940835ad.0;
        Sun, 18 Aug 2024 20:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724039812; x=1724644612; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMZ9rvcN3iR9Q8xwVCUJVcQ9FiUXOexqld6lBS5xZ1A=;
        b=NJtogYbhij9R8KB1KEWpiYVo1nlj+aENrHXmBiiz5fu7s1wzxmGuP01TAbhdSI7UIX
         XchyO8i39OPrUXp8ZwDJNtkE1rjpA4XolOac0zh8MNGQaM3bDQ6Nc7q31o2k4ga6UUe4
         ulVZrPlc+8WekDG1G0qTBHW/8Dwrpb3uL0dv/ygoLcITUxs/Z+hwZjNSfVgVjmhtnP1p
         e7wyXUtfC1BJm5hAAeD47FJNJxOswiY4/tCrHwZpREhBELnudSmbxHM4RoTYTiCzA1t0
         ZLDMa9EY1qutEqNiu9mN4qmzgzE2+xmOFJWEjG/dX8QItpZrMZy4OgXplgriaIQr3rq3
         Nv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724039812; x=1724644612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMZ9rvcN3iR9Q8xwVCUJVcQ9FiUXOexqld6lBS5xZ1A=;
        b=p3HO/TITItEOn5C/eYgzbFXE2URvFWHTCXV50xu46hDVGOfMBxEu94h2himoJPnx72
         8OO1XVuUlA0PV9WZ9jmc0ZQb6TQvzTH8tc/VuHUg7KciZODg6SoK0kR7NAaR6ZrxiLyg
         44z22z1VVQAt45wafyq0iplwVom/AFQNiurOnrpQ1t0+GznYphiSqo8h8z3CMT/JMwev
         4Dl8yIWaRE6wacM/WMVBe1jYX8MW0SbSa3zeGB9t7LyfmLM/R+CKOFqQoDJ8ZbNphizO
         nDVXWDUQfQPFovxF5sqSQEomh3UWf412f4jynhsZjhNSh174F6lhFgUwq1xj7r54NR3T
         InJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDlBMEMj0kYDvCqLLIgN2rnhtOW+U2Vwe3kfGrvY+Qbr6jAc3iJXOO3CsfqEuDycN5UW/1w9sPG/VNOWLQ9+6Y84SZl/NR6xPwj+oyzDI+jt1P2Pq5oG94y/rssTXwIBlYoUn1voG0
X-Gm-Message-State: AOJu0Yxdu2b4OyQ+EtROyjGUu2i85W5QZeqGQHN8/cMfJKyjIakXFixc
	jB+lfgfCfMJpw1X2zxBoljIc7003D0ekbSOAlK+ZE8t4c79A6DZqxywzKg==
X-Google-Smtp-Source: AGHT+IEKBhYBnAvPKWan3AhEl+XTUbhdrUsrDNblATEFmLfYDep00piSaKlr6N+dv4Cf4D8iPzgKWQ==
X-Received: by 2002:a17:903:41d2:b0:202:19a0:fcba with SMTP id d9443c01a7336-20219a0fe95mr62909075ad.41.1724039812219;
        Sun, 18 Aug 2024 20:56:52 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0375649sm55784435ad.124.2024.08.18.20.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 20:56:51 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org,
	schung@nuvoton.com,
	ychuang3@nuvoton.com
Subject: [PATCH 0/3] arm64: dts: nuvoton: Add pinctrl and gpio nodes for MA35D1
Date: Mon, 19 Aug 2024 03:56:44 +0000
Message-Id: <20240819035647.306-1-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

This patch series adds pinctrl and gpio nodes to the device tree of
the Nuvoton MA35D1 SoC. Additionally, it includes pin configuration
for UART nodes now that the pinctrl node is available.

Jacky Huang (3):
  arm64: dts: nuvoton: Add syscon to the system-management node
  arm64: dts: nuvoton: ma35d1: Add pinctrl and gpio nodes
  arm64: dts: nuvoton: ma35d1: Add uart pinctrl settings

 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  80 +++++++++-
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  83 +++++++++-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 151 +++++++++++++++++-
 3 files changed, 305 insertions(+), 9 deletions(-)

-- 
2.34.1

