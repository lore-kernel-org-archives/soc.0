Return-Path: <SRS0=/1sb=VG=ext.kapsi.fi=maukka@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D866BC433F5
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 20:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A82E4C385AE; Thu, 28 Apr 2022 20:01:46 +0000 (UTC)
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [91.232.154.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C002DC385AD;
	Thu, 28 Apr 2022 20:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C002DC385AD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ext.kapsi.fi
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ext.kapsi.fi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gzVV445a097JaqW+vYNWt+9yYStK+kI3wuGghxSXi8U=; b=AugXy+lhcsHQFcJJ7lFbWoBJL9
	f8FbN+R6CjG7y8geQdVHbp1ppZ0i4WhZRukFt/fdx6Bql6uoxims1ifwjru2CW39wOHAfU9hfOa1E
	KQawDCneqkWJh+BzohzoROL2vccEjXysABu2Vq4jipaoxaWhN+9AXFsxr0VcGOE5u7Q02/I8I5eVd
	QVVOOjjmIWr+ajU0oyC/IFZeEq75YyCDFfeXTxACEpQ92IFJ3Z3MTzrj6yP+bkIbA7QPQipEUxECM
	O+g/P4gQBIJwmwnUQQDunEKZMM0GMIp1/J/53WV+fudbMsStgah/kbdmM0tDgLBBch8UqVKdOUNY0
	cdfTwifQ==;
Received: from 378b-225d-1272-9d03-8500-87e2-07d0-2001.dyn.estpak.ee ([2001:7d0:87e2:8500:9d03:1272:225d:378b]:57015)
	by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <maukka@ext.kapsi.fi>)
	id 1nkAKK-00082n-FG; Thu, 28 Apr 2022 23:01:24 +0300
Message-ID: <1509d16c-d244-19c7-610b-4c8ea8ca1624@ext.kapsi.fi>
Date: Thu, 28 Apr 2022 23:01:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, maukka@ext.kapsi.fi
References: <20220427162123.110458-1-maukka@ext.kapsi.fi>
 <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
From: Mauri Sandberg <maukka@ext.kapsi.fi>
In-Reply-To: <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:7d0:87e2:8500:9d03:1272:225d:378b
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
Subject: Re: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)

Hi Arnd and thanks for your quick reply.

On 27.4.2022 21.10, Arnd Bergmann wrote:
> On Wed, Apr 27, 2022 at 6:21 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>>
>> Hello all,
>>
>> I am making an attempt to create a device tree for D-Link DNS-323 devices
>> but I am falling short on a few specific details. I am requesting a
>> general review of the device tree files. I have access to DNS-323 rev A1
>> only and the B1 and C1 need to be tested separately, so I am reaching out
>> to people who might have them.
> 
> Hi Mauri,
> 
> It's really nice to see some progress on this! I don't have the hardware,
> but I'll try to answer some of your questions anyway.
> 
>> The questions that I have at the moment are below.
>>
>> - some of resulting IRQs are different from what was requested in device tree
>> - logs say NR_IRQS is different from mach file one
> 
Ok thanks, I won't worry about it anymore.

> This is all normal: with a board file, all on-board IRQs are statically
> assigned to fixed numbers. With DT based boot, IRQ controllers
> usually define their own IRQ domains, which get a number space assigned
> according to probe order, and above the preallocated IRQ numbers.
> 
>> - sata_mv fails to initialise with -22 (-EINVAL)
> 
> No idea, I'd try inserting a printk in every code path that can return -EINVAL
> from there
> 
I had something like that but I didn't get any wiser immediately. Then I 
suspected it's something to do with initialisation of the PCIe bus and 
that clashing with sata_mv initialisation and thought it's better to 
ask. The PCIe initialisation uses hardwired irq and maybe that was 
getting in the way. Is there a way to describe the PCIe bus in the 
device tree? The initalisation of that bus is done for rev A1 only.

>> - there is no concensus on how to get ascii formatted MAC address from mtd
>>    partitions so eth is not fully functional without setting the MAC from
>>    userspace
> 
> Ideally this is handled by the boot loader, but that requires being
> able to update
> it. If you cannot, this could perhaps be done using something like
> https://github.com/zonque/pxa-impedance-matcher

I had a look at the pxa-impedance-matcher but I am not sure how to use 
it. Should it be flashed on the device and then it would the boot the 
rest of the system? Maybe I'll have to add some dns323 specifics there 
too first. On the dns323 there are these mtd partitions MTD1 and MTD2, 
which I am not really sure what they are for. Maybe those could 
accommodate a 3rd stage loader. But I'll consider it as my last resort 
as they put it in their documentation too. In linux-mtd there's been a 
few attempts to find a solution and I am hoping one will be found 
eventually.

Adding support in the u-boot was stalled back in the days for some 
reason and I am not sure I will be much wiser than the previous people 
that were at it. But I have jtag programmer that should be suitable.

-- Mauri
