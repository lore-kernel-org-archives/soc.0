Return-Path: <SRS0=/1sb=VG=ext.kapsi.fi=maukka@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15301C433F5
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 20:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3802C385AE; Thu, 28 Apr 2022 20:10:05 +0000 (UTC)
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [91.232.154.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16CBDC385AD;
	Thu, 28 Apr 2022 20:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16CBDC385AD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ext.kapsi.fi
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ext.kapsi.fi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=piDIJ1f0FDvLWgXlaYEIfyTPSV/dXSVUv52WkJhydEo=; b=vASkPiLUGNrFhHCTaoAbWYg7Yd
	Ht1Zx0SJ8HD0brytQcuEoM/yuxQ2K0rpAAHF/rXzvGXeEtw3toDsQNx0vvBDzkafD5FzveyIx+PXx
	GrSENGuo8aYEjkSLtLtExMpEUntOSIfdyr35Wlc9UBO3qpanTJV/XN6XdAedCVu092+oSuvQlh0rj
	xY+9NYxPeHm4jyokO07TmNSIpDYyXqeB7HhW9i9+VWva7S5FYVnrAWG+dVsMMKT3V2dK/He61XvZE
	nFgzkLaDFo8VLFjeUSJ6hy3hBEB2b1FxJu0IU5roiG3ghuk53yu3ZSooohNy7UJdpv1ijTYmvcc+I
	olPXDkWA==;
Received: from 378b-225d-1272-9d03-8500-87e2-07d0-2001.dyn.estpak.ee ([2001:7d0:87e2:8500:9d03:1272:225d:378b]:57022)
	by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <maukka@ext.kapsi.fi>)
	id 1nkASX-0008Fz-OI; Thu, 28 Apr 2022 23:09:54 +0300
Message-ID: <57e1d929-e58f-1819-2253-3d0ad215d46a@ext.kapsi.fi>
Date: Thu, 28 Apr 2022 23:09:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: arnd@arndb.de, olof@lixom.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com, maukka@ext.kapsi.fi
References: <20220427162123.110458-1-maukka@ext.kapsi.fi>
 <20220427162123.110458-2-maukka@ext.kapsi.fi>
 <a1d5cec3-b883-319c-c413-b09cca1fa518@linaro.org>
From: Mauri Sandberg <maukka@ext.kapsi.fi>
In-Reply-To: <a1d5cec3-b883-319c-c413-b09cca1fa518@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:7d0:87e2:8500:9d03:1272:225d:378b
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
Subject: Re: [RFC RFT PATCH v1 1/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)

Hello Krzysztof and thanks for your feedback

On 28.4.2022 10.13, Krzysztof Kozlowski wrote:
> On 27/04/2022 18:21, Mauri Sandberg wrote:
>> Convert D-Link DNS-323 to use the device tree and remove associated
>> mach file.
>>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
>> ---
>>   arch/arm/boot/dts/Makefile                   |   3 +
>>   arch/arm/boot/dts/orion5x-dlink-dns323.dtsi  | 217 ++++++
>>   arch/arm/boot/dts/orion5x-dlink-dns323a1.dts |  59 ++
>>   arch/arm/boot/dts/orion5x-dlink-dns323b1.dts |  38 +
>>   arch/arm/boot/dts/orion5x-dlink-dns323c1.dts |  80 ++
>>   arch/arm/mach-orion5x/Kconfig                |   6 +-
>>   arch/arm/mach-orion5x/Makefile               |   2 +-
>>   arch/arm/mach-orion5x/board-dns323.c         | 118 +++
>>   arch/arm/mach-orion5x/board-dt.c             |   3 +
>>   arch/arm/mach-orion5x/common.h               |   6 +
>>   arch/arm/mach-orion5x/dns323-setup.c         | 724 -------------------
>>   11 files changed, 528 insertions(+), 728 deletions(-)
>>   create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323.dtsi
>>   create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323a1.dts
>>   create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323b1.dts
>>   create mode 100644 arch/arm/boot/dts/orion5x-dlink-dns323c1.dts
>>   create mode 100644 arch/arm/mach-orion5x/board-dns323.c
>>   delete mode 100644 arch/arm/mach-orion5x/dns323-setup.c
> 
> DTS goes separately.
Duly noted. :)

> 
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 7c16f8a2b738..c7c5c0b6c843 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -949,6 +949,9 @@ dtb-$(CONFIG_SOC_DRA7XX) += \
>>   	dra71-evm.dtb \
>>   	dra76-evm.dtb
>>   dtb-$(CONFIG_ARCH_ORION5X) += \
>> +	orion5x-dlink-dns323a1.dtb \
>> +	orion5x-dlink-dns323b1.dtb \
>> +	orion5x-dlink-dns323c1.dtb \
>>   	orion5x-kuroboxpro.dtb \
>>   	orion5x-lacie-d2-network.dtb \
>>   	orion5x-lacie-ethernet-disk-mini-v2.dtb \
>> diff --git a/arch/arm/boot/dts/orion5x-dlink-dns323.dtsi b/arch/arm/boot/dts/orion5x-dlink-dns323.dtsi
>> new file mode 100644
>> index 000000000000..2b033d37cbf8
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/orion5x-dlink-dns323.dtsi
>> @@ -0,0 +1,217 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2022 Mauri Sandberg <maukka@ext.kapsi.fi>
>> + *
>> + */
>> +
>> +/ {
>> +	model = "D-Link DNS-323";
>> +	compatible = "dlink,dns323", "marvell,orion5x";
>>
> 
> You need to also document the compatibles in bindings file for boards.
> It would be nice to convert
> Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.txt to DT
> Schema (see armada-7k-8k.yaml for example), but it is not a requirement.

Ah, I hadn't even noticed them before. Will look into this.

