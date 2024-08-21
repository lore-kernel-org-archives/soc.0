Return-Path: <SRS0=GX9E=PU=pdp7.com=drew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110AEC52D7C
	for <soc@archiver.kernel.org>; Wed, 21 Aug 2024 09:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C578FC4AF09; Wed, 21 Aug 2024 09:01:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B9BAC32782
	for <soc@kernel.org>; Wed, 21 Aug 2024 09:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B9BAC32782
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4281c164408so51159365e9.1
        for <soc@kernel.org>; Wed, 21 Aug 2024 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1724230900; x=1724835700; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqqM9bltdl7ERWZlDB/xDu0XlTf9F8/Bo40tfa0qccE=;
        b=0r/zPSl0RAsy8SN72ggyQQTkdZgtPqRvJsn0mt+0jU/SEQpBR60nlWAOVmwroUO8zT
         QHNvZu8qhx/3WMtEUWtgIo5Ecp2L5GXfFTkRQDAJ2o8+bYLj/vnze6Io+zpqDEUgvXH9
         +02UpAkt8pIXsBDz7C8/zcjcRXRG9uT1XKYGURzQCs0BU/i8iatLhuqkQwp6n233ZMzg
         2Z3gN49f05lnvLNgTO2sIhXX9MWfBT+kUjaCMZz0/yImv+kER8WgZw0raQEOBSpKvWJa
         m0HyBCo3X2klTiKC+bwFbS2Xk6SAdm1mY63PjrM+RY2JL8g8Ntt1JNOqXZmqGp7KWw8h
         WF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230900; x=1724835700;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqqM9bltdl7ERWZlDB/xDu0XlTf9F8/Bo40tfa0qccE=;
        b=AsbRyOgZ109IMwHC7l9nvgCv9iu2rABYhdisRhMKOUSWYAlup3KBEyecak/VZWkgU7
         Gx/STB2SSlqXkUVW7Qn5CMnYBNH+6KhncTtLlDfWDIVr1M32EP7cXVjZRGBZcv+5Tvol
         JBrTxBygeIE9jjFUzjjhxPmVjJfGuDTOAj9HjB2Kqv+xoYD63caaElCoRqPJM5RNXe9X
         O7sQYuxRjfZ+tpr7XeB59OAKqpYj4s22j2cMjqfm/FE2p8nZakDmBu3M2QFBehI2OsLf
         CXKIA8lqiF0T/29TMxuda5SWh2yTKJaEZG7K6JDJdZChSHa/cyqDG6ERhhFO/6iHzJxy
         tthg==
X-Gm-Message-State: AOJu0YynwVP1WEEoO1NdxMj+Q6v2GV2uMQay2PqHCOUWHME9wmlCnKyA
	XU/x9eZxyX534Pdq4j8rIuxHFpnVTmSdbKXzJrV0YdCyDOTqGvmSZJOyPdW3LlIGGqAKmxuCu1u
	/qmE=
X-Google-Smtp-Source: AGHT+IFvRpxwoefPfsPJKT7RyLtcLqtQGYbN7c2LTwxuGtgb6LyU4gPYatIPuNkyVwMXdBcT7xS4NA==
X-Received: by 2002:a05:600c:1d83:b0:428:c0a:27ea with SMTP id 5b1f17b1804b1-42abd212819mr12286595e9.12.1724230899932;
        Wed, 21 Aug 2024 02:01:39 -0700 (PDT)
Received: from x1 ([31.217.165.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abed8b86bsm18002035e9.4.2024.08.21.02.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 02:01:39 -0700 (PDT)
Date: Wed, 21 Aug 2024 12:01:37 +0300
From: Drew Fustini <drew@pdp7.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.12
Message-ID: <ZsWs8QiVruMXjzPc@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

Please pull these thead dts changes. I've run W=1 dtbs_check and they
have been in linux-next since August 9th.

Thanks,
Drew

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://github.com/pdp7/linux.git tags/thead-dt-for-v6.12

for you to fetch changes up to 2d98fea7491a00dccd61fee019843b262e60f819:

  riscv: dts: thead: change TH1520 SPI node to use clock controller (2024-08-08 09:19:46 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for v6.12

Add SPI controller node to th1520.dtsi and enable spi0 on the BeagleV
Ahead and LicheePi 4A.

The TH1520 AP_SYS clock driver landed in v6.11 so convert multiple
peripherals like mmc and uart from fixed clocks to the clock controller.

All of these patches have been in linux-next since next-20240809.

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Drew Fustini (6):
      riscv: dts: thead: Add TH1520 AP_SUBSYS clock controller
      riscv: dts: thead: change TH1520 uart nodes to use clock controller
      riscv: dts: thead: change TH1520 mmc nodes to use clock controller
      riscv: dts: thead: update TH1520 dma and timer nodes to use clock controller
      riscv: dts: thead: add clock to TH1520 gpio nodes
      riscv: dts: thead: change TH1520 SPI node to use clock controller

Kanak Shilledar (1):
      riscv: dts: thead: add basic spi node

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 17 ++---
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 12 ----
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  5 ++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 83 ++++++++++++----------
 4 files changed, 56 insertions(+), 61 deletions(-)
