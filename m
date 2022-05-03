Return-Path: <SRS0=9B/D=VL=ext.kapsi.fi=maukka@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5851C433EF
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 08:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C151C385A4; Tue,  3 May 2022 08:21:19 +0000 (UTC)
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [91.232.154.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFCAAC385A9;
	Tue,  3 May 2022 08:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CFCAAC385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ext.kapsi.fi
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ext.kapsi.fi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OqscgcMP9UVcA9P6b/llsibkIGdaT45kJnJUIEEFa+E=; b=SO7arh+QQbvl3u+idWbbxla84E
	rBBkmJycDY87e63wuNoKkFLGdgjbn65KS2zuY2rKl0ajbzM91l0u0sZCbae6fE107iExFfFcNK4Ps
	AlLbFXtWl0qKF2/Ttd+qzeOwbwrmzO1VXFNgWrnQcGHLCah/gYn4iF1bZYRUBE72owho6gBXtsV0X
	iIUiKS/juFoI2HMvtLIT4Y46RYqpOZRAD4+6Y+5m7cVxpiYKPJ4hpwp29wd3+PeK2eXaLX28HChA6
	JF+D7zXuIlPm3nP5PK94IRdFG9iZXCZ+x9zAcy440w2th6nYWHiZ70Jkp7jY0FPb8YvSL9hmi1+45
	Fy6n5+FA==;
Received: from 13-105-191-90.dyn.estpak.ee ([90.191.105.13]:58685 helo=[10.0.2.15])
	by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <maukka@ext.kapsi.fi>)
	id 1nlnm8-000596-6d; Tue, 03 May 2022 11:20:52 +0300
Message-ID: <c6d61bfd-24c0-030b-eb50-5e97214f3f13@ext.kapsi.fi>
Date: Tue, 3 May 2022 11:20:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
References: <20220427162123.110458-1-maukka@ext.kapsi.fi>
 <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
 <YmndWe63ELJbQe20@lunn.ch>
 <b9c7eb81-c49e-76bf-5b49-b97cb5c2b03d@ext.kapsi.fi>
 <YmsisTq28nsSlf3k@lunn.ch>
From: Mauri Sandberg <maukka@ext.kapsi.fi>
In-Reply-To: <YmsisTq28nsSlf3k@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 90.191.105.13
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
Subject: Re: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)


On 29.04.22 02:26, Andrew Lunn wrote:
> On Thu, Apr 28, 2022 at 11:25:00PM +0300, Mauri Sandberg wrote:
>> Hello Andrew!
>>
>> On 28.4.2022 3.18, Andrew Lunn wrote:
>>>>> - there is no concensus on how to get ascii formatted MAC address from mtd
>>>>>     partitions so eth is not fully functional without setting the MAC from
>>>>>     userspace
>>>> Ideally this is handled by the boot loader, but that requires being
>>>> able to update
>>>> it.
>>> The mv643xx Ethernet driver is happy if it finds the MAC address
>>> already in the hardware. The vendor uboot often does this. Does tftp
>>> boot work in uboot? That would indicate it has access to the MAC
>>> address.
>> The u-boot is really limited and I am transferring new images over kermit.
> Ouch!
>
> If you can, try kexec. You can use wget or similar to grab the kernel
> from you host machine, and then something like:
>
> kexec --append 'rootwait ro earlyprintk console=ttyS0,115200n8' bzImage
>
> wget will be much faster then kernel.
>
Nice, this looks promising. Thanks for the tip.


