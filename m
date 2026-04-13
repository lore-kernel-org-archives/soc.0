Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49E7399013
	for <soc@lists.linux.dev>; Mon, 13 Apr 2026 07:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066540; cv=none; b=uYdkYtK/xajPZVsdwPjDb+5oE/cEwboR/tXKoJrlE7EQ/Mg4Ji5JPwSfc0EMx7EPh/A4p3iWFCHeztn0RU2PYgQzcVtEXJBy3bjdXJIdsVmTNh7jnp97Xt0ZQdQKmz8fUMrQzo5P81S/E+IaYtB3Suu/25Y+zY/OAL0MhnmlcsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066540; c=relaxed/simple;
	bh=Pv+2oy3eASn9J7liZ0p89zz9u+BIXG7pvHKbSIxg3SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwrKfu/xUVdHHutfqaK/1qTkRLd5LkNuu+m6M1RNyh9heVKUIXvgJfo6l8QTdAcMUJzkFAru71Rf0ozdGjq0Vg5KYfGEUxfOU5uWNbjXmS0YKaIKI4vStjAuYtDoO30r4Uty8PmAH7nCnyj3iKaozQg9VL9/SBcCggVJB73+nak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjrSt5X7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjrSt5X7"
Received: by smtp.kernel.org (Postfix)
	id 35D29C2BCB3; Mon, 13 Apr 2026 07:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB4CC116C6;
	Mon, 13 Apr 2026 07:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776066539;
	bh=Pv+2oy3eASn9J7liZ0p89zz9u+BIXG7pvHKbSIxg3SU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SjrSt5X71ELB/H9v1/mmqQBKSDa2/PYHklhFFPVJ1fA6C/eEsU9xrnPZSyA+bD9kK
	 rSyTfHViIzpXoSggVd9nQDLO2aRYIUefqCa7nY25lYIUrytISmHRqMiU85DMoO548o
	 me9ExFkBIMFl5BiQ9KzNEnvD0/tNUmsa+pUSdjMm9PoUqXYEn8R3h+O4z60wljE9gT
	 mk9h8THrFIdNrWFzGgViNRY+iQClaHi870UFDCCGVikJklfRykhghLFoRogqPnuIU+
	 mqfakxYjuAY3Ouz10n76QMxM5R3vrHF/LTIOZqeHd3Cv5pYJQwFUk/FatYcFKvhp6W
	 V6S3PjDyLukMw==
Message-ID: <a9cfd67f-6924-4f10-b9ba-1dc5f61f3143@kernel.org>
Date: Mon, 13 Apr 2026 09:48:56 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
 <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
 <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
 <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
 <6adde3fe-7eea-46e7-a6f7-de536f054c06@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <6adde3fe-7eea-46e7-a6f7-de536f054c06@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/04/2026 09:45, Neil Armstrong wrote:
> On 4/13/26 09:30, Krzysztof Kozlowski wrote:
>> On 13/04/2026 09:17, Krzysztof Kozlowski wrote:
>>> On 13/04/2026 09:10, Neil Armstrong wrote:
>>>> On 4/11/26 11:32, Krzysztof Kozlowski wrote:
>>>>> On Fri, Apr 10, 2026 at 10:50:58AM +0200, Neil Armstrong wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Here's the Amlogic ARM64 DT changes for v7.1, including a bunch of fixes
>>>>>> and improvements for the Khadas VIM4 and VIM1s SBCs, plus some additions
>>>>>> for the Phicomm N1 and a couple of low priority fixes.
>>>>>>
>>>>>> Thanks,
>>>>>> Neil
>>>>>>
>>>>>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>>>>>
>>>>>>     Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>
>>>>>>     https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.1
>>>>>>
>>>>>> for you to fetch changes up to 401e5c73eedde8225e87bd11c794b8409248ff41:
>>>>>>
>>>>>>     arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-08 14:27:20 +0200)
>>>>>
>>>>> Days in linux-next:
>>>>> ----------------------------------------
>>>>>    1 | ++++++++ (8)
>>>>>    ...
>>>>>
>>>>> So a few things were just applied, unless this was rebased?
>>>>
>>>> This one has been applied lately, but this is news for me, I always took
>>>> in account the time spent in the lists, not in linux-next.
>>>> I made sure this one landed at least once in -next to trigger CIs.
>>>>
>>>> So if there’s new rules, we should be made aware of those.
>>>
>>> How is it a new rule? Linus posting from 2023:
>>>
>>> https://lore.kernel.org/all/CAHk-=wgXDTfWFbn-481=it6W_B0KTQsOhdgXL6mweVm6ewtSvA@mail.gmail.com/
>>>
>>> Plus this is simply logic - why soc tree should be the first tree
>>> exposed to integration issues and robot reports? If soc tree merges
>>> stuff which was not on next, all such reports will be applicable to soc
>>> tree as well. That's nothing new about this.
>>>
>>>>
>>>>>
>>>>> I will wait with this. It might miss the merge window if v7.0 is
>>>>> released this weekend.
>>>>
>>>> Ok wow, just like that... I mean the amlogic DT is stable, all patches
>>>> patches bindings checks and none is critical since it mainly touches
>>>
>>> You sent your pull very late, just before v7.1, and skipping late
>>> posting is not a new rule. It was always going late pulls, which might
>>> make it or might not make it.
>>>
>>>> new platforms and the incriminated commit is a low priority fix for
>>>> 10y old development boards...
>>>
>>> I did not check which commit was not in next. You can provide feedback
>>> to my reply with actual argument, because such explanation was missing
>>> in tag. Instead you decided to be surprised that patches needs to be in
>>> next...
>>>
>>
>> And to clarify, I did not say that pull will not make it. Considering
>> the timeline:
>> 1. You sent the pull on 10th April, Friday
>> 2. v7.1 is released on 13th April, Sunday
> 
> Stop this nonsense, there's a very high probability release are done after rc7,
> but it's not a strict rule at all.

What is the "nonsense" here (except my mistake 13th April -> 12th, and
earlier "before v7.1" were I meant v7.0 obviously)?

$ git show v7.0
tag v7.0
Tagger: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Apr 12 13:48:06 2026 -0700

Earlier wrote:
" if v7.0 is released this weekend."

I said before that if release is made this Sunday, then this pull might
miss it. If release was not made, the pull would have time, that is
implied by the "if" part in my sentence.

Best regards,
Krzysztof
