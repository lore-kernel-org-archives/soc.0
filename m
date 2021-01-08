Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48583C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 12:56:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63FAE23975
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 12:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63FAE23975
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n25LcmBG7CXhfueM5VHQv1oaWH9F/vqM1KSlSkuhr/s=; b=JU7lJKVWgrAVSEb9/nO52kRRa
	ouW5VF/K9F5uU6Vsiwzo1KBxfYFl3LGfnKQGWknhF4YQUoIVSmQluKJXA5ppdt+OiODLNc9GcuIGy
	cqPqo+BvezzNaqmoo3O8aheg8nSEZaH35kkiu9Uoms3vh1G82G+EJ+K+0XVc32dqspkB3K9AVb19l
	G5EYsEvUQ36BJUvEvrC1E+C2y+YS7uLkuIF/AW7LNyQd6Gyx74AKDSLh9nHstUohdm91KTUPGvorx
	yfTfELgW0HCjTjS3M1AjXWFS+x7GLygnHhAIh5m7aAAHaFzl7KBbWwEkOh9fUIvLy3SWSU0ozz5Lz
	Hf7EidCGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxrHx-0002wt-Ct; Fri, 08 Jan 2021 12:54:45 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxrHZ-0002vz-Gp
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 12:54:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C5AD6E;
 Fri,  8 Jan 2021 04:54:18 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.36.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1996B3F719;
 Fri,  8 Jan 2021 04:54:16 -0800 (PST)
Date: Fri, 8 Jan 2021 12:54:10 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Subject: Re: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Message-ID: <20210108125410.GA84941@C02TD0UTHF1T.local>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_075421_663063_DC248607 
X-CRM114-Status: GOOD (  35.23  )
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
Cc: arnd@arndb.de, catalin.marinas@arm.com, soc@kernel.org, olof@lixom.net,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108125410.TuhSVkRxenTTYKLzXdzBIn9ubOL_8HqvuTKLQ7YUZco@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
