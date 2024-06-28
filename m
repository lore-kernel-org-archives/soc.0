Return-Path: <SRS0=AxmB=N6=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550CFC2BD09
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 187D0C2BD10; Fri, 28 Jun 2024 21:08:26 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D11FC116B1;
	Fri, 28 Jun 2024 21:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D11FC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52cecba8d11so1252607e87.1;
        Fri, 28 Jun 2024 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719608903; x=1720213703; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dmhlTQVKP3bt0jrACs+g3oYCc5nmTL2fJ8oisMAUBwk=;
        b=Lr6aqbi/6a7J3DLsGL6A6KoRlsLkbZvJWZgoPXsvPOhrAucxYT/t0WFX9caw/uO+IY
         WSCHgse2OH+qm4y24mG9tS108USBjzJTQyFsL8LS5gLgBPPlMAHAQzGc18/xdcankY3g
         7hqSU/emB1Obk6NhMG/YSuCqGmUb9Hq8WY8mnI3oBIMLAuJ3g1mghx/fR38WNhE7NFWl
         1mJoo//4Ep10EXbfHMCUOMNZmD5gqJ9zU0YN5RU02WVdzuuHnpGF5K3oeB+HvYyEuc6X
         PTDbwV3doGYnzNqheHpur71GQnwhvF3GY0ZYbinhTCLNg29Bkp8BM/tgvEN6DNcMb92s
         JxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608903; x=1720213703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmhlTQVKP3bt0jrACs+g3oYCc5nmTL2fJ8oisMAUBwk=;
        b=KKwzpLvQOTurI1O2cWoZfgttLH82ipPjArkuO74d/J6yWddg8+dwHObBD72M9PNngn
         C+SzvRRj0F/EQLRwC1XWOVtsqjfOW2BsIy742uZLY7gmoRkTk7BALqrfGc35i5dEQ31c
         sAK4YkMzwMqd0bR/eiu6rgKHDsv01Oq0LYDB/Ng5w9B5ug4A2QtRuBYhVmLvx1bmn0Y7
         N1ZL1HnuWZC3un4Dr5guJ7kq7pDi+GsP+imyTq+gYyBoCLDSk1PAEbreTnEA/xo1hRSv
         eG4Oyhv1dfCG2vuoMxWYrnYOjCkxHsGYWVpRKUuAhmBroiz7Qmt3/FclW1+gSnHt36bn
         faqg==
X-Forwarded-Encrypted: i=1; AJvYcCUINlp56DH+paoQysVSzqg10hGYSKxwhNKELMifDIA4DGGTeLbkMprmbYOmDXcciDbUv6LtCK6eL3zwiN3Wsw==
X-Gm-Message-State: AOJu0YyGDKNeQUSSXJD3ZkROAWL8TLr0zSsKP2pFFGRWB8EAvIuYAqA4
	9iag4Z4e9vikHZ6fW7hhYKc8Hg0KipyGGsoB0UD4WVdXwQCGCIcWp4saJw==
X-Google-Smtp-Source: AGHT+IHPh5XULJ09RYKLkz5YRHePVV5MnL22HsdOUS9qtdmpNP5TPa2vhc8R+fmRFlGZT7a5KXlamQ==
X-Received: by 2002:a05:6512:31d2:b0:52c:e3bd:c708 with SMTP id 2adb3069b0e04-52ce3bdc757mr14024777e87.10.1719608902122;
        Fri, 28 Jun 2024 14:08:22 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af389b3sm51396625e9.1.2024.06.28.14.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 14:08:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] soc/tegra: Changes for v6.11-rc1
Date: Fri, 28 Jun 2024 23:08:14 +0200
Message-ID: <20240628210818.3627404-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.11-soc

for you to fetch changes up to cfcd6c46fec46cac3bf6658838d3ea329aff37aa:

  soc/tegra: pmc: Simplify resource lookup (2024-06-27 09:02:31 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.11-rc1

This is a simple change that condenses two function calls into one in
two places to save some boilerplate.

----------------------------------------------------------------
Jon Hunter (1):
      soc/tegra: pmc: Simplify resource lookup

 drivers/soc/tegra/pmc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
