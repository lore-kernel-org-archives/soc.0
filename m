Return-Path: <SRS0=dNzL=VQ=ext.kapsi.fi=maukka@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14785C433F5
	for <soc@archiver.kernel.org>; Sun,  8 May 2022 14:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6991C385AE; Sun,  8 May 2022 14:07:00 +0000 (UTC)
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [91.232.154.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 035E9C385A4;
	Sun,  8 May 2022 14:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 035E9C385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ext.kapsi.fi
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ext.kapsi.fi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W0tQV1b59psj0uX2rTp463T0cXIooxs7wRIP1e8MNl0=; b=BjHE7HGD7QfM2RdHJwejq1lSqq
	deTPSV5ENgCMzgukEfknXtMiEM922z5SDdkhmYnelzwHM4dzLEn0MAhC3lZ2lsW5zO7zjL4BzQQPU
	V003JuEsgHHUKFuJF80R6QkRjZ2HTWxtF39BnBF0e5Gg7Mt7upGBEthfoTWrz+0fkKj2/BclVqTCi
	UfMUezBOuP4EQwauXG9u7AHdhTkeVHeP6QZwHJGq6LC0b/+dAxdvqJaMx2QX8lFivDdX2dZzDGGDV
	N64H7c9HE1YXJf3ndzvJcnsJpYHCtlw7u/NON7enyDKv7O09FHPI/C5YWYZF8jOd3E47bVnezZhKE
	S+fT1T8Q==;
Received: from 249-238-196-88.dyn.estpak.ee ([88.196.238.249]:61373 helo=[10.0.2.15])
	by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <maukka@ext.kapsi.fi>)
	id 1nnhYQ-0006PG-MF; Sun, 08 May 2022 17:06:35 +0300
Message-ID: <b09847c4-90f8-509d-835b-85613712344d@ext.kapsi.fi>
Date: Sun, 8 May 2022 17:06:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Mauri Sandberg <maukka@ext.kapsi.fi>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: maukka@ext.kapsi.fi, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
References: <20220427162123.110458-1-maukka@ext.kapsi.fi>
 <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
 <1509d16c-d244-19c7-610b-4c8ea8ca1624@ext.kapsi.fi>
 <CAK8P3a3g4CZjiVHHoBqJLrdN0chghaskODVvtWY1Fjj8TcB8KQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAK8P3a3g4CZjiVHHoBqJLrdN0chghaskODVvtWY1Fjj8TcB8KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 88.196.238.249
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
Subject: Re: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)



On 28.4.2022 23.56, Arnd Bergmann wrote:
> On Thu, Apr 28, 2022 at 10:01 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>> On 27.4.2022 21.10, Arnd Bergmann wrote:
>>> On Wed, Apr 27, 2022 at 6:21 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>>>> - sata_mv fails to initialise with -22 (-EINVAL)
>>>
>>> No idea, I'd try inserting a printk in every code path that can return -EINVAL
>>> from there
>>>

With debugging the reason for -EINVAL remains a bit mystery.
  - sata_mv calls ata_host_activate() [1]
  - later on, in request_threaded_irq(), there are sanity checks [2]
  - that fail with irq_settings_can_request() returning 0 [3]

I cannot really put my finger on why the irq cannot be requested in DT
approach.

>> Is there a way to describe the PCIe bus in the
>> device tree? The initalisation of that bus is done for rev A1 only.
> 
> I'm not too familiar with the platform, but my interpretation is that the
> DT support here is incomplete:
> 
> The DT based PCI probe using drivers/pci/controller/pci-mvebu.c
> is not hooked up in orion5x.dtsi, and the traditional pci code does
> not work with DT.

Can the existing pci code still be used to init the PCI bus and describe
the rest in the DT or is it a futile attempt?

> I see that orion5x has two separate blocks --  a PCIe host that is
> similar to the kirkwood one, and a legacy PCI host that needs
> a completely separate driver.
> 
> Which of the two do you actually need here?
> 

I really cannot say which one is it. How can I tell? The functions given
in struct hw_pci find their way to drivers/pci/probe.c eventually and
use pci_scan_root_bus_bridge(). Nothing seems to utilising mvebu or
kirkwood explicitly at least.

Here's the output from lspci if the ids reveal anything.

# lspci -v -k
00:00.0 Class 0580: 11ab:5181
01:00.0 Class 0580: 11ab:5181
00:01.0 Class 0100: 11ab:7042 sata_mv

-- Mauri

[1] 
https://elixir.bootlin.com/linux/v5.17/source/drivers/ata/sata_mv.c#L4434

[2] https://elixir.bootlin.com/linux/v5.17/source/kernel/irq/manage.c#L2146

[3] https://elixir.bootlin.com/linux/v5.17/source/kernel/irq/settings.h#L100
