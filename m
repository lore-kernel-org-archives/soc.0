Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2647C46467
	for <soc@archiver.kernel.org>; Wed,  4 Jan 2023 10:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0B6CC433F1; Wed,  4 Jan 2023 10:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCA3C433D2;
	Wed,  4 Jan 2023 10:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672827535;
	bh=T7RuvxLnIRG+f/lbtUQ7s/m4Z+FmbsOtM4nx99txaPg=;
	h=Date:From:To:List-Id:CC:Subject:In-Reply-To:References:From;
	b=aH2Qs0dqvBlMBMXoZCBzba6k8douc1XjAEqa4ZKrgzRjoZcFzjJhCA4RnpR17NghF
	 Jv+lfOE2R9ggVhU/0aspr66RYQuoLUYcZH3Iz1u3Z8W/1rRo3WuCclIK+Ho4jl8V0T
	 591zWzQ7fSNTXqRGoHtmVH66gXIuLUwtHVFyLixJ6MiALUBcj8dOjETKeV9UUzH1yZ
	 Ko/tPOoVcWqiuLJnEKEGQWbfbjNZSYboHGxYVxk/djpDSAlZacGhhCv8MVM6Uoe7nA
	 VRcntL7EuqhC6Q3hBxxP7ySmnD3rWc4vdnTf2rAEZgkzhfnG7epT9qcYvGjug8NPM4
	 5822s9m8vNbvQ==
Date: Wed, 04 Jan 2023 10:18:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>, arnd@arndb.de, palmer@dabbelt.com,
 prabhakar.csengg@gmail.com
List-Id: <soc.lore.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com,
 aou@eecs.berkeley.edu, apatel@ventanamicro.com, atishp@rivosinc.com,
 biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, geert@linux-m68k.org,
 guoren@kernel.org, hch@infradead.org, heiko@sntech.de, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 magnus.damm@gmail.com, nathan@kernel.org, paul.walmsley@sifive.com,
 philipp.tomsich@vrull.eu, prabhakar.mahadev-lad.rj@bp.renesas.com,
 robh+dt@kernel.org, samuel@sholland.org, soc@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_v5=2E1_6/9=5D_cache=2Csoc=3A_Move_SiFi?= =?US-ASCII?Q?ve_CCache_driver_=26_create_drivers/cache?=
User-Agent: K-9 Mail for Android
In-Reply-To: <49bd7b4a-b0e1-3213-8aed-9f39604f3935@codethink.co.uk>
References: <Y62nOqzyuUKqYDpq@spud> <20230103210400.3500626-7-conor@kernel.org> <49bd7b4a-b0e1-3213-8aed-9f39604f3935@codethink.co.uk>
Message-ID: <AA57B670-C952-47FE-9355-B4B1E4305CF6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 4 January 2023 09:50:58 GMT, Ben Dooks <ben=2Edooks@codethink=2Eco=2Euk=
> wrote:
>On 03/01/2023 21:03, Conor Dooley wrote:
>> From: Conor Dooley <conor=2Edooley@microchip=2Ecom>
>>=20
>> The Zicbo* set of extensions for cache maintenance arrived too late &
>> several SoCs exist without them that require non-coherent DMA=2E
>> As things stand, the StarFive JH7100, Microchip PolarFire SoC & Renesas
>> RZ/Five all require cache maintenance and lack instructions for this
>> purpose=2E
>> Create a subsystem for cache drivers so that vendor specific behaviour
>> can be isolated from arch code, but keep the interfaces etc consistent=
=2E
>> Move the existing SiFive CCache driver to create drivers/cache=2E
>>=20
>> Signed-off-by: Conor Dooley <conor=2Edooley@microchip=2Ecom>
>> ---
>>   MAINTAINERS                                   | 15 ++++++++-------
>>   drivers/Kconfig                               |  2 ++
>>   drivers/Makefile                              |  2 ++
>>   drivers/{soc/sifive =3D> cache}/Kconfig         |  8 +++++++-
>>   drivers/{soc/sifive =3D> cache}/Makefile        |  0
>>   drivers/{soc/sifive =3D> cache}/sifive_ccache=2Ec |  2 +-
>>   drivers/edac/sifive_edac=2Ec                    |  2 +-
>>   drivers/soc/Kconfig                           |  1 -
>>   drivers/soc/Makefile                          |  1 -
>>   include/{soc/sifive =3D> cache}/sifive_ccache=2Eh |  0
>>   10 files changed, 21 insertions(+), 12 deletions(-)
>>   rename drivers/{soc/sifive =3D> cache}/Kconfig (56%)
>>   rename drivers/{soc/sifive =3D> cache}/Makefile (100%)
>>   rename drivers/{soc/sifive =3D> cache}/sifive_ccache=2Ec (99%)
>>   rename include/{soc/sifive =3D> cache}/sifive_ccache=2Eh (100%)
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f61eb221415b=2E=2E4437e96a657b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19054,13 +19054,6 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma=2Eyam=
l
>>   F:	drivers/dma/sf-pdma/
>>   -SIFIVE SOC DRIVERS
>> -M:	Conor Dooley <conor@kernel=2Eorg>
>> -L:	linux-riscv@lists=2Einfradead=2Eorg
>> -S:	Maintained
>> -T:	git https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/conor/linux=
=2Egit/
>> -F:	drivers/soc/sifive/
>> -
>>   SILEAD TOUCHSCREEN DRIVER
>>   M:	Hans de Goede <hdegoede@redhat=2Ecom>
>>   L:	linux-input@vger=2Ekernel=2Eorg
>> @@ -19873,6 +19866,14 @@ S:	Supported
>>   T:	git git://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/gregkh/stagi=
ng=2Egit
>>   F:	drivers/staging/
>>   +STANDALONE CACHE CONTROLLER DRIVERS
>> +M:	Conor Dooley <conor@kernel=2Eorg>
>> +L:	linux-riscv@lists=2Einfradead=2Eorg
>> +S:	Maintained
>> +T:	git https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/conor/linux=
=2Egit/
>> +F:	drivers/cache
>> +F:	include/cache
>I thought the riscv list was subscribers only?

Shouldn't be=2E At least, I'm not one on this account and I don't get comp=
laints!

>Maybe if we do the suggestion of other cache drivers here we should
>either use the main kernel one or find some arch non-specific list=2E

Yah, good point=2E I just moved the existing one, otherwise my script woul=
d yell at me about the maintainers pattern ;)

>
>> +
>>   STARFIRE/DURALAN NETWORK DRIVER
>>   M:	Ion Badulescu <ionut@badula=2Eorg>
>>   S:	Odd Fixes
>> diff --git a/drivers/Kconfig b/drivers/Kconfig
>> index 968bd0a6fd78=2E=2Ee592ba5276ae 100644
>> --- a/drivers/Kconfig
>> +++ b/drivers/Kconfig
>> @@ -241,4 +241,6 @@ source "drivers/peci/Kconfig"
>>     source "drivers/hte/Kconfig"
>>   +source "drivers/cache/Kconfig"
>> +
>>   endmenu
>> diff --git a/drivers/Makefile b/drivers/Makefile
>> index bdf1c66141c9=2E=2E6ff60cf21823 100644
>> --- a/drivers/Makefile
>> +++ b/drivers/Makefile
>> @@ -38,6 +38,8 @@ obj-y				+=3D clk/
>>   # really early=2E
>>   obj-$(CONFIG_DMADEVICES)	+=3D dma/
>>   +obj-y				+=3D cache/
>> +
>>   # SOC specific infrastructure drivers=2E
>>   obj-y				+=3D soc/
>>   diff --git a/drivers/soc/sifive/Kconfig b/drivers/cache/Kconfig
>> similarity index 56%
>> rename from drivers/soc/sifive/Kconfig
>> rename to drivers/cache/Kconfig
>> index ed4c571f8771=2E=2Ebc852f005c10 100644
>> --- a/drivers/soc/sifive/Kconfig
>> +++ b/drivers/cache/Kconfig
>> @@ -1,9 +1,15 @@
>>   # SPDX-License-Identifier: GPL-2=2E0
>>   -if SOC_SIFIVE
>> +menuconfig CACHE_CONTROLLER
>> +	bool "Cache controller driver support"
>> +	default y if RISCV
>> +
>> +if CACHE_CONTROLLER
>>     config SIFIVE_CCACHE
>>   	bool "Sifive Composable Cache controller"
>> +	depends on RISCV
>> +	default y
>>   	help
>>   	  Support for the composable cache controller on SiFive platforms=2E
>>  =20
>
>Maybe we should find and move the ARM PL cache controllers and
>have them here too?

What to do there is up to Arnd et al :)
The maintainers entry would certainly have to look significantly different=
 then=2E

