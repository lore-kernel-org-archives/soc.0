Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8522313D8B1
	for <soc@lists.linux.dev>; Wed, 13 Nov 2024 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731522058; cv=none; b=enUQVn2M8kB+kIXiWJxHZTOtyQS3/9GqRDkKk7hU12xeCQLTEdjkNegNeWtbnecqlA28j2xoYg0ZLtPY2Z67bnjN/G3Tf3iKF5MAvo9WuYKiBa3GbAvjiG+Dw+4O09YdMfehtOT9wDfLmIYqOR/JgxgWneMiQeIMVn/K5j4nKRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731522058; c=relaxed/simple;
	bh=A2zo95P0cUkVciaSYwUn17Mn8GHfIbEow+/fyUTkvI4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ukokaj1GX9EFl6veK5vWaEOV2Bp0aSiw5aw0+2YIp3toDgwX/62ZYFYWqzlN0g5CY/bja2d8y39AZgjy6umm8y/nOjripodhJ18VNTnoz84veVXdmElcGwLGbSyar6QE0blAVNVaP0QbW0zXXy6JIQ3VY6Pt6s+s5xhenf1xCWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Omw/b7X9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Omw/b7X9"
Received: by smtp.kernel.org (Postfix)
	id 580C0C4CED5; Wed, 13 Nov 2024 18:20:58 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66493C4CECF
	for <soc@kernel.org>; Wed, 13 Nov 2024 18:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66493C4CECF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so4571366f8f.2
        for <soc@kernel.org>; Wed, 13 Nov 2024 10:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731522056; x=1732126856; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BFavaAaAPBK1zdTplun/3lQN1DVlUK79cnZIlxUFoo=;
        b=Omw/b7X9H14V1E8pvFfwuTsL0vTadhzbFL2VfwcL8K0gO+dffgZnnlLjaDIfttqsbY
         J/pO62U7sKt5mDK9oXgGke6Mr/TSYWWzz5JLhbq+ML94+BJKp1LDaUU+g8/e2clUYgF3
         QJL2EUUL03jTU9QSLzho4G2AH13mw9bx5ouqTyIlEE8+M1SOpGv2zP87ep5Nx6k8icUr
         PCl3lkvr8BIeLZPKbV54ipTJpJrKv5tnHgZ0w88v4uGXR3DSjxfW9PIsuN8GMEu/JDMA
         qh/uhfvqp+p2k9JLh++nyeDdO7kGIxkPnW353buJta2gLwnJAjplmaNQS/JvnpygdbHd
         6idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731522056; x=1732126856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BFavaAaAPBK1zdTplun/3lQN1DVlUK79cnZIlxUFoo=;
        b=T+o49uQR5oj1Ip1xQxVvNs08f5OBzRxBQ+Vl1VqoWCHmrTiGks/6qRGm7+rvQfZ3ON
         vEYvOAFm/FsZrBfH0ZThZL+z4YOsvH2GmRYvWKn1Kc1E/YY1N8b8g45u1aPsYg/jtah/
         SVVd/4vjd47NJrd/kD5xpkKIbh/W7BImZ1Vcp+T09D032YkNJnSew41XQHZrQrHWBsIP
         DNpK++g63HzaO7SPt+Ysm0mWqmpOAshVKW04xLXjgabu6GT+MlmeYQCf5ubVEALDLYUw
         ZFb2srIp5WlD4yUUv0jIqISkdYrNx/0fJJM10gjj+TPoZ36hctvekKFIgl9hZy1/xnc7
         6o3w==
X-Forwarded-Encrypted: i=1; AJvYcCWsHY0qoQISRl+UDMmOoIj/VYjF25gc7898Bi/5H1rXDHxvenEsYZxLlvgoj7dpRRDZdQo=@kernel.org
X-Gm-Message-State: AOJu0YzveC+8Gw43UDsNwEdBfPgJYKkxAigvbCp32ZDhfrlQv08mWTMr
	talBiwr3iZSLPDRCEZf6HgvE4Y7/53B1KMqrLTw30+0sgZzjHtaUBivo2Oi2EL4=
X-Google-Smtp-Source: AGHT+IEsU1pa7lAwPRKXaWud/Ylc1h9H/a+DW7TRPX/WCZyVaBRXwly5BC1hWgW2sielk9MShKXvEg==
X-Received: by 2002:a05:6000:2aa:b0:37e:f1ed:67e8 with SMTP id ffacd0b85a97d-381f186dd5cmr17209038f8f.35.1731522055625;
        Wed, 13 Nov 2024 10:20:55 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9978c6sm19009502f8f.50.2024.11.13.10.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 10:20:55 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev
Subject: [RESEND GIT PULL] Microchip AT91 SoC updates for v6.13
Date: Wed, 13 Nov 2024 20:20:50 +0200
Message-Id: <20241113182050.2176500-3-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113182050.2176500-1-claudiu.beznea@tuxon.dev>
References: <20241113182050.2176500-1-claudiu.beznea@tuxon.dev>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.13

for you to fetch changes up to d1312c5c06f5cfbed55207cdef4a319015042579:

  dt-bindings: microchip: atmel,at91rm9200-tcb: add sam9x7 compatible (2024-10-13 18:33:02 +0300)

----------------------------------------------------------------
Microchip AT91 SoC updates for v6.13

It contains:
- DT bindings update for the SAM9X7 TCB block

----------------------------------------------------------------
Varshini Rajendran (1):
      dt-bindings: microchip: atmel,at91rm9200-tcb: add sam9x7 compatible

 .../bindings/soc/microchip/atmel,at91rm9200-tcb.yaml | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)
