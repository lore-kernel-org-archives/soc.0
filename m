Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC0526D4E5
	for <soc@lists.linux.dev>; Sat, 28 Mar 2026 04:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774671795; cv=none; b=j1gbYK1XL9u5vRDXAYQeRWV9pm0P27Jh7gquNdVY4/DDUifED0BPqdj+Ojc643PN3WUGyZC4tUtE6kc5BTgvoXovD5rK+ExDfqgZo5YnP5PKST5rEDVIN2/WVBgHQVMI5RNFwVH7R3diAG+jms7c3YMeKmxfhpVJPVGBnaxjsYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774671795; c=relaxed/simple;
	bh=qLLLhkgdKnGOkCEB4eclxzYOtOT4MNl+L8EdUeBK4NA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAeuEwaYXwjSJRu1TTePWiU+26KubC+lnVLPcTXbGG1ry2Khgihc/NIgfvVQiMCBYqnfrweHdoPpwtO4ddD3N4EMDPINOoOEbYXDEmVTuUcgdTSLzjOWc/23JNlgYmYc1pUYupqR5lKYytPO98Kzt2igQPAOqVPvqC8iikN/4Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=MdXDd4tU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="MdXDd4tU"
Received: by smtp.kernel.org (Postfix)
	id 90309C2BCB1; Sat, 28 Mar 2026 04:23:14 +0000 (UTC)
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7342FC4CEF7;
	Sat, 28 Mar 2026 04:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7342FC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=freeshell.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1774671777;
	bh=M0l99A/V2N8MyiyZ5jgq9vmlvDdHEYTtZ2s5QSsSKlQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MdXDd4tUEVjyBkWp6U3wTHCIU6ms9cOUC7Sr3hG8AC7C0TyL1zo90tscG2WSnLS5k
	 KcmdkxYNOolPoy6xbKYJn8JP0S5NdBFBoIvdWbtWTpQTfq67OVI/GwyhZoRAjIIfNp
	 ga+R5AOdRx5JLhly/Qd2OaBz+xObUaQcTV9pshMzTWnzeXTdYqTiEhrkc97nteWxFy
	 hiAVkiia3lD7vKmVTbptqHXG/F1FJyLhG2+Bo5rAsAo0fjZJVLj3vw7Zt/OCznwI+2
	 cuvV5wLtu5zbmpJedh7T3FzKEB3txFNj7DkGDQwsFeHx7nSauVeVx1PoqAVpQfyGCY
	 ln2Ljb4qypIeQ==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 8783BB220345;
	Sat, 28 Mar 2026 05:22:55 +0100 (CET)
Message-ID: <72aef644-73c9-462b-9034-01e076a46e25@freeshell.de>
Date: Fri, 27 Mar 2026 21:22:52 -0700
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, soc@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hal Feng <hal.feng@starfivetech.com>, Ilya Sorochan <k0tran@altlinux.org>
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
 <d7eb716d-9b9c-4474-a9ca-d44e96c46fc8@kernel.org>
 <20260327-tapestry-frightful-de17113da7d3@spud>
 <c88af06a-596c-4793-a043-dcb018c2c95b@kernel.org>
 <8c411e55-7043-4987-bd6b-cb5b139902c5@kernel.org>
 <20260327-duress-swoop-81695580967f@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260327-duress-swoop-81695580967f@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 3/27/26 05:16, Conor Dooley wrote:
> On Fri, Mar 27, 2026 at 11:50:39AM +0100, Krzysztof Kozlowski wrote:
>> On 27/03/2026 10:49, Krzysztof Kozlowski wrote:
>>> On 27/03/2026 10:45, Conor Dooley wrote:
>>>>
>>>>> The commit touches only DTS, not DTSO, so how can you claim that a DTS
>>>>> file change breaks some completely other board (Raspberry)?
>>>>>
>>>>> This DTS file is nowhere included (and should not be).
>>>>>
>>>>> Of course maybe the true question would be why anyone described a hat as
>>>>> DTS file...
>>>>>
>>>>>>
>>>>>> E. we know that by chance you have found a base board that ignores the 
>>>>>> standard.
>>>>>>
>>>>>> Your patch 4cce8b2503ab5 made my standard compliant baseboard unusable. 
>>>>>
>>>>> DTS of some board is a final product, so it cannot be applied to a
>>>>> baseboard, that's pretty messed DTS tree...
>>>>
>>>> The cm-lite is a rpi compute module compatible device, the base boards
>>>> don't have any devices on them in a lot of cases and just provide
>>>> physical connectors, so there's no point having a distinct dts for every
>>>> baseboard of that type.
>>>> https://www.waveshare.com/product/cm4-io-base-a.htm
>>>>
>>> I saw the picture and it looked like it should never be a DTS, because
>>> it is not usable on its own. You cannot run it.
>>
>>
>> ... although what I found earlier was different. I typed the model name
>> from DTS "Milk-V Mars CM Lite" and it gave me this:
>>
>> https://milkv.io/mars-cm
>> which misses the "Lite" suffix.
> 
> Lite is the same thing without an emmc.
> 

The eMMC part is populated on Mars CM system-on-module and is absent on
Mars CM Lite system-on-module. Either has the same pin connections on
the high-density base board connector available for an optional SD Card
holder (or eMMC module) of any attached base board design; use of SD
Card conflicts with eMMC use when both are present on this connection to
the primary mmc interface.

The secondary mmc interface is (according to the VisionFive 2 1.3b
reference design) expected for connection to SD Card use and here
instead is routed for optioned on-board SDIO WiFi module. Mars CM or
Mars CM Lite are a derivative hybrid design of both Radxa CM3 and
VisionFive 2 1.3b, as evident in the earlier schematic revisions
containing copy+paste of those reference schematic. Radxa CM3 as a
reference design is the origin of Card Detect being routed to that pin
and not any Raspberry Pi CM4 specification.

The "Lite" suffix in the Mars CM model name refers to System-on-Module
onboard presence or absence of the eMMC part at the primary mmc
interface and independent of any optioned on-board SDIO WiFi module at
the secondary mmc interface. There is an additional "WiFi" product
naming suffix for that System-on-Module and the known AP6256 wireless
SDIO module populated that features additional serial data connections
for integrated Bluetooth radio routed to UART lines which are also
exposed as pins on the base board connector.

>>
>> What you pasted is called "Mini Base Board (A) Designed for Raspberry Pi
>> Compute Module 4" and it also does not have "Lite" in the name and
>> picture does not have the SoM.
>>
>> I am confused now and I do not know what the DTS "Milk-V Mars CM Lite"
>> is. Answering to this is crucial, because it determines whether this
>> particular deviec has broken-cd or not.
> 
> It's an Raspberry Pi compatible SoM, what you linked.
> I was linking to the kind of base-board that Heinrich has, to show that
> it pretty much is a connector to the SoM and the physical connectors for
> ethernet etc and nothing else on the board.

The description I authored for initial Mars CM and Mars CM Lite support
in Linux does repeat the marketing claim of compatibility with the
Raspberry Pi Compute Module CM4 IO Board. I missed then this detail
about card detect for the named base board in the same context as
describing to add Mars CM Lite support of SD Card.

My advice, questions, and changes requested to Heinrich's proposed patch:

https://lore.kernel.org/lkml/3225628d-2546-44c1-bc9d-1607aa3d6c90@freeshell.de/

The functionality of the proposed patch:

https://lore.kernel.org/lkml/3166f7d5-b526-411d-b337-27981a7ed14d@canonical.com/

I disapprove the above because it lacks the associated comments that I
asked for as changes requested. There is information loss in this
situation. The hardware is perfectly capable of card detect but we just
delete this in the hardware description without even a comment I have
asked for, that is wrong.

My review feedback remains as I wrote it, we should implement overlay
support and I personally have no clue how to do this but doing so is the
technically correct way to resolve these base board support concerns.

> 
> The dts was done the way it was, IIRC, to permit using overlays on top
> of the $som.dts file to describe the minor differences between the
> pretty trivial I/O boards, such as the one I linked to or the standard
> RPi one: https://www.raspberrypi.com/products/compute-module-4-io-board/
> 
> It's akin to having "jh7110-milkv-marscm-lite-generic-trivial-base-board.dts"
> which I think isn't problematic. There's a jh7110-milkv-marscm.dtsi that
> is what actually describes the bulk of the SoM.
> 

This should have had review questions and changes requested addressed
before applying. I'm not surprised that Heinrich would avoid if at all
possible the work of implementing overlays. At least put the comments in
like I requested though, it is postured like there's some kind of
standards violation which is made up nonsense or at best a bad inference
of my error in the commit for initial support for missing the
discrepancy of marketing materials versus the schematic.

>> Arguments that something else has broken-cd, thus you add such property
>> to "Milk-V Mars CM Lite" are obviously wrong.
> 
> The argument is that "broken-cd" is the standard for RPi compute module
> baseboards, so the rare baseboard that doesn't do that is the one which
> would have to use an overlay to function.
> I think that that is the right approach to take, in a world where having
> a dts for the SoM is permitted.

Logically as Mars CM or Mars CM Lite System-on-Module are not adhering
to the Raspberry Pi CM4 System-on-Module specification, there should be
written an overlay that implement the Raspberry Pi CM4 standard (and so,
"broken-cd") applied for use with base boards.

Overlays are not going to implement themselves. I have no idea how to do
this either, though. There's some UART line assignments for serial
console peripheral of the Home Assistant Yellow base board that I would
like to write an overlay for if that was something I would understand
how to do... it seems to need actual programmer though for the initial
effort.

-E

P.S. Possibly off-topic I was hopeful that for the broader JH-7110
support we would get some bare-minimum JH-7110 generic board dts with
EEPROM and USB Fastboot and USB/UART serial console supported, nothing
else, for use as a fail-safe in U-Boot or as a basis for overlays and
modular support. Presently for U-Boot we just halt and so the advice in
board documentation is to use the vendor BSP in recovery situations. The
utility of overlays with JH-7110 related board support is not restricted
to this system-on-module scenario.
