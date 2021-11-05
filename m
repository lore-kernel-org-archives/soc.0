Return-Path: <SRS0=NKgK=PY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F4AC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Nov 2021 18:40:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3D7861186
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Nov 2021 18:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3D7861186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGmRc7751l6AOO7LlTdCYueAsoVXKmDIHtmfcpcA568=; b=0sbcSlMFXKPL9L
	izP9oCSL+4Jpeoq095yGQWR7+OqLjzla2bGH6xTmkkmXSqzpj/GtbW3AU5LRCuXeOmTQb0S90GUMN
	0wVE92BUpYh+SXcMk7w3RXKnOU1MKVN0eG2y2l1d1kvNMC9OSPquL0u4Nih8qmYxx1ZhOiBXT+GFs
	eUWvpgQ6eS9zvtMhAhrej/FObc94Cy0cdTplg0saCv89ne1wlFLwnMCveVxXfDDZbfqF4ZvsmJvGm
	vl3Ufl1/IQj+LfuvezI26Nl6srXBjtGWoruY2yF9qYATXXRsxa3EpF0tFpIT6ZAnC52U3e6pER8dK
	5fLKKk1TaGijCCFamumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj47k-00C9AN-Rx; Fri, 05 Nov 2021 18:39:37 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj47h-00C99k-4j
 for linux-arm-kernel@lists.infradead.org; Fri, 05 Nov 2021 18:39:35 +0000
Received: by mail-oi1-x229.google.com with SMTP id x70so15907875oix.6
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 05 Nov 2021 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Y+2tTqVNPtgyU8gy8heL1eqRjjKPw+inr348G0Hpczo=;
 b=S0lSAYc/kzkkUP2ul5Ud8tbotSoYq6yL/PAisZptx0RRr//juLH3yuR5LtnpNPGWAw
 /cB8rWbqzSyo1Dt+ZBjF3h+I1gGWVgaCZHrba4TI1f31K8wXmruAXsr5T3xtfuwmlmpq
 zdZdkNDUcOX8Q8I9HwgQ4uvse1XVt4pQkFQGeqDLhCNh5XDujsUS71YOenkI8+kE1rhT
 dHUsYC81ggNrQ0w78M6Eac40/keNMEQ8a7wQZp7B/M5zx39rYYmasXcuPV24XJANQbty
 fZxOxRsgPwZzPiR2e1MDBW/zsqe93w/nIns18biddVpnlAr0gnxzEe7wNVG6ONGhBQnK
 s1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=Y+2tTqVNPtgyU8gy8heL1eqRjjKPw+inr348G0Hpczo=;
 b=mK6YFY//AKTHi4Rs1ZTJRbAe5bvl2yRpbnRJXY0gzTtnzTYJXVWT6R9xrStPxJILmK
 7XH0e4KqpyykU+LEW7AKpXSvB8oBZUoy6NQ4iEvzpbMCeiiL81rIYC9SmYQJnXJuBrG6
 1bd1/hq2R/ba/Fc1Zab2XScD7R6+b+1EL4SYi9T3tPIBaVEbUs6BRp8rQb69uWUp0S6u
 QykpfjoKeqTG9X7uB8WaUIh1r67Wky4OjupiQaynvVNEbtLD2NEIpsJC+PLE2/rQE5ab
 m1Fg9nL+JEvJpNAji97fygNVbY4snlG9HdhJnkMOwXIPLN+39jly0Gg+ChSazardBD8e
 T/hw==
X-Gm-Message-State: AOAM532N7qX7nHjeSz9NdxbJMpoelBVCKw7fWdi7Ytf+tVDU602p4rCo
 aiCDv+z9v64ManToZANTmyM=
X-Google-Smtp-Source: ABdhPJw5GlTufvi//BkpX8W/5ghRqnc7l9Ojq1MFC/x9hhHIZTw+JZ6pBphqnNQwGASC6sbDXtyGPQ==
X-Received: by 2002:aca:ad49:: with SMTP id w70mr20785602oie.19.1636137572374; 
 Fri, 05 Nov 2021 11:39:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u7sm2973063oiu.41.2021.11.05.11.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 11:39:31 -0700 (PDT)
Date: Fri, 5 Nov 2021 11:39:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] ARM: dts: arm: Update register-bit-led nodes 'reg' and
 node names
Message-ID: <20211105183930.GA1448386@roeck-us.net>
References: <20211024232003.211484-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211024232003.211484-1-linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_113933_214379_1B4F42D5 
X-CRM114-Status: GOOD (  15.43  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211105183930.xgdGBdLCv5eeSMdWUxB1T_-UIoGfKRZjA2O04daD1D0@z>

Hi,

On Mon, Oct 25, 2021 at 01:20:03AM +0200, Linus Walleij wrote:
> From: Rob Herring <robh@kernel.org>
> 
> Add a 'reg' entry for register-bit-led nodes on the Arm Ltd platforms.
> The 'reg' entry is the LED control register address. With this, the node
> name can be updated to use a generic node name, 'led', and a
> unit-address.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> SoC folks: please apply this directly for v5.16.

This patch results in widespread sysfs backtraces with various qemu arm
emulations (versatilepb, versatileab, realview-pb-a8, realview-pbx-a9,
realview-eb, realview-eb-mpcore, integratorcp, mps2-an385).

Example log:

sysfs: cannot create duplicate filename '/devices/platform/10000000.core-module/10000008.led'
CPU: 0 PID: 1 Comm: swapper Not tainted 5.15.0+ #1
Hardware name: ARM-Versatile (Device Tree Support)
[<c001d21c>] (unwind_backtrace) from [<c001937c>] (show_stack+0x10/0x14)
[<c001937c>] (show_stack) from [<c01f0778>] (sysfs_warn_dup+0x50/0x64)
[<c01f0778>] (sysfs_warn_dup) from [<c01f08ac>] (sysfs_create_dir_ns+0xdc/0xfc)
[<c01f08ac>] (sysfs_create_dir_ns) from [<c04caa80>] (kobject_add_internal+0xb0/0x2f8)
[<c04caa80>] (kobject_add_internal) from [<c04cad20>] (kobject_add+0x58/0xc8)
[<c04cad20>] (kobject_add) from [<c05bc974>] (device_add+0xf0/0x8ac)
[<c05bc974>] (device_add) from [<c07a3fa0>] (of_platform_device_create_pdata+0xa4/0xfc)
[<c07a3fa0>] (of_platform_device_create_pdata) from [<c07a41a4>] (of_platform_bus_create+0x1a0/0x3d8)
[<c07a41a4>] (of_platform_bus_create) from [<c07a41f0>] (of_platform_bus_create+0x1ec/0x3d8)
[<c07a41f0>] (of_platform_bus_create) from [<c07a4518>] (of_platform_populate+0x68/0xd8)
[<c07a4518>] (of_platform_populate) from [<c0c47ad0>] (customize_machine+0x1c/0x30)
[<c0c47ad0>] (customize_machine) from [<c000a7a0>] (do_one_initcall+0x88/0x2f8)
[<c000a7a0>] (do_one_initcall) from [<c0c451f4>] (kernel_init_freeable+0x194/0x224)
[<c0c451f4>] (kernel_init_freeable) from [<c0910ebc>] (kernel_init+0x10/0x100)
[<c0910ebc>] (kernel_init) from [<c00084f8>] (ret_from_fork+0x14/0x3c)
Exception stack(0xc1495fb0 to 0xc1495ff8)
5fa0:                                     00000000 00000000 00000000 00000000
5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
kobject_add_internal failed for 10000008.led with -EEXIST, don't try to register things with the same name in the same directory.

Bisect log is attached.

Guenter

---
# bad: [b8c4a6bfae4eef0d0f143516b262ccacfdb0365a] dt-bindings: watchdog: convert Broadcom's WDT to the json-schema
# good: [8bb7eca972ad531c9b149c0a51ab43a417385813] Linux 5.15
git bisect start 'HEAD' 'v5.15'
# good: [c0d6586afa3546a3d148cf4b9d9a407b4f79d0bb] Merge tag 'acpi-5.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
git bisect good c0d6586afa3546a3d148cf4b9d9a407b4f79d0bb
# good: [2219b0ceefe835b92a8a74a73fe964aa052742a2] Merge tag 'soc-5.16' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 2219b0ceefe835b92a8a74a73fe964aa052742a2
# bad: [048ff8629e117d8411a787559417c781bcd78d7e] Merge tag 'usb-5.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
git bisect bad 048ff8629e117d8411a787559417c781bcd78d7e
# bad: [f253fb365e1ab89b45db8adef7648c21d7bfd89c] Merge tag 'samsung-dt64-5.16-2' of git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/dt
git bisect bad f253fb365e1ab89b45db8adef7648c21d7bfd89c
# good: [c7613530d1ed3534168c219e6e6069f91e771b00] Merge tag 'qcom-arm64-for-5.16' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
git bisect good c7613530d1ed3534168c219e6e6069f91e771b00
# good: [8bd8822c83785ae669a23080d1638b0a534203b1] Merge tag 'imx-dt-5.16' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/dt
git bisect good 8bd8822c83785ae669a23080d1638b0a534203b1
# good: [804565cd9994d4be167d0c42062618ef2065caa8] Merge tag 'ixp4xx-dts-for-v5.16' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik into arm/dt
git bisect good 804565cd9994d4be167d0c42062618ef2065caa8
# good: [9f2feb32c2b6a39fdf8c872486341ffa84b2eff5] Merge tag 'omap-for-v5.16/gpmc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into arm/dt
git bisect good 9f2feb32c2b6a39fdf8c872486341ffa84b2eff5
# good: [f9241fe8b9652e6751f4ae684efe0148e3c157c7] ARM: dts: aspeed: Add uart routing to device tree
git bisect good f9241fe8b9652e6751f4ae684efe0148e3c157c7
# bad: [2ec492731a1ff651d89c909ccce01fd69346d1f0] Merge tag 'at91-dt-5.16-2' of git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/dt
git bisect bad 2ec492731a1ff651d89c909ccce01fd69346d1f0
# bad: [25b892b583ccf0ce5ac1469d27708f5340147f52] ARM: dts: arm: Update register-bit-led nodes 'reg' and node names
git bisect bad 25b892b583ccf0ce5ac1469d27708f5340147f52
# good: [8f0450c51148d28443a1026c9510a6edf932c6eb] dts: socfpga: Add Mercury+ AA1 devicetree
git bisect good 8f0450c51148d28443a1026c9510a6edf932c6eb
# good: [eb425d57a8b69acadc273e23aaf1bdfded814390] Merge tag 'aspeed-5.16-devicetree-2' of git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/dt
git bisect good eb425d57a8b69acadc273e23aaf1bdfded814390
# first bad commit: [25b892b583ccf0ce5ac1469d27708f5340147f52] ARM: dts: arm: Update register-bit-led nodes 'reg' and node names

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
