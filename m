Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811277E792
	for <soc@lists.linux.dev>; Sat, 15 Nov 2025 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197253; cv=none; b=EqiNDIy84IwpGKY46FkTXk03KLnZwMzIDimJld+L3dFSHY2T4pJtZ4+CXGohH94MqP3jIapEqylS8qt0CVIaD4T/DOlcyW1uhybnBCtriGgpNW1kITTYRbs60TNyFw8TQNU2Om1FuNOdpBujXP9lgafIg1kGQ/gMNzg2SRUranU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197253; c=relaxed/simple;
	bh=llOeIgKu70lBMfgvDNAGcgciZ6ZowV9Pd+ydOcXSkmo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GXIWUelTmkkgwr0labO9+blfgzWA8YBVvMx2BIL7udBw0IacZfNXNRVQh79bzaRmZ1iOvtOXJ84NvqqlRybPm+N/QGKST/ILfyeYC4UcVDFiBH2kpDTqbVYxlXJClYe992moXzUE/nRgdHNS32f6m3Hdgkz/cZnKbuuMo7d4+LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyFBsKxN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyFBsKxN"
Received: by smtp.kernel.org (Postfix)
	id 36530C113D0; Sat, 15 Nov 2025 09:00:53 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15F3BC4CEF5
	for <soc@kernel.org>; Sat, 15 Nov 2025 09:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 15F3BC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775638d819so15656605e9.1
        for <soc@kernel.org>; Sat, 15 Nov 2025 01:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197250; x=1763802050; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/FG4Wv2yzpc6XTk4ytRAyYbGsSHLi20bNidAtF6BPo=;
        b=EyFBsKxNDkUIIeJgF2o/ysGizmhho+qWXuE/LvkyflDvXu/sDyyl96szhQUZ3tL8JK
         WLEPHy8MQS8Q17WFw7nKlPi5JUxH6ScM/GYUhxRsOnhNUnxEvLYbvMIezNe1SjW/d5s6
         jxiwHAJzCVdqk75XwpAIiA74fXiMZ2DkOt8VEb4F0dIdFoQHWe6w0KbaxR7eXBuxHEpj
         FoioFMHy93WRgfufWnrluXKK//EgxIojXa6vmWT8CzADQ+NuPflBZKrDn/XTJCC/f8Kk
         wSY4Vxd1DcDtbQ2WfMfkJVbqn6ITT/s7RtJ8w5FZQ2JB9lDJr44ugqA70cumWGT0H1Vu
         +YLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197250; x=1763802050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/FG4Wv2yzpc6XTk4ytRAyYbGsSHLi20bNidAtF6BPo=;
        b=kAyjczGerbNpKyNZXca46J1SnpfQlanVHsOfZ3leNbujF8/FRfc24WCt6sqw7mVImZ
         QUg7NNJXNpJ0uRWqHxzdBRvdSlt9uRuUuFBWDIulls9TjjHHjBeKMs5k+BLvxltx5G1d
         Pcrb3BCtfzECSfJe3LQ/bl/6m8m1b3NXsYifoGGob+ijaYF7JL8DUyPZsXIPVg21US0a
         vqzCwEJRsSDCDC4NyCk+AzNxnmTDwaZvGvv+L8jMSYjAtNg+t2cPUUrLH09mLOq8Llxj
         WzqFZrFwQsnstZt1eAz3eMlaZ9dsyqZZ8GcxgIqBzQRhv29oQs1l0F49paIjqfP1Muu0
         ETrg==
X-Forwarded-Encrypted: i=1; AJvYcCWvjVl0VQ2B+amgT3BAs3vVvnjzp0nnSXY0Swb7MCOqXSdNsEfxp35YxFR4m5LwL6FsWu8=@kernel.org
X-Gm-Message-State: AOJu0YzYUVFrrLhpk2znzoa8WQOI/Ozh9OkYg3Rb0Kg/7M7Nrw2wyNhI
	oR6dPmaefJ0wKk90z1AwN/cKDBbFnDAP05q5aQDg64MSk+xFJ1Aoyxtl
X-Gm-Gg: ASbGncuonNcFP3nbLvj3zBB94gwOWC2I2BQxjJQ8D58MYapRHUuxSzCYQuAkMakYfK7
	bsQtli16cSQAA5MtXHt7Fw9H4icUhiR46OIC/zkfn76zoQaj6gCCg7x9H4ez/TmPcM0uXcCMBJd
	7mr7FUkqBPZP2Z1wiyCLtp0MiShoEvdQEliX+n54ntwlyAemcRGZOFD/xEoquWs1jrGY8p4M5/O
	MznXIf34uUOZohZ7LQNOtGdFe+cOeWWGZyDdwGmD6ud9+DgLojAIlgAB46U6lRbNba36xXsipJf
	v1ES+r9RwJ/Ufmn/pprVgpOfwTE5g2HmsSGsvrAlUOIcVP7w5naZxBGtQ8Gwz50p2VpQHG74pny
	OXC7zje4FXGXGdenCqRzQ/FbS2sKDDhfTLGi7MvPYkVcQPd2EEgxttgMYAPbPd4VbKpypKNua5o
	qELq1S1+XLirLeOLSM45Bpq03TXRReGs7m+/Mlq3fDZfLVlBKFU14KKIlB6qgZJvCjS3zo
X-Google-Smtp-Source: AGHT+IHKzYERexCacs/Q5yKJvm0zjIs4CrHo/8nTkrtDYu+DEwl/oT7LDhhSdgl1W/LCLyMV8AfECw==
X-Received: by 2002:a05:600c:c4aa:b0:477:79f8:da9d with SMTP id 5b1f17b1804b1-4778fea8cbemr51354805e9.24.1763197249912;
        Sat, 15 Nov 2025 01:00:49 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6acsm200541545e9.9.2025.11.15.01.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:48 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/8] syscore: Changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:36 +0100
Message-ID: <20251115090044.3140331-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-syscore

for you to fetch changes up to a97fbc3ee3e2a536fafaff04f21f45472db71769:

  syscore: Pass context data to callbacks (2025-11-14 10:01:52 +0100)

This is a cross-arch/subsystem patch that is a prerequisite for several
subsequent changes that I plan on getting in after v6.19-rc1. This is
purely an API change, so no functional changes are intended.

I've done extensive build testing to make sure all files are covered,
but a last-minute build problem was reported two days ago. This was due
to a #ifdef block for a configuration symbol that wasn't covered. That's
now fixed, but it might be a good idea to give this an extra few days in
next before merging it, just in case there's something else I missed.

Thanks,
Thierry

----------------------------------------------------------------
syscore: Changes for v6.19-rc1

Add a parameter to syscore operations to allow passing contextual data,
which in turn enables refactoring of drivers to make them independent of
global data. This initially only contains the API changes along with the
updates for existing drivers. Subsequent work will make use of this to
improve drivers.

----------------------------------------------------------------
Thierry Reding (1):
      syscore: Pass context data to callbacks

 arch/arm/mach-exynos/mcpm-exynos.c        | 12 +++--
 arch/arm/mach-exynos/suspend.c            | 48 +++++++++++-------
 arch/arm/mach-pxa/generic.h               |  6 +--
 arch/arm/mach-pxa/irq.c                   | 10 ++--
 arch/arm/mach-pxa/mfp-pxa2xx.c            | 10 ++--
 arch/arm/mach-pxa/mfp-pxa3xx.c            | 10 ++--
 arch/arm/mach-pxa/pxa25x.c                |  4 +-
 arch/arm/mach-pxa/pxa27x.c                |  4 +-
 arch/arm/mach-pxa/pxa3xx.c                |  4 +-
 arch/arm/mach-pxa/smemc.c                 | 12 +++--
 arch/arm/mach-s3c/irq-pm-s3c64xx.c        | 12 +++--
 arch/arm/mach-s5pv210/pm.c                | 10 ++--
 arch/arm/mach-versatile/integrator_ap.c   | 12 +++--
 arch/arm/mm/cache-b15-rac.c               | 12 +++--
 arch/loongarch/kernel/smp.c               | 12 +++--
 arch/mips/alchemy/common/dbdma.c          | 12 +++--
 arch/mips/alchemy/common/irq.c            | 24 ++++++---
 arch/mips/alchemy/common/usb.c            | 12 +++--
 arch/mips/pci/pci-alchemy.c               | 16 +++---
 arch/powerpc/platforms/cell/spu_base.c    | 10 ++--
 arch/powerpc/platforms/powermac/pic.c     | 12 +++--
 arch/powerpc/sysdev/fsl_lbc.c             | 12 +++--
 arch/powerpc/sysdev/fsl_pci.c             | 12 +++--
 arch/powerpc/sysdev/ipic.c                | 12 +++--
 arch/powerpc/sysdev/mpic.c                | 14 ++++--
 arch/powerpc/sysdev/mpic_timer.c          | 10 ++--
 arch/sh/mm/pmb.c                          | 10 ++--
 arch/x86/events/amd/ibs.c                 | 12 +++--
 arch/x86/hyperv/hv_init.c                 | 12 +++--
 arch/x86/kernel/amd_gart_64.c             | 10 ++--
 arch/x86/kernel/apic/apic.c               | 12 +++--
 arch/x86/kernel/apic/io_apic.c            | 17 +++++--
 arch/x86/kernel/cpu/aperfmperf.c          | 20 +++++---
 arch/x86/kernel/cpu/intel_epb.c           | 16 +++---
 arch/x86/kernel/cpu/mce/core.c            | 14 ++++--
 arch/x86/kernel/cpu/microcode/core.c      | 15 ++++--
 arch/x86/kernel/cpu/mtrr/legacy.c         | 12 +++--
 arch/x86/kernel/cpu/umwait.c              | 10 ++--
 arch/x86/kernel/i8237.c                   | 10 ++--
 arch/x86/kernel/i8259.c                   | 14 ++++--
 arch/x86/kernel/kvm.c                     | 12 +++--
 drivers/acpi/pci_link.c                   | 10 ++--
 drivers/acpi/sleep.c                      | 12 +++--
 drivers/base/firmware_loader/main.c       | 12 +++--
 drivers/base/syscore.c                    | 82 ++++++++++++++++---------------
 drivers/bus/mvebu-mbus.c                  | 16 +++---
 drivers/clk/at91/pmc.c                    | 12 +++--
 drivers/clk/imx/clk-vf610.c               | 12 +++--
 drivers/clk/ingenic/jz4725b-cgu.c         |  2 +-
 drivers/clk/ingenic/jz4740-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4755-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4760-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4770-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4780-cgu.c          |  2 +-
 drivers/clk/ingenic/pm.c                  | 14 ++++--
 drivers/clk/ingenic/pm.h                  |  2 +-
 drivers/clk/ingenic/tcu.c                 | 12 +++--
 drivers/clk/ingenic/x1000-cgu.c           |  2 +-
 drivers/clk/ingenic/x1830-cgu.c           |  2 +-
 drivers/clk/mvebu/common.c                | 12 +++--
 drivers/clk/rockchip/clk-rk3288.c         | 12 +++--
 drivers/clk/samsung/clk-s5pv210-audss.c   | 12 +++--
 drivers/clk/samsung/clk.c                 | 12 +++--
 drivers/clk/tegra/clk-tegra210.c          | 12 +++--
 drivers/clocksource/timer-armada-370-xp.c | 12 +++--
 drivers/cpuidle/cpuidle-psci.c            | 12 +++--
 drivers/gpio/gpio-mxc.c                   | 12 +++--
 drivers/gpio/gpio-pxa.c                   | 12 +++--
 drivers/gpio/gpio-sa1100.c                | 12 +++--
 drivers/hv/vmbus_drv.c                    | 14 ++++--
 drivers/iommu/amd/init.c                  | 16 +++---
 drivers/iommu/intel/iommu.c               | 12 +++--
 drivers/irqchip/exynos-combiner.c         | 14 ++++--
 drivers/irqchip/irq-armada-370-xp.c       | 12 +++--
 drivers/irqchip/irq-bcm7038-l1.c          | 12 +++--
 drivers/irqchip/irq-gic-v3-its.c          | 12 +++--
 drivers/irqchip/irq-i8259.c               | 12 +++--
 drivers/irqchip/irq-imx-gpcv2.c           | 16 +++---
 drivers/irqchip/irq-loongson-eiointc.c    | 12 +++--
 drivers/irqchip/irq-loongson-htpic.c      | 10 ++--
 drivers/irqchip/irq-loongson-htvec.c      | 12 +++--
 drivers/irqchip/irq-loongson-pch-lpc.c    | 12 +++--
 drivers/irqchip/irq-loongson-pch-pic.c    | 12 +++--
 drivers/irqchip/irq-mchp-eic.c            | 12 +++--
 drivers/irqchip/irq-mst-intc.c            | 12 +++--
 drivers/irqchip/irq-mtk-cirq.c            | 12 +++--
 drivers/irqchip/irq-renesas-rzg2l.c       | 12 +++--
 drivers/irqchip/irq-sa11x0.c              | 12 +++--
 drivers/irqchip/irq-sifive-plic.c         | 12 +++--
 drivers/irqchip/irq-sun6i-r.c             | 18 ++++---
 drivers/irqchip/irq-tegra.c               | 12 +++--
 drivers/irqchip/irq-vic.c                 | 12 +++--
 drivers/leds/trigger/ledtrig-cpu.c        | 14 ++++--
 drivers/macintosh/via-pmu.c               | 12 +++--
 drivers/power/reset/sc27xx-poweroff.c     | 10 ++--
 drivers/sh/clk/core.c                     | 10 ++--
 drivers/sh/intc/core.c                    | 12 +++--
 drivers/soc/bcm/brcmstb/biuctrl.c         | 12 +++--
 drivers/soc/tegra/pmc.c                   | 17 ++++---
 drivers/thermal/intel/intel_hfi.c         | 12 +++--
 drivers/xen/xen-acpi-processor.c          | 12 +++--
 include/linux/syscore_ops.h               | 15 ++++--
 kernel/cpu_pm.c                           | 12 +++--
 kernel/irq/generic-chip.c                 | 14 ++++--
 kernel/irq/pm.c                           | 11 +++--
 kernel/printk/printk.c                    | 11 +++--
 kernel/time/sched_clock.c                 | 22 +++++++--
 kernel/time/timekeeping.c                 | 22 +++++++--
 virt/kvm/kvm_main.c                       | 18 ++++---
 109 files changed, 898 insertions(+), 470 deletions(-)
