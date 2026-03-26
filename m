Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4452D5935
	for <soc@lists.linux.dev>; Thu, 26 Mar 2026 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539882; cv=none; b=Gn3u4Ahxp/fHlg+3o2dOUBUgdP6Oiuv0Z1d8B2stZoXcAWcayTnIFPOHkP9A2/aMbGd0aXM9IOpIfPCH9G0LvDfbgv+wJWGcY0w4YBLRZNctjx+Y1EUQjzUSnWRDRJGkxNARqzl/69vduwbXEu7Ss6sK9E2vLJUgAxqyM4FcFCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539882; c=relaxed/simple;
	bh=Mtx8jjA7KzZj7L3Cx5cvFEQGGpei7IBUS8eQj6JYAhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9Gi+YX8zyQbhqoPKwC17mVZHeeNAe9lMQLa6Ll7FHeMTJpsIM1++5BNsAiOQIrNoQ/Lr1cHKkaH78GlrRkMlTo/s/ftkfSbW0Ph+eY5aw5HxJNUil1GOoEJgQNEBFQRxQMi3I3LEqMRH9TZ2wK1sH+0cTDS2I4/MkFJRIYnajA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Hxk0zIh0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Hxk0zIh0"
Received: by smtp.kernel.org (Postfix)
	id 586A8C116C6; Thu, 26 Mar 2026 15:44:42 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 199BAC2BCB0
	for <soc@kernel.org>; Thu, 26 Mar 2026 15:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 199BAC2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EE3C33F63C
	for <soc@kernel.org>; Thu, 26 Mar 2026 15:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1774539871;
	bh=v1SUD2/RxGmhieWQs46q6VAPxE1rsiRhxrRLY8jePYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=Hxk0zIh0lFF6/BO7zHmljcAqFV1Jl1QXzFQ2keOPX25G5Xbmpc2m1iwfSYM2ZDyqs
	 UFR85KQz+0SOsOSZUPKgoxAV5zy/qokXQt14BrypjOcEPXu33IAbobb7NPyHXhFKy3
	 bzsQOo982Qds3eeY94H9QWTzvRk2by71HhUzVMCCWTC+Jmux7iCzE70gbPkY6mbsh+
	 VGfkb54c/Uf7fjqc8J7vBrkkjefVRM4VJAUOC/BdPKy5Vl18plgu8oP7PdyB3029wr
	 O45mJF+MxUP+CcjNtHqr87ZeO5/I7/zyfVlCmZp0N1/P65j4xj7dw67V9rCQjEJmdA
	 I/TdV2gv50wLPy11gsXFUQ6/NsZkw+Tt10ZhXxOv02BZiMm+utVWUV/8AnBpuSQPoa
	 Tf32MS/1fWrGkMTI/TtoFALvxjKMrvFZD79PB14NzwUuDo0H6gGdN/omjmbQhBwwgA
	 /+5L2Ez8A+H/bHu3tmsyYx87mMi8t2uT6oYhl3dR0569zHJ5oMdUzwE/UZGtzu2Rzd
	 3rYJRR/HWF36qyLdZbb+viNDc1MgXfZ1GdSfrA0tr8mSxVYI8D12+q9WODJyNQYJPc
	 vdtbN55UHV8lZqYM3tw1O420AqskSfst3mpPp2nQfZYmUYXQXtLMWYyefL7CAedeqd
	 6fyY7Zs/OVEfJYPrJSUWyvR0=
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-439b3011be7so677159f8f.1
        for <soc@kernel.org>; Thu, 26 Mar 2026 08:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539870; x=1775144670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1SUD2/RxGmhieWQs46q6VAPxE1rsiRhxrRLY8jePYc=;
        b=Pd/c0GOqq3S8As5d9AtKmvHwUnWmY7ju4XH8rKpOQuZ9jPniIdHo44pCvbjjr1tyK5
         OMyZi5ZtaPs/KoHW6IK7peBtYbD6Hh3ppK0557/mLcRUKfQRCKZG9Vd0/2iIAu50As0B
         3GiYrpK2Q67ywGstMC9VJmsYshJBEa9E1rk/6FTBK+QYI6XywY6fINGObmx2Tsc4Wh8Z
         bOY+9S0UgaY69r5vPW9GL1+MWyh75jq+aBP1D91Lma/xoiIl9ja7zfN5ZxN+ZmT2aVYy
         lUWoJxe+TAtryWgZFAGCtBbRJI6BgnQwSSOr0UnUXAcVVmceBYtPeruNHinliuhEA+Lr
         EWfA==
X-Gm-Message-State: AOJu0Yxy4irKMrGnk2Q15nAvTtT1N/kZuF5HDHnaEp5yf5pwqrwlTWv6
	RVkH9LyfIzpVr9Ff4xaK/XRSnzTfg8/x3n015B8etM4qz84XzLELWQ8HJ/EyP4ZfQ1GFPKBZZxc
	8oWhLLXwxfpJRsHOxRPnvSSVRE9h8Ui2vjrFLYmHRbz6rHeasPYuvvvNzyQgWIms=
X-Gm-Gg: ATEYQzzAx65j71ZlMlHDBYJQB40sbMAW944aN+gSp9MkOcS6pnD79OwuZT5TYjS4fgD
	957MvAu2jKwZu00Uts9BBBFsGOY5Wlo4gR54yqWkCxPEvBPXtz+ayWHDFqx+eVTCfa2zwZWbKho
	RqgQWBA0FcdrDPvhk0y55NpSBKCkI5xAKXV8vHXe96S6ARwjPsDzLPQ2Ne/4Z2LEzK86HIlBbxA
	9uSbn94u1sQfzBx0KE+Wd0bz4NOY5MkpJSEfz4pOkXYIgbXcjaWZHWWl3mU1OvCy+fjwseoy8tn
	5JugFeI/SerLrZ1B1kw9PuetGevRxmx1zxDmfvn+TEMbaIgdbWIj+nvR+B/jPAEzwiH0AOEmejy
	b8JPg6ShDj7pSV1qlAHZN4nTBxRFUsaY5o4zZ3c/Y8DlzuMQTxt1q/aaj0FlZVPo5EkD7sZRvw2
	2aGeGIe9vjvxEAj8DtDJesuaUneVkbL/mPa6TkGw9hMpQhFDg4QO0=
X-Received: by 2002:a05:6000:2dca:b0:43b:4312:2ca9 with SMTP id ffacd0b85a97d-43b8899932emr13350514f8f.6.1774539870403;
        Thu, 26 Mar 2026 08:44:30 -0700 (PDT)
X-Received: by 2002:a05:6000:2dca:b0:43b:4312:2ca9 with SMTP id ffacd0b85a97d-43b8899932emr13350459f8f.6.1774539869831;
        Thu, 26 Mar 2026 08:44:29 -0700 (PDT)
Received: from [192.168.103.137] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cefd7sm8746077f8f.17.2026.03.26.08.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 08:44:29 -0700 (PDT)
Message-ID: <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
Date: Thu, 26 Mar 2026 16:44:28 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
To: E Shattow <e@freeshell.de>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Ilya Sorochan <k0tran@altlinux.org>, Conor Dooley <conor@kernel.org>
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20260326-viscous-rigor-4beb18f77eec@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/26 16:14, Conor Dooley wrote:
> On Thu, Mar 26, 2026 at 07:36:07AM -0700, E Shattow wrote:
>> On 3/26/26 04:13, Conor Dooley wrote:
>>> Hey folks,
>>>
>>> Please pull a small fixes PR.
>>>
>>> Cheers,
>>> Conor.
>>>
>>> The following changes since commit 0528a348b04b327a4611e29589beb4c9ae81304a:
>>>
>>>    cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() (2026-02-06 19:54:40 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-fixes-for-v7.0-rc6
>>>
>>> for you to fetch changes up to 305f2865bd034146b2eebc77c27fc50d8d79778d:
>>>
>>>    riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card. (2026-03-19 16:00:13 +0000)
>>>
>>> ----------------------------------------------------------------
>>> RISC-V devicetrees fixes for v7.0-rc6
>>>
>>> Starfive:
>>> Two fixes for the SD cards on the Mars CM Lite.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> ----------------------------------------------------------------
>>> Heinrich Schuchardt (1):
>>>        riscv: dts: starfive: Milk-V Mars CM Lite broken-cd
>>>
>>> Ilya Sorochan (1):
>>>        riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
>>>
>>>   arch/riscv/boot/dts/starfive/jh7110-common.dtsi           | 1 +
>>>   arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts | 2 +-
> 
>> To be clear the "riscv: dts: starfive: jh7110-common: fix jh7110 SoC
>> boot from SD-card." commit does not affect Linux whatsoever, there is no
>> problem to boot Linux from SD Card impacted by having or not having this
>> commit. This also is not common, so should not be in jh7110-common, as
>> more JH-7110 SoC products by-the-numbers have transistor logic replacing
>> this signal selection to the StarFive loader in BootROM and so
>> precluding this from functioning.
> 
> All the patch does is tell bootloaders what stage of the boot they
> should should pay attention to the node, and the link was to a big
> mechanical deletion, with a reasonable comment from someone that
> has a track record.
> 
>> This ignores the wider discussion about StarFive both deprecating this
>> capability (for Secondary Program Loader i.e. U-Boot SPL) of StarFive
>> Loader in JH-7110 BootROM loading from SD Card being deprecated
>> officially in the latest StarFive JH-7110 Technical Reference Manual and
>> StarFive JH-7110 Boot User Guide documentation, and the ongoing GPL
>> non-compliance by StarFive for use of GPL 2.0+ code in the JH-7110
>> BootROM; the latter being important if we want to accurately attempt to
>> support this deprecated feature set as a community (even when ignoring
>> for the moment this copyright license non-compliance).
> 
> I'm sorry, but I have only a passing familiarity with your work there
> (as in, I have seen you talk about it on IRC and paid no attention), and
> there's no way I would have associated it with this change.
> I definitely was not ignoring a wider conversation by merging this
> patch, I was not aware this was controversial at all!
> 
>> I have done an ~80%+ analysis on Ghidra decompilation of the JH-7110
>> BootROM, and openly invite anyone that would like to help get this
>> effort to 100% is welcome to so that we may publish and refer to this
>> for technical competence. I do not object to the community supporting
>> this deprecated capability if there is any real documentation not based
>> on rumors and memes; but no one has offered to do take a moment to do
>> this most basic of fact finding. Evidently the StarFive maintainer(s)
>> have refused to support this, GPL non-compliance persists and only a
>> rough description from Hal has been written to the U-Boot developer mail
>> list that does not match my analysis, all while complaining about the
>> capability not being supported going forward.
>>
>> I object to this PR it is NAK from me on the basis of stuffing this in
>> sideways without technical justification or review. Also I do object to

Concerning technical justification it is clear:

Distro images have been supplied with U-Boot on SD-card for years and 
the recent work in Linux and U-Boot broke booting them. This needs to be 
fixed.

> 
> The technical justification seemed to me to be multiple people saying "we
> need this added so that u-boot can use the sd-card". The patch has been
> on the list for over three weeks at this point, so there was definitely
> opportunity to comment on it. I don't think I have been unreasonable
> here. If current U-Boot needs it, then I'd still like to have it merged.
> If you work pulls through and this becomes no-longer required, then I'd
> be happy to take it back out again.
> 
>> "riscv: dts: starfive: Milk-V Mars CM Lite broken-cd" as this goes the
>> wrong way around, it does not describe the hardware; if some external
>> carrier boards cannot deal with the capability of the Mars CM
>> system-on-module having card detect line then that should be dealt with
>> as a dtbo per-carrier board and not be replaced in the dts by a
>> broken-cd, although at least we had this discussion and Conor made a
>> decision with all the facts and discussion available.
>>

As my patch points out the CD line is broken because it does not conform 
to the standard established by Raspberry.

E. we know that by chance you have found a base board that ignores the 
standard.

Your patch 4cce8b2503ab5 made my standard compliant baseboard unusable. 
My patch in the pull request does not stop your board from booting but 
re-enables mine.

Best regards

Heinrich
