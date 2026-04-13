Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07AE39F17C
	for <soc@lists.linux.dev>; Mon, 13 Apr 2026 07:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066326; cv=none; b=lav85Y9Q49YYBqha9v60AHfwly8Ggkd3kxCz/VZov8dvhNOs2h+2MV2sWvAET2mu9j5eQy+XJ7HcumaknsFbsMzBDbLb8JGFB7pRRvTzrL2d8dFg+UU4lVjj09yklSWA356zVETiuw88JkXkDs8+uoChQEzUonkJ4BCFdAi5HwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066326; c=relaxed/simple;
	bh=bVQQkllE9FsB3FoMq2iX1KHXSbDPIIeoKVxWTvJnWY8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=D3i+JeZwgGn58js7KmrzUHDDaD7P1UMcHl4D1eIBsp9SDsqF05JWEyJvqwl/gLv7zHGlj82SS4Yir2E6wJRIfnVBIC4i3BXOpDAvBtnDHLQ/aOdiIho2GsGApzFSUmdBnzFcf0JcZp8e4CcvxhHzwHilR4hG5o+DhiNENS1K8FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZKDopoE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZKDopoE"
Received: by smtp.kernel.org (Postfix)
	id 2FBEBC2BCB4; Mon, 13 Apr 2026 07:45:26 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 625F5C2BCB7
	for <soc@kernel.org>; Mon, 13 Apr 2026 07:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 625F5C2BCB7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so51435705e9.0
        for <soc@kernel.org>; Mon, 13 Apr 2026 00:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776066321; x=1776671121; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXpz2O0o7IAOiW0wpCsudNdz58SNhf9Y+6JQ1Zpf05w=;
        b=uZKDopoEAORTcp4EQy5YktBOrNJr1xUgeZzAC3oUxYKtDcIgc11n3d5/7YlGbz9aut
         MGr4AV5V0ZYT5QaV421N6TsyDw/pZN0+4oNSIotdFOAKxYt5R9pj7XqfBXvzlnWLjnOp
         FeGdnZCJ/+/GGyC2Ix0ayYMh3eR65Vp5aMwURSkNljnyQ4o5TV8oK/A7Jvz++n2H0J8K
         Ry+m0shxjjO4kX3Mtq8VS280LkyDSnsuf0jB6In6mvmUiMsJghWaRVHezxOXvHcswtb6
         XeuJpv7nDRRBMBQ8QwreH0RI6vRIx6o+ju3PkbcprFy3EGJivI3NrWn+xWYwtwxAnWt/
         0JOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066321; x=1776671121;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXpz2O0o7IAOiW0wpCsudNdz58SNhf9Y+6JQ1Zpf05w=;
        b=beJGuhRJOiYZevfGKjTPq32m+gLR+sWyk0W4JcsrE/Zl89baTSD0ztvYedfY7yhvOG
         hC/ZzkiIXdC0rUJzHDHnDtPA6hsvVNNnNLC9UIIPsyj/cYpKNa2WPFwJkIWFQHedHWBg
         N3klnhEXGZTZgcPD2Z6f07DJX19qVDdc39r95T/IdPliN/DKcM6pNb3JR0XzBOPqEg9u
         QYoNxUkiuIzL+ilVjFPgSLM3ORvScH3J1vB4v4MSUHf4ND7Wy9fBKrlqrB3K6pT1wV5U
         X3q+tYnXQLVlu8mpQQ/znGQZ6bxqLczOhRePuHIzU/E6+PAjHPEFBBFVFrYQnZAnk4fP
         +2GQ==
X-Gm-Message-State: AOJu0YxuOEjqlBX5w8OjU23jyScIlLd1FBO7UqLhJ3+AaMCn4K66j8JR
	aCEMA6Y2gD0e3gpCMdHQw45viGGRjjm3Pzw/ptT4lCq4rfbSt3DXli0ZZxdGodA5SbE=
X-Gm-Gg: AeBDiet2zAmDumX8tCskJJZ6yIjyKIdktQgUVjJujJ0yVF3BUUHw6Q8DPEg6bUKcvH/
	3H7bEbl7MQZGJShavIWLdH1cNtQboYKioDcYhO+y/dU+YXL7dTlv/GKcxzdzwU2jgqggHhYXy9r
	U/FmRBO//pgGUIXpHkycK5JEUoTmob0aAYjCB3EEm9ilQSnsdcUexrS1APeOQv06XzxWnoxogJm
	Xhi1vmM7nfxyLClwE5o5MKUehPibhXFuHP9HvBkChDLJ0+8YY7NtzS18gvN0wmcFmTMnUjJ1PYB
	9HkP8LkiTX4hC7sehFnKeaqBwFtsgxNJvl7ssvOKA/ovTZa28FmZC5QgdDl/mudZV+Tn2gXoR8V
	b7lCjTPMCDJkp90v97Pk3MOuEmc9b1od1FY3+n8Pg+IZb7G7ALazV3BQy1jh1Q3fbkUANHAhkEK
	m+A0VEVY3d6jqipAV5IDOHDHp/bcE8lirUmzXn+aR/Kz+9CjC0UrSMWs+DTicZSyC4qeBJ52s0i
	YkLsS7o
X-Received: by 2002:a05:600c:4215:b0:488:d9ea:3da7 with SMTP id 5b1f17b1804b1-488d9ea3e0cmr86555425e9.10.1776066321406;
        Mon, 13 Apr 2026 00:45:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d684b55fsm92669805e9.26.2026.04.13.00.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 00:45:20 -0700 (PDT)
Message-ID: <6adde3fe-7eea-46e7-a6f7-de536f054c06@linaro.org>
Date: Mon, 13 Apr 2026 09:45:18 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
 <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
 <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
 <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/13/26 09:30, Krzysztof Kozlowski wrote:
> On 13/04/2026 09:17, Krzysztof Kozlowski wrote:
>> On 13/04/2026 09:10, Neil Armstrong wrote:
>>> On 4/11/26 11:32, Krzysztof Kozlowski wrote:
>>>> On Fri, Apr 10, 2026 at 10:50:58AM +0200, Neil Armstrong wrote:
>>>>> Hi,
>>>>>
>>>>> Here's the Amlogic ARM64 DT changes for v7.1, including a bunch of fixes
>>>>> and improvements for the Khadas VIM4 and VIM1s SBCs, plus some additions
>>>>> for the Phicomm N1 and a couple of low priority fixes.
>>>>>
>>>>> Thanks,
>>>>> Neil
>>>>>
>>>>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>>>>
>>>>>     Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>     https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.1
>>>>>
>>>>> for you to fetch changes up to 401e5c73eedde8225e87bd11c794b8409248ff41:
>>>>>
>>>>>     arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-08 14:27:20 +0200)
>>>>
>>>> Days in linux-next:
>>>> ----------------------------------------
>>>>    1 | ++++++++ (8)
>>>>    ...
>>>>
>>>> So a few things were just applied, unless this was rebased?
>>>
>>> This one has been applied lately, but this is news for me, I always took
>>> in account the time spent in the lists, not in linux-next.
>>> I made sure this one landed at least once in -next to trigger CIs.
>>>
>>> So if there’s new rules, we should be made aware of those.
>>
>> How is it a new rule? Linus posting from 2023:
>>
>> https://lore.kernel.org/all/CAHk-=wgXDTfWFbn-481=it6W_B0KTQsOhdgXL6mweVm6ewtSvA@mail.gmail.com/
>>
>> Plus this is simply logic - why soc tree should be the first tree
>> exposed to integration issues and robot reports? If soc tree merges
>> stuff which was not on next, all such reports will be applicable to soc
>> tree as well. That's nothing new about this.
>>
>>>
>>>>
>>>> I will wait with this. It might miss the merge window if v7.0 is
>>>> released this weekend.
>>>
>>> Ok wow, just like that... I mean the amlogic DT is stable, all patches
>>> patches bindings checks and none is critical since it mainly touches
>>
>> You sent your pull very late, just before v7.1, and skipping late
>> posting is not a new rule. It was always going late pulls, which might
>> make it or might not make it.
>>
>>> new platforms and the incriminated commit is a low priority fix for
>>> 10y old development boards...
>>
>> I did not check which commit was not in next. You can provide feedback
>> to my reply with actual argument, because such explanation was missing
>> in tag. Instead you decided to be surprised that patches needs to be in
>> next...
>>
> 
> And to clarify, I did not say that pull will not make it. Considering
> the timeline:
> 1. You sent the pull on 10th April, Friday
> 2. v7.1 is released on 13th April, Sunday

Stop this nonsense, there's a very high probability release are done after rc7,
but it's not a strict rule at all.

> 
> and that people are allowed to take weekends off, then there is simply
> almost no way that pull can be merged before v7.1 is released, so by
> definition it is a *late pull*. The policy for late pulls, like that,
> did not change.
> 
> Lack of exposure of a few commits to linux-next is only the explanation
> why I did not pull it while doing last round of pulls.
> 
> Feel free to ignore that explanation and take other one: avoid sending
> pulls a one working day before new release, because it is considered a
> late pull.

I understood your explanation, crystal clear.

Neil

> 
> Best regards,
> Krzysztof

