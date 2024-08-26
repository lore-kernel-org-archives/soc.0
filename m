Return-Path: <SRS0=ZWwM=PZ=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D366BC5321E
	for <soc@archiver.kernel.org>; Mon, 26 Aug 2024 17:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96737C58284; Mon, 26 Aug 2024 17:07:55 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 835FBC5828A
	for <soc@kernel.org>; Mon, 26 Aug 2024 17:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 835FBC5828A
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8684c31c60so539981666b.3
        for <soc@kernel.org>; Mon, 26 Aug 2024 10:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724692073; x=1725296873; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PHLTIZSL6mxK5jXoYm57pd0VcDJXB77tZFJivAxUJuI=;
        b=JdjX1nUUQiggqU0uVzVjVVmtiW/f6woAU4bc34SFG1dEMl0OrSWLcu041e6x8QJQdx
         IXs0u4KubbmdlxhuUl+v54lXxRaouhMXfqxNYjJ+rJFUXoRxLRXsx4P8YFrjZQQHS+s4
         luwAj/d/NzPPd2le5lsR/zS77gon0wfEUsxV13aCaNJrBy1CwoAwdE0ZwnjDQBlIHgc9
         9bp9TsxPzI698PTaoawOgFJoj7oydw3clzUejuNn2S5tOzCtZ195h4UKzHw9LMzxPl2L
         WjrJPjiT5cgXOXS8wofQ/aKSozriyGbBvKObxY3MYg/Gx+36YXRWkcD2oAnJnGcQwB2E
         8wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724692073; x=1725296873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHLTIZSL6mxK5jXoYm57pd0VcDJXB77tZFJivAxUJuI=;
        b=CtiEdxHH6z0puThvIoIp0EYceff88u7IDbUep3TibqBOY/8BSQBpFJ6sP/GFtgKVSW
         0G7JS6qsbmBh9wRJdQxUf2iHhMC+griyFWbeh0C+crVjunP2I/7o+VaKihh+CwjyIpgK
         igVyyXeOpOcZyVvGE9xDQNEkkAoLvYmkJAytM9sjsJ5wXBGQRTYL80iPv0W/9f3P2pBd
         3xDUaawscjGm78zNRZb1GMePSs3e2V7Iq46q9soOjFZvBvP8tXtLrwoqFeN68NIAFttC
         +VPHdqAqHWWikcosBSozkfBRqGwASUSSDCCIY4Tq5lBnpUW2GBA4GSfquIj5Dv86CIFS
         o6Ow==
X-Forwarded-Encrypted: i=1; AJvYcCX3pI0LF9S7nqD82LjZvGuqNcd7YUyRobh8bX5hR570dD/liin9elzsiDPRmnLuNalra0I=@kernel.org
X-Gm-Message-State: AOJu0YyjtrKXB4LADXqRK2ZnD4Jdk7M8DXc1Gu8OJSjz3lCI8jNrkmmU
	B558HRhS0ReJy5ho+i3y9LU9kjN9fG2SNQm3YgRyfDSA/9XMPHGppvcXZOY79pk=
X-Google-Smtp-Source: AGHT+IF/Fhz0MlhVmlP4aiiVZUWBNUm1/8dArRXig/7U5NzOsgQp5We61UW+Mtsts3RMRjli6f9HYQ==
X-Received: by 2002:a17:907:7d9f:b0:a86:8b7b:7880 with SMTP id a640c23a62f3a-a86a54bf55emr682757866b.63.1724692072692;
        Mon, 26 Aug 2024 10:07:52 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f28f109sm684042866b.55.2024.08.26.10.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 10:07:51 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 fixes for v6.11
Date: Mon, 26 Aug 2024 20:07:49 +0300
Message-Id: <20240826170749.3271888-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git at91-fixes-6.11

for you to fetch changes up to e9408fa234fb2c0f087d718c7172212bb0dd7e6f:

  MAINTAINERS: Update DTS path for ARM/Microchip (AT91) SoC (2024-08-07 18:29:56 +0300)

----------------------------------------------------------------
Microchip AT91 fixes for v6.11

It contains:
- DTS directory update to match all entries not only those starting with
  at91 or sama

----------------------------------------------------------------
Andrei Simion (1):
      MAINTAINERS: Update DTS path for ARM/Microchip (AT91) SoC

 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
