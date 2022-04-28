Return-Path: <SRS0=/1sb=VG=ext.kapsi.fi=maukka@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FA7C433EF
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 20:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78F8FC385AD; Thu, 28 Apr 2022 20:06:44 +0000 (UTC)
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [91.232.154.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57435C385A9;
	Thu, 28 Apr 2022 20:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57435C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ext.kapsi.fi
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ext.kapsi.fi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I5u8zpuc4eHIF32qr8qeXiS0xgWZFyvFwd0Ma3V9R1E=; b=nD1JIdv1lfy53fTI4CTVCG+Mzc
	mNxYRRH+TG08v1rp6BFxU6yq0RXSBm/CJs6asUgxSBBye8nD+mSzmn82Jd3kUlckw2A0HoZ5j2wCZ
	VAKoRibw7ZQd9xIpW9xOlzrpoII8hv3VzqZvxjy8hrWJtUZMRJc/2b0s95PqN/U5EtPB3msWEgJT9
	iqppNDiK7GB1XRJHeBnk3XXeAUHqe3gbdvg/BK2tceLLxPHgK2tZe8Ke+XC8+OkV9wLHgafMWONBy
	FN0MzHHGrI9qwzDC50irWKNKcma6M/GXvrS5VA646Y77YVd/CH6tLPm87up8cx6Wd5Z41YKCdlUca
	mBlliFSQ==;
Received: from 378b-225d-1272-9d03-8500-87e2-07d0-2001.dyn.estpak.ee ([2001:7d0:87e2:8500:9d03:1272:225d:378b]:57018)
	by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <maukka@ext.kapsi.fi>)
	id 1nkAPJ-0008CV-9V; Thu, 28 Apr 2022 23:06:33 +0300
Message-ID: <d8ab7986-c0a8-e11f-3599-a09c2938d936@ext.kapsi.fi>
Date: Thu, 28 Apr 2022 23:06:32 +0300
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
 <20220427162123.110458-2-maukka@ext.kapsi.fi>
 <CAK8P3a2renoWK+rUYBAyUb10v-TKfv6gLTQUiGFRroFgLCv+9w@mail.gmail.com>
From: Mauri Sandberg <maukka@ext.kapsi.fi>
In-Reply-To: <CAK8P3a2renoWK+rUYBAyUb10v-TKfv6gLTQUiGFRroFgLCv+9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:7d0:87e2:8500:9d03:1272:225d:378b
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
Subject: Re: [RFC RFT PATCH v1 1/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)



On 27.4.2022 21.12, Arnd Bergmann wrote:
> On Wed, Apr 27, 2022 at 6:21 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>>
>> Convert D-Link DNS-323 to use the device tree and remove associated
>> mach file.
>>
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
> Having the combined patch is generally fine for review, but for actually
> merging it, I would prefer splitting the new DT from the code removal,
> as I send these through different trees to Linus.

You know, I had them initially in separate patches but then I looked at 
the existing commit history and at least a few ones were in a single 
commit so I merged them. :)

Will split this in two in the next iteration.

