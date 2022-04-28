Return-Path: <SRS0=/1sb=VG=ext.kapsi.fi=maukka@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7525CC433EF
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 20:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E059C385AD; Thu, 28 Apr 2022 20:25:15 +0000 (UTC)
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [91.232.154.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE99AC385B2;
	Thu, 28 Apr 2022 20:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AE99AC385B2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ext.kapsi.fi
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ext.kapsi.fi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Cc:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xtJrZMVo5Mq3hApYo1dK34SYaneZ5Xak6ST3DDUrWsk=; b=Cf9KlFIoJxk2im6IWZE7gAy3bN
	wy5LrUD37eYdPGdVPIKuOqAzsnlhh+apqGEmGllR50k+a7KODr8tAawtrg038DxG3qoYDpDti7Fdv
	++p4jODQYrCoJe/Ez5M+ncnDeanu5ejRHnQWSjaS/H8h82gKWbrEBMp7T7auqvnKgpm//X2jvnbRv
	EdTR/0AokSf8efK2q2WYxbT9fVM+gNlOOg/x4aSA3OtElDWpi/TOMhuz5ZG49/kLn0MVLTobB/Aoi
	9ElVcaCVMM77RGsRkHK5cKtAi8v81iYNXbqsF3oTf/4Mk1bwr+03LzjKkafq6nwqrW9oWfxmdMIPv
	CfTwiEng==;
Received: from 378b-225d-1272-9d03-8500-87e2-07d0-2001.dyn.estpak.ee ([2001:7d0:87e2:8500:9d03:1272:225d:378b]:57203)
	by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <maukka@ext.kapsi.fi>)
	id 1nkAhB-0000Mf-Bx; Thu, 28 Apr 2022 23:25:01 +0300
Message-ID: <b9c7eb81-c49e-76bf-5b49-b97cb5c2b03d@ext.kapsi.fi>
Date: Thu, 28 Apr 2022 23:25:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
List-Id: <soc.lore.kernel.org>
Cc: maukka@ext.kapsi.fi, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>
References: <20220427162123.110458-1-maukka@ext.kapsi.fi>
 <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
 <YmndWe63ELJbQe20@lunn.ch>
From: Mauri Sandberg <maukka@ext.kapsi.fi>
In-Reply-To: <YmndWe63ELJbQe20@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:7d0:87e2:8500:9d03:1272:225d:378b
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
Subject: Re: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)

Hello Andrew!

On 28.4.2022 3.18, Andrew Lunn wrote:
>>> - there is no concensus on how to get ascii formatted MAC address from mtd
>>>    partitions so eth is not fully functional without setting the MAC from
>>>    userspace
>>
>> Ideally this is handled by the boot loader, but that requires being
>> able to update
>> it.
> 
> The mv643xx Ethernet driver is happy if it finds the MAC address
> already in the hardware. The vendor uboot often does this. Does tftp
> boot work in uboot? That would indicate it has access to the MAC
> address.

The u-boot is really limited and I am transferring new images over 
kermit. Tftp is not enabled.

