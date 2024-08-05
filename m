Return-Path: <SRS0=0ypw=PE=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671E1C3DA7F
	for <soc@archiver.kernel.org>; Mon,  5 Aug 2024 01:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24337C4AF0C; Mon,  5 Aug 2024 01:47:23 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40C28C32786
	for <soc@kernel.org>; Mon,  5 Aug 2024 01:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40C28C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ff4fa918afso24309405ad.1
        for <soc@kernel.org>; Sun, 04 Aug 2024 18:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722822441; x=1723427241; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=go9+jMuiKPxIzbSCtVn3aSgkl1rGhZtdM8/wBVYPVDE=;
        b=FbV+aohwhkuwfwXGqHxRWGwcazBXqvdcSpYpr74KJOy/5PjAdoQsoOGwnluoOj/OSh
         sNZeNs5yh2s8AxTqlJ5AwMvf3R/yXW7cycYOwJgkjNsPElZvIXqjuum3SqWW7gjHoHbZ
         hTI0HlJqTyRqn8Bd8bflVxASPNvtD5mkAch5/T5elqPLXoWrtBkm3DDzA5iuEMNjikqc
         HpODGigFb0vlvXAVq1IG5P01X7dhZelHSnttVyaB12xNHVPY4KpiWQQeFiDzHwLeOk5K
         3HC6O/orIptCXy+sINFlKCC2wpP+lQd/lbNeL2qnAJhdOHEsBjv/gGRYS7ApKv0i4raG
         zlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722822441; x=1723427241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=go9+jMuiKPxIzbSCtVn3aSgkl1rGhZtdM8/wBVYPVDE=;
        b=TbOAZ+AlrHiPrio4BPxCrgEzpAzAvD1ls3w6+AHY7CDptTClje6Z9Q0KvTuDk8ggNC
         IuTlwbGRQH+dv1dKkn8WIcrZjoD1o8EoBzbZJErJ0uxmxdO7O0B10i0hg74WZO+GA5dd
         PUbGoors9CouQgwFwTWLhiQc4COzZto09U5odC7AnWCgSAaw0zbKKeOOSnjcMHP7H0n8
         K56A3pS10cmvuCKWsKWwWVeAn5YEQee5kmJIpJkeryBhXrIk9MYuZlY2lH27ktNWiLbf
         GMi0pXZ/WeYlI6yPn5VGT5w+Ao1LSmE2fDwdGcYKiqOSOFOml6IR+aAPn/y8wRetWgW2
         jkFA==
X-Forwarded-Encrypted: i=1; AJvYcCWF4a2FX1BIh5wTCdeTz9tX/Q98iPdqzshUQTqvKJXwXhAYX8JUvGq98+irikm6oqCN5Iv2bdjnEfvi8/71XA==
X-Gm-Message-State: AOJu0YzYgKRRnldqjW/M5tWJ2hoU0thZ63JuHLSuDXr/DDkMKljX/dcY
	ZvgHIHY3+mq3kbW4D+pSse7gIg8AWDvgoCUpGQcfxtonX5klwxwa
X-Google-Smtp-Source: AGHT+IGrBD7d3KKyvGObAGd8ellCDk7nxxYgIs1u6U2R16dB2zAH+MXNhey9YIhZnLs1wqSsiIarUw==
X-Received: by 2002:a17:903:22c1:b0:1fc:5b41:baff with SMTP id d9443c01a7336-1ff5722e988mr106617235ad.3.1722822441341;
        Sun, 04 Aug 2024 18:47:21 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59295790sm55836015ad.261.2024.08.04.18.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 18:47:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH 0/5] Remove support for platform data from matrix keypad driver
Date: Sun,  4 Aug 2024 18:47:03 -0700
Message-ID: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series attempts to remove support for platform data from
matrix_keypad driver, and have it use generic device properties only
for the keypad configuration. Spitz is the only board [left] that
uses platform data.

As part of the migration I am also dropping support for "clustered"
interrupt mode, as it was only available through platform data and there
are no users of it in the mainline kernel.

Additionally gpio-keys device used by Spitz converted to use device
properties instead of platform data.  

I would prefer not to have the song and dance of merging first 2 patches
through the input tree, waiting, merging the spitz patches through SoC
tree, waiting, and finally merging the last patch to matrix keypad
through input again, so maybe we could merge it all through SoC?
Alternatively, I could merge everything through input. What do you
think?

Dmitry Torokhov (5):
  Input: matrix_keypad - remove support for clustered interrupt
  Input: matrix_keypad - switch to gpiod API and generic device
    properties
  ARM: spitz: Use software nodes/properties for the GPIO-driven buttons
  ARM: spitz: Use software nodes/properties for the matrix keypad
  Input: matrix_keypad - remove support for platform data

 arch/arm/mach-pxa/spitz.c              | 163 ++++++++----
 drivers/input/keyboard/matrix_keypad.c | 334 ++++++++++---------------
 include/linux/input/matrix_keypad.h    |  48 ----
 3 files changed, 248 insertions(+), 297 deletions(-)

Thanks.

--
Dmitry

