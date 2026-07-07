Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EA237FF5D
	for <soc@lists.linux.dev>; Tue,  7 Jul 2026 03:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394047; cv=none; b=kPLroN4wLNUpzpIdiMiRRYM4ALr8GC9JJ2Z0UJO6YmI4YQVUIGoj3zmRmezEssqFzrD8ykfxI2vimjarKwQf5FqPxbStZIu9dYxd9P0CL2JXD36KVehMgnDJAGnqqShlrL8X4fzKyPLbp5J4wCKx+qHNLsHbyeOfvaLiRHHiUgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394047; c=relaxed/simple;
	bh=n2/nKFygs+4Z+p5617bemBXSFbdENuHbHfewNN2PB6w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FOtADL+2xRQBV9CHWRNVkfTPr7UlC7ftpyONNBE7r2Gx4008vvv2j3U0qbrvEj1KG2gtm0Tma1wMXIYTBHbUQkqfRTMVKvI/6jNa/LSYtUug4e3CyHShZMkxTFdRtD95/M9SXF8rBec2o1H3yvdeZxe9nCqryppb/e+oFsypohs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2Cl5/qx; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2Cl5/qx"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84347ad88edso4977020b3a.1
        for <soc@lists.linux.dev>; Mon, 06 Jul 2026 20:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394045; x=1783998845; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+fjWa++UBimAMIMqNtyKD1hu2ij4ym5qJ6xUR6av8M8=;
        b=I2Cl5/qxFYrAGjOzWt1K2TVtkZlKDfqbb2x0KDwuITzCASOVaUyUqhSKNOjGBKNSbY
         UaU34ekjj4FVTp/G1iQ5faB4ypQ1BClfcJHihHYcGPMvR+bH3kVM3vBuW52OiaRh8f5m
         /uIBFMciB/kIMYpux2jMiNVsI3rJMwRw6ZJvBKCW4JToc11QdalNNvoPeGXXkwmgy7X5
         qf2nwRL1KpyubUCcRxCB98tgm7i3IRS1CLnNB94Lg2Mw4P83y+Z0CnL4Ul+mEmVX2tmQ
         PsVAhXtCnHR5q6vl5/DNNIdHVVls6p3bn9z68vbCFEGgoNhFfEpJJCIQg7U9tpn6L4Ps
         7YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394045; x=1783998845;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+fjWa++UBimAMIMqNtyKD1hu2ij4ym5qJ6xUR6av8M8=;
        b=gwe1wPS/HKQFjfeLFo0L0TCxB+jbRCd0gF4D/tpNX5G+ChB7ONIn4yWkXvEl1BXrS1
         15l5DKWZOQ58q+NDYfPr6cupKGz5nBz+dQTApcMnb+Hgf35JegNdDfh/ssVA19ddzzkv
         WvCrwANKZdLexTnzGaunNgQk+gNAuE46w4ph/ESOKFR86F5/sWVw3KQudgrMPxFEYiPe
         Ckt1YsdqwruG83jtVgdkgl2+aT7LT8vSWMFKhz9+In3S8RlOARv5sl4vCGy03JZyRpJj
         0HnxxottB/ZlH2DLuudADlYth0FWFDQi6MnhRW8zrb2vcMKBKF0ZeKMwpl5EeEOOeOaN
         DhOg==
X-Forwarded-Encrypted: i=1; AHgh+RqP7mnVgY9+LdRAdt7xBepkeFwqElCBqbC/Ko10t9w1SNZvdRNVWnaPxqu9W4AKvrFa2s0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1QG8skZpCFlH2Wwv6jGQnygFLl7roIoIjtU123+UbOk5X3DUn
	SsVZMhQVieLYA4Zr3Mk2ph5Ih/+WmgKJsywmotACYGVsbZdCuo6i9sJR
X-Gm-Gg: AfdE7cmqjU3bpcQFOjuRRpshnHPTDzXMDCEH7KRgeaObaBAVKkWzhVYDPKBQENbdX3g
	O5+9QaM6s+tZNIbk5YxunpdT4KeCfhn3H+hWOUAlYRn0gHW8li9EtfcTCy0A+/62y4yHcITuuCN
	qvc4VVeJVhHNjjrlciTfJ88LUn65jpLCQyBNa1jny/cuJMBQxATOCNey3rLte3Rs9wLyxWM5Fuw
	yoLU9N0dbCA5HYus+jMM6RNLH1D05iVbAD/0Pb3Jh2YSppEkC5Ug8axCO//xN26e/y83nCzBAys
	wuG9p6Q1G/+bOvukM01qG0EU92RIWX+HCYFQJFvDCLBmz1vRpy4eGKrgMv08JxZdWaJhbIHk/Nl
	/S9KgRgxays3SMbY6IG0ypH5oib4WeG9m0IjnZcuYQBYcSvQ5N2m+P8XWB8YVN94ZRGQ8iQ8OF0
	rqR2aPZmr9WtFs4A/WNDafdq3VEQl+cz7p8iOtS0U3e0u1+GwmwDzMJ9K1zAvNPAT73yYM+qf8d
	RE1Nz/xm/6IFME=
X-Received: by 2002:a05:6a21:3294:b0:3bf:6c08:2849 with SMTP id adf61e73a8af0-3c08ef2d446mr4097835637.56.1783394045522;
        Mon, 06 Jul 2026 20:14:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:04 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/4] ARM: sa1100: convert gpio-keys to software nodes
Date: Mon, 06 Jul 2026 20:13:59 -0700
Message-Id: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPduTGoC/yXMOw6DMBBF0a2gqbE0dhQQ2UqUwoYHDIWJPOEjI
 fYeJ5SnuPcgRRIoPYqDElZRmWOGLQtqRx8HGOmyybGruOa7UW8ts9Etzh2Md0BAU98QAuXmndD
 L/v89X5d1CRPaz29C5/kFSAKU23EAAAA=
X-Change-ID: 20260705-sa1100-swnode-a2eebe973ebb
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

This patch series converts StrongARM SA-1100 evaluation and handheld
boards (Assabet, Collie, and HP iPAQ H3xxx) from legacy platform data
(struct gpio_keys_platform_data) to static software nodes and device
properties.

The first patch registers a shared software node for the SA-1100 SoC
GPIO controller in drivers/gpio/gpio-sa1100.c, attaching its firmware
node directly to the GPIO chip prior to registration. The subsequent
patches convert the board setup files to define static software nodes
referencing the SoC GPIO controller directly, allowing pin bindings to
be resolved via the attached firmware node without relying on name
matching.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (4):
      gpio: sa1100: register software node for GPIO controller
      ARM: sa1100: assabet: convert gpio-keys to use software nodes
      ARM: sa1100: collie: convert gpio-keys to use software nodes
      ARM: sa1100: h3xxx: convert gpio-keys to use software nodes

 arch/arm/mach-sa1100/assabet.c | 75 ++++++++++++++++++++++++++++--------------
 arch/arm/mach-sa1100/collie.c  | 74 +++++++++++++++++++++++++----------------
 arch/arm/mach-sa1100/generic.h |  3 ++
 arch/arm/mach-sa1100/h3xxx.c   | 69 +++++++++++++++++++++++---------------
 drivers/gpio/gpio-sa1100.c     | 10 +++++-
 5 files changed, 150 insertions(+), 81 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260705-sa1100-swnode-a2eebe973ebb

Thanks.

-- 
Dmitry

