Return-Path: <SRS0=IqTQ=ZX=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8095BC54EE9
	for <soc@archiver.kernel.org>; Tue, 20 Sep 2022 15:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39313C433D7; Tue, 20 Sep 2022 15:41:38 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B691FC433D6;
	Tue, 20 Sep 2022 15:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B691FC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from [192.168.1.138] ([37.4.248.18]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MBV6n-1oR3nW2vp1-00CzKX; Tue, 20 Sep 2022 17:41:17 +0200
Message-ID: <4e378923-6107-2ed3-3bc2-31e861f525f1@i2se.com>
Date: Tue, 20 Sep 2022 17:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ARM: dts: Add Raspberry Pi Compute Module 4 CANOPi Board
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, arnd@arndb.de, f.fainelli@gmail.com,
 nsaenz@kernel.org, olof@lixom.net, robh+dt@kernel.org, soc@kernel.org,
 william.zhang@broadcom.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220916153156.30412-1-ariel.dalessandro@collabora.com>
 <YygeqySPtiAEN8EH@ada.ifak-system.com>
 <354a3ef2-c2df-e8fb-da15-b2271581959b@i2se.com>
 <Yyl6aD7jXigk9UFX@ada.ifak-system.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <Yyl6aD7jXigk9UFX@ada.ifak-system.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yNLjCv5Zwpuih1IkL5D+u++ZhYFuYhIIK0V5Ii8uf6IVfcqE9kG
 rWaXfXksss/z6Dxly+7y9zalRZkkf8APN6aM1DMYhD4Wd2My/CemwkC05dlC6ZW4zQYNZP+
 AiLkrxLIqTG1RRSjctJ1r52LS6P1d1vDTkJgR//U+BcLdvernHdgX4V76PKX2UIPpkU4ob6
 3iYuh84fUFMHqvnHgUgZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tDfEjoZD0VA=:pTNGJRsHA9rgiTmpGHKu9Y
 M13QnC7ySK3USJ1tiWHP3/ntADuumUPXbbFyDvTSlNKMibTAoPCgtuerSwtYKtx5aY1lGWWAB
 Rs3AWCTAbqKhiVl4zH+GUW5qinPpfHO/m9NM5bP+KZDJDMK2ONKJzFSPiyqDrLN+2r3CHd6e3
 XcOOxeWDnlANVr3hRUaDOC/a5posxci6AkgUZYzZhap24P010f3ag4dCPZ+VhoGKWMuzDzG/6
 91Kvy3j+m8o4mrdjSJ6bybZ7q24x3/LSx6TCufJfCqj1ZW7MCa9x5JmDEPIAH8BbZsN8EhlYI
 J+mVGooG/juaVOed/UxxEvZxm1kTRcQJwP/JcSSnjyDFtWzF2/IBIY8RyS1b9pkgQYEsKAbR5
 inIVgdqPtn9P22SdzCbb2aIyOIasA39klwZgaBcH2/6ZbO/zqZOAnUR5QiqnTjrUGwe49fLj1
 DtQz4rqxX7FP8aXAfgmFlsQbD2DzriQjWkx2PrxRv0yAeZagbQjJXj8dkbA67eTUR0uDcypcj
 0vaA5/Cm2Y04dcanqALim2nTDBsZUscpxpv80Tp35Hc+Aurrdi6fX1TazbC37PM75pW6QRxqi
 GIIQDzo3y6hRVhPWnXTDIqtKYAyrhuKnVvMoZuEMejvm2S+nZ6KVwfOG/2lwQQPJAbmpkMdz+
 xS2h6VcSyoXENPYPyqh+KbXpWPtAuK/aIBKUX73KCZdASXVPVQohi0zErZ30HsY5DqW8rQfxJ
 MWvYRi+h/6d7VLNHigzG3491ZUD+Nk3ayU+xAxWwo0/ECvtxZtlE92UH/MjBLBgWu6u3vVcSO
 r/mT/AC

Hi Alexander,

Am 20.09.22 um 10:31 schrieb Alexander Dahl:
> Hello Stefan,
>
> Am Mon, Sep 19, 2022 at 01:18:21PM +0200 schrieb Stefan Wahren:
>> Hi Alexander,
>>
>> [fix address of Krzysztof]
>>
>> Am 19.09.22 um 09:47 schrieb Alexander Dahl:
>>> Hei hei,
>>>
>>> Am Fri, Sep 16, 2022 at 12:31:56PM -0300 schrieb Ariel D'Alessandro:
>>>> The Eclipse KUKSA CANOPi [0] is a baseboard for the Raspberry Compute
>>>> Module 4 (CM4). It contains a VIA VL805 4 Port USB controller and two
>>>> MCP251xFD based CAN-FD interfaces.
>>>>
>>>> [0] https://github.com/boschresearch/kuksa.hardware
>>>>
>>>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>>>> ---
>>>>    arch/arm/boot/dts/Makefile                    |   1 +
>>>>    arch/arm/boot/dts/bcm2711-rpi-cm4-canopi.dts  | 139 ++++++++++++++++++
>>>>    arch/arm64/boot/dts/broadcom/Makefile         |   1 +
>>>>    .../dts/broadcom/bcm2711-rpi-cm4-canopi.dts   |   2 +
>>>>    4 files changed, 143 insertions(+)
>>>>    create mode 100644 arch/arm/boot/dts/bcm2711-rpi-cm4-canopi.dts
>>>>    create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-cm4-canopi.dts
>>>>
>>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>>> index 05d8aef6e5d2..8930ab2c132c 100644
>>>> --- a/arch/arm/boot/dts/Makefile
>>>> +++ b/arch/arm/boot/dts/Makefile
>>>> @@ -98,6 +98,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
>>>>    	bcm2837-rpi-zero-2-w.dtb \
>>>>    	bcm2711-rpi-400.dtb \
>>>>    	bcm2711-rpi-4-b.dtb \
>>>> +	bcm2711-rpi-cm4-canopi.dtb \
>>>>    	bcm2711-rpi-cm4-io.dtb \
>>>>    	bcm2835-rpi-zero.dtb \
>>>>    	bcm2835-rpi-zero-w.dtb
>>>> diff --git a/arch/arm/boot/dts/bcm2711-rpi-cm4-canopi.dts b/arch/arm/boot/dts/bcm2711-rpi-cm4-canopi.dts
>>>> new file mode 100644
>>>> index 000000000000..52ec5908883c
>>>> --- /dev/null
>>>> +++ b/arch/arm/boot/dts/bcm2711-rpi-cm4-canopi.dts
>>>> @@ -0,0 +1,139 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/dts-v1/;
>>>> +#include "bcm2711-rpi-cm4.dtsi"
>>>> +
>>>> +/ {
>>>> +	model = "Raspberry Pi Compute Module 4 CANOPi Board";
>>>> +
>>>> +	clocks {
>>>> +		clk_mcp251xfd_osc: mcp251xfd-osc {
>>>> +			#clock-cells = <0>;
>>>> +			compatible = "fixed-clock";
>>>> +			clock-frequency = <20000000>;
>>>> +		};
>>>> +	};
>>>> +
>>>> +	leds {
>>>> +		led-act {
>>>> +			gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
>>>> +		};
>>>> +
>>>> +		led-pwr {
>>>> +			label = "PWR";
>>>> +			gpios = <&expgpio 2 GPIO_ACTIVE_LOW>;
>>>> +			default-state = "keep";
>>>> +			linux,default-trigger = "default-on";
>>>> +		};
>>>> +	};
>>> This looks like using the node name and the deprecated "label"
>>> property for LED naming.  Please see
>>> Documentation/devicetree/bindings/leds/common.yaml and use the
>>> properties "function" and "color" instead.  Also check the node names
>>> itself, see the example in that binding or the leds-gpio binding for
>>> reference.
>> Oops, i didn't noticed this.
>>
>> Unfortunately the ACT-LED is already a little bit opaque defined in
>> bcm2835-rpi.dtsi:
>>
>> leds {
>>          compatible = "gpio-leds";
>>
>>          led-act {
>>              label = "ACT";
>>              default-state = "keep";
>>              linux,default-trigger = "heartbeat";
>>          };
>> };
>>
>> So a reference (currently missing) would have make it clear that the ACT-LED
>> is common for all Raspberry Pi boards.
> Yes, a reference would probably good, would make it easier to spot
> this is already defined in the dtsi.
I will take care of this.
>
>> So you wish that this is fixed for the CANOPi board or all Raspberry Pi
>> boards?
>>
>> I'm asking because switching to function would change the sysfs path and
>> breaking userspace ABI.
> You're right, and the effective label should stay as is for existing
> boards to not break userspace.
>
> Not sure what the policy is for baseboards with compute modules.  Are
> those LEDs on the compute module?  Or does the CM just expose those
> GPIOs?
These are GPIOs expose by the Compute Module. Since these are 
initialized by the VC4 firmware, it's not the best idea to use them for 
other functions.
>    Is there some policy all baseboards must use them for LEDs?
> An what about additional LEDs on the baseboard?  Is this allowed?
Definitely
> (I don't think there a generic rules for that, but maybe some best
> practices for certain SoMs like the RPi CM?)
I think we should for Ariel's reponse.
> IMHO for new independent boards though, new LEDs should not be
> introduced the old way. I thought this is the case here, but it seems
> I was wrong due to that baseboard vs. SoM thing.

Without your comment i hadn't noticed this :-)

I'm thinking of a dtsi file in order to encapsulate the deprecated LED 
stuff, remove the global ACT-LED from bcm2835-rpi.dtsi and include the 
dtsi from all board files.

Best regards
