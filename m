Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70034155743
	for <soc@lists.linux.dev>; Tue, 24 Sep 2024 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727169873; cv=none; b=SkG77vrnDFTciSfKPnwxHhNdcaWxSrnhO9ly+RFjgsY37n+bqiURmeNq2+2D0w6zPiHpIeFZnzCPmzJt1voo48fjTYB4oocA2kqBoIiKXyJZjDZk+KBNga2+3XDSt5zgTfFt7t2jJU51ab4XJWMn1Dz+kKZQX1a8PpknZv9YgU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727169873; c=relaxed/simple;
	bh=dI0ztOadlf/S1pnakLt/oKsQkgAk4v6rBGf1+7LWnOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PVBKE5Uv/22NaxATKnNWsrYOn9iHBrfsfN0ibTWO97azt+vFl22ITRzTgEDqfT2IxWJXJEQc9UgMCuYXE8V3TGW2lMrN1rtwJpdoRvUjg1gfJUSe7Hq6zrik4VJcPlkfNG4ZVQjXajXJLTpWU2KLwZohDfoFbBcxSXxJQ9q7r+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SoJ2l4jk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SoJ2l4jk"
Received: by smtp.kernel.org (Postfix)
	id 00B89C4CEC4; Tue, 24 Sep 2024 09:24:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF2D5C4CEC5
	for <soc@kernel.org>; Tue, 24 Sep 2024 09:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF2D5C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727169870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Bc2XIgIruT3HvUSS07XrwLzqaOB5PyjnEV1kT6BR7U4=;
	b=SoJ2l4jkwZP2VGe+bTdFNxpmrMsT5k0xtJzTLhTojBoqUC3/5aizhJ7xwLfgiOgvd1usWp
	55gSoigaLmXfyOVhgkbleam7I5yvS9PekYOyBbBzplspUe1KER7S86QkMn50hkZAXo4rmB
	ytAn+fndfi4Gmc5S6yxxmfPFcJ/wWtg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-eRQidZJ-PsWFjbRjDpBk8g-1; Tue, 24 Sep 2024 05:24:29 -0400
X-MC-Unique: eRQidZJ-PsWFjbRjDpBk8g-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3756212a589so3498255f8f.2
        for <soc@kernel.org>; Tue, 24 Sep 2024 02:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727169868; x=1727774668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bc2XIgIruT3HvUSS07XrwLzqaOB5PyjnEV1kT6BR7U4=;
        b=TcLmPlh149gy+fl0PpW4qI1h3aqIuOsTBowHGGEk1homgr2be2dqwkumJ3v/UuTMjQ
         iUAi1GrWmvvqDAjHHDXCrSBvGaymUKc4r3do8jySnjSt4kClTS47H6qBX6QpjSkhA8mz
         naQbVjwZRHanVUNl46gE26LWfTqIE2kb65OrjGr7F0EJCrLeSsuHN4guKQwkAnVdF4Ke
         g7i/+kMIxGDNMxKm2MgVxBkTuBvEEY4BvDpnKexYsDbiWryoDEjlz0cxsR1wsgsrh+ns
         i1bbmBlX0RPNvLEtNG4keyvRsLuxakj7BOZHRPSATRmAzMP8aM0tyGENtrGGytMTko09
         dVmw==
X-Forwarded-Encrypted: i=1; AJvYcCUP+liQYF3XPl3ZtmFRYuM6Qt5Z7OjYbz8bHj4p2RZ0+A7x7QoT7ORJ3VszrHxeqqp6lKg=@kernel.org
X-Gm-Message-State: AOJu0Yy0LwKfxkKqjPH7UACQM0YmLX3WrRSx9DcJx9jnCH07G4miVdoq
	fnb1Lz9xPAJpA8RQDFeq8iIum64WfmsHM7zaA7zDQbtHwD3COzv/4HWXhLx61AgabNUrKZnsrAD
	BsWo4h9v7q83oKUDx9A9VAH5j9M6J92qhQgsPc9HBh8s=
X-Received: by 2002:adf:f64e:0:b0:371:8dd3:27c8 with SMTP id ffacd0b85a97d-37a42279eb8mr12970178f8f.23.1727169868043;
        Tue, 24 Sep 2024 02:24:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtB9eM4bgR0oA/7C9qfTMCUdblSA96IAhCJIqTblqLM8bL7ZbpHCQHUESQulyuXbPD8W6YbQ==
X-Received: by 2002:adf:f64e:0:b0:371:8dd3:27c8 with SMTP id ffacd0b85a97d-37a42279eb8mr12970160f8f.23.1727169867654;
        Tue, 24 Sep 2024 02:24:27 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2c215asm1079306f8f.45.2024.09.24.02.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 02:24:26 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] soc: ep93xx: drop reference to removed EP93XX_SOC_COMMON config
Date: Tue, 24 Sep 2024 11:24:23 +0200
Message-ID: <20240924092423.50734-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 6eab0ce6e1c6 ("soc: Add SoC driver for Cirrus ep93xx") adds the
config EP93XX_SOC referring to the config EP93XX_SOC_COMMON.

Within the same patch series of the commit above, the commit 046322f1e1d9
("ARM: ep93xx: DT for the Cirrus ep93xx SoC platforms") then removes the
config EP93XX_SOC_COMMON. With that the reference to this config is
obsolete.

Simplify the expression in the EP93XX_SOC config definition.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/soc/cirrus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/cirrus/Kconfig b/drivers/soc/cirrus/Kconfig
index f2fd0e16a196..d8b3b1e68998 100644
--- a/drivers/soc/cirrus/Kconfig
+++ b/drivers/soc/cirrus/Kconfig
@@ -6,7 +6,7 @@ config EP93XX_SOC
 	bool "Cirrus EP93xx chips SoC"
 	select SOC_BUS
 	select AUXILIARY_BUS
-	default y if !EP93XX_SOC_COMMON
+	default y
 	help
 	  Enable support SoC for Cirrus EP93xx chips.
 
-- 
2.46.1

