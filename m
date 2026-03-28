Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A633793CA
	for <soc@lists.linux.dev>; Sat, 28 Mar 2026 10:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774692439; cv=none; b=aw0jd6J5biqF4hMV0HWm3CpZl1GPcQs8eCQWxL4EIwAGAJEtTh55lHexR6SxpkTEudSt/nFzBMyZJ5C7fF6nYoXkA7zASr7POfwhOWl0HUdTy2fz+Efc/qrurWRMSzZejpL80cu3RWykAM9sBJ4neC1ZhmWp1RB1Gu+OI3xQjDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774692439; c=relaxed/simple;
	bh=go4G4GA7fsDGJZrimUfspW9HZUrYWXyen5WfMAFb3Rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fns7oucLOTaegUUfv2j/dUHBecE3mZ6+a1QUoQ4Avhv/DJdV/8NCDNSouc1l9+9f+lobNJp7nxCuFGuK0AZxqBgDkOXCElsQLXHLMA0Fe+u22IcchwQKIU3/LA3znxDAhYzXPkTNieb1E6eJ11OlwArNF47dXlLJr2MBVD4fKpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=Hw0DqWWh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="Hw0DqWWh"
Received: by smtp.kernel.org (Postfix)
	id 99AE6C2BC87; Sat, 28 Mar 2026 10:07:17 +0000 (UTC)
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF6BFC4CEF7;
	Sat, 28 Mar 2026 10:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF6BFC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=freeshell.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1774692426;
	bh=0cKj4w/RJV1m1gcNIGNio+JSd8YlUtnzI9F2nKGcT7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hw0DqWWhur0gexv3gtWUongGMUClFHEkv2c0X51pRwzqgXk8slMSFDIk/Ne/b78LJ
	 kWoT0chyignLYAJ/DaeP+pj+F97AIiiZMiYKNit8PFB+qrjipuEx//+YGAPGAa1e1N
	 oPzva9MS0FUzQMdhCBMfs2C0DnT2vwMjLRpzarfRxra4rYhJc48ISePjCPum5qf5pP
	 29gM8/YFhZGRwNVuydF5pKoK2D9xYN6BW7jsuCMpCyS8LBsO1AybXw+D5PrN+SCovn
	 VkYuMfxELSEtDiBLqQg6USwk36L/08ehbxbxQXqXC/dt3K7/cwUxRlfexbXZcvdRkt
	 DACxNIKOqvMTA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id D35C4B22177E;
	Sat, 28 Mar 2026 11:07:04 +0100 (CET)
Message-ID: <a77f7c9c-4357-47df-95e1-f6e0f5a7c02f@freeshell.de>
Date: Sat, 28 Mar 2026 03:07:01 -0700
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
To: Ilya Sorochan <k0tran@altlinux.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Conor Dooley <conor@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
 <DHCYMK8FEH10.1Y1YWLL3J1HSK@altlinux.org>
 <ff792101-61e3-4470-9c5c-eea375edc9fa@freeshell.de>
 <DHDFR4K758TP.291K17J2J5VL7@altlinux.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <DHDFR4K758TP.291K17J2J5VL7@altlinux.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ilya,

On 3/27/26 01:52, Ilya Sorochan wrote:
>> On 3/26/26 12:27, Ilya Sorochan wrote:
>>> On Thu, Mar 26, 2026 at 07:36:07AM -0700, E Shattow wrote:
>> ...
> 
> Sorry, I'm not trying to be disrespectful. Yes, it's my first time. Kernel docs
> bewarn of spamming therefore I trimmed CC based on the assumption that those who
> interested in devicetrees are present in devicetree lists. I guess it is not
> true which seems strange to me, but okay.

$ scripts/get_maintainer.pl arch/riscv/boot/dts/starfive/jh7110-common.dtsi
...Conor... (maintainer:STARFIVE DEVICETREES)
...linux-riscv... (open list:STARFIVE DEVICETREES)
...devicetree... (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
BINDINGS)
...linux-kernel... (open list)
RISC-V ARCHITECTURE status: Supported

Not all maintainers are subscribed to all lists or even any lists. Some
just occasionally search lore mailing list archives

https://lore.kernel.org/linux-riscv
https://lore.kernel.org/linux-devicetree
https://lore.kernel.org/lkml/

if there's not CC directly to them.

Additionally to making sure your patch reaches its audience for review,
there are automated testing "Patchwork" which for LKML RISC-V

https://patchwork.kernel.org/project/linux-riscv/list/

breaks if you are not CC at least linux-riscv mail list. Threading
breaks in multi-patch series or series with cover letter if any of the
messages have different recipient ordering. Broken threading and missing
automated testing equals confused reviewers.

Note that special for StarFive SoC is Conor has responsibility for this
whereas the more recent usual delegation of responsibility to SoC or
vendor specific mail lists and git trees. SpacemiT development as a
recent example following the new pattern of delegation has its own
spacemit mailing list and git repo whereas starfive development sits on
linux-devicetree mailing list and co-habitation of Conor's devicetree
git repo because Conor is both a devicetree maintainer and adopted this
responsibility years ago when the StarFive SoC's were new.

Congratulations on your first patch to Linux Kernel :)

> 
> I'm not asking to support this feature properly. It would be nice to have but
> it is hard and StarFive is not making it any easier. However I'm asking to keep
> it working while you can if you can. It worked for me and other people and we
> would appreciate if you can delay breaking it as long as possible.
> 
>>> I traced this property a little in the U-Boot repo:
>>> - 503fc8548197 Hal added it to VisionFive v1.3b (with mmc pins)
>>> - 6bbe95ef7208 Hal moved it (and other common things) into
>>>   jh7110-common-u-boot.dtsi
>>> - 27f617019dd0 E removed it with jh7110-common-u-boot.dtsi
>>> - 762f85bb2e36 Tom squash-updated upstream dts
>>>
>>> New device trees did not contain this property. This is how they were introduced
>>> into the Linux: b127dbf9e1ebbfbcded4 ("riscv: dts: starfive: Add mmc nodes on
>>> VisionFive 2 board")
>>>
>>> I do not know if this miss is intentional or not. However it would be nice to
>>> be able to boot from SD-card again.
>>
>> There is already nothing to prevent you from booting Linux from SD-card,
>> with U-Boot SPL and U-Boot Main located in SPI Flash as is recommended
>> by StarFive officially.
> 
> Yes. However I'm implying the deprecated SDIO3.0 way. I agree that this would be
> nice to have in the commit message - if this what are you talking about.
> 
>> I'm glad you sent a patch, but I still object for the other reasons
>> mentioned.
> 
> I'm glad to talk to competent people in this space, however I still hope that
> the kernel will refrain from breaking this feature until it is really necessary.

I hope you'll continue on to review the BootROM r.e. effort and cite its
code snippets in patches so adding bootph-pre-ram hints covering the
eMMC SPL boot method from StarFive Loader, retrospectively describing
the SD Card SPL boot method from StarFive Loader, and/or secure boot
crypto accelerator functionality in the starfive crypto driver (what
does command=8 and command=9 do exactly?) The exact nature of the bug in
StarFive Loader UART XMODEM incompatibility could use a proper
description, and SPI Flash configuration parameter analysis, too.

-E
