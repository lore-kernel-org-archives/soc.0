Return-Path: <SRS0=ojEH=PY=gmail.com=groeck7@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0ACC433F5
	for <soc@archiver.kernel.org>; Fri,  5 Nov 2021 18:39:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6203961220; Fri,  5 Nov 2021 18:39:33 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26783611AE;
	Fri,  5 Nov 2021 18:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26783611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id g125so15871736oif.9;
        Fri, 05 Nov 2021 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
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
        b=x3+ZB5XIaWelVwdg1nw16DPBv86+ephywE9AKgmp8VzcT3eh2VB5ZssVDIkhziBUJU
         uZg3pqE9xkAuG6t3icVNdXsFHk8WHsKEu02ezK5g60RwcxisdoBok1i1S3cCz9fvt8wB
         3WKO7X14XwsWsaPkXvmO0LPanAjuwTMe5bmw0vajZf/KqfToSqWu9tqaBrfRvcKfTrtK
         VYPAOlsB23hx+AMF9zFHWIqXUs3vqwi+zwWWlrS2FiIoryBERKaZz2IpijbeCUt2/gSU
         DhRpaJ96/dfLyzr+s7K0gdQWv258EY3PrTFql/hS44h7iNqfCm4wT4JxrOhs44uo78Nf
         ECtQ==
X-Gm-Message-State: AOAM532PVWmyX7txIQIqwgdn+DoCjIw0EVhc3aoqbRCzdRq8lPdfVqBZ
	DWZIi9i2ZLKebMQdsX4aWMRnlh51mfs=
X-Google-Smtp-Source: ABdhPJw5GlTufvi//BkpX8W/5ghRqnc7l9Ojq1MFC/x9hhHIZTw+JZ6pBphqnNQwGASC6sbDXtyGPQ==
X-Received: by 2002:aca:ad49:: with SMTP id w70mr20785602oie.19.1636137572374;
        Fri, 05 Nov 2021 11:39:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u7sm2973063oiu.41.2021.11.05.11.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 11:39:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211024232003.211484-1-linus.walleij@linaro.org>

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
