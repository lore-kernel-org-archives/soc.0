Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B857202F70
	for <soc@lists.linux.dev>; Fri, 30 Jan 2026 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769782116; cv=none; b=uxqv365AnwoBDQzas39sOrputp36X301Tem/ofWiB/YpCcGnOXmOCTQTlkFR+GPWGgc18agL1H2r13zZ5nB6uDsQ8cKTOI7PXltWguJGASEOpMZncP7sP7749666J/XZt4+SQrGgxXSIkMVT/JC82pP1vW/OBHiReyWG205dZ8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769782116; c=relaxed/simple;
	bh=eweihapFrrh5VW+Qkrl0w1sJDA9qHpYWWpJceNTe5UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mvlt1YTFtEnCAAVk9hX07y6Ux4plbXZJ9Q9XN1oXw1GUEpZhYaoCefsVYj0k6Hvp2diRBKsEE4gRjT/woOSNZH4TIXWxbHcCzo2ND9BpPDbA6jN6CaUSvPdH9sfoFwsChhBY2csuMGyUV+8FKAPtbu0EaDTyMmE6I11vkChB2lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4484A153B;
	Fri, 30 Jan 2026 06:08:28 -0800 (PST)
Received: from [10.57.54.50] (unknown [10.57.54.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC9383F632;
	Fri, 30 Jan 2026 06:08:33 -0800 (PST)
Message-ID: <5607f0f3-d1d4-46d2-a857-8dfde185d2b1@arm.com>
Date: Fri, 30 Jan 2026 14:08:31 +0000
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
To: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Stefan_D=C3=B6singer?=
 <stefandoesinger@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev, Jun Nie <jun.nie@linaro.org>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
 <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com>
 <2936803.ElGaqSPkdT@grey>
 <9325c1b8-40f8-4403-8098-b924124e3868@app.fastmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <9325c1b8-40f8-4403-8098-b924124e3868@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-30 8:58 am, Arnd Bergmann wrote:
> On Thu, Jan 29, 2026, at 20:38, Stefan Dösinger wrote:
>> Am Donnerstag, 29. Januar 2026, 01:00:08 Ostafrikanische Zeit schrieb Arnd
>> Bergmann:
>>> On Wed, Jan 28, 2026, at 21:34, Stefan Dösinger wrote:
>>
>> I am certain switching to EL3 is working here because I am using it in the
>> same way to set up ICC_SRE_EL*. (And yes, I know this code doesn't belong in
>> this place. It's just more comfortable for my development tree for now)
> 
> Ok

If you can do that, then:

a) You're starting in Secure SVC, which explains the GIC issues (since 
we usually expect to be dealing with the Non-Secure side of the GIC)

b) Monitor mode exists, which means EL3 is in AArch32 state (and I would 
imagine the SoC is wired to boot that way), which means you'd need to 
rewrite the entire firmware for AArch64 (most likely including an 
AArch32 stub to RMR itself into AArch64 state initially) before you 
could consider running lower ELs in AArch64.

>>> I've never seen a Cortex-A53 without FPU and NEON, but since this
>>> is optional, it was a matter of time before we got one ;-)

They certainly exist in various networking gear and other embedded 
applications, they've just never (directly) asked to run mainline Linux ;)

Cheers,
Robin.

>> The ZTE 3.4 kernel code suggests that there is/was a zx297520v2 that was
>> Cortex A9 based, and then ZTE replaced the Cortex-A9 with a Cortex-A53 and
>> left the rest of the system unchanged.
>>
>> A later version of this SoC, zx298501 switched to 64 bit, including kernel +
>> userland. But I don't have any hardware based on either of them.
> 
> Right, it's quite possible that v3 was a node shrink and Cortex-A9
> was not available for the new process.
> 
>>> Support for 64-bit cores is actually quite rudimentary in 32-bit
>>> more, as we are missing a lot of the errata workarounds and ARMv8
>>> specific features in the kernel. If you can figure out how to
>>> use 64-bit kernel mode, that would be ideal.
>>
>> One of my co-hackers is giving it another try. Pairing a 64 bit kernel with 32
>> bit userspace seems reasonable. Of course the other question is what quirks
>> are hiding in the hardware when we run them in a mode the vendor never tested.
> 
> Right, that is clearly a risk. I see that we do support FPU-less
> systems, e.g. 82e0191a1aa1 ("arm64: Support systems without
> FP/ASIMD"), but I doubt that this code path is well tested.
> 
> For the core itself, I would expect fewer problems with 64-bit
> kernels than 32-bit ones, but the problems are going to be different
> of course.
> 
> For 32-bit compat userspace, there is a chance that you have
> device drivers missing compat ioctl handlers, especially if you
> need non-upstream drivers. There are also a few differences in
> handling of deprecated instructions like ARMv6 style barriers
> or unaligned ldm/stm data accesses, which require you to enable
> the workarounds at boot time on 64-bit kernels.
> 
>       Arnd
> 

