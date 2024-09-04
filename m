Return-Path: <SRS0=YajF=QC=bgdev.pl=brgl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EED3CD4F24
	for <soc@archiver.kernel.org>; Wed,  4 Sep 2024 20:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 385E3C4CECA; Wed,  4 Sep 2024 20:05:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23916C4CEC8
	for <soc@kernel.org>; Wed,  4 Sep 2024 20:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 23916C4CEC8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428e1915e18so57622755e9.1
        for <soc@kernel.org>; Wed, 04 Sep 2024 13:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725480339; x=1726085139; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvNzqYcqOubBZ+9rgoakUqDGmObCHf2XxvZ218tZXPc=;
        b=mKVk0HiYx2rIbx+c/o9MPu5STOw1PClayXT7/fL1iybzhCdcvIYcXHw/ikW60+MtHF
         QKsnsnhcBt2FDzixvIi77DrJeHp/J1D4v0ksTkoX3eSBZ4gLD8ciy8MIk5E1T+XfYegx
         H5waQzmUKfcLLuK4rb5e7fjc7vLpwH5OTO53Rz/2EID03kOw9dUPbXq5Wmr4yOmt/dCl
         l+CTwy7je5xXSYUUarokQE63oYesiUdZhm2KbzPokH+gd4otX1bhJbzHybWExzmF12Eb
         89a57hL2B7udMU+9h/76zUevL3MBffZGhaZlDC2QySQlc6ru0RS1nZRC7Ms3U7wK+ICY
         MsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725480339; x=1726085139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvNzqYcqOubBZ+9rgoakUqDGmObCHf2XxvZ218tZXPc=;
        b=tZcU6ecIBBzxrM35agF2SOgojyC+SQyVA0SPl/YGw8cVmtHcLXnR2KFF9fONovEKpq
         WxQaKt516TdchBWPEkk5TxO6VtG2mkTaJ1Y2WKY1NpajvQkB1G07uyEGBdm0wIh7FH9K
         4TBzbbqkRF2ZTCEuGhB6daUfbOi9HBr5QLpW1lOCZg0egsjXhhaROXK/HBljHVLNdPBp
         kec8VVZQUzBxZfsj1Rm+hjfo0Wl7327XLnWO0ppKhFt9UI2tFYbUL6A0JlKHprY18HUG
         iH29XC83Tmb0cM5Mv8bXvUtw+++El47NLHIKdEK09DVY06S33QD38b5YzpFvuZMIxaV2
         9zgg==
X-Forwarded-Encrypted: i=1; AJvYcCVHS89FQmHfqcpqRBFOiskvv6QqVQjTNZsIsQz5s5I2g/aTtQWIKC1eBcG6H1AZwN36YWo=@kernel.org
X-Gm-Message-State: AOJu0Yy6ezOf6k4f6l/9XDnEYTmM2DR5ZMQ/H+U3GxLFdqd8yrrTWVxJ
	Z0n5KXFSlM+pObs6vxdResljGkO2Ih6rKl7LzXHk7rBDdhuLgbnZaxcDGEbUGhk=
X-Google-Smtp-Source: AGHT+IEnBQSYmr1WuuqVAyBxdunF1gnXMSQlAsIWmjY2HqD2iPYxjUY0ORFQUIzxnjNAyxFWlSVWLA==
X-Received: by 2002:adf:b31c:0:b0:369:b849:61b0 with SMTP id ffacd0b85a97d-374bf1c94ffmr9826897f8f.43.1725480338164;
        Wed, 04 Sep 2024 13:05:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:66d0:70f:5bef:d67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-376914bfca1sm4738868f8f.18.2024.09.04.13.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 13:05:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] ARM: davinci updates for v6.12-rc1
Date: Wed,  4 Sep 2024 22:05:30 +0200
Message-ID: <20240904200530.80386-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Arnd,

Please pull the following updates for mach-davinci. The PR just removes
more unused code - details are in the signed tag.

Thanks,
Bartosz

The following changes since commit 7c626ce4bae1ac14f60076d00eafe71af30450ba:

  Linux 6.11-rc3 (2024-08-11 14:27:14 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/davinci-updates-for-v6.12-rc1

for you to fetch changes up to 973d248c43f237e53116009dec70091c8e836c11:

  ARM: davinci: remove unused cpuidle code (2024-08-19 09:38:54 +0200)

----------------------------------------------------------------
Texas Instruments DaVinci updates for v6.12-rc1

- remove unused cpuidle code
- remove unused function prototypes and stubs

----------------------------------------------------------------
Bartosz Golaszewski (1):
      ARM: davinci: remove unused cpuidle code

Gaosheng Cui (2):
      ARM: davinci: remove unused davinci_cfg_reg_list() declaration
      ARM: davinci: remove unused davinci_init_ide() declaration

 arch/arm/mach-davinci/Makefile        |  1 -
 arch/arm/mach-davinci/common.h        |  1 -
 arch/arm/mach-davinci/cpuidle.c       | 99 -----------------------------------
 arch/arm/mach-davinci/cpuidle.h       | 15 ------
 arch/arm/mach-davinci/devices-da8xx.c |  1 -
 arch/arm/mach-davinci/mux.h           |  5 --
 6 files changed, 122 deletions(-)
 delete mode 100644 arch/arm/mach-davinci/cpuidle.c
 delete mode 100644 arch/arm/mach-davinci/cpuidle.h
