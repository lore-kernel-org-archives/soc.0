Return-Path: <SRS0=EmFY=GL=arm.com=mark.rutland@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66697C433DB
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 12:54:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1A95F239FF; Fri,  8 Jan 2021 12:54:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 987AF239FC;
	Fri,  8 Jan 2021 12:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 987AF239FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=mark.rutland@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C5AD6E;
	Fri,  8 Jan 2021 04:54:18 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.36.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1996B3F719;
	Fri,  8 Jan 2021 04:54:16 -0800 (PST)
Date: Fri, 8 Jan 2021 12:54:10 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@kernel.org, olof@lixom.net,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de
Subject: Re: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Message-ID: <20210108125410.GA84941@C02TD0UTHF1T.local>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>

On Fri, Jan 08, 2021 at 07:52:31PM +0900, Misono Tomohiro wrote:
> (Resend as cover letter title was missing in the first time. Sorry for noise)
> 
> Hello,

Hi,

> This series adds Fujitsu A64FX SoC entry in drivers/soc and hardware
> barrier driver for it.
> 
> [Driver Description]
>  A64FX CPU has several functions for HPC workload and hardware barrier
>  is one of them. It is a mechanism to realize fast synchronization by
>  PEs belonging to the same L3 cache domain by using implementation
>  defined hardware registers.
>  For more details, see A64FX HPC extension specification in
>  https://github.com/fujitsu/A64FX
>  
>  The driver mainly offers a set of ioctls to manipulate related registers.
>  Patch 1-9 implements driver code and patch 10 finally adds kconfig,
>  Makefile and MAINTAINER entry for the driver.  

I have a number of concerns here, and at a high level, I do not think
that this is something Linux can reasonably support in its current form.
Sorry if this comes across as harsh; I appreciate the work that has gone
into this, and the effort to try to upstream support is great -- my
concerns are with the overal picture.

As a general rule, we avoid the use of IMPLEMENTATION DEFINED features
in Linux, as they pose a number of correctness/safety challenges and
come with a potentially significan long term maintenance burden that is
generally not justified by the features themselves. For example, such
features are not usable under virtualization (where a hypervisor may set
HCR_EL2.TIDCP, or fail to context-switch state that it is unaware of).

Secondly, the intended usage model appears to expose this to EL0 for
direct access, and the code seems to depend on threads being pinned, but
AFAICT this is not enforced and there is no provision for
context-switch, thread migration, or interaction with ptrace. I fear
this is going to be very fragile in practice, and that extending that
support in future will require much more complexity than is currently
apparent, with potentially invasive changes to arch code.

Thirdly, this requires userspace software to be intimately familiar with
the HW platform that it is running on (both in terms of using IMP-DEF
instructions and needing to know the physical layout), rather than being
generic and portable, which I don't believe is something that we wish to
encourage.  I also think this is unlikely to be supported by generic
software because of the lack of portability, and consequently I struggle
to beleive that this will see significant usage.

Further, as an IMP-DEF feature, it's not clear how much of this will
carry forward into future designs, and where things may change. It's
extremely difficult to determine whether any of the ABI decisions (e.g.
the sysfs layout) are sufficient, or what level of changes would be
necessary in userspace code if there are physical topology changes or
changes to the strucutre of the system register interfaces.

Overall, I think this needs much more justification in terms of
practical usage, safety/correctness, and long term maintenance, and with
that I think the longer term goal would be to use this to justify an
architectural feature along similar lines rather than to support any
IMPLEMENTATION DEFINED variants upstream in Linux.

>  Also, C library and test program for this driver is available on: 
>  https://github.com/fujitsu/hardware_barrier

Hmm... I see some code in that repo which looks suspiciously like code
from the Linux kernel tree, but licensed differently, which is
concerning.

Specifically, the asm block in internal.h (which the SPDX headers says
is licensed as LGPL-3.0-only) looks like a copy of code from
arch/arm64/include/asm/sysreg.h (which is licensed as GPL-2.0-only per
its SPDX header).

If that code was copied, I don't believe that relicensing is permitted.
I would advise that someone with legal training considers the provenance
of that code and what is permitted.

Thanks,
Mark.

>  The driver is based on v5.11-rc2 and tested on FX700 environment.
> 
> [RFC]
>  This is the first time we upstream drivers for our chip and I want to
>  confirm driver location and patch submission process.
> 
>  Based on my observation it seems drivers/soc folder is right place to put
>  this driver, so I added Kconfig entry for arm64 platform config, created
>  soc/fujitsu folder and updated MAINTAINER entry accordingly (last patch).
>  Is it right?
> 
>  Also for final submission I think I need to 1) create some public git
>  tree to push driver code (github or something), 2) make pull request to
>  SOC team (soc@kernel.org). Is it a correct procedure?
> 
>  I will appreciate any help/comments.
> 
> sidenote: We plan to post other drivers for A64FX HPC extension
> (prefetch control and cache control) too anytime soon.
> 
> Misono Tomohiro (10):
>   soc: fujitsu: hwb: Add hardware barrier driver init/exit code
>   soc: fujtisu: hwb: Add open operation
>   soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
>   soc: fujitsu: hwb: Add IOC_BW_ASSIGN ioctl
>   soc: fujitsu: hwb: Add IOC_BW_UNASSIGN ioctl
>   soc: fujitsu: hwb: Add IOC_BB_FREE ioctl
>   soc: fujitsu: hwb: Add IOC_GET_PE_INFO ioctl
>   soc: fujitsu: hwb: Add release operation
>   soc: fujitsu: hwb: Add sysfs entry
>   soc: fujitsu: hwb: Add Kconfig/Makefile to build fujitsu_hwb driver
> 
>  MAINTAINERS                            |    7 +
>  arch/arm64/Kconfig.platforms           |    5 +
>  drivers/soc/Kconfig                    |    1 +
>  drivers/soc/Makefile                   |    1 +
>  drivers/soc/fujitsu/Kconfig            |   24 +
>  drivers/soc/fujitsu/Makefile           |    2 +
>  drivers/soc/fujitsu/fujitsu_hwb.c      | 1253 ++++++++++++++++++++++++
>  include/uapi/linux/fujitsu_hpc_ioctl.h |   41 +
>  8 files changed, 1334 insertions(+)
>  create mode 100644 drivers/soc/fujitsu/Kconfig
>  create mode 100644 drivers/soc/fujitsu/Makefile
>  create mode 100644 drivers/soc/fujitsu/fujitsu_hwb.c
>  create mode 100644 include/uapi/linux/fujitsu_hpc_ioctl.h
> 
> -- 
> 2.26.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
