Return-Path: <SRS0=/S2V=PJ=dabbelt.com=palmer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11642C433EF
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 16:00:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E8BEA6120C; Thu, 21 Oct 2021 16:00:34 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4AD3611CB
	for <soc@kernel.org>; Thu, 21 Oct 2021 16:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4AD3611CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f169.google.com with SMTP id m14so1028250pfc.9
        for <soc@kernel.org>; Thu, 21 Oct 2021 09:00:34 -0700 (PDT)
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
        b=yNZLXTw1hD37o3Wtw5zXObSQqVr//8ix1lA6UCnvLURmnpZijF2jAVNEaWGNdu1+wR
         8XBOyrusGCJiqjcEdu3KGDq39GGDtgF5luhSUQzoooVlsdD9l7DnX+ig2C7cvG0u05+U
         ECImxCaUvO3zWM9c+HMVLSRgnoO/BIjzToztSiIpnK85eQK128gILcHYfOem+ul3YcvH
         szpSF0hPjjqvTSpt8foy0UaTMpVXBKCKuE+d60Eg5DgLl/vgeAHLrJ4nb4WffLpSg0RH
         piFGZHLGCX9ilPoI9OLq6f/3XUNh2OlvuwfP9l5syYExNDsEy16566/9nVjP1phjw6LE
         Dyhw==
X-Gm-Message-State: AOAM530iAfBKvZJ3DI1YZST67pM42xzGxQWzgZ5PyThXsjtOEGDTtW4p
	aLdbO1gRPffz1hO8psDpKlPKGw==
X-Google-Smtp-Source: ABdhPJytyx4F+hrgvUvw2MPlr5EhMd87gJY71gV7pQ+9ZFhz7HeNUW+zuglLq18P4mNhOQq5Fbal1w==
X-Received: by 2002:a63:b21a:: with SMTP id x26mr5122686pge.418.1634832033956;
        Thu, 21 Oct 2021 09:00:33 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:459d:a8c7:78e4:f487])
        by smtp.gmail.com with ESMTPSA id j6sm5624696pgq.0.2021.10.21.09.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 09:00:33 -0700 (PDT)
Date: Thu, 21 Oct 2021 09:00:33 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Oct 2021 09:00:30 PDT (-0700)
Subject:     Re: [PATCH] soc: add polarfire soc system controller
In-Reply-To: <79ae46c3-c028-2c99-2428-b601e4fb03d4@microchip.com>
CC: robh+dt@kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>,
  jassisinghbrar@gmail.com, aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-riscv@lists.infradead.org, j.neuschaefer@gmx.net, Stephen Rothwell <sfr@canb.auug.org.au>,
  Cyril.Jean@microchip.com, Daire.McNamara@microchip.com, Atish Patra <Atish.Patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
List-Id: <soc.lore.kernel.org>
To: Conor.Dooley@microchip.com, Arnd Bergmann <arnd@arndb.de>,
  Olof Johansson <olof@lixom.net>, soc@kernel.org
Message-ID: <mhng-a25d4570-1744-44ef-988b-43914d5bc17d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

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
