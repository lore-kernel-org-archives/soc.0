Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9D4C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 12:44:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF182239FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 12:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF182239FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j29jO32HahtNAS6usmwNmLFli96PLA63/gE2X90+5UI=; b=raHeJZZe6sRz1vA6vi8fvoa3A
	6lt8V5CWHtCEw/dtSs/nbzDskOx8HF44UM4uECCLZ1QL8VpduWP5m/3kUTIr0GpfbsJgku8H40mgj
	ZWLFUEX0puDVJ+hDK1p7mra575F2V+IVWs8hDJJtZ2dEhfcmHPvQSayB0IDhCKN4BCuzUtAz2sCI9
	71s+nmKzo4Ih/WMYC9s1SyrpPYfPuqYptfTLdoFd8XZSU5teEIfYSXhmS8yWhn9SON4ym+fApQRwl
	XXB2nb962dkkKeoT5f/A6ibfcwD4KaEIA6nk+iAwBkylE2wb47L7+JR9SVgCOFak5ZAq/BQzOQKHn
	lLx17GnwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxr68-00017H-8K; Fri, 08 Jan 2021 12:42:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxr5j-00016d-9Z
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 12:42:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25048239FD
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-ot1-f46.google.com with SMTP id i6so9536113otr.2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Jan 2021 04:42:06 -0800 (PST)
X-Gm-Message-State: AOAM5332sSxkZPnq/Wa3pQ7XazfZHGk7phwdk7Ou+PKHx8Ha9QMhLfZS
 jbPPNQKrv4mJWnRdodjAxEqjT2GhoV7vKvcA6U4=
X-Google-Smtp-Source: ABdhPJzrIYxQ4ZupKr9iakNXzDWEL5TQMPAP1PIBfeDFaIo1FeiqehupKiXYB5mviqUtaCl+ISPof6A1aC0YCUjLEck=
X-Received: by 2002:a05:6830:2413:: with SMTP id
 j19mr2488449ots.251.1610109725444; 
 Fri, 08 Jan 2021 04:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
 <20210108103227.1740865-2-misono.tomohiro@jp.fujitsu.com>
In-Reply-To: <20210108103227.1740865-2-misono.tomohiro@jp.fujitsu.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 13:41:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a15PUC5Tu+FBuyZYtyQUC_bc92zVszYeFoCU6tn05jgMA@mail.gmail.com>
Message-ID: <CAK8P3a15PUC5Tu+FBuyZYtyQUC_bc92zVszYeFoCU6tn05jgMA@mail.gmail.com>
Subject: Re: [PATCH 01/10] soc: fujitsu: hwb: Add hardware barrier driver
 init/exit code
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_074207_572200_C51E006C 
X-CRM114-Status: GOOD (  22.26  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108124149.P30VduChn6Rnq5O6uGgzLrN4yqabMqnhTdWhyGYQzH0@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
