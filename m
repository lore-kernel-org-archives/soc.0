Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A38C28DF0F
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 10:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753092550; cv=none; b=qy5uw/6PqQJoPy7DFHj04kr4nJvKD7Mu5QwZIE1GemfDxZOc/FswMG8Ce4KnrbSaVyLnIK7Onbqla5q+N2yIuI6er2G7cWTJ7XDLvqTTQsfNljOGT1t+4ScUGjQtrpAIljC3RPNQ9zfsMO4H+E9ZIw6GdGPAyAwaZ6HFTTxttUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753092550; c=relaxed/simple;
	bh=vjqOI8zpfW+DrHMfMI3ikiOZgwR7NpLlwVHPK4dHE3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BfEsmNyNeUwd7Tn6lCpzvNodTuwipm9QkP6luQoX1U75njPH86o/pSHn8Z4t72tZZuDCAWIvgBNXRsP/Z5ijjOo+lk8ksGvYUM+Oe7GcMj9/v4igDW6hdb9eohXSETLUzX5aA219OcIZyqnOC7JjLRNTgIBvqtEUF7pKsjNy4/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SS+CVHZF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SS+CVHZF"
Received: by smtp.kernel.org (Postfix)
	id 14CA7C4CEF1; Mon, 21 Jul 2025 10:09:10 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CDEADC4CEF4
	for <soc@kernel.org>; Mon, 21 Jul 2025 10:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CDEADC4CEF4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so792397466b.1
        for <soc@kernel.org>; Mon, 21 Jul 2025 03:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1753092546; x=1753697346; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOPi555g1R1nQnwbYf65VIBf8GYSuV0PguYr5CDG9HE=;
        b=SS+CVHZFHAGEAUrMJ3RO3c7t5u3Wzg5oOOnk+L2bbdejl/Dwl7ijMAWHa1oQMa52ch
         PtcV2sIy4KONzvrt4ypxRk39+3rvqq5PLNt6F67cFWQrVM+6Ka9eOuqianxxZ/zWpUiT
         ZYJilXv34kGOp/B8J2THFuSym2Lc6silh49mbJVfUSFwZItFRcPESkJcp6vlN15K1mIt
         Zi4wwegWGNEIF4EK0KtZIHp5pTLLbSta6XsCP0Xu9X8HEw9H+wACZcs7sXOn9aEhkK/B
         xIOA1XJfkOxg67NOaCSf9/mZq8Nrgqmt122EUc3TMGHjF7hMtoigbYnwoxAsk9wmEY8I
         kZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753092546; x=1753697346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOPi555g1R1nQnwbYf65VIBf8GYSuV0PguYr5CDG9HE=;
        b=Gu9GQBOu2eqycsaykVor8OMENMQiLGoCkQeaTeP8OLZN4jCjNogS5FyvxhhM4c3Fcz
         m7Rrzfzj8gwvAg2WRyzvS66uI2Ug5K56HxhRDEJdrntPn0c8dvOmLkFWNNhhYTDiJ8vR
         5IzRgNSFGdWY1FMX5KkJ1Qaw6cjcG9w4Ir3IGq1xjwO7RpAZvz3CLm/Mduvnc5ZI1K4S
         5hi1EcntIOJJ3/ffdyZrJx4BohjiC4NN3A68qpi3E5KCe9qw+UKk6GTNSi6mbIz6CqLn
         YdiqqRQ8zw0szNfp7xU0DHtTfmt5p9nwjMdxqvwbqO9Ko6l7lPqdVJQgkYnNNR+nUwwR
         QTzA==
X-Forwarded-Encrypted: i=1; AJvYcCWhijsnRHzAuUMamFtny9gL9y/al+bo8mwNazlpNt9XUVb+pYJgTRHqWOFYDtnrhdijL6Q=@kernel.org
X-Gm-Message-State: AOJu0Yxu//hxaO6alzFg2Fs9Oijgk63ckG9EY67odUPKwReqgNbFllnV
	hM0c4t7MFejqUJmTd0U8BlU1LDxt15VCN5MYC9ut4vubs3dJ9QcllfzBPKCCnToPDDM=
X-Gm-Gg: ASbGncsQL7KroBD9Vkf4nmEfhYRckx77aY7nCZfn4g+CiqK3LLeVszTOpl79Pa88461
	hBxSi7DEpoAGE02PFs/auqV9niB9hdgS04Mx24aRGM2gv3QOkYAanHbI6aVKukoh03IFGe/BN0B
	uDuLL1cYvR1DqIj1EIhA5fSWB51NRo74136d9JnSBe3+86lw1FRH9uP6+oPtDxor6NbTrZtz/Id
	n7kGbHYgkvgCq2gCZldo9DHULrb/vRAsTC0kBdSwto23N2zzN5r6V6IxfFqoJUhFzv6WMQIdZM1
	//cNqezEU82Xefdp4KCzpuYeE7a3ck/2MoI825dEsArWuaIgzv9yYi8fRkLUo8VzCwQ3zB6EyDK
	VVxNF9O8b5fPywwOKBvaRgZ/BjHmz4veJ497ucQ17
X-Google-Smtp-Source: AGHT+IG/sZ0fRnLRzNDazSyxk5d4XUySLdxtGzOE7Ju/SX6SozwXYOit0mXXfrFc3DkmltPmuHnQ5w==
X-Received: by 2002:a17:907:5ce:b0:aca:95eb:12e with SMTP id a640c23a62f3a-aec4df004a1mr1302412266b.24.1753092545787;
        Mon, 21 Jul 2025 03:09:05 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d68a1sm647649766b.46.2025.07.21.03.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:09:05 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 defconfig updates for v6.17
Date: Mon, 21 Jul 2025 13:09:03 +0300
Message-ID: <20250721100904.568575-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.17

for you to fetch changes up to fac62e76b870292648c62522efd1cfb72aefc079:

  ARM: configs: sama5_defconfig: Select CONFIG_WILC1000_SDIO (2025-06-24 10:06:38 +0300)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v6.17

This update includes:
- the WILC1000 SDIO module

----------------------------------------------------------------
Fabio Estevam (1):
      ARM: configs: sama5_defconfig: Select CONFIG_WILC1000_SDIO

 arch/arm/configs/sama5_defconfig | 1 +
 1 file changed, 1 insertion(+)
