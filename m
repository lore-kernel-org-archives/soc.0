Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5901B3F30
	for <soc@lists.linux.dev>; Thu,  2 Jan 2025 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735828259; cv=none; b=iO1JXT3/H/NXt+fRTUdyfhreEYZ/OgZIhIxPkmwvH4btTar8KivY40YJaQdKngR/SBo7LaPGcVmsWfhVSlMTcAmYywJYGEN6fuEbactVsIDBDWDZN4w2p1aEs5De7OxzJmuSVIP+z2XFVg8H960d7TrfHjViHue8qPfHRq1WBp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735828259; c=relaxed/simple;
	bh=TmEvM6/ulK4Tejh1AJLuN4C41yHOlfAzYJ4Ojb7tn5U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=txjcTxJ3eaeCRuWNMiU1JIqUrtUuqpX5W15kiYciQc6Uweo7rk/0pbJM9Oh9+rjxtkFmGbQRARcpDaZ4as5+yz4cXgG+XYvo/AFEdW5mK9uXRW13gAHjSaT5bER+QchaLO2WXidAQuETENCIVp0EsFt/GjY7HRH0NAGFXcCH+NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lixom-net.20230601.gappssmtp.com header.i=@lixom-net.20230601.gappssmtp.com header.b=3L4w7rBx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20230601.gappssmtp.com header.i=@lixom-net.20230601.gappssmtp.com header.b="3L4w7rBx"
Received: by smtp.kernel.org (Postfix)
	id 931C4C4CED7; Thu,  2 Jan 2025 14:30:58 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3731C4CED0
	for <soc@kernel.org>; Thu,  2 Jan 2025 14:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3731C4CED0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166022c5caso136919975ad.2
        for <soc@kernel.org>; Thu, 02 Jan 2025 06:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20230601.gappssmtp.com; s=20230601; t=1735828256; x=1736433056; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4dPHcD3etpIB8BJNHpXKgDogAHOZXkFpPg5JS1pQGiE=;
        b=3L4w7rBxPietbDRPJq4mfa4J4HmICMWB175u3i+JHlqDeIoVGEg/EId3BNWcXGQ6AU
         qVz641e/o88ecEaPuVPGALbfEQs9SRBS7Nf60dWVEJLv1Y35nPcrWGWiUFUJVNIRzrpw
         8k64Ut6JFBfkoSxeJh1c24Qdb2b1gljPmecLECBlXinjn2LHPqiuLxBBYZBN/Fj+nq4D
         Tr6QEVfQPoFwWndBLlz2sHmwXJ3tJdtS27gkWjUiyejg1+qAsSP5GzDQ85Is5+g5UAMl
         vOaYC4N8HAzGAx7e9PIgsUne0HA0D4cj6GZPM64qDNMZcO63UY/s4MYZNSjKCQWgcvv3
         +m+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735828256; x=1736433056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dPHcD3etpIB8BJNHpXKgDogAHOZXkFpPg5JS1pQGiE=;
        b=q1VKodZW73YAPHJ54plO8sFdSWdm+0NAhr7jFKnzBx9RobJE881LRQGxTKjj2tn5XS
         F+biKc4gGRLD1/OqsbiEnjU1yO9pHGMCuzTdMU1Qz0hId529gPfEdzLINZJQiRYpwMqx
         ArUel5DzvRGMHe3NVjzDLPDYMew3GXuXm37lsC80LTiUcxfQSWClP8IwpJWvJAVo5Sfe
         v3eiB4BUVYh1w4xyZpEJJvzX4FEI7/Kmx0TGhXLDWrTbWDrcRFQtc0g2t7z05ZBfH0yj
         4rYND0pd5Zp7cGPFwsQwKlLqLGthOu+oQ3gXSKCTbjpsa21+RrK7EP8ZRPeyRlHoB7i+
         Br1Q==
X-Gm-Message-State: AOJu0YzKdlve5Gr9Dv2kVH25Klyjulxm8cqafdnTMIVA6+lRkrOdVN2w
	WhMBLe1kqn0SjiXCqRozvsHR+2pAndjGNKiCDlCJ3YCjS5WMVxwtz3b64EIvjcUD6JaUECutJoY
	KhGI=
X-Gm-Gg: ASbGncv1PChAcEdyRjbePEFh4gwjBpQvYy23MTzI2XbgnwhB4HuplwKwM+/bzuXjEmC
	W2IzDxTvsKPAogE/9+BZy3NeH1zfQ7v3zRkfnFF1ANb5tMqDUoS9z9Jh7jptIjuXcTOWgTUnTE9
	vffhNf+8n3pOz8RoOTapOpKOwrP1lR/P1ck0HZldWdg9vFBFoBHojYY89MEGAnYUUE2pUB4qa5l
	XKBjDZgROsABFl349sQUp+LpALdO6tywMoWI3DRAjfMcWJLH3IoW6GcRj1cFoSr90irHlB1X4UT
	Qx39ByGq1BdGtZ2ZSPpNQIvCPZszjOVOvQ==
X-Google-Smtp-Source: AGHT+IHT3cBLl27jqyP15+bTyE2j1m0pzmNCWLB7tuHRqnFcfX4KosS1XtWbFn9PYKhVIYF8LI9Stg==
X-Received: by 2002:a17:903:22c7:b0:216:18dc:43b3 with SMTP id d9443c01a7336-219e6f2eaffmr722467265ad.42.1735828256108;
        Thu, 02 Jan 2025 06:30:56 -0800 (PST)
Received: from chonkvm.lixom.net. (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d5fsm228565615ad.38.2025.01.02.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 06:30:55 -0800 (PST)
From: Olof Johansson <olof@lixom.net>
To: torvalds@linux-foundation.org
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] MAINTAINERS: Remove Olof from SoC maintainers
Date: Thu,  2 Jan 2025 06:30:03 -0800
Message-Id: <20250102143003.169611-1-olof@lixom.net>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I haven't been an active participant for a couple of years now, and
after discussions at Linux Plumbers in 2024, Arnd is getting fresh help
from a few more participants.

It's time to remove myself, and spare myself from patches and pull
requests in my inbox.

Signed-off-by: Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..c575de4903db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1797,7 +1797,6 @@ F:	include/uapi/linux/if_arcnet.h
 
 ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
 M:	Arnd Bergmann <arnd@arndb.de>
-M:	Olof Johansson <olof@lixom.net>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	soc@lists.linux.dev
 S:	Maintained
-- 
2.39.5

