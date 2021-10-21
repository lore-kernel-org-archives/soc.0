Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DFEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 16:00:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03C38611CB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 16:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03C38611CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6cCvphkPNFUKWKRRGdwkEIvOhPOLrMLFgpDdxJ+tS5A=; b=M0UPeB2onniCUqWNTBI4pWoSyF
	+0jn12pd32yuEEi2U0h0D8h1fVrTUhwOeifVOFS33um7vnDxtsaQDc20W1NGEFHL3mAeT0UIk56/1
	rK9fuDfmn22j691yBmX8rES9ee+pIxgmHs9RgZvGTku0tRIJew18WqhKdj/kQwj/XNokesIg01Xmv
	p7yBRwcT3GkLLH39TqXLBscaVxPqzIeDNSCgOMyl/3DzmWiaaLnU2C0xVqAgMIuZmd6FaQNZjW4vh
	a6Wj2xU3Unzc4A9PZPO0Ctk19IkSvpxuSEttE9EldoekfV1fqdK2e27IX5O4FY3rTHRjZx/o8KrVS
	BzMYH6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdaUh-008HKS-9s; Thu, 21 Oct 2021 16:00:39 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdaUd-008HJb-Uz
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 16:00:37 +0000
Received: by mail-pf1-x433.google.com with SMTP id q19so1050913pfl.4
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YeTXUC7FXIs4b0FtOSVjfSUiqqnC2var+RaHYD8npIk=;
 b=oL8WFg9f6dcbR0BF8YA9iQSaSwvjwmeFVYq1KbCyOFulTiD7osu4EfPWBt91PD0KyX
 JTzu8EiH661uLT6WMte5/P6x75NYyixjPbmj2v2J/wjh0uFvmYk37jcsLM07eaGE4f5E
 JTwe2gNcdGzYyt4g1vft3y37g9RBAGV3IJkqy5CDoGWY7rBmuKEJZJ63VWKumX7YQwjG
 M7rBvz6KpM+DFCV3+sbzK71xpyzUAovxwtGjreBTRGXRxAEzYN82WvmpPVpq55FueO7R
 GTrKWNnwqBZyhT7/BM/1ue2vFOyC4SRDpNS45sDdCcMRjd06GL6vQARufQHAvpZ0oIs8
 lIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YeTXUC7FXIs4b0FtOSVjfSUiqqnC2var+RaHYD8npIk=;
 b=K9Rmjf898iK+mitx0a6r1dA5Ru/5gKtjzyCbfqKkZNRDdsK5ij38MjyQRoKhVtprMZ
 bjG0ivhs8F5BSRAUgtzxvsFU3jMqJDW/UZWXqOqgdkEp/itR4PjaPera0OHqSAs2QtLx
 3TcLlCKj6BMG9mt1RIvDPxMN/SJNGIRvAb1cm/2qSoXVK+9nR5oj8CvT4UsFl+feeDRI
 6R3VvPKqJKHHa5zJs3Bpvj1KtZ16Wg1f9J1aNaAJlEKKn9CSPdSDiFqmuuCBCCIZCXFR
 PPf3kcB2JqHimNWJH8H9aHianU0VWmzE25UgawgjQNSmVP0FD2mjGZfsNqWuywP0hl3T
 eyqQ==
X-Gm-Message-State: AOAM532Fu/sOUuJOjY8x1pUg3Tn5tMp9ice6bOCrGBcHRAxkSKAun6B0
 TpqoaHBqCpPHkKAmhUV0zGaIbw==
X-Google-Smtp-Source: ABdhPJytyx4F+hrgvUvw2MPlr5EhMd87gJY71gV7pQ+9ZFhz7HeNUW+zuglLq18P4mNhOQq5Fbal1w==
X-Received: by 2002:a63:b21a:: with SMTP id x26mr5122686pge.418.1634832033956; 
 Thu, 21 Oct 2021 09:00:33 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:459d:a8c7:78e4:f487])
 by smtp.gmail.com with ESMTPSA id j6sm5624696pgq.0.2021.10.21.09.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:00:33 -0700 (PDT)
Date: Thu, 21 Oct 2021 09:00:33 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Oct 2021 09:00:30 PDT (-0700)
Subject: Re: [PATCH] soc: add polarfire soc system controller
In-Reply-To: <79ae46c3-c028-2c99-2428-b601e4fb03d4@microchip.com>
CC: robh+dt@kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>,
 jassisinghbrar@gmail.com, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, j.neuschaefer@gmx.net,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Cyril.Jean@microchip.com, Daire.McNamara@microchip.com,
 Atish Patra <Atish.Patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
List-Id: <soc.lore.kernel.org>
To: Conor.Dooley@microchip.com, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Message-ID: <mhng-a25d4570-1744-44ef-988b-43914d5bc17d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_090036_105583_BF6BF5B7 
X-CRM114-Status: GOOD (  36.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20211021160033.QKeU_q7Zr10NLZVn-VIEbp8oCFVdcbT4m46SHNlzCio@z>

On Thu, 21 Oct 2021 06:13:35 PDT (-0700), Conor.Dooley@microchip.com wrote:
> On 05/10/2021 13:47, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> This driver provides an interface for other drivers to access the
>> functions of the system controller on the Microchip PolarFire SoC.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Is there some extra CCs that I am missing on this patch that weren't 
> picked up by getmaintainers,
> and/or am I mistaken in thinking that the soc tree is arm only?

+Arnd, Olof, and the SOC list.  They probably understand this better 
than I do, we're kind of new to having SOCs in RISC-V land.

I guess I was assuming that someone maintained drivers/soc, but from 
poking around it seems like there's no entry for it and instead it's 
just a bunch of entries for the sub-directories.  As a result the 
scripts aren't picking up anyone to send these too, and I'd assuming 
that because they're not in arch/riscv that they're not for the RISC-V 
tree.

That said, it looks like I put the Kendryte stuff in there (so sorry if 
I screwed anything up).  I'm happy to take these via the RISC-V tree as 
well, I'm assuming that means there should be a MAINTAINERS entry for 
this new sub-directory so changes to it are less likely to get lost.  
Sorry if I was confusing before, I guess I forgot about how this fits 
together.

Arnd: aside from the lack of a maintainer, these generally look fine to 
me.  LMK if you were expecting this kind of stuff to go through the 
RISC-V tree.

Conor: if you're not comfortable maintaining this then I'm OK signing up 
for it.  I certainly don't want to maintain all RISC-V SOC drivers, but 
I'm vaguely responsible for this one so I'm not opposed to it.  
Obviously preferable on my end to have less of that, though, as it can 
get out of hand pretty quickly.

>> ---
>>   drivers/soc/Kconfig                         |   1 +
>>   drivers/soc/Makefile                        |   1 +
>>   drivers/soc/microchip/Kconfig               |  10 ++
>>   drivers/soc/microchip/Makefile              |   1 +
>>   drivers/soc/microchip/mpfs-sys-controller.c | 119 ++++++++++++++++++++
>>   5 files changed, 132 insertions(+)
>>   create mode 100644 drivers/soc/microchip/Kconfig
>>   create mode 100644 drivers/soc/microchip/Makefile
>>   create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c
>>
>> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
>> index e8a30c4c5aec..b33142e020e0 100644
>> --- a/drivers/soc/Kconfig
>> +++ b/drivers/soc/Kconfig
>> @@ -12,6 +12,7 @@ source "drivers/soc/imx/Kconfig"
>>   source "drivers/soc/ixp4xx/Kconfig"
>>   source "drivers/soc/litex/Kconfig"
>>   source "drivers/soc/mediatek/Kconfig"
>> +source "drivers/soc/microchip/Kconfig"
>>   source "drivers/soc/qcom/Kconfig"
>>   source "drivers/soc/renesas/Kconfig"
>>   source "drivers/soc/rockchip/Kconfig"
>> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
>> index a05e9fbcd3e0..e3be151e391e 100644
>> --- a/drivers/soc/Makefile
>> +++ b/drivers/soc/Makefile
>> @@ -17,6 +17,7 @@ obj-y				+= ixp4xx/
>>   obj-$(CONFIG_SOC_XWAY)		+= lantiq/
>>   obj-$(CONFIG_LITEX_SOC_CONTROLLER) += litex/
>>   obj-y				+= mediatek/
>> +obj-y				+= microchip/
>>   obj-y				+= amlogic/
>>   obj-y				+= qcom/
>>   obj-y				+= renesas/
>> diff --git a/drivers/soc/microchip/Kconfig b/drivers/soc/microchip/Kconfig
>> new file mode 100644
>> index 000000000000..eb656b33156b
>> --- /dev/null
>> +++ b/drivers/soc/microchip/Kconfig
>> @@ -0,0 +1,10 @@
>> +config POLARFIRE_SOC_SYS_CTRL
>> +	tristate "POLARFIRE_SOC_SYS_CTRL"
>> +	depends on POLARFIRE_SOC_MAILBOX
>> +	help
>> +	  This driver adds support for the PolarFire SoC (MPFS) system controller.
>> +
>> +	  To compile this driver as a module, choose M here. the
>> +	  module will be called mpfs_system_controller.
>> +
>> +	  If unsure, say N.
>> diff --git a/drivers/soc/microchip/Makefile b/drivers/soc/microchip/Makefile
>> new file mode 100644
>> index 000000000000..14489919fe4b
>> --- /dev/null
>> +++ b/drivers/soc/microchip/Makefile
>> @@ -0,0 +1 @@
>> +obj-$(CONFIG_POLARFIRE_SOC_SYS_CTRL)	+= mpfs-sys-controller.o
>> diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
>> new file mode 100644
>> index 000000000000..3cfee997fa59
>> --- /dev/null
>> +++ b/drivers/soc/microchip/mpfs-sys-controller.c
>> @@ -0,0 +1,119 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Microchip PolarFire SoC (MPFS) system controller driver
>> + *
>> + * Copyright (c) 2020 Microchip Corporation. All rights reserved.
>> + *
>> + * Author: Conor Dooley <conor.dooley@microchip.com>
>> + *
>> + */
>> +
>> +#include <linux/slab.h>
>> +#include <linux/module.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/platform_device.h>
>> +#include <soc/microchip/mpfs.h>
>> +
>> +static DEFINE_MUTEX(transaction_lock);
>> +
>> +struct mpfs_sys_controller {
>> +	struct mbox_client client;
>> +	struct mbox_chan *chan;
>> +	struct completion c;
>> +	u32 enabled;
>> +};
>> +
>> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg)
>> +{
>> +	int ret;
>> +
>> +	mutex_lock_interruptible(&transaction_lock);
>> +
>> +	reinit_completion(&mpfs_client->c);
>> +
>> +	ret = mbox_send_message(mpfs_client->chan, msg);
>> +	if (ret >= 0) {
>> +		if (wait_for_completion_timeout(&mpfs_client->c, HZ)) {
>> +			ret = 0;
>> +		} else {
>> +			ret = -ETIMEDOUT;
>> +			dev_warn(mpfs_client->client.dev, "MPFS sys controller transaction timeout\n");
>> +		}
>> +	} else {
>> +		dev_err(mpfs_client->client.dev,
>> +			"mpfs sys controller transaction returned %d\n", ret);
>> +	}
>> +
>> +	mutex_unlock(&transaction_lock);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(mpfs_blocking_transaction);
>> +
>> +static void rx_callback(struct mbox_client *client, void *msg)
>> +{
>> +	struct mpfs_sys_controller *mpfs_client =
>> +		container_of(client, struct mpfs_sys_controller, client);
>> +
>> +	complete(&mpfs_client->c);
>> +}
>> +
>> +static int mpfs_sys_controller_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct mpfs_sys_controller *mpfs_client;
>> +
>> +	mpfs_client = devm_kzalloc(dev, sizeof(*mpfs_client), GFP_KERNEL);
>> +	if (!mpfs_client)
>> +		return -ENOMEM;
>> +
>> +	mpfs_client->client.dev = dev;
>> +	mpfs_client->client.rx_callback = rx_callback;
>> +	mpfs_client->client.tx_block = 1U;
>> +
>> +	mpfs_client->chan = mbox_request_channel(&mpfs_client->client, 0);
>> +	if (IS_ERR(mpfs_client->chan))
>> +		return dev_err_probe(dev, PTR_ERR(mpfs_client->chan),
>> +				     "Failed to get mbox channel\n");
>> +
>> +	init_completion(&mpfs_client->c);
>> +
>> +	platform_set_drvdata(pdev, mpfs_client);
>> +
>> +	dev_info(&pdev->dev, "Registered MPFS system controller driver\n");
>> +
>> +	return 0;
>> +}
>> +
>> +struct mpfs_sys_controller *
>> +mpfs_sys_controller_get(struct device_node *mss_node)
>> +{
>> +	struct platform_device *pdev = of_find_device_by_node(mss_node);
>> +
>> +	if (!pdev)
>> +		return NULL;
>> +
>> +	return platform_get_drvdata(pdev);
>> +}
>> +EXPORT_SYMBOL(mpfs_sys_controller_get);
>> +
>> +static const struct of_device_id mpfs_sys_controller_of_match[] = {
>> +	{.compatible = "microchip,polarfire-soc-sys-controller", },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, mpfs_sys_controller_of_match);
>> +
>> +static struct platform_driver mpfs_sys_controller_driver = {
>> +	.driver = {
>> +		.name = "mpfs-sys-controller",
>> +		.of_match_table = mpfs_sys_controller_of_match,
>> +	},
>> +	.probe = mpfs_sys_controller_probe,
>> +};
>> +module_platform_driver(mpfs_sys_controller_driver);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
>> +MODULE_DESCRIPTION("MPFS system controller driver");
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
