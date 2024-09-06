Return-Path: <SRS0=OjNc=QE=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48E8CE7B1B
	for <soc@archiver.kernel.org>; Fri,  6 Sep 2024 14:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8EFD8C4CEC8; Fri,  6 Sep 2024 14:05:21 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E032C4CEC4
	for <soc@kernel.org>; Fri,  6 Sep 2024 14:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E032C4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c254a544bfso245021a12.1
        for <soc@kernel.org>; Fri, 06 Sep 2024 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725631519; x=1726236319; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0KtTAkDnPVtI+Xf63+eqBvZoy4RV22T/taS47u19/A=;
        b=igoiokYoKWf/9PWxT7ZYSwRyvKoBxHWtHhLUqLHgiYo6TObxhr8jXMVbea98XAALH7
         MXAVmC1EJvb4jgkY7leFO5RTdx069LuMjARRaG9Zvg00tJAlRPkdA1oPtq6cGxFjbP2A
         IFoP9uFutREwryMeXcbHbFY/bJmJPHu4qTgSySlCeBjp5K8gv1JMV6hm0ZR9RODiobPU
         NoxQ2vH2pGLImVUt4At4Nby3Fxy3CDDk2XOt6Uy5Z+8Dht727yAvHm/IiH1fR+BOxVwp
         Sgu9JjD33yUYNuwxDV8XfdyCU2ADSd+HfSjw6+e5tWUz+XFZIkqXV33LFsfFg2Tbzc0J
         10ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725631519; x=1726236319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0KtTAkDnPVtI+Xf63+eqBvZoy4RV22T/taS47u19/A=;
        b=uzg2JUJ5hODR9eK4mB4Q35JgUw2xhEmZ3sGxPyIdrO7ZpcXMcsLXVPn5KbDOOdBypV
         fYDFDtJl9rcssyPLuXoCGDLvxe+FZlF2ftS8icBjxovZcj7iGtulASD9Y4/uJUn1QQmq
         eDsGHNybkswGBkZzcsyapQ7dZtgEIg8jOOca7TlOAJakZkcJ6aGBZdewZPWho6R3amx+
         rAzpM+YYW5HXDA7WwPmwPhCgkiWLIOirVYvcpWhjkrf+79CXINx9k1BFHbqwDipAgE81
         Z670KaVj5wKJqWumHaLJD77uVbFHbqoIDsC4YFAtqYeeR9pVp2ZcRehGzeKGnG7WVLz0
         297g==
X-Forwarded-Encrypted: i=1; AJvYcCX2D/yx6rMKhOlGi7cxSg+BInmJ/Op77uWahLqYb8nmSul4a1z+ay9emQxQRc/xY1fbfBI=@kernel.org
X-Gm-Message-State: AOJu0Yy2uuJfvdrOhIB7o+daDqQ9t/1m8I68KOnScK271xxmlVpKx+t3
	SFvcRruEtdzZWWr4gMKIxWDCbnjEFPK7uSHGc51eFq1KBMfwTUnM943Gzc2VHcU=
X-Google-Smtp-Source: AGHT+IH4jOU5C15cfCX8P2TTmcku2hXBGZeYp52ClIPdrcJIGyBSc1Si/kzrYhGwc89fJNBRbV5OjQ==
X-Received: by 2002:a17:907:da3:b0:a79:a1b2:1a5e with SMTP id a640c23a62f3a-a8a88909224mr102991566b.10.1725631517829;
        Fri, 06 Sep 2024 07:05:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a7e223498sm162319666b.196.2024.09.06.07.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:05:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] arm64: dts: minor improvements for v6.12
Date: Fri,  6 Sep 2024 16:05:11 +0200
Message-ID: <20240906140513.71307-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.12

for you to fetch changes up to a4b3f197bcd17ea81605f3121a459dece448e877:

  arm64: dts: sprd: move/add SPDX license to top of the file (2024-08-12 12:09:54 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.12

1. APM: correct node name to match bindings.
2. Spreadtrum: correct node names to match bindings, order properties to
   match DTS coding style and put SPDX identifier at top of the file as
   expected usually.

----------------------------------------------------------------
Marek Vasut (1):
      arm64: dts: apm: storm: Rename menetphy@3 to ethernet-phy@3

Stanislav Jakubek (3):
      arm64: dts: sprd: rename SDHCI and fuel gauge nodes to match bindings
      arm64: dts: sprd: reorder clock-names after clocks
      arm64: dts: sprd: move/add SPDX license to top of the file

 arch/arm64/boot/dts/apm/apm-storm.dtsi        |  2 +-
 arch/arm64/boot/dts/sprd/sc2731.dtsi          |  5 ++--
 arch/arm64/boot/dts/sprd/sc9836-openphone.dts |  3 +-
 arch/arm64/boot/dts/sprd/sc9836.dtsi          |  3 +-
 arch/arm64/boot/dts/sprd/sc9860.dtsi          |  3 +-
 arch/arm64/boot/dts/sprd/sc9863a.dtsi         |  8 ++---
 arch/arm64/boot/dts/sprd/sharkl64.dtsi        |  3 +-
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts     |  3 +-
 arch/arm64/boot/dts/sprd/ums512.dtsi          |  4 +--
 arch/arm64/boot/dts/sprd/whale2.dtsi          | 43 ++++++++++++++-------------
 10 files changed, 37 insertions(+), 40 deletions(-)
