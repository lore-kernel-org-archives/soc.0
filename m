Return-Path: <SRS0=hsWj=HF=gmail.com=jacquiot.aurelien@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E940C433DB
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 07:52:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1E9BB64E43; Wed,  3 Feb 2021 07:52:21 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8537164E3E;
	Wed,  3 Feb 2021 07:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8537164E3E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=jacquiot.aurelien@gmail.com
Received: by mail-oi1-f172.google.com with SMTP id n7so25789787oic.11;
        Tue, 02 Feb 2021 23:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a9z++W2wRebjxIFG67r6l73+2fuLawkme/JzgcDyPdo=;
        b=Ki6aqWgPkR3SP6KlmhUgCgg3t1sGLsy4z8QA8vXkPBdLoeuENwbjLi1zXDvZj5oiFX
         KGGo+T8YGTsNbwdzAcU4/jkmjD4738/RGpSzk03a/y7F0qU+uUy3xycSvJAZ3zMqhFlu
         CU9KmzGsjliYi0qKqD+surIamwX8m5RmbLtk77g7wFzisrwRSIHKEBVgjz8AlA8sEq87
         jKV7Aqpi6L1gtYL9eQryF9FxVMl8GIsuEnyAfw3NsQZFd1XUci/sVKgk/iCSRWLT9cXH
         5UHV0cII0Vn4fTzE24zNDu6pm2tFMSsWr6Edltzo5TaXpN8ttrHeOZJHEiTZeB1GXUyF
         sC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a9z++W2wRebjxIFG67r6l73+2fuLawkme/JzgcDyPdo=;
        b=PRMnePtzf7K+I09ECzZZtRmndSjZ5C5gAqMxn8hvWpgigbmqDBOIZN0bSrByWhjVb7
         7AJV7EtcxletEMdAW6B+MfRtJATqmfzLg3jPG/U3ZhCN8JAPvh9TdFSc4KS2XuySL0rB
         HTSO+2qZt9zB8N2Ba/GKuyoYF8U4+f3M22qoTRNfshLg+L4nm2V4aDNc7i5VRKCgiMWh
         dzVyj/XVC/txbUy1OlRWbg4zNpFgFmjFxf+WP0ruMeo07Rbrug09XS9YXWTRdlaoI13G
         KlFZcED8Qq3Ft3U19IYK0QIFsP/R+a2hTJnPha2wkJ1ULmnymCuH4ufomp7CmxHXc64y
         UN6w==
X-Gm-Message-State: AOAM533wFgzEsIJO2hYMYshEPKOuhNaYDatvAama3UBfoDgCfKliIeXT
	Suoeoe/Rotl2PE2fTgunMtsYSE69sp+VpH4Eh8Q=
X-Google-Smtp-Source: ABdhPJyiO2flItmxo0zWoKF9GTEp7zyj/5nCveEkUUbyXze+jE/u6MmHZ0Jl/OSEEHIn0FPYCuLCqXcMRxeDCAYWJnU=
X-Received: by 2002:a54:4689:: with SMTP id k9mr1225429oic.149.1612338739527;
 Tue, 02 Feb 2021 23:52:19 -0800 (PST)
MIME-Version: 1.0
References: <20210120124812.2800027-1-arnd@kernel.org> <20210120124812.2800027-2-arnd@kernel.org>
 <20dff5cfdc4ca3aad9fb55e43a716630ba50a939.camel@redhat.com>
In-Reply-To: <20dff5cfdc4ca3aad9fb55e43a716630ba50a939.camel@redhat.com>
From: Aurelien Jacquiot <jacquiot.aurelien@gmail.com>
Date: Wed, 3 Feb 2021 08:52:10 +0100
Message-ID: <CAC_vE7y40xd7AZoYggBxjxG546mgD9xtuGRrJBcXyZjp0j52KA@mail.gmail.com>
Subject: Re: [PATCH 1/5] c6x: remove architecture
To: Mark Salter <msalter@redhat.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	linux-c6x-dev@linux-c6x.org
Content-Type: multipart/alternative; boundary="000000000000d3c40e05ba69dd17"

--000000000000d3c40e05ba69dd17
Content-Type: text/plain; charset="UTF-8"

Thanks Mark and Arnd.

On Thu, Jan 21, 2021 at 4:44 PM Mark Salter <msalter@redhat.com> wrote:

> On Wed, 2021-01-20 at 13:48 +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The c6x architecture was added to the kernel in 2011 at a time when
> > running Linux on DSPs was widely seen as the logical evolution.
> > It appears the trend has gone back to running Linux on Arm based SoCs
> > with DSP, using a better supported software ecosystem, and having better
> > real-time behavior for the DSP code. An example of this is TI's own
> > Keystone2 platform.
> >
> > The upstream kernel port appears to no longer have any users. Mark
> > Salter remained avaialable to review patches, but mentioned that
> > he no longer has access to working hardware himself. Without any
> > users, it's best to just remove the code completely to reduce the
> > work for cross-architecture code changes.
> >
> > Many thanks to Mark for maintaining the code for the past ten years.
> >
> > Link:
> https://lore.kernel.org/lkml/41dc7795afda9f776d8cd0d3075f776cf586e97c.camel@redhat.com/
> > Cc: Mark Salter <msalter@redhat.com>
> > Cc: Aurelien Jacquiot <jacquiot.aurelien@gmail.com>
> > Cc: linux-c6x-dev@linux-c6x.org
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  .../devicetree/bindings/c6x/clocks.txt        |  40 -
> >  .../devicetree/bindings/c6x/dscr.txt          | 127 ---
> >  .../devicetree/bindings/c6x/emifa.txt         |  62 --
> >  Documentation/devicetree/bindings/c6x/soc.txt |  28 -
> >  .../ti,c64x+megamod-pic.txt                   | 103 ---
> >  .../bindings/timer/ti,c64x+timer64.txt        |  25 -
> >  MAINTAINERS                                   |   8 -
> >  arch/c6x/Kconfig                              | 113 ---
> >  arch/c6x/Kconfig.debug                        |  10 -
> >  arch/c6x/Makefile                             |  60 --
> >  arch/c6x/boot/Makefile                        |  11 -
> >  arch/c6x/boot/dts/Makefile                    |  16 -
> >  arch/c6x/boot/dts/dsk6455.dts                 |  57 --
> >  arch/c6x/boot/dts/evmc6457.dts                |  43 -
> >  arch/c6x/boot/dts/evmc6472.dts                |  68 --
> >  arch/c6x/boot/dts/evmc6474.dts                |  53 --
> >  arch/c6x/boot/dts/evmc6678.dts                |  78 --
> >  arch/c6x/boot/dts/tms320c6455.dtsi            |  97 ---
> >  arch/c6x/boot/dts/tms320c6457.dtsi            |  69 --
> >  arch/c6x/boot/dts/tms320c6472.dtsi            | 135 ----
> >  arch/c6x/boot/dts/tms320c6474.dtsi            |  90 ---
> >  arch/c6x/boot/dts/tms320c6678.dtsi            | 147 ----
> >  arch/c6x/configs/dsk6455_defconfig            |  42 -
> >  arch/c6x/configs/evmc6457_defconfig           |  39 -
> >  arch/c6x/configs/evmc6472_defconfig           |  40 -
> >  arch/c6x/configs/evmc6474_defconfig           |  40 -
> >  arch/c6x/configs/evmc6678_defconfig           |  40 -
> >  arch/c6x/include/asm/Kbuild                   |   5 -
> >  arch/c6x/include/asm/asm-offsets.h            |   1 -
> >  arch/c6x/include/asm/bitops.h                 |  95 ---
> >  arch/c6x/include/asm/bug.h                    |  20 -
> >  arch/c6x/include/asm/cache.h                  |  94 ---
> >  arch/c6x/include/asm/cacheflush.h             |  45 --
> >  arch/c6x/include/asm/checksum.h               |  34 -
> >  arch/c6x/include/asm/clock.h                  | 145 ----
> >  arch/c6x/include/asm/cmpxchg.h                |  63 --
> >  arch/c6x/include/asm/delay.h                  |  64 --
> >  arch/c6x/include/asm/dscr.h                   |  30 -
> >  arch/c6x/include/asm/elf.h                    | 117 ---
> >  arch/c6x/include/asm/flat.h                   |  19 -
> >  arch/c6x/include/asm/ftrace.h                 |   6 -
> >  arch/c6x/include/asm/hardirq.h                |  17 -
> >  arch/c6x/include/asm/irq.h                    |  50 --
> >  arch/c6x/include/asm/irqflags.h               |  68 --
> >  arch/c6x/include/asm/linkage.h                |  31 -
> >  arch/c6x/include/asm/megamod-pic.h            |  10 -
> >  arch/c6x/include/asm/mmu_context.h            |   6 -
> >  arch/c6x/include/asm/module.h                 |  20 -
> >  arch/c6x/include/asm/page.h                   |   9 -
> >  arch/c6x/include/asm/pgtable.h                |  66 --
> >  arch/c6x/include/asm/processor.h              | 114 ---
> >  arch/c6x/include/asm/procinfo.h               |  24 -
> >  arch/c6x/include/asm/ptrace.h                 |  32 -
> >  arch/c6x/include/asm/sections.h               |  12 -
> >  arch/c6x/include/asm/setup.h                  |  31 -
> >  arch/c6x/include/asm/soc.h                    |  35 -
> >  arch/c6x/include/asm/special_insns.h          |  60 --
> >  arch/c6x/include/asm/string.h                 |  18 -
> >  arch/c6x/include/asm/switch_to.h              |  30 -
> >  arch/c6x/include/asm/syscall.h                |  75 --
> >  arch/c6x/include/asm/syscalls.h               |  46 --
> >  arch/c6x/include/asm/thread_info.h            |  94 ---
> >  arch/c6x/include/asm/timer64.h                |   7 -
> >  arch/c6x/include/asm/timex.h                  |  30 -
> >  arch/c6x/include/asm/tlb.h                    |   7 -
> >  arch/c6x/include/asm/traps.h                  |  33 -
> >  arch/c6x/include/asm/uaccess.h                |  97 ---
> >  arch/c6x/include/asm/unaligned.h              | 104 ---
> >  arch/c6x/include/asm/vmalloc.h                |   4 -
> >  arch/c6x/include/uapi/asm/Kbuild              |   2 -
> >  arch/c6x/include/uapi/asm/byteorder.h         |  13 -
> >  arch/c6x/include/uapi/asm/ptrace.h            | 164 ----
> >  arch/c6x/include/uapi/asm/setup.h             |   7 -
> >  arch/c6x/include/uapi/asm/sigcontext.h        |  81 --
> >  arch/c6x/include/uapi/asm/swab.h              |  55 --
> >  arch/c6x/include/uapi/asm/unistd.h            |  29 -
> >  arch/c6x/kernel/Makefile                      |  13 -
> >  arch/c6x/kernel/asm-offsets.c                 | 123 ---
> >  arch/c6x/kernel/c6x_ksyms.c                   |  62 --
> >  arch/c6x/kernel/devicetree.c                  |  14 -
> >  arch/c6x/kernel/entry.S                       | 736 ------------------
> >  arch/c6x/kernel/head.S                        |  81 --
> >  arch/c6x/kernel/irq.c                         | 127 ---
> >  arch/c6x/kernel/module.c                      | 119 ---
> >  arch/c6x/kernel/process.c                     | 151 ----
> >  arch/c6x/kernel/ptrace.c                      | 139 ----
> >  arch/c6x/kernel/setup.c                       | 476 -----------
> >  arch/c6x/kernel/signal.c                      | 322 --------
> >  arch/c6x/kernel/soc.c                         |  87 ---
> >  arch/c6x/kernel/switch_to.S                   |  71 --
> >  arch/c6x/kernel/sys_c6x.c                     |  71 --
> >  arch/c6x/kernel/time.c                        |  63 --
> >  arch/c6x/kernel/traps.c                       | 409 ----------
> >  arch/c6x/kernel/vectors.S                     |  78 --
> >  arch/c6x/kernel/vmlinux.lds.S                 | 151 ----
> >  arch/c6x/lib/Makefile                         |   8 -
> >  arch/c6x/lib/checksum.c                       |  11 -
> >  arch/c6x/lib/csum_64plus.S                    | 414 ----------
> >  arch/c6x/lib/divi.S                           |  41 -
> >  arch/c6x/lib/divremi.S                        |  34 -
> >  arch/c6x/lib/divremu.S                        |  75 --
> >  arch/c6x/lib/divu.S                           |  86 --
> >  arch/c6x/lib/llshl.S                          |  25 -
> >  arch/c6x/lib/llshr.S                          |  26 -
> >  arch/c6x/lib/llshru.S                         |  26 -
> >  arch/c6x/lib/memcpy_64plus.S                  |  43 -
> >  arch/c6x/lib/mpyll.S                          |  37 -
> >  arch/c6x/lib/negll.S                          |  19 -
> >  arch/c6x/lib/pop_rts.S                        |  20 -
> >  arch/c6x/lib/push_rts.S                       |  19 -
> >  arch/c6x/lib/remi.S                           |  52 --
> >  arch/c6x/lib/remu.S                           |  70 --
> >  arch/c6x/lib/strasgi.S                        |  77 --
> >  arch/c6x/lib/strasgi_64plus.S                 |  27 -
> >  arch/c6x/mm/Makefile                          |   6 -
> >  arch/c6x/mm/dma-coherent.c                    | 173 ----
> >  arch/c6x/mm/init.c                            |  65 --
> >  arch/c6x/platforms/Kconfig                    |  21 -
> >  arch/c6x/platforms/Makefile                   |  13 -
> >  arch/c6x/platforms/cache.c                    | 444 -----------
> >  arch/c6x/platforms/dscr.c                     | 595 --------------
> >  arch/c6x/platforms/emif.c                     |  84 --
> >  arch/c6x/platforms/megamod-pic.c              | 344 --------
> >  arch/c6x/platforms/pll.c                      | 440 -----------
> >  arch/c6x/platforms/plldata.c                  | 467 -----------
> >  arch/c6x/platforms/timer64.c                  | 241 ------
> >  drivers/bus/Kconfig                           |   2 +-
> >  fs/Kconfig.binfmt                             |   2 +-
> >  include/asm-generic/page.h                    |   4 -
> >  129 files changed, 2 insertions(+), 11162 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/c6x/clocks.txt
> >  delete mode 100644 Documentation/devicetree/bindings/c6x/dscr.txt
> >  delete mode 100644 Documentation/devicetree/bindings/c6x/emifa.txt
> >  delete mode 100644 Documentation/devicetree/bindings/c6x/soc.txt
> >  delete mode 100644
> Documentation/devicetree/bindings/interrupt-controller/ti,c64x+megamod-pic.txt
> >  delete mode 100644
> Documentation/devicetree/bindings/timer/ti,c64x+timer64.txt
> >  delete mode 100644 arch/c6x/Kconfig
> >  delete mode 100644 arch/c6x/Kconfig.debug
> >  delete mode 100644 arch/c6x/Makefile
> >  delete mode 100644 arch/c6x/boot/Makefile
> >  delete mode 100644 arch/c6x/boot/dts/Makefile
> >  delete mode 100644 arch/c6x/boot/dts/dsk6455.dts
> >  delete mode 100644 arch/c6x/boot/dts/evmc6457.dts
> >  delete mode 100644 arch/c6x/boot/dts/evmc6472.dts
> >  delete mode 100644 arch/c6x/boot/dts/evmc6474.dts
> >  delete mode 100644 arch/c6x/boot/dts/evmc6678.dts
> >  delete mode 100644 arch/c6x/boot/dts/tms320c6455.dtsi
> >  delete mode 100644 arch/c6x/boot/dts/tms320c6457.dtsi
> >  delete mode 100644 arch/c6x/boot/dts/tms320c6472.dtsi
> >  delete mode 100644 arch/c6x/boot/dts/tms320c6474.dtsi
> >  delete mode 100644 arch/c6x/boot/dts/tms320c6678.dtsi
> >  delete mode 100644 arch/c6x/configs/dsk6455_defconfig
> >  delete mode 100644 arch/c6x/configs/evmc6457_defconfig
> >  delete mode 100644 arch/c6x/configs/evmc6472_defconfig
> >  delete mode 100644 arch/c6x/configs/evmc6474_defconfig
> >  delete mode 100644 arch/c6x/configs/evmc6678_defconfig
> >  delete mode 100644 arch/c6x/include/asm/Kbuild
> >  delete mode 100644 arch/c6x/include/asm/asm-offsets.h
> >  delete mode 100644 arch/c6x/include/asm/bitops.h
> >  delete mode 100644 arch/c6x/include/asm/bug.h
> >  delete mode 100644 arch/c6x/include/asm/cache.h
> >  delete mode 100644 arch/c6x/include/asm/cacheflush.h
> >  delete mode 100644 arch/c6x/include/asm/checksum.h
> >  delete mode 100644 arch/c6x/include/asm/clock.h
> >  delete mode 100644 arch/c6x/include/asm/cmpxchg.h
> >  delete mode 100644 arch/c6x/include/asm/delay.h
> >  delete mode 100644 arch/c6x/include/asm/dscr.h
> >  delete mode 100644 arch/c6x/include/asm/elf.h
> >  delete mode 100644 arch/c6x/include/asm/flat.h
> >  delete mode 100644 arch/c6x/include/asm/ftrace.h
> >  delete mode 100644 arch/c6x/include/asm/hardirq.h
> >  delete mode 100644 arch/c6x/include/asm/irq.h
> >  delete mode 100644 arch/c6x/include/asm/irqflags.h
> >  delete mode 100644 arch/c6x/include/asm/linkage.h
> >  delete mode 100644 arch/c6x/include/asm/megamod-pic.h
> >  delete mode 100644 arch/c6x/include/asm/mmu_context.h
> >  delete mode 100644 arch/c6x/include/asm/module.h
> >  delete mode 100644 arch/c6x/include/asm/page.h
> >  delete mode 100644 arch/c6x/include/asm/pgtable.h
> >  delete mode 100644 arch/c6x/include/asm/processor.h
> >  delete mode 100644 arch/c6x/include/asm/procinfo.h
> >  delete mode 100644 arch/c6x/include/asm/ptrace.h
> >  delete mode 100644 arch/c6x/include/asm/sections.h
> >  delete mode 100644 arch/c6x/include/asm/setup.h
> >  delete mode 100644 arch/c6x/include/asm/soc.h
> >  delete mode 100644 arch/c6x/include/asm/special_insns.h
> >  delete mode 100644 arch/c6x/include/asm/string.h
> >  delete mode 100644 arch/c6x/include/asm/switch_to.h
> >  delete mode 100644 arch/c6x/include/asm/syscall.h
> >  delete mode 100644 arch/c6x/include/asm/syscalls.h
> >  delete mode 100644 arch/c6x/include/asm/thread_info.h
> >  delete mode 100644 arch/c6x/include/asm/timer64.h
> >  delete mode 100644 arch/c6x/include/asm/timex.h
> >  delete mode 100644 arch/c6x/include/asm/tlb.h
> >  delete mode 100644 arch/c6x/include/asm/traps.h
> >  delete mode 100644 arch/c6x/include/asm/uaccess.h
> >  delete mode 100644 arch/c6x/include/asm/unaligned.h
> >  delete mode 100644 arch/c6x/include/asm/vmalloc.h
> >  delete mode 100644 arch/c6x/include/uapi/asm/Kbuild
> >  delete mode 100644 arch/c6x/include/uapi/asm/byteorder.h
> >  delete mode 100644 arch/c6x/include/uapi/asm/ptrace.h
> >  delete mode 100644 arch/c6x/include/uapi/asm/setup.h
> >  delete mode 100644 arch/c6x/include/uapi/asm/sigcontext.h
> >  delete mode 100644 arch/c6x/include/uapi/asm/swab.h
> >  delete mode 100644 arch/c6x/include/uapi/asm/unistd.h
> >  delete mode 100644 arch/c6x/kernel/Makefile
> >  delete mode 100644 arch/c6x/kernel/asm-offsets.c
> >  delete mode 100644 arch/c6x/kernel/c6x_ksyms.c
> >  delete mode 100644 arch/c6x/kernel/devicetree.c
> >  delete mode 100644 arch/c6x/kernel/entry.S
> >  delete mode 100644 arch/c6x/kernel/head.S
> >  delete mode 100644 arch/c6x/kernel/irq.c
> >  delete mode 100644 arch/c6x/kernel/module.c
> >  delete mode 100644 arch/c6x/kernel/process.c
> >  delete mode 100644 arch/c6x/kernel/ptrace.c
> >  delete mode 100644 arch/c6x/kernel/setup.c
> >  delete mode 100644 arch/c6x/kernel/signal.c
> >  delete mode 100644 arch/c6x/kernel/soc.c
> >  delete mode 100644 arch/c6x/kernel/switch_to.S
> >  delete mode 100644 arch/c6x/kernel/sys_c6x.c
> >  delete mode 100644 arch/c6x/kernel/time.c
> >  delete mode 100644 arch/c6x/kernel/traps.c
> >  delete mode 100644 arch/c6x/kernel/vectors.S
> >  delete mode 100644 arch/c6x/kernel/vmlinux.lds.S
> >  delete mode 100644 arch/c6x/lib/Makefile
> >  delete mode 100644 arch/c6x/lib/checksum.c
> >  delete mode 100644 arch/c6x/lib/csum_64plus.S
> >  delete mode 100644 arch/c6x/lib/divi.S
> >  delete mode 100644 arch/c6x/lib/divremi.S
> >  delete mode 100644 arch/c6x/lib/divremu.S
> >  delete mode 100644 arch/c6x/lib/divu.S
> >  delete mode 100644 arch/c6x/lib/llshl.S
> >  delete mode 100644 arch/c6x/lib/llshr.S
> >  delete mode 100644 arch/c6x/lib/llshru.S
> >  delete mode 100644 arch/c6x/lib/memcpy_64plus.S
> >  delete mode 100644 arch/c6x/lib/mpyll.S
> >  delete mode 100644 arch/c6x/lib/negll.S
> >  delete mode 100644 arch/c6x/lib/pop_rts.S
> >  delete mode 100644 arch/c6x/lib/push_rts.S
> >  delete mode 100644 arch/c6x/lib/remi.S
> >  delete mode 100644 arch/c6x/lib/remu.S
> >  delete mode 100644 arch/c6x/lib/strasgi.S
> >  delete mode 100644 arch/c6x/lib/strasgi_64plus.S
> >  delete mode 100644 arch/c6x/mm/Makefile
> >  delete mode 100644 arch/c6x/mm/dma-coherent.c
> >  delete mode 100644 arch/c6x/mm/init.c
> >  delete mode 100644 arch/c6x/platforms/Kconfig
> >  delete mode 100644 arch/c6x/platforms/Makefile
> >  delete mode 100644 arch/c6x/platforms/cache.c
> >  delete mode 100644 arch/c6x/platforms/dscr.c
> >  delete mode 100644 arch/c6x/platforms/emif.c
> >  delete mode 100644 arch/c6x/platforms/megamod-pic.c
> >  delete mode 100644 arch/c6x/platforms/pll.c
> >  delete mode 100644 arch/c6x/platforms/plldata.c
> >  delete mode 100644 arch/c6x/platforms/timer64.c
> >
> > diff --git a/Documentation/devicetree/bindings/c6x/clocks.txt
> b/Documentation/devicetree/bindings/c6x/clocks.txt
> > deleted file mode 100644
> > index a04f5fd30122..000000000000
> > diff --git a/Documentation/devicetree/bindings/c6x/dscr.txt
> b/Documentation/devicetree/bindings/c6x/dscr.txt
> > deleted file mode 100644
> > index 92672235de57..000000000000
> > diff --git a/Documentation/devicetree/bindings/c6x/emifa.txt
> b/Documentation/devicetree/bindings/c6x/emifa.txt
> > deleted file mode 100644
> > index 0ff6e9b9a13f..000000000000
> > diff --git a/Documentation/devicetree/bindings/c6x/soc.txt
> b/Documentation/devicetree/bindings/c6x/soc.txt
> > deleted file mode 100644
> > index b1e4973b5769..000000000000
> > diff --git
> a/Documentation/devicetree/bindings/interrupt-controller/ti,c64x+megamod-pic.txt
> b/Documentation/devicetree/bindings/interrupt-
> > controller/ti,c64x+megamod-pic.txt
> > deleted file mode 100644
> > index ee3f9c351501..000000000000
> > diff --git a/Documentation/devicetree/bindings/timer/ti,c64x+timer64.txt
> b/Documentation/devicetree/bindings/timer/ti,c64x+timer64.txt
> > deleted file mode 100644
> > index d96c1e283e73..000000000000
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fb971f5f6f0c..7c3eadb185f9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3837,14 +3837,6 @@ F:       drivers/irqchip/irq-csky-*
> >  N:     csky
> >  K:     csky
> >
> > -C6X ARCHITECTURE
> > -M:     Mark Salter <msalter@redhat.com>
> > -M:     Aurelien Jacquiot <jacquiot.aurelien@gmail.com>
> > -L:     linux-c6x-dev@linux-c6x.org
> > -S:     Maintained
> > -W:     http://www.linux-c6x.org/wiki/index.php/Main_Page
> > -F:     arch/c6x/
> > -
> >  CA8210 IEEE-802.15.4 RADIO DRIVER
> >  M:     Harry Morris <h.morris@cascoda.com>
> >  L:     linux-wpan@vger.kernel.org
> > diff --git a/arch/c6x/Kconfig b/arch/c6x/Kconfig
> > deleted file mode 100644
> > index bdeeac28b1be..000000000000
> > diff --git a/arch/c6x/Kconfig.debug b/arch/c6x/Kconfig.debug
> > deleted file mode 100644
> > index c299e0d8eca3..000000000000
> > diff --git a/arch/c6x/Makefile b/arch/c6x/Makefile
> > deleted file mode 100644
> > index b7aa854f7008..000000000000
> > diff --git a/arch/c6x/boot/Makefile b/arch/c6x/boot/Makefile
> > deleted file mode 100644
> > index 842b7b0bfe80..000000000000
> > diff --git a/arch/c6x/boot/dts/Makefile b/arch/c6x/boot/dts/Makefile
> > deleted file mode 100644
> > index f438285c3640..000000000000
> > diff --git a/arch/c6x/boot/dts/dsk6455.dts
> b/arch/c6x/boot/dts/dsk6455.dts
> > deleted file mode 100644
> > index fa904f2916b5..000000000000
> > diff --git a/arch/c6x/boot/dts/evmc6457.dts
> b/arch/c6x/boot/dts/evmc6457.dts
> > deleted file mode 100644
> > index 73e1d43b51ce..000000000000
> > diff --git a/arch/c6x/boot/dts/evmc6472.dts
> b/arch/c6x/boot/dts/evmc6472.dts
> > deleted file mode 100644
> > index 4878b78919fa..000000000000
> > diff --git a/arch/c6x/boot/dts/evmc6474.dts
> b/arch/c6x/boot/dts/evmc6474.dts
> > deleted file mode 100644
> > index d10746453217..000000000000
> > diff --git a/arch/c6x/boot/dts/evmc6678.dts
> b/arch/c6x/boot/dts/evmc6678.dts
> > deleted file mode 100644
> > index 5e6c0961e7b2..000000000000
> > diff --git a/arch/c6x/boot/dts/tms320c6455.dtsi
> b/arch/c6x/boot/dts/tms320c6455.dtsi
> > deleted file mode 100644
> > index 0b21cb30343b..000000000000
> > diff --git a/arch/c6x/boot/dts/tms320c6457.dtsi
> b/arch/c6x/boot/dts/tms320c6457.dtsi
> > deleted file mode 100644
> > index e49f7ae19124..000000000000
> > diff --git a/arch/c6x/boot/dts/tms320c6472.dtsi
> b/arch/c6x/boot/dts/tms320c6472.dtsi
> > deleted file mode 100644
> > index 9dd4b04e78ef..000000000000
> > diff --git a/arch/c6x/boot/dts/tms320c6474.dtsi
> b/arch/c6x/boot/dts/tms320c6474.dtsi
> > deleted file mode 100644
> > index 0ef5333629a6..000000000000
> > diff --git a/arch/c6x/boot/dts/tms320c6678.dtsi
> b/arch/c6x/boot/dts/tms320c6678.dtsi
> > deleted file mode 100644
> > index da1e3f2bf062..000000000000
> > diff --git a/arch/c6x/configs/dsk6455_defconfig
> b/arch/c6x/configs/dsk6455_defconfig
> > deleted file mode 100644
> > index d764ea4cce7f..000000000000
> > diff --git a/arch/c6x/configs/evmc6457_defconfig
> b/arch/c6x/configs/evmc6457_defconfig
> > deleted file mode 100644
> > index 05d0b4a25ab1..000000000000
> > diff --git a/arch/c6x/configs/evmc6472_defconfig
> b/arch/c6x/configs/evmc6472_defconfig
> > deleted file mode 100644
> > index 8d81fcf86b0e..000000000000
> > diff --git a/arch/c6x/configs/evmc6474_defconfig
> b/arch/c6x/configs/evmc6474_defconfig
> > deleted file mode 100644
> > index 8156a98f3958..000000000000
> > diff --git a/arch/c6x/configs/evmc6678_defconfig
> b/arch/c6x/configs/evmc6678_defconfig
> > deleted file mode 100644
> > index c4f433c25b69..000000000000
> > diff --git a/arch/c6x/include/asm/Kbuild b/arch/c6x/include/asm/Kbuild
> > deleted file mode 100644
> > index a4ef93a1f7ae..000000000000
> > diff --git a/arch/c6x/include/asm/asm-offsets.h
> b/arch/c6x/include/asm/asm-offsets.h
> > deleted file mode 100644
> > index d370ee36a182..000000000000
> > diff --git a/arch/c6x/include/asm/bitops.h
> b/arch/c6x/include/asm/bitops.h
> > deleted file mode 100644
> > index 50e618f38a11..000000000000
> > diff --git a/arch/c6x/include/asm/bug.h b/arch/c6x/include/asm/bug.h
> > deleted file mode 100644
> > index 1a68676256ee..000000000000
> > diff --git a/arch/c6x/include/asm/cache.h b/arch/c6x/include/asm/cache.h
> > deleted file mode 100644
> > index 0fa8bf77c954..000000000000
> > diff --git a/arch/c6x/include/asm/cacheflush.h
> b/arch/c6x/include/asm/cacheflush.h
> > deleted file mode 100644
> > index 10922d528de6..000000000000
> > diff --git a/arch/c6x/include/asm/checksum.h
> b/arch/c6x/include/asm/checksum.h
> > deleted file mode 100644
> > index 934918def632..000000000000
> > diff --git a/arch/c6x/include/asm/clock.h b/arch/c6x/include/asm/clock.h
> > deleted file mode 100644
> > index 7b6c42a52ec9..000000000000
> > diff --git a/arch/c6x/include/asm/cmpxchg.h
> b/arch/c6x/include/asm/cmpxchg.h
> > deleted file mode 100644
> > index 6eed628a9e7f..000000000000
> > diff --git a/arch/c6x/include/asm/delay.h b/arch/c6x/include/asm/delay.h
> > deleted file mode 100644
> > index 455fc713ae54..000000000000
> > diff --git a/arch/c6x/include/asm/dscr.h b/arch/c6x/include/asm/dscr.h
> > deleted file mode 100644
> > index f6b095c3d3f5..000000000000
> > diff --git a/arch/c6x/include/asm/elf.h b/arch/c6x/include/asm/elf.h
> > deleted file mode 100644
> > index ca88acbf560b..000000000000
> > diff --git a/arch/c6x/include/asm/flat.h b/arch/c6x/include/asm/flat.h
> > deleted file mode 100644
> > index 9e6544b51386..000000000000
> > diff --git a/arch/c6x/include/asm/ftrace.h
> b/arch/c6x/include/asm/ftrace.h
> > deleted file mode 100644
> > index 3701958d3d1c..000000000000
> > diff --git a/arch/c6x/include/asm/hardirq.h
> b/arch/c6x/include/asm/hardirq.h
> > deleted file mode 100644
> > index f37d07d31040..000000000000
> > diff --git a/arch/c6x/include/asm/irq.h b/arch/c6x/include/asm/irq.h
> > deleted file mode 100644
> > index 9da4d1afd0d7..000000000000
> > diff --git a/arch/c6x/include/asm/irqflags.h
> b/arch/c6x/include/asm/irqflags.h
> > deleted file mode 100644
> > index d6cd71c02629..000000000000
> > diff --git a/arch/c6x/include/asm/linkage.h
> b/arch/c6x/include/asm/linkage.h
> > deleted file mode 100644
> > index 1ad615da6479..000000000000
> > diff --git a/arch/c6x/include/asm/megamod-pic.h
> b/arch/c6x/include/asm/megamod-pic.h
> > deleted file mode 100644
> > index a0a6d596bf9b..000000000000
> > diff --git a/arch/c6x/include/asm/mmu_context.h
> b/arch/c6x/include/asm/mmu_context.h
> > deleted file mode 100644
> > index d2659d0a3297..000000000000
> > diff --git a/arch/c6x/include/asm/module.h
> b/arch/c6x/include/asm/module.h
> > deleted file mode 100644
> > index 9fc9f4a8ecc2..000000000000
> > diff --git a/arch/c6x/include/asm/page.h b/arch/c6x/include/asm/page.h
> > deleted file mode 100644
> > index 40079899084d..000000000000
> > diff --git a/arch/c6x/include/asm/pgtable.h
> b/arch/c6x/include/asm/pgtable.h
> > deleted file mode 100644
> > index 8a91ceda39fa..000000000000
> > diff --git a/arch/c6x/include/asm/processor.h
> b/arch/c6x/include/asm/processor.h
> > deleted file mode 100644
> > index 1456f5e11de3..000000000000
> > diff --git a/arch/c6x/include/asm/procinfo.h
> b/arch/c6x/include/asm/procinfo.h
> > deleted file mode 100644
> > index aaa3cb902c43..000000000000
> > diff --git a/arch/c6x/include/asm/ptrace.h
> b/arch/c6x/include/asm/ptrace.h
> > deleted file mode 100644
> > index 7cbae382cf37..000000000000
> > diff --git a/arch/c6x/include/asm/sections.h
> b/arch/c6x/include/asm/sections.h
> > deleted file mode 100644
> > index dc2f15eb3bde..000000000000
> > diff --git a/arch/c6x/include/asm/setup.h b/arch/c6x/include/asm/setup.h
> > deleted file mode 100644
> > index 5496bccecaa0..000000000000
> > diff --git a/arch/c6x/include/asm/soc.h b/arch/c6x/include/asm/soc.h
> > deleted file mode 100644
> > index 43f50159e59b..000000000000
> > diff --git a/arch/c6x/include/asm/special_insns.h
> b/arch/c6x/include/asm/special_insns.h
> > deleted file mode 100644
> > index d233160aefd4..000000000000
> > diff --git a/arch/c6x/include/asm/string.h
> b/arch/c6x/include/asm/string.h
> > deleted file mode 100644
> > index b290ead40f68..000000000000
> > diff --git a/arch/c6x/include/asm/switch_to.h
> b/arch/c6x/include/asm/switch_to.h
> > deleted file mode 100644
> > index 36c5332fadae..000000000000
> > diff --git a/arch/c6x/include/asm/syscall.h
> b/arch/c6x/include/asm/syscall.h
> > deleted file mode 100644
> > index 38f3e2284ecd..000000000000
> > diff --git a/arch/c6x/include/asm/syscalls.h
> b/arch/c6x/include/asm/syscalls.h
> > deleted file mode 100644
> > index df3d05feb153..000000000000
> > diff --git a/arch/c6x/include/asm/thread_info.h
> b/arch/c6x/include/asm/thread_info.h
> > deleted file mode 100644
> > index dd8913d57189..000000000000
> > diff --git a/arch/c6x/include/asm/timer64.h
> b/arch/c6x/include/asm/timer64.h
> > deleted file mode 100644
> > index b850dfef1f79..000000000000
> > diff --git a/arch/c6x/include/asm/timex.h b/arch/c6x/include/asm/timex.h
> > deleted file mode 100644
> > index f946ce297e13..000000000000
> > diff --git a/arch/c6x/include/asm/tlb.h b/arch/c6x/include/asm/tlb.h
> > deleted file mode 100644
> > index 240ba0febb57..000000000000
> > diff --git a/arch/c6x/include/asm/traps.h b/arch/c6x/include/asm/traps.h
> > deleted file mode 100644
> > index 7e1d31c47680..000000000000
> > diff --git a/arch/c6x/include/asm/uaccess.h
> b/arch/c6x/include/asm/uaccess.h
> > deleted file mode 100644
> > index 585adf9201b7..000000000000
> > diff --git a/arch/c6x/include/asm/unaligned.h
> b/arch/c6x/include/asm/unaligned.h
> > deleted file mode 100644
> > index d628cc170564..000000000000
> > diff --git a/arch/c6x/include/asm/vmalloc.h
> b/arch/c6x/include/asm/vmalloc.h
> > deleted file mode 100644
> > index 26c6c6696bbd..000000000000
> > diff --git a/arch/c6x/include/uapi/asm/Kbuild
> b/arch/c6x/include/uapi/asm/Kbuild
> > deleted file mode 100644
> > index e78470141932..000000000000
> > diff --git a/arch/c6x/include/uapi/asm/byteorder.h
> b/arch/c6x/include/uapi/asm/byteorder.h
> > deleted file mode 100644
> > index ab61f867391c..000000000000
> > diff --git a/arch/c6x/include/uapi/asm/ptrace.h
> b/arch/c6x/include/uapi/asm/ptrace.h
> > deleted file mode 100644
> > index 9b51110a0842..000000000000
> > diff --git a/arch/c6x/include/uapi/asm/setup.h
> b/arch/c6x/include/uapi/asm/setup.h
> > deleted file mode 100644
> > index e90548cebec3..000000000000
> > diff --git a/arch/c6x/include/uapi/asm/sigcontext.h
> b/arch/c6x/include/uapi/asm/sigcontext.h
> > deleted file mode 100644
> > index 4e5a9a260861..000000000000
> > diff --git a/arch/c6x/include/uapi/asm/swab.h
> b/arch/c6x/include/uapi/asm/swab.h
> > deleted file mode 100644
> > index c407c0497718..000000000000
> > diff --git a/arch/c6x/include/uapi/asm/unistd.h
> b/arch/c6x/include/uapi/asm/unistd.h
> > deleted file mode 100644
> > index 79b724c39d9b..000000000000
> > diff --git a/arch/c6x/kernel/Makefile b/arch/c6x/kernel/Makefile
> > deleted file mode 100644
> > index fbe74174de87..000000000000
> > diff --git a/arch/c6x/kernel/asm-offsets.c
> b/arch/c6x/kernel/asm-offsets.c
> > deleted file mode 100644
> > index 4a264ef87dcb..000000000000
> > diff --git a/arch/c6x/kernel/c6x_ksyms.c b/arch/c6x/kernel/c6x_ksyms.c
> > deleted file mode 100644
> > index 5a39f52f9db4..000000000000
> > diff --git a/arch/c6x/kernel/devicetree.c b/arch/c6x/kernel/devicetree.c
> > deleted file mode 100644
> > index a0c73f0545b2..000000000000
> > diff --git a/arch/c6x/kernel/entry.S b/arch/c6x/kernel/entry.S
> > deleted file mode 100644
> > index fb154d19625b..000000000000
> > diff --git a/arch/c6x/kernel/head.S b/arch/c6x/kernel/head.S
> > deleted file mode 100644
> > index fecbeef827bc..000000000000
> > diff --git a/arch/c6x/kernel/irq.c b/arch/c6x/kernel/irq.c
> > deleted file mode 100644
> > index e4c53d185b62..000000000000
> > diff --git a/arch/c6x/kernel/module.c b/arch/c6x/kernel/module.c
> > deleted file mode 100644
> > index 09b4c6bfe877..000000000000
> > diff --git a/arch/c6x/kernel/process.c b/arch/c6x/kernel/process.c
> > deleted file mode 100644
> > index 9f4fd6a40a10..000000000000
> > diff --git a/arch/c6x/kernel/ptrace.c b/arch/c6x/kernel/ptrace.c
> > deleted file mode 100644
> > index 3cdaa8cf0ed6..000000000000
> > diff --git a/arch/c6x/kernel/setup.c b/arch/c6x/kernel/setup.c
> > deleted file mode 100644
> > index 9254c3b794a5..000000000000
> > diff --git a/arch/c6x/kernel/signal.c b/arch/c6x/kernel/signal.c
> > deleted file mode 100644
> > index 862460c3b183..000000000000
> > diff --git a/arch/c6x/kernel/soc.c b/arch/c6x/kernel/soc.c
> > deleted file mode 100644
> > index 8362f9390e03..000000000000
> > diff --git a/arch/c6x/kernel/switch_to.S b/arch/c6x/kernel/switch_to.S
> > deleted file mode 100644
> > index b7f9f607042e..000000000000
> > diff --git a/arch/c6x/kernel/sys_c6x.c b/arch/c6x/kernel/sys_c6x.c
> > deleted file mode 100644
> > index 600277f057cf..000000000000
> > diff --git a/arch/c6x/kernel/time.c b/arch/c6x/kernel/time.c
> > deleted file mode 100644
> > index f3ec91a87f4f..000000000000
> > diff --git a/arch/c6x/kernel/traps.c b/arch/c6x/kernel/traps.c
> > deleted file mode 100644
> > index 2b9121c755be..000000000000
> > diff --git a/arch/c6x/kernel/vectors.S b/arch/c6x/kernel/vectors.S
> > deleted file mode 100644
> > index ad3dc006a6d3..000000000000
> > diff --git a/arch/c6x/kernel/vmlinux.lds.S
> b/arch/c6x/kernel/vmlinux.lds.S
> > deleted file mode 100644
> > index ac99ba0864bf..000000000000
> > diff --git a/arch/c6x/lib/Makefile b/arch/c6x/lib/Makefile
> > deleted file mode 100644
> > index e182004f82fe..000000000000
> > diff --git a/arch/c6x/lib/checksum.c b/arch/c6x/lib/checksum.c
> > deleted file mode 100644
> > index dff2e2ec6e64..000000000000
> > diff --git a/arch/c6x/lib/csum_64plus.S b/arch/c6x/lib/csum_64plus.S
> > deleted file mode 100644
> > index 57148866d8d3..000000000000
> > diff --git a/arch/c6x/lib/divi.S b/arch/c6x/lib/divi.S
> > deleted file mode 100644
> > index d1764ae0b519..000000000000
> > diff --git a/arch/c6x/lib/divremi.S b/arch/c6x/lib/divremi.S
> > deleted file mode 100644
> > index 575fc57a8a76..000000000000
> > diff --git a/arch/c6x/lib/divremu.S b/arch/c6x/lib/divremu.S
> > deleted file mode 100644
> > index 5f6a6a2997ae..000000000000
> > diff --git a/arch/c6x/lib/divu.S b/arch/c6x/lib/divu.S
> > deleted file mode 100644
> > index f0f6082944c2..000000000000
> > diff --git a/arch/c6x/lib/llshl.S b/arch/c6x/lib/llshl.S
> > deleted file mode 100644
> > index 3272499618e0..000000000000
> > diff --git a/arch/c6x/lib/llshr.S b/arch/c6x/lib/llshr.S
> > deleted file mode 100644
> > index 6bfaacd15e73..000000000000
> > diff --git a/arch/c6x/lib/llshru.S b/arch/c6x/lib/llshru.S
> > deleted file mode 100644
> > index 103128f50770..000000000000
> > diff --git a/arch/c6x/lib/memcpy_64plus.S b/arch/c6x/lib/memcpy_64plus.S
> > deleted file mode 100644
> > index 157a30486bfd..000000000000
> > diff --git a/arch/c6x/lib/mpyll.S b/arch/c6x/lib/mpyll.S
> > deleted file mode 100644
> > index d07c13ec4fd4..000000000000
> > diff --git a/arch/c6x/lib/negll.S b/arch/c6x/lib/negll.S
> > deleted file mode 100644
> > index 9ba434db5366..000000000000
> > diff --git a/arch/c6x/lib/pop_rts.S b/arch/c6x/lib/pop_rts.S
> > deleted file mode 100644
> > index f129e32943c5..000000000000
> > diff --git a/arch/c6x/lib/push_rts.S b/arch/c6x/lib/push_rts.S
> > deleted file mode 100644
> > index 40b0a4fe937c..000000000000
> > diff --git a/arch/c6x/lib/remi.S b/arch/c6x/lib/remi.S
> > deleted file mode 100644
> > index 96a1335eac20..000000000000
> > diff --git a/arch/c6x/lib/remu.S b/arch/c6x/lib/remu.S
> > deleted file mode 100644
> > index 428feb9c06c0..000000000000
> > diff --git a/arch/c6x/lib/strasgi.S b/arch/c6x/lib/strasgi.S
> > deleted file mode 100644
> > index 715aeb200792..000000000000
> > diff --git a/arch/c6x/lib/strasgi_64plus.S
> b/arch/c6x/lib/strasgi_64plus.S
> > deleted file mode 100644
> > index d10aa2dc3249..000000000000
> > diff --git a/arch/c6x/mm/Makefile b/arch/c6x/mm/Makefile
> > deleted file mode 100644
> > index 19d05e972dd1..000000000000
> > diff --git a/arch/c6x/mm/dma-coherent.c b/arch/c6x/mm/dma-coherent.c
> > deleted file mode 100644
> > index 03df07a831fc..000000000000
> > diff --git a/arch/c6x/mm/init.c b/arch/c6x/mm/init.c
> > deleted file mode 100644
> > index a97e51a3e26d..000000000000
> > diff --git a/arch/c6x/platforms/Kconfig b/arch/c6x/platforms/Kconfig
> > deleted file mode 100644
> > index f3a9ae6e0e82..000000000000
> > diff --git a/arch/c6x/platforms/Makefile b/arch/c6x/platforms/Makefile
> > deleted file mode 100644
> > index b320f1c68884..000000000000
> > diff --git a/arch/c6x/platforms/cache.c b/arch/c6x/platforms/cache.c
> > deleted file mode 100644
> > index fff027b72513..000000000000
> > diff --git a/arch/c6x/platforms/dscr.c b/arch/c6x/platforms/dscr.c
> > deleted file mode 100644
> > index 4571615b589f..000000000000
> > diff --git a/arch/c6x/platforms/emif.c b/arch/c6x/platforms/emif.c
> > deleted file mode 100644
> > index 6142ecc2cd88..000000000000
> > diff --git a/arch/c6x/platforms/megamod-pic.c
> b/arch/c6x/platforms/megamod-pic.c
> > deleted file mode 100644
> > index 56189e50728c..000000000000
> > diff --git a/arch/c6x/platforms/pll.c b/arch/c6x/platforms/pll.c
> > deleted file mode 100644
> > index 6fdf20d64dc7..000000000000
> > diff --git a/arch/c6x/platforms/plldata.c b/arch/c6x/platforms/plldata.c
> > deleted file mode 100644
> > index a799e04edefe..000000000000
> > diff --git a/arch/c6x/platforms/timer64.c b/arch/c6x/platforms/timer64.c
> > deleted file mode 100644
> > index 661f4c7c6ef6..000000000000
> > diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> > index 0c262c2aeaf2..e7f7eee6ee9a 100644
> > --- a/drivers/bus/Kconfig
> > +++ b/drivers/bus/Kconfig
> > @@ -80,7 +80,7 @@ config MOXTET
> >
> >  config HISILICON_LPC
> >         bool "Support for ISA I/O space on HiSilicon Hip06/7"
> > -       depends on (ARM64 && ARCH_HISI) || (COMPILE_TEST && !ALPHA &&
> !HEXAGON && !PARISC && !C6X)
> > +       depends on (ARM64 && ARCH_HISI) || (COMPILE_TEST && !ALPHA &&
> !HEXAGON && !PARISC)
> >         depends on HAS_IOMEM
> >         select INDIRECT_PIO if ARM64
> >         help
> > diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
> > index 885da6d983b4..647439c2c05a 100644
> > --- a/fs/Kconfig.binfmt
> > +++ b/fs/Kconfig.binfmt
> > @@ -45,7 +45,7 @@ config ARCH_USE_GNU_PROPERTY
> >  config BINFMT_ELF_FDPIC
> >         bool "Kernel support for FDPIC ELF binaries"
> >         default y if !BINFMT_ELF
> > -       depends on (ARM || (SUPERH && !MMU) || C6X)
> > +       depends on (ARM || (SUPERH && !MMU))
> >         select ELFCORE
> >         help
> >           ELF FDPIC binaries are based on ELF, but allow the individual
> load
> > diff --git a/include/asm-generic/page.h b/include/asm-generic/page.h
> > index fe801f01625e..6fc47561814c 100644
> > --- a/include/asm-generic/page.h
> > +++ b/include/asm-generic/page.h
> > @@ -63,11 +63,7 @@ extern unsigned long memory_end;
> >
> >  #endif /* !__ASSEMBLY__ */
> >
> > -#ifdef CONFIG_KERNEL_RAM_BASE_ADDRESS
> > -#define PAGE_OFFSET            (CONFIG_KERNEL_RAM_BASE_ADDRESS)
> > -#else
> >  #define PAGE_OFFSET            (0)
> > -#endif
> >
> >  #ifndef ARCH_PFN_OFFSET
> >  #define ARCH_PFN_OFFSET                (PAGE_OFFSET >> PAGE_SHIFT)
>
> Thanks Arnd.
>
> Acked-by: Mark Salter <msalter@redhat.com>
>
>
>
>

--000000000000d3c40e05ba69dd17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Mark and Arnd.</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 21, 2021 at 4:44 PM Mark =
Salter &lt;<a href=3D"mailto:msalter@redhat.com" target=3D"_blank">msalter@=
redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, 2021-01-20 at 13:48 +0100, Arnd Bergmann wrote:<br>
&gt; From: Arnd Bergmann &lt;<a href=3D"mailto:arnd@arndb.de" target=3D"_bl=
ank">arnd@arndb.de</a>&gt;<br>
&gt; <br>
&gt; The c6x architecture was added to the kernel in 2011 at a time when<br=
>
&gt; running Linux on DSPs was widely seen as the logical evolution.<br>
&gt; It appears the trend has gone back to running Linux on Arm based SoCs<=
br>
&gt; with DSP, using a better supported software ecosystem, and having bett=
er<br>
&gt; real-time behavior for the DSP code. An example of this is TI&#39;s ow=
n<br>
&gt; Keystone2 platform.<br>
&gt; <br>
&gt; The upstream kernel port appears to no longer have any users. Mark<br>
&gt; Salter remained avaialable to review patches, but mentioned that<br>
&gt; he no longer has access to working hardware himself. Without any<br>
&gt; users, it&#39;s best to just remove the code completely to reduce the<=
br>
&gt; work for cross-architecture code changes.<br>
&gt; <br>
&gt; Many thanks to Mark for maintaining the code for the past ten years.<b=
r>
&gt; <br>
&gt; Link: <a href=3D"https://lore.kernel.org/lkml/41dc7795afda9f776d8cd0d3=
075f776cf586e97c.camel@redhat.com/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lore.kernel.org/lkml/41dc7795afda9f776d8cd0d3075f776cf586e97c.camel@r=
edhat.com/</a><br>
&gt; Cc: Mark Salter &lt;<a href=3D"mailto:msalter@redhat.com" target=3D"_b=
lank">msalter@redhat.com</a>&gt;<br>
&gt; Cc: Aurelien Jacquiot &lt;<a href=3D"mailto:jacquiot.aurelien@gmail.co=
m" target=3D"_blank">jacquiot.aurelien@gmail.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:linux-c6x-dev@linux-c6x.org" target=3D"_blank">l=
inux-c6x-dev@linux-c6x.org</a><br>
&gt; Signed-off-by: Arnd Bergmann &lt;<a href=3D"mailto:arnd@arndb.de" targ=
et=3D"_blank">arnd@arndb.de</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../devicetree/bindings/c6x/clocks.txt=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 40 -<br>
&gt; =C2=A0.../devicetree/bindings/c6x/dscr.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 127 ---<br>
&gt; =C2=A0.../devicetree/bindings/c6x/emifa.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 62 --<br>
&gt; =C2=A0Documentation/devicetree/bindings/c6x/soc.txt |=C2=A0 28 -<br>
&gt; =C2=A0.../ti,c64x+megamod-pic.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
103 ---<br>
&gt; =C2=A0.../bindings/timer/ti,c64x+timer64.txt=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 25 -<br>
&gt; =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 8 -<br>
&gt; =C2=A0arch/c6x/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 113 ---<br>
&gt; =C2=A0arch/c6x/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 -<br>
&gt; =C2=A0arch/c6x/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 60 --<br>
&gt; =C2=A0arch/c6x/boot/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 -<br>
&gt; =C2=A0arch/c6x/boot/dts/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 16 -<br>
&gt; =C2=A0arch/c6x/boot/dts/dsk6455.dts=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 57 =
--<br>
&gt; =C2=A0arch/c6x/boot/dts/evmc6457.dts=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 43 -<br>
&gt; =C2=A0arch/c6x/boot/dts/evmc6472.dts=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 68 --<br>
&gt; =C2=A0arch/c6x/boot/dts/evmc6474.dts=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 53 --<br>
&gt; =C2=A0arch/c6x/boot/dts/evmc6678.dts=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 78 --<br>
&gt; =C2=A0arch/c6x/boot/dts/tms320c6455.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 97 ---<br>
&gt; =C2=A0arch/c6x/boot/dts/tms320c6457.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 69 --<br>
&gt; =C2=A0arch/c6x/boot/dts/tms320c6472.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 135 ----<br>
&gt; =C2=A0arch/c6x/boot/dts/tms320c6474.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 90 ---<br>
&gt; =C2=A0arch/c6x/boot/dts/tms320c6678.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 147 ----<br>
&gt; =C2=A0arch/c6x/configs/dsk6455_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 42 -<br>
&gt; =C2=A0arch/c6x/configs/evmc6457_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 39 -<br>
&gt; =C2=A0arch/c6x/configs/evmc6472_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 40 -<br>
&gt; =C2=A0arch/c6x/configs/evmc6474_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 40 -<br>
&gt; =C2=A0arch/c6x/configs/evmc6678_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 40 -<br>
&gt; =C2=A0arch/c6x/include/asm/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 5 -<br>
&gt; =C2=A0arch/c6x/include/asm/asm-offsets.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -<br>
&gt; =C2=A0arch/c6x/include/asm/bitops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 95 =
---<br>
&gt; =C2=A0arch/c6x/include/asm/bug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 20 -<br>
&gt; =C2=A0arch/c6x/include/asm/cache.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
94 ---<br>
&gt; =C2=A0arch/c6x/include/asm/cacheflush.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 45 --<br>
&gt; =C2=A0arch/c6x/include/asm/checksum.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 34 -<br>
&gt; =C2=A0arch/c6x/include/asm/clock.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 145 --=
--<br>
&gt; =C2=A0arch/c6x/include/asm/cmpxchg.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 63 --<br>
&gt; =C2=A0arch/c6x/include/asm/delay.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
64 --<br>
&gt; =C2=A0arch/c6x/include/asm/dscr.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 30 -<br>
&gt; =C2=A0arch/c6x/include/asm/elf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 117 ---<br>
&gt; =C2=A0arch/c6x/include/asm/flat.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 19 -<br>
&gt; =C2=A0arch/c6x/include/asm/ftrace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 6 -<br>
&gt; =C2=A0arch/c6x/include/asm/hardirq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 17 -<br>
&gt; =C2=A0arch/c6x/include/asm/irq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 50 --<br>
&gt; =C2=A0arch/c6x/include/asm/irqflags.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 68 --<br>
&gt; =C2=A0arch/c6x/include/asm/linkage.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 31 -<br>
&gt; =C2=A0arch/c6x/include/asm/megamod-pic.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 -<br>
&gt; =C2=A0arch/c6x/include/asm/mmu_context.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 -<br>
&gt; =C2=A0arch/c6x/include/asm/module.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20 =
-<br>
&gt; =C2=A0arch/c6x/include/asm/page.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 9 -<br>
&gt; =C2=A0arch/c6x/include/asm/pgtable.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 66 --<br>
&gt; =C2=A0arch/c6x/include/asm/processor.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 114 ---<br>
&gt; =C2=A0arch/c6x/include/asm/procinfo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 -<br>
&gt; =C2=A0arch/c6x/include/asm/ptrace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 32 =
-<br>
&gt; =C2=A0arch/c6x/include/asm/sections.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 -<br>
&gt; =C2=A0arch/c6x/include/asm/setup.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
31 -<br>
&gt; =C2=A0arch/c6x/include/asm/soc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 35 -<br>
&gt; =C2=A0arch/c6x/include/asm/special_insns.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 60 --<br>
&gt; =C2=A0arch/c6x/include/asm/string.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 =
-<br>
&gt; =C2=A0arch/c6x/include/asm/switch_to.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 30 -<br>
&gt; =C2=A0arch/c6x/include/asm/syscall.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 75 --<br>
&gt; =C2=A0arch/c6x/include/asm/syscalls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 46 --<br>
&gt; =C2=A0arch/c6x/include/asm/thread_info.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 94 ---<br>
&gt; =C2=A0arch/c6x/include/asm/timer64.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 -=
<br>
&gt; =C2=A0arch/c6x/include/asm/timex.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
30 -<br>
&gt; =C2=A0arch/c6x/include/asm/tlb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 7 -<br>
&gt; =C2=A0arch/c6x/include/asm/traps.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
33 -<br>
&gt; =C2=A0arch/c6x/include/asm/uaccess.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 97 ---<br=
>
&gt; =C2=A0arch/c6x/include/asm/unaligned.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 104 ---<br>
&gt; =C2=A0arch/c6x/include/asm/vmalloc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 -=
<br>
&gt; =C2=A0arch/c6x/include/uapi/asm/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 -<br>
&gt; =C2=A0arch/c6x/include/uapi/asm/byteorder.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 13 -<br>
&gt; =C2=A0arch/c6x/include/uapi/asm/ptrace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 164 ----<br>
&gt; =C2=A0arch/c6x/include/uapi/asm/setup.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 -<br>
&gt; =C2=A0arch/c6x/include/uapi/asm/sigcontext.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 81 --<br>
&gt; =C2=A0arch/c6x/include/uapi/asm/swab.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 55 --<br>
&gt; =C2=A0arch/c6x/include/uapi/asm/unistd.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 29 -<br>
&gt; =C2=A0arch/c6x/kernel/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 13 -<br>
&gt; =C2=A0arch/c6x/kernel/asm-offsets.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 123 ---<b=
r>
&gt; =C2=A0arch/c6x/kernel/c6x_ksyms.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 62 --<br>
&gt; =C2=A0arch/c6x/kernel/devicetree.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
14 -<br>
&gt; =C2=A0arch/c6x/kernel/entry.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 736 ------------------<br>
&gt; =C2=A0arch/c6x/kernel/head.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 81 --<br>
&gt; =C2=A0arch/c6x/kernel/irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 127 ---<br>
&gt; =C2=A0arch/c6x/kernel/module.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 119 ---<br>
&gt; =C2=A0arch/c6x/kernel/process.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 151 ----<br>
&gt; =C2=A0arch/c6x/kernel/ptrace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 139 ----<br>
&gt; =C2=A0arch/c6x/kernel/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 476 -----------<br>
&gt; =C2=A0arch/c6x/kernel/signal.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 322 --------<br>
&gt; =C2=A0arch/c6x/kernel/soc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 87 ---<br>
&gt; =C2=A0arch/c6x/kernel/switch_to.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 71 --<br>
&gt; =C2=A0arch/c6x/kernel/sys_c6x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 71 --<br>
&gt; =C2=A0arch/c6x/kernel/time.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 63 --<br>
&gt; =C2=A0arch/c6x/kernel/traps.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 409 ----------<br>
&gt; =C2=A0arch/c6x/kernel/vectors.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 78 --<br>
&gt; =C2=A0arch/c6x/kernel/vmlinux.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 151 ----<=
br>
&gt; =C2=A0arch/c6x/lib/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 -<br>
&gt; =C2=A0arch/c6x/lib/checksum.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 11 -<br>
&gt; =C2=A0arch/c6x/lib/csum_64plus.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 414 ----------<br>
&gt; =C2=A0arch/c6x/lib/divi.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 41 -<br>
&gt; =C2=A0arch/c6x/lib/divremi.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 34 -<br>
&gt; =C2=A0arch/c6x/lib/divremu.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 75 --<br>
&gt; =C2=A0arch/c6x/lib/divu.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 86 --<br>
&gt; =C2=A0arch/c6x/lib/llshl.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 25 -<br>
&gt; =C2=A0arch/c6x/lib/llshr.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 -<br>
&gt; =C2=A0arch/c6x/lib/llshru.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 -<br>
&gt; =C2=A0arch/c6x/lib/memcpy_64plus.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
43 -<br>
&gt; =C2=A0arch/c6x/lib/mpyll.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 37 -<br>
&gt; =C2=A0arch/c6x/lib/negll.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 -<br>
&gt; =C2=A0arch/c6x/lib/pop_rts.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20 -<br>
&gt; =C2=A0arch/c6x/lib/push_rts.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 19 -<br>
&gt; =C2=A0arch/c6x/lib/remi.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 52 --<br>
&gt; =C2=A0arch/c6x/lib/remu.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 70 --<br>
&gt; =C2=A0arch/c6x/lib/strasgi.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 77 --<br>
&gt; =C2=A0arch/c6x/lib/strasgi_64plus.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 27 =
-<br>
&gt; =C2=A0arch/c6x/mm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 -<br>
&gt; =C2=A0arch/c6x/mm/dma-coherent.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 173 ----<br>
&gt; =C2=A0arch/c6x/mm/init.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 65 --<br>
&gt; =C2=A0arch/c6x/platforms/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 21 -<br>
&gt; =C2=A0arch/c6x/platforms/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 13 -<br>
&gt; =C2=A0arch/c6x/platforms/cache.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 444 -----------<br>
&gt; =C2=A0arch/c6x/platforms/dscr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 595 --------------<br>
&gt; =C2=A0arch/c6x/platforms/emif.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 84 --<br>
&gt; =C2=A0arch/c6x/platforms/megamod-pic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 344 --------<br>
&gt; =C2=A0arch/c6x/platforms/pll.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 440 -----------<br>
&gt; =C2=A0arch/c6x/platforms/plldata.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 467 --=
---------<br>
&gt; =C2=A0arch/c6x/platforms/timer64.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 241 --=
----<br>
&gt; =C2=A0drivers/bus/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
&gt; =C2=A0fs/Kconfig.binfmt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
&gt; =C2=A0include/asm-generic/page.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 4 -<br>
&gt; =C2=A0129 files changed, 2 insertions(+), 11162 deletions(-)<br>
&gt; =C2=A0delete mode 100644 Documentation/devicetree/bindings/c6x/clocks.=
txt<br>
&gt; =C2=A0delete mode 100644 Documentation/devicetree/bindings/c6x/dscr.tx=
t<br>
&gt; =C2=A0delete mode 100644 Documentation/devicetree/bindings/c6x/emifa.t=
xt<br>
&gt; =C2=A0delete mode 100644 Documentation/devicetree/bindings/c6x/soc.txt=
<br>
&gt; =C2=A0delete mode 100644 Documentation/devicetree/bindings/interrupt-c=
ontroller/ti,c64x+megamod-pic.txt<br>
&gt; =C2=A0delete mode 100644 Documentation/devicetree/bindings/timer/ti,c6=
4x+timer64.txt<br>
&gt; =C2=A0delete mode 100644 arch/c6x/Kconfig<br>
&gt; =C2=A0delete mode 100644 arch/c6x/Kconfig.debug<br>
&gt; =C2=A0delete mode 100644 arch/c6x/Makefile<br>
&gt; =C2=A0delete mode 100644 arch/c6x/boot/Makefile<br>
&gt; =C2=A0delete mode 100644 arch/c6x/boot/dts/Makefile<br>
&gt; =C2=A0delete mode 100644 arch/c6x/boot/dts/dsk6455.dts<br>
&gt; =C2=A0delete mode 100644 arch/c6x/boot/dts/evmc6457.dts<br>
&gt; =C2=A0delete mode 100644 arch/c6x/boot/dts/evmc6472.dts<br>
&gt; =C2=A0delete mode 100644 arch/c6x/boot/dts/evmc6474.dts<br>
&gt; =C2=A0delete mode 100644 arch/c6x/boot/dts/evmc6678.dts<br>
&gt; =C2=A0delete mode 100644 arch/c6x/boot/dts/tms320c6455.dtsi<br>
&gt; =C2=A0delete mode 100644 arch/c6x/boot/dts/tms320c6457.dtsi<br>
&gt; =C2=A0delete mode 100644 arch/c6x/boot/dts/tms320c6472.dtsi<br>
&gt; =C2=A0delete mode 100644 arch/c6x/boot/dts/tms320c6474.dtsi<br>
&gt; =C2=A0delete mode 100644 arch/c6x/boot/dts/tms320c6678.dtsi<br>
&gt; =C2=A0delete mode 100644 arch/c6x/configs/dsk6455_defconfig<br>
&gt; =C2=A0delete mode 100644 arch/c6x/configs/evmc6457_defconfig<br>
&gt; =C2=A0delete mode 100644 arch/c6x/configs/evmc6472_defconfig<br>
&gt; =C2=A0delete mode 100644 arch/c6x/configs/evmc6474_defconfig<br>
&gt; =C2=A0delete mode 100644 arch/c6x/configs/evmc6678_defconfig<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/Kbuild<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/asm-offsets.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/bitops.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/bug.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/cache.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/cacheflush.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/checksum.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/clock.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/cmpxchg.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/delay.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/dscr.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/elf.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/flat.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/ftrace.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/hardirq.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/irq.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/irqflags.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/linkage.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/megamod-pic.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/mmu_context.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/module.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/page.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/pgtable.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/processor.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/procinfo.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/ptrace.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/sections.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/setup.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/soc.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/special_insns.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/string.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/switch_to.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/syscall.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/syscalls.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/thread_info.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/timer64.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/timex.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/tlb.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/traps.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/uaccess.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/unaligned.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/asm/vmalloc.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/uapi/asm/Kbuild<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/uapi/asm/byteorder.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/uapi/asm/ptrace.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/uapi/asm/setup.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/uapi/asm/sigcontext.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/uapi/asm/swab.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/include/uapi/asm/unistd.h<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/Makefile<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/asm-offsets.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/c6x_ksyms.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/devicetree.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/entry.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/head.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/irq.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/module.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/process.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/ptrace.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/setup.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/signal.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/soc.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/switch_to.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/sys_c6x.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/time.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/traps.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/vectors.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/kernel/vmlinux.lds.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/Makefile<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/checksum.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/csum_64plus.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/divi.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/divremi.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/divremu.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/divu.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/llshl.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/llshr.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/llshru.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/memcpy_64plus.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/mpyll.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/negll.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/pop_rts.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/push_rts.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/remi.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/remu.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/strasgi.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/lib/strasgi_64plus.S<br>
&gt; =C2=A0delete mode 100644 arch/c6x/mm/Makefile<br>
&gt; =C2=A0delete mode 100644 arch/c6x/mm/dma-coherent.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/mm/init.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/platforms/Kconfig<br>
&gt; =C2=A0delete mode 100644 arch/c6x/platforms/Makefile<br>
&gt; =C2=A0delete mode 100644 arch/c6x/platforms/cache.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/platforms/dscr.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/platforms/emif.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/platforms/megamod-pic.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/platforms/pll.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/platforms/plldata.c<br>
&gt; =C2=A0delete mode 100644 arch/c6x/platforms/timer64.c<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/c6x/clocks.txt b/Docume=
ntation/devicetree/bindings/c6x/clocks.txt<br>
&gt; deleted file mode 100644<br>
&gt; index a04f5fd30122..000000000000<br>
&gt; diff --git a/Documentation/devicetree/bindings/c6x/dscr.txt b/Document=
ation/devicetree/bindings/c6x/dscr.txt<br>
&gt; deleted file mode 100644<br>
&gt; index 92672235de57..000000000000<br>
&gt; diff --git a/Documentation/devicetree/bindings/c6x/emifa.txt b/Documen=
tation/devicetree/bindings/c6x/emifa.txt<br>
&gt; deleted file mode 100644<br>
&gt; index 0ff6e9b9a13f..000000000000<br>
&gt; diff --git a/Documentation/devicetree/bindings/c6x/soc.txt b/Documenta=
tion/devicetree/bindings/c6x/soc.txt<br>
&gt; deleted file mode 100644<br>
&gt; index b1e4973b5769..000000000000<br>
&gt; diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti=
,c64x+megamod-pic.txt b/Documentation/devicetree/bindings/interrupt-<br>
&gt; controller/ti,c64x+megamod-pic.txt<br>
&gt; deleted file mode 100644<br>
&gt; index ee3f9c351501..000000000000<br>
&gt; diff --git a/Documentation/devicetree/bindings/timer/ti,c64x+timer64.t=
xt b/Documentation/devicetree/bindings/timer/ti,c64x+timer64.txt<br>
&gt; deleted file mode 100644<br>
&gt; index d96c1e283e73..000000000000<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index fb971f5f6f0c..7c3eadb185f9 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -3837,14 +3837,6 @@ F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dri=
vers/irqchip/irq-csky-*<br>
&gt; =C2=A0N:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0csky<br>
&gt; =C2=A0K:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0csky<br>
&gt; =C2=A0<br>
&gt; -C6X ARCHITECTURE<br>
&gt; -M:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Mark Salter &lt;<a href=3D"mailto:msa=
lter@redhat.com" target=3D"_blank">msalter@redhat.com</a>&gt;<br>
&gt; -M:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Aurelien Jacquiot &lt;<a href=3D"mail=
to:jacquiot.aurelien@gmail.com" target=3D"_blank">jacquiot.aurelien@gmail.c=
om</a>&gt;<br>
&gt; -L:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<a href=3D"mailto:linux-c6x-dev@linux=
-c6x.org" target=3D"_blank">linux-c6x-dev@linux-c6x.org</a><br>
&gt; -S:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Maintained<br>
&gt; -W:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<a href=3D"http://www.linux-c6x.org/w=
iki/index.php/Main_Page" rel=3D"noreferrer" target=3D"_blank">http://www.li=
nux-c6x.org/wiki/index.php/Main_Page</a><br>
&gt; -F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0arch/c6x/<br>
&gt; -<br>
&gt; =C2=A0CA8210 IEEE-802.15.4 RADIO DRIVER<br>
&gt; =C2=A0M:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Harry Morris &lt;<a href=3D"mail=
to:h.morris@cascoda.com" target=3D"_blank">h.morris@cascoda.com</a>&gt;<br>
&gt; =C2=A0L:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<a href=3D"mailto:linux-wpan@vge=
r.kernel.org" target=3D"_blank">linux-wpan@vger.kernel.org</a><br>
&gt; diff --git a/arch/c6x/Kconfig b/arch/c6x/Kconfig<br>
&gt; deleted file mode 100644<br>
&gt; index bdeeac28b1be..000000000000<br>
&gt; diff --git a/arch/c6x/Kconfig.debug b/arch/c6x/Kconfig.debug<br>
&gt; deleted file mode 100644<br>
&gt; index c299e0d8eca3..000000000000<br>
&gt; diff --git a/arch/c6x/Makefile b/arch/c6x/Makefile<br>
&gt; deleted file mode 100644<br>
&gt; index b7aa854f7008..000000000000<br>
&gt; diff --git a/arch/c6x/boot/Makefile b/arch/c6x/boot/Makefile<br>
&gt; deleted file mode 100644<br>
&gt; index 842b7b0bfe80..000000000000<br>
&gt; diff --git a/arch/c6x/boot/dts/Makefile b/arch/c6x/boot/dts/Makefile<b=
r>
&gt; deleted file mode 100644<br>
&gt; index f438285c3640..000000000000<br>
&gt; diff --git a/arch/c6x/boot/dts/dsk6455.dts b/arch/c6x/boot/dts/dsk6455=
.dts<br>
&gt; deleted file mode 100644<br>
&gt; index fa904f2916b5..000000000000<br>
&gt; diff --git a/arch/c6x/boot/dts/evmc6457.dts b/arch/c6x/boot/dts/evmc64=
57.dts<br>
&gt; deleted file mode 100644<br>
&gt; index 73e1d43b51ce..000000000000<br>
&gt; diff --git a/arch/c6x/boot/dts/evmc6472.dts b/arch/c6x/boot/dts/evmc64=
72.dts<br>
&gt; deleted file mode 100644<br>
&gt; index 4878b78919fa..000000000000<br>
&gt; diff --git a/arch/c6x/boot/dts/evmc6474.dts b/arch/c6x/boot/dts/evmc64=
74.dts<br>
&gt; deleted file mode 100644<br>
&gt; index d10746453217..000000000000<br>
&gt; diff --git a/arch/c6x/boot/dts/evmc6678.dts b/arch/c6x/boot/dts/evmc66=
78.dts<br>
&gt; deleted file mode 100644<br>
&gt; index 5e6c0961e7b2..000000000000<br>
&gt; diff --git a/arch/c6x/boot/dts/tms320c6455.dtsi b/arch/c6x/boot/dts/tm=
s320c6455.dtsi<br>
&gt; deleted file mode 100644<br>
&gt; index 0b21cb30343b..000000000000<br>
&gt; diff --git a/arch/c6x/boot/dts/tms320c6457.dtsi b/arch/c6x/boot/dts/tm=
s320c6457.dtsi<br>
&gt; deleted file mode 100644<br>
&gt; index e49f7ae19124..000000000000<br>
&gt; diff --git a/arch/c6x/boot/dts/tms320c6472.dtsi b/arch/c6x/boot/dts/tm=
s320c6472.dtsi<br>
&gt; deleted file mode 100644<br>
&gt; index 9dd4b04e78ef..000000000000<br>
&gt; diff --git a/arch/c6x/boot/dts/tms320c6474.dtsi b/arch/c6x/boot/dts/tm=
s320c6474.dtsi<br>
&gt; deleted file mode 100644<br>
&gt; index 0ef5333629a6..000000000000<br>
&gt; diff --git a/arch/c6x/boot/dts/tms320c6678.dtsi b/arch/c6x/boot/dts/tm=
s320c6678.dtsi<br>
&gt; deleted file mode 100644<br>
&gt; index da1e3f2bf062..000000000000<br>
&gt; diff --git a/arch/c6x/configs/dsk6455_defconfig b/arch/c6x/configs/dsk=
6455_defconfig<br>
&gt; deleted file mode 100644<br>
&gt; index d764ea4cce7f..000000000000<br>
&gt; diff --git a/arch/c6x/configs/evmc6457_defconfig b/arch/c6x/configs/ev=
mc6457_defconfig<br>
&gt; deleted file mode 100644<br>
&gt; index 05d0b4a25ab1..000000000000<br>
&gt; diff --git a/arch/c6x/configs/evmc6472_defconfig b/arch/c6x/configs/ev=
mc6472_defconfig<br>
&gt; deleted file mode 100644<br>
&gt; index 8d81fcf86b0e..000000000000<br>
&gt; diff --git a/arch/c6x/configs/evmc6474_defconfig b/arch/c6x/configs/ev=
mc6474_defconfig<br>
&gt; deleted file mode 100644<br>
&gt; index 8156a98f3958..000000000000<br>
&gt; diff --git a/arch/c6x/configs/evmc6678_defconfig b/arch/c6x/configs/ev=
mc6678_defconfig<br>
&gt; deleted file mode 100644<br>
&gt; index c4f433c25b69..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/Kbuild b/arch/c6x/include/asm/Kbuild=
<br>
&gt; deleted file mode 100644<br>
&gt; index a4ef93a1f7ae..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/asm-offsets.h b/arch/c6x/include/asm=
/asm-offsets.h<br>
&gt; deleted file mode 100644<br>
&gt; index d370ee36a182..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/bitops.h b/arch/c6x/include/asm/bito=
ps.h<br>
&gt; deleted file mode 100644<br>
&gt; index 50e618f38a11..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/bug.h b/arch/c6x/include/asm/bug.h<b=
r>
&gt; deleted file mode 100644<br>
&gt; index 1a68676256ee..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/cache.h b/arch/c6x/include/asm/cache=
.h<br>
&gt; deleted file mode 100644<br>
&gt; index 0fa8bf77c954..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/cacheflush.h b/arch/c6x/include/asm/=
cacheflush.h<br>
&gt; deleted file mode 100644<br>
&gt; index 10922d528de6..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/checksum.h b/arch/c6x/include/asm/ch=
ecksum.h<br>
&gt; deleted file mode 100644<br>
&gt; index 934918def632..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/clock.h b/arch/c6x/include/asm/clock=
.h<br>
&gt; deleted file mode 100644<br>
&gt; index 7b6c42a52ec9..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/cmpxchg.h b/arch/c6x/include/asm/cmp=
xchg.h<br>
&gt; deleted file mode 100644<br>
&gt; index 6eed628a9e7f..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/delay.h b/arch/c6x/include/asm/delay=
.h<br>
&gt; deleted file mode 100644<br>
&gt; index 455fc713ae54..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/dscr.h b/arch/c6x/include/asm/dscr.h=
<br>
&gt; deleted file mode 100644<br>
&gt; index f6b095c3d3f5..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/elf.h b/arch/c6x/include/asm/elf.h<b=
r>
&gt; deleted file mode 100644<br>
&gt; index ca88acbf560b..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/flat.h b/arch/c6x/include/asm/flat.h=
<br>
&gt; deleted file mode 100644<br>
&gt; index 9e6544b51386..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/ftrace.h b/arch/c6x/include/asm/ftra=
ce.h<br>
&gt; deleted file mode 100644<br>
&gt; index 3701958d3d1c..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/hardirq.h b/arch/c6x/include/asm/har=
dirq.h<br>
&gt; deleted file mode 100644<br>
&gt; index f37d07d31040..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/irq.h b/arch/c6x/include/asm/irq.h<b=
r>
&gt; deleted file mode 100644<br>
&gt; index 9da4d1afd0d7..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/irqflags.h b/arch/c6x/include/asm/ir=
qflags.h<br>
&gt; deleted file mode 100644<br>
&gt; index d6cd71c02629..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/linkage.h b/arch/c6x/include/asm/lin=
kage.h<br>
&gt; deleted file mode 100644<br>
&gt; index 1ad615da6479..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/megamod-pic.h b/arch/c6x/include/asm=
/megamod-pic.h<br>
&gt; deleted file mode 100644<br>
&gt; index a0a6d596bf9b..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/mmu_context.h b/arch/c6x/include/asm=
/mmu_context.h<br>
&gt; deleted file mode 100644<br>
&gt; index d2659d0a3297..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/module.h b/arch/c6x/include/asm/modu=
le.h<br>
&gt; deleted file mode 100644<br>
&gt; index 9fc9f4a8ecc2..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/page.h b/arch/c6x/include/asm/page.h=
<br>
&gt; deleted file mode 100644<br>
&gt; index 40079899084d..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/pgtable.h b/arch/c6x/include/asm/pgt=
able.h<br>
&gt; deleted file mode 100644<br>
&gt; index 8a91ceda39fa..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/processor.h b/arch/c6x/include/asm/p=
rocessor.h<br>
&gt; deleted file mode 100644<br>
&gt; index 1456f5e11de3..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/procinfo.h b/arch/c6x/include/asm/pr=
ocinfo.h<br>
&gt; deleted file mode 100644<br>
&gt; index aaa3cb902c43..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/ptrace.h b/arch/c6x/include/asm/ptra=
ce.h<br>
&gt; deleted file mode 100644<br>
&gt; index 7cbae382cf37..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/sections.h b/arch/c6x/include/asm/se=
ctions.h<br>
&gt; deleted file mode 100644<br>
&gt; index dc2f15eb3bde..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/setup.h b/arch/c6x/include/asm/setup=
.h<br>
&gt; deleted file mode 100644<br>
&gt; index 5496bccecaa0..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/soc.h b/arch/c6x/include/asm/soc.h<b=
r>
&gt; deleted file mode 100644<br>
&gt; index 43f50159e59b..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/special_insns.h b/arch/c6x/include/a=
sm/special_insns.h<br>
&gt; deleted file mode 100644<br>
&gt; index d233160aefd4..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/string.h b/arch/c6x/include/asm/stri=
ng.h<br>
&gt; deleted file mode 100644<br>
&gt; index b290ead40f68..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/switch_to.h b/arch/c6x/include/asm/s=
witch_to.h<br>
&gt; deleted file mode 100644<br>
&gt; index 36c5332fadae..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/syscall.h b/arch/c6x/include/asm/sys=
call.h<br>
&gt; deleted file mode 100644<br>
&gt; index 38f3e2284ecd..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/syscalls.h b/arch/c6x/include/asm/sy=
scalls.h<br>
&gt; deleted file mode 100644<br>
&gt; index df3d05feb153..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/thread_info.h b/arch/c6x/include/asm=
/thread_info.h<br>
&gt; deleted file mode 100644<br>
&gt; index dd8913d57189..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/timer64.h b/arch/c6x/include/asm/tim=
er64.h<br>
&gt; deleted file mode 100644<br>
&gt; index b850dfef1f79..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/timex.h b/arch/c6x/include/asm/timex=
.h<br>
&gt; deleted file mode 100644<br>
&gt; index f946ce297e13..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/tlb.h b/arch/c6x/include/asm/tlb.h<b=
r>
&gt; deleted file mode 100644<br>
&gt; index 240ba0febb57..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/traps.h b/arch/c6x/include/asm/traps=
.h<br>
&gt; deleted file mode 100644<br>
&gt; index 7e1d31c47680..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/uaccess.h b/arch/c6x/include/asm/uac=
cess.h<br>
&gt; deleted file mode 100644<br>
&gt; index 585adf9201b7..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/unaligned.h b/arch/c6x/include/asm/u=
naligned.h<br>
&gt; deleted file mode 100644<br>
&gt; index d628cc170564..000000000000<br>
&gt; diff --git a/arch/c6x/include/asm/vmalloc.h b/arch/c6x/include/asm/vma=
lloc.h<br>
&gt; deleted file mode 100644<br>
&gt; index 26c6c6696bbd..000000000000<br>
&gt; diff --git a/arch/c6x/include/uapi/asm/Kbuild b/arch/c6x/include/uapi/=
asm/Kbuild<br>
&gt; deleted file mode 100644<br>
&gt; index e78470141932..000000000000<br>
&gt; diff --git a/arch/c6x/include/uapi/asm/byteorder.h b/arch/c6x/include/=
uapi/asm/byteorder.h<br>
&gt; deleted file mode 100644<br>
&gt; index ab61f867391c..000000000000<br>
&gt; diff --git a/arch/c6x/include/uapi/asm/ptrace.h b/arch/c6x/include/uap=
i/asm/ptrace.h<br>
&gt; deleted file mode 100644<br>
&gt; index 9b51110a0842..000000000000<br>
&gt; diff --git a/arch/c6x/include/uapi/asm/setup.h b/arch/c6x/include/uapi=
/asm/setup.h<br>
&gt; deleted file mode 100644<br>
&gt; index e90548cebec3..000000000000<br>
&gt; diff --git a/arch/c6x/include/uapi/asm/sigcontext.h b/arch/c6x/include=
/uapi/asm/sigcontext.h<br>
&gt; deleted file mode 100644<br>
&gt; index 4e5a9a260861..000000000000<br>
&gt; diff --git a/arch/c6x/include/uapi/asm/swab.h b/arch/c6x/include/uapi/=
asm/swab.h<br>
&gt; deleted file mode 100644<br>
&gt; index c407c0497718..000000000000<br>
&gt; diff --git a/arch/c6x/include/uapi/asm/unistd.h b/arch/c6x/include/uap=
i/asm/unistd.h<br>
&gt; deleted file mode 100644<br>
&gt; index 79b724c39d9b..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/Makefile b/arch/c6x/kernel/Makefile<br>
&gt; deleted file mode 100644<br>
&gt; index fbe74174de87..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/asm-offsets.c b/arch/c6x/kernel/asm-offse=
ts.c<br>
&gt; deleted file mode 100644<br>
&gt; index 4a264ef87dcb..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/c6x_ksyms.c b/arch/c6x/kernel/c6x_ksyms.c=
<br>
&gt; deleted file mode 100644<br>
&gt; index 5a39f52f9db4..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/devicetree.c b/arch/c6x/kernel/devicetree=
.c<br>
&gt; deleted file mode 100644<br>
&gt; index a0c73f0545b2..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/entry.S b/arch/c6x/kernel/entry.S<br>
&gt; deleted file mode 100644<br>
&gt; index fb154d19625b..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/head.S b/arch/c6x/kernel/head.S<br>
&gt; deleted file mode 100644<br>
&gt; index fecbeef827bc..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/irq.c b/arch/c6x/kernel/irq.c<br>
&gt; deleted file mode 100644<br>
&gt; index e4c53d185b62..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/module.c b/arch/c6x/kernel/module.c<br>
&gt; deleted file mode 100644<br>
&gt; index 09b4c6bfe877..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/process.c b/arch/c6x/kernel/process.c<br>
&gt; deleted file mode 100644<br>
&gt; index 9f4fd6a40a10..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/ptrace.c b/arch/c6x/kernel/ptrace.c<br>
&gt; deleted file mode 100644<br>
&gt; index 3cdaa8cf0ed6..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/setup.c b/arch/c6x/kernel/setup.c<br>
&gt; deleted file mode 100644<br>
&gt; index 9254c3b794a5..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/signal.c b/arch/c6x/kernel/signal.c<br>
&gt; deleted file mode 100644<br>
&gt; index 862460c3b183..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/soc.c b/arch/c6x/kernel/soc.c<br>
&gt; deleted file mode 100644<br>
&gt; index 8362f9390e03..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/switch_to.S b/arch/c6x/kernel/switch_to.S=
<br>
&gt; deleted file mode 100644<br>
&gt; index b7f9f607042e..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/sys_c6x.c b/arch/c6x/kernel/sys_c6x.c<br>
&gt; deleted file mode 100644<br>
&gt; index 600277f057cf..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/time.c b/arch/c6x/kernel/time.c<br>
&gt; deleted file mode 100644<br>
&gt; index f3ec91a87f4f..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/traps.c b/arch/c6x/kernel/traps.c<br>
&gt; deleted file mode 100644<br>
&gt; index 2b9121c755be..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/vectors.S b/arch/c6x/kernel/vectors.S<br>
&gt; deleted file mode 100644<br>
&gt; index ad3dc006a6d3..000000000000<br>
&gt; diff --git a/arch/c6x/kernel/vmlinux.lds.S b/arch/c6x/kernel/vmlinux.l=
ds.S<br>
&gt; deleted file mode 100644<br>
&gt; index ac99ba0864bf..000000000000<br>
&gt; diff --git a/arch/c6x/lib/Makefile b/arch/c6x/lib/Makefile<br>
&gt; deleted file mode 100644<br>
&gt; index e182004f82fe..000000000000<br>
&gt; diff --git a/arch/c6x/lib/checksum.c b/arch/c6x/lib/checksum.c<br>
&gt; deleted file mode 100644<br>
&gt; index dff2e2ec6e64..000000000000<br>
&gt; diff --git a/arch/c6x/lib/csum_64plus.S b/arch/c6x/lib/csum_64plus.S<b=
r>
&gt; deleted file mode 100644<br>
&gt; index 57148866d8d3..000000000000<br>
&gt; diff --git a/arch/c6x/lib/divi.S b/arch/c6x/lib/divi.S<br>
&gt; deleted file mode 100644<br>
&gt; index d1764ae0b519..000000000000<br>
&gt; diff --git a/arch/c6x/lib/divremi.S b/arch/c6x/lib/divremi.S<br>
&gt; deleted file mode 100644<br>
&gt; index 575fc57a8a76..000000000000<br>
&gt; diff --git a/arch/c6x/lib/divremu.S b/arch/c6x/lib/divremu.S<br>
&gt; deleted file mode 100644<br>
&gt; index 5f6a6a2997ae..000000000000<br>
&gt; diff --git a/arch/c6x/lib/divu.S b/arch/c6x/lib/divu.S<br>
&gt; deleted file mode 100644<br>
&gt; index f0f6082944c2..000000000000<br>
&gt; diff --git a/arch/c6x/lib/llshl.S b/arch/c6x/lib/llshl.S<br>
&gt; deleted file mode 100644<br>
&gt; index 3272499618e0..000000000000<br>
&gt; diff --git a/arch/c6x/lib/llshr.S b/arch/c6x/lib/llshr.S<br>
&gt; deleted file mode 100644<br>
&gt; index 6bfaacd15e73..000000000000<br>
&gt; diff --git a/arch/c6x/lib/llshru.S b/arch/c6x/lib/llshru.S<br>
&gt; deleted file mode 100644<br>
&gt; index 103128f50770..000000000000<br>
&gt; diff --git a/arch/c6x/lib/memcpy_64plus.S b/arch/c6x/lib/memcpy_64plus=
.S<br>
&gt; deleted file mode 100644<br>
&gt; index 157a30486bfd..000000000000<br>
&gt; diff --git a/arch/c6x/lib/mpyll.S b/arch/c6x/lib/mpyll.S<br>
&gt; deleted file mode 100644<br>
&gt; index d07c13ec4fd4..000000000000<br>
&gt; diff --git a/arch/c6x/lib/negll.S b/arch/c6x/lib/negll.S<br>
&gt; deleted file mode 100644<br>
&gt; index 9ba434db5366..000000000000<br>
&gt; diff --git a/arch/c6x/lib/pop_rts.S b/arch/c6x/lib/pop_rts.S<br>
&gt; deleted file mode 100644<br>
&gt; index f129e32943c5..000000000000<br>
&gt; diff --git a/arch/c6x/lib/push_rts.S b/arch/c6x/lib/push_rts.S<br>
&gt; deleted file mode 100644<br>
&gt; index 40b0a4fe937c..000000000000<br>
&gt; diff --git a/arch/c6x/lib/remi.S b/arch/c6x/lib/remi.S<br>
&gt; deleted file mode 100644<br>
&gt; index 96a1335eac20..000000000000<br>
&gt; diff --git a/arch/c6x/lib/remu.S b/arch/c6x/lib/remu.S<br>
&gt; deleted file mode 100644<br>
&gt; index 428feb9c06c0..000000000000<br>
&gt; diff --git a/arch/c6x/lib/strasgi.S b/arch/c6x/lib/strasgi.S<br>
&gt; deleted file mode 100644<br>
&gt; index 715aeb200792..000000000000<br>
&gt; diff --git a/arch/c6x/lib/strasgi_64plus.S b/arch/c6x/lib/strasgi_64pl=
us.S<br>
&gt; deleted file mode 100644<br>
&gt; index d10aa2dc3249..000000000000<br>
&gt; diff --git a/arch/c6x/mm/Makefile b/arch/c6x/mm/Makefile<br>
&gt; deleted file mode 100644<br>
&gt; index 19d05e972dd1..000000000000<br>
&gt; diff --git a/arch/c6x/mm/dma-coherent.c b/arch/c6x/mm/dma-coherent.c<b=
r>
&gt; deleted file mode 100644<br>
&gt; index 03df07a831fc..000000000000<br>
&gt; diff --git a/arch/c6x/mm/init.c b/arch/c6x/mm/init.c<br>
&gt; deleted file mode 100644<br>
&gt; index a97e51a3e26d..000000000000<br>
&gt; diff --git a/arch/c6x/platforms/Kconfig b/arch/c6x/platforms/Kconfig<b=
r>
&gt; deleted file mode 100644<br>
&gt; index f3a9ae6e0e82..000000000000<br>
&gt; diff --git a/arch/c6x/platforms/Makefile b/arch/c6x/platforms/Makefile=
<br>
&gt; deleted file mode 100644<br>
&gt; index b320f1c68884..000000000000<br>
&gt; diff --git a/arch/c6x/platforms/cache.c b/arch/c6x/platforms/cache.c<b=
r>
&gt; deleted file mode 100644<br>
&gt; index fff027b72513..000000000000<br>
&gt; diff --git a/arch/c6x/platforms/dscr.c b/arch/c6x/platforms/dscr.c<br>
&gt; deleted file mode 100644<br>
&gt; index 4571615b589f..000000000000<br>
&gt; diff --git a/arch/c6x/platforms/emif.c b/arch/c6x/platforms/emif.c<br>
&gt; deleted file mode 100644<br>
&gt; index 6142ecc2cd88..000000000000<br>
&gt; diff --git a/arch/c6x/platforms/megamod-pic.c b/arch/c6x/platforms/meg=
amod-pic.c<br>
&gt; deleted file mode 100644<br>
&gt; index 56189e50728c..000000000000<br>
&gt; diff --git a/arch/c6x/platforms/pll.c b/arch/c6x/platforms/pll.c<br>
&gt; deleted file mode 100644<br>
&gt; index 6fdf20d64dc7..000000000000<br>
&gt; diff --git a/arch/c6x/platforms/plldata.c b/arch/c6x/platforms/plldata=
.c<br>
&gt; deleted file mode 100644<br>
&gt; index a799e04edefe..000000000000<br>
&gt; diff --git a/arch/c6x/platforms/timer64.c b/arch/c6x/platforms/timer64=
.c<br>
&gt; deleted file mode 100644<br>
&gt; index 661f4c7c6ef6..000000000000<br>
&gt; diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig<br>
&gt; index 0c262c2aeaf2..e7f7eee6ee9a 100644<br>
&gt; --- a/drivers/bus/Kconfig<br>
&gt; +++ b/drivers/bus/Kconfig<br>
&gt; @@ -80,7 +80,7 @@ config MOXTET<br>
&gt; =C2=A0<br>
&gt; =C2=A0config HISILICON_LPC<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool &quot;Support for=
 ISA I/O space on HiSilicon Hip06/7&quot;<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on (ARM64 &amp;&amp=
; ARCH_HISI) || (COMPILE_TEST &amp;&amp; !ALPHA &amp;&amp; !HEXAGON &amp;&a=
mp; !PARISC &amp;&amp; !C6X)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on (ARM64 &amp;&amp=
; ARCH_HISI) || (COMPILE_TEST &amp;&amp; !ALPHA &amp;&amp; !HEXAGON &amp;&a=
mp; !PARISC)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on HAS_IOMEM<b=
r>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select INDIRECT_PIO if=
 ARM64<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help<br>
&gt; diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt<br>
&gt; index 885da6d983b4..647439c2c05a 100644<br>
&gt; --- a/fs/Kconfig.binfmt<br>
&gt; +++ b/fs/Kconfig.binfmt<br>
&gt; @@ -45,7 +45,7 @@ config ARCH_USE_GNU_PROPERTY<br>
&gt; =C2=A0config BINFMT_ELF_FDPIC<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool &quot;Kernel supp=
ort for FDPIC ELF binaries&quot;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default y if !BINFMT_E=
LF<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on (ARM || (SUPERH =
&amp;&amp; !MMU) || C6X)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on (ARM || (SUPERH =
&amp;&amp; !MMU))<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select ELFCORE<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ELF FDPIC binar=
ies are based on ELF, but allow the individual load<br>
&gt; diff --git a/include/asm-generic/page.h b/include/asm-generic/page.h<b=
r>
&gt; index fe801f01625e..6fc47561814c 100644<br>
&gt; --- a/include/asm-generic/page.h<br>
&gt; +++ b/include/asm-generic/page.h<br>
&gt; @@ -63,11 +63,7 @@ extern unsigned long memory_end;<br>
&gt; =C2=A0<br>
&gt; =C2=A0#endif /* !__ASSEMBLY__ */<br>
&gt; =C2=A0<br>
&gt; -#ifdef CONFIG_KERNEL_RAM_BASE_ADDRESS<br>
&gt; -#define PAGE_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0(CONFIG_KERNEL_RAM_BASE_ADDRESS)<br>
&gt; -#else<br>
&gt; =C2=A0#define PAGE_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0(0)<br>
&gt; -#endif<br>
&gt; =C2=A0<br>
&gt; =C2=A0#ifndef ARCH_PFN_OFFSET<br>
&gt; =C2=A0#define ARCH_PFN_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(PAGE_OFFSET &gt;&=
gt; PAGE_SHIFT)<br>
<br>
Thanks Arnd.<br>
<br>
Acked-by: Mark Salter &lt;<a href=3D"mailto:msalter@redhat.com" target=3D"_=
blank">msalter@redhat.com</a>&gt;<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d3c40e05ba69dd17--
