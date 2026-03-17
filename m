Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75E435EDBA
	for <soc@lists.linux.dev>; Tue, 17 Mar 2026 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739173; cv=none; b=CpVm7+CKA9STaQlyCcu4/c+rGtmLInyNbtWYmcLHalTemSxqekeU0w/jslYwmBBC73sDr1ktXYDP1em+72Nobjmuc56kIU0HrEDDQb3ikokVjvQsHZDYyQxFOAzewRrUzHK2Yw2ERrCXTJV2pQS3Q92DSOTsR0BigMaB/bPoPCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739173; c=relaxed/simple;
	bh=be6va4WwPnBFOMfW6Lq/Dypb11IupWJmaZIo3CJTq3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UgxWX0otUtvU6nKgu/5Bp9sCbVQItWPgHjTRJ1qobau3TNS52x89/jH2X3MKgU5kYveZ9OC2cnvb/2aqhIeauajJzFNFj9uMe2zQl5zCmfoCLFNStSow6C6EiCkXcoDmqeYzIfr+DN9+bBn7dov0olIc1TmbqdgBu3zvejrNuug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKRDp3Ci; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKRDp3Ci"
Received: by smtp.kernel.org (Postfix)
	id B0F19C2BCAF; Tue, 17 Mar 2026 09:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9C8C4CEF7;
	Tue, 17 Mar 2026 09:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739172;
	bh=be6va4WwPnBFOMfW6Lq/Dypb11IupWJmaZIo3CJTq3I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fKRDp3CiCzpbQ2NbDVx5XifGID6bUaoSSRNjp1UPT46LKIGfGMvW1SbwOzAhfMVA4
	 MkBDwCQ3wkeGnMzFu4OrPumJJOD9wGFtTWwPrgjcCqBGdmmRJP6TkIf1LbbaJiIfxm
	 OSu7eMEHza0kNOZBFS5YuSz8ZSr7cnKdCilryx5nwv4ljCPUtLIusZZGr7FM32NFLf
	 OacMYpwCUDxlybUuYVrqdbDNqWSEzQSodjKne+cs/lXji2Y8JyQ6qFrgHm5JuLfFpd
	 MD02OKfLwHJEsgwfMkhyd/tYvYqNJhgQw67hO4pjyjpqaV5YvRt/kWv/Nd4QAmio01
	 1Z6ecKGi9B4aA==
Message-ID: <aa9d42ad-c480-4fc8-b8be-1a0c505b4293@kernel.org>
Date: Tue, 17 Mar 2026 10:19:29 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Rockchip dts fixes for 7.0 #1
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <5055064.GXAFRqVoOG@phil>
 <20260317-clever-flat-wolverine-313a4c@quoll> <10817796.nUPlyArG6x@phil>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <10817796.nUPlyArG6x@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2026 10:05, Heiko Stuebner wrote:
> Am Dienstag, 17. März 2026, 09:45:30 Mitteleuropäische Normalzeit schrieb Krzysztof Kozlowski:
>> On Sat, Mar 14, 2026 at 07:42:38PM +0100, Heiko Stuebner wrote:
>>> Hi SoC maintainers,
>>>
>>> please find a below some Rockchip fixes for the current 7.0 release-cycle.
>>> And in the next PR, even one driver-fix this time.
>>>
>>> Please pull
>>>
>>> Thanks
>>> Heiko
>>>
>>>
>>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>>
>>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.0-rockchip-dtsfixes1
>>>
>>> for you to fetch changes up to 2ed11ad1c2b4c191cb2ed6741be127eb99f8634f:
>>>
>>>   arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace (2026-03-12 20:52:53 +0100)
>>>
>>> ----------------------------------------------------------------
>>> A big number of changes fixing dt-schema issues on the ARM32 side,
>>> fixes for the Gameforce-Ace to make the hardware work properly
>>> (including thermals) as well as fixing issues both on Beelink A1 (spdif)
>>> and Pinebook Pro (Wifi) by reverting the commits that created the issues
>>>
>>> ----------------------------------------------------------------
>>> Chris Morgan (2):
>>>       arm64: dts: rockchip: Correct Fan Supply for Gameforce Ace
>>>       arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace
>>>
>>> Fabio Estevam (11):
>>>       ARM: dts: rockchip: Remove rockchip,grf from rk3288 tsadc
>>>       ARM: dts: rockchip: Move PHY reset to ethernet-phy node on rk3036 boards
>>>       ARM: dts: rockchip: Fix RTC compatible on rk3288-phycore-rdk
>>>       ARM: dts: rockchip: Use mount-matrix on rk3188-bqedison2qc
>>>       ARM: dts: rockchip: Remove invalid regulator-property from rk3288-veyron
>>
>> Not a fix.
>>
>>>       ARM: dts: rockchip: Fix the Bluetooth node name on rk3288-veyron
>>
>> Not a fix. This is a pure style change. Fixes for current cycle means
>> either important issues being fixed or errors introduced in current
>> cycle.
>>
>> Changing style from one to another is not a fix.
>>
>>>       ARM: dts: rockchip: Fix the trackpad supply on rk3288-veyron-jerry
>>>       ARM: dts: rockchip: Add missing the touchscreen interrupt on rk3288-phycore-rdk
>>>       ARM: dts: rockchip: Fix RTC description on rk3288-firefly-reload
>>
>> Not a fix. Style of node name is not a bug, otherwise describe user
>> visible (not "internal tools" visible) impact.
>>
>>>       ARM: dts: rockchip: Fix GMAC description n RK3288 boards
>>>       ARM: dts: rockchip: Fix LED node names on rk3288-phycore-rdk
>>
>> Several other are questionable as well, since they were in DTS for long
>> time. Please also read Linus' explanation here from some time ago - if
>> the issue is for long time and no one cared, then changing it is a normal
>> development.
>>
>> Several changed pieces here look like 3 or more years old, so does not
>> fit criteria of current cycle fix at all.
>>
>> Please split the pull.
> 
> I do remember in the past, changes that reduced the number of
> dt-checker errors were considered fixes, but it seems that has
> changed, so I'll split that accordingly.

It is subjective and of course dtbs_check fix for issue introduced in
current cycle is a RC-fix. I am pretty sure that many maintainers would
pull all above to RC, but I follow a bit stricter interpretation just
like Linus explained it:

https://lore.kernel.org/lkml/CA+55aFyvW38WU93CqegHiKt-ReO8yNfAOUGZRFGY3-Aq0UsETw@mail.gmail.com/

https://lore.kernel.org/all/CAHk-%3DwgFuoHpMk_Z_R3qMXVDgq0N1592%2BbABkyGjwwSL4zBtHA@mail.gmail.com/

So the issues were there probably for many years and fixes do not have
user-visible impact, thus they look like regular improvement of poor
code. Just like I evaluated dtbs_check findings in 2024 - 50% of
warnings are style.

Best regards,
Krzysztof
