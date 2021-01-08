Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1456C433DB
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 12:42:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4A13523A01; Fri,  8 Jan 2021 12:42:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D297239FC;
	Fri,  8 Jan 2021 12:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610109726;
	bh=WK2Ph1rImywdZhL3N07jSxCF3LCMkWe6lh9+rpuj9Ro=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Bv3rWwJIBZ2a5V3YrX+RPUiIANMoXUX0XyVPnbsQ7nHKd3bGnVLNAWZuHaBOoEJUS
	 K2Sqz+vpW7rB3k2aFC2jJxGN7isEBeGThwCjSNSrJMUAMeiy2qiobIHOJLSCdYJzSk
	 X7dbf431h3RJgcJjnEw97cK06NEjcPULHsU3I66BTH3Unwie0RREcIm9C31zxWat3f
	 no4s9WKpTtBBFAzlZV8jp/DMJgDCvfDv5yTQT4t5mUeM2okD+Tvc9JAVjWIlZBETwH
	 zOTihCJ0DpFJkBP1ERkIEoGW1zdCUaDfrWERy+DEDFT61RjvEaS02KIywbsXmb4Qcl
	 UeNXaLcmwvBmA==
Received: by mail-ot1-f49.google.com with SMTP id x13so9493166oto.8;
        Fri, 08 Jan 2021 04:42:06 -0800 (PST)
X-Gm-Message-State: AOAM533TzUuxMnjkTZedhlkYOStwFe4lpuTdskL7vY/Oae1kYN3CMzdW
	leS6iPDI4m+5vOQCpIci2x/8eKT8bbhhGJkuGk4=
X-Google-Smtp-Source: ABdhPJzrIYxQ4ZupKr9iakNXzDWEL5TQMPAP1PIBfeDFaIo1FeiqehupKiXYB5mviqUtaCl+ISPof6A1aC0YCUjLEck=
X-Received: by 2002:a05:6830:2413:: with SMTP id j19mr2488449ots.251.1610109725444;
 Fri, 08 Jan 2021 04:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com> <20210108103227.1740865-2-misono.tomohiro@jp.fujitsu.com>
In-Reply-To: <20210108103227.1740865-2-misono.tomohiro@jp.fujitsu.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 13:41:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a15PUC5Tu+FBuyZYtyQUC_bc92zVszYeFoCU6tn05jgMA@mail.gmail.com>
Message-ID: <CAK8P3a15PUC5Tu+FBuyZYtyQUC_bc92zVszYeFoCU6tn05jgMA@mail.gmail.com>
Subject: Re: [PATCH 01/10] soc: fujitsu: hwb: Add hardware barrier driver
 init/exit code
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 11:32 AM Misono Tomohiro
<misono.tomohiro@jp.fujitsu.com> wrote:
> + *
> + * This hardware barrier (HWB) driver provides a set of ioctls to realize synchronization
> + * by PEs in the same Come Memory Group (CMG) by using implementation defined registers.
> + * On A64FX, CMG is the same as L3 cache domain.
> + *
> + * The main purpose of the driver is setting up registers which cannot be accessed
> + * from EL0. However, after initialization, BST_SYNC/LBSY_SYNC registers which is used
> + * in synchronization main logic can be accessed from EL0 (therefore it is fast).
> + *
> + * Simplified barrier operation flow of user application is as follows:
> + *  (one PE)
> + *    1. Call IOC_BB_ALLOC to setup INIT_SYNC register which is shared in a CMG.
> + *       This specifies which PEs join synchronization
> + *  (on each PE joining synchronization)
> + *    2. Call IOC_BW_ASSIGN to setup ASSIGN_SYNC register per PE
> + *    3. Barrier main logic (all logic runs in EL0)
> + *      a) Write 1 to BST_SYNC register
> + *      b) Read LBSY_SYNC register
> + *      c) If LBSY_SYNC value is 1, sync is finished, otherwise go back to b
> + *         (If all PEs joining synchronization write 1 to BST_SYNC, LBSY_SYNC becomes 1)
> + *    4. Call IOC_BW_UNASSIGN to reset ASSIGN_SYNC register
> + *  (one PE)
> + *    5. Call IOC_BB_FREE to reset INIT_SYNC register
> + */

On a very general note, I would like to see some background about how
specific this functionality is to the specific design of A64fx. If there are
other processors with a similar requirement, then it would be best to
define a more abstract user API that can work for any such product.

> +static int __init hwb_init(void)
> +{
> +       int ret;
> +
> +       ret = setup_hwinfo();
> +       if (ret < 0) {
> +               pr_err("Unsupported CPU type\n");
> +               return ret;
> +       }

Loading the module on a different machine should not print a warning:
In general, we want it to be possible to have all hardware specific
drivers built into the kernel, but not print any irritating messages
when they are simply not used on the hardware.

One way to avoid this would be to use a platform_driver() that
only gets loaded when a corresponding hardware device of some
sort is found, or ignored otherwise.

      Arnd
