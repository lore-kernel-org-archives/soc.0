Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262523A3827
	for <soc@lists.linux.dev>; Mon, 20 Apr 2026 17:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706296; cv=none; b=e5R4CmhWUdNNeKrXH5T6ecTSjKItrI17zlj81XOPk20sNWP3j1edsHHwyFcDno308OVC7qKbm1FHbzqO3qqe/keQEBBFBfn2gR+lv76WPCT3XNyYIGjjcR6QqtAcpcdlkl1ZQCvPME2+hrUrgDKae4IZfKJFMig7BUOIyAD51Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706296; c=relaxed/simple;
	bh=h3cxgsYvRbspx99Lx+i8mr6DlXG2j3GXT/9zhUNmcxY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=t58ekWPjxHuf2pc2S4/AbCzZquHIeDPJJn79zBaKcbfmg8DlP5Vm+zsmYsPuE6/5OQ4cQG43uoUdwK7VjD8zyoRqHwGP7UFAgGSkyqMGy9Lf+xUcUkIoiP7Zqwdxb6Kv/iq8AJ23TlqX6ueIJ/m7COkR0WIyJzZfZck1KoUYr9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qaZ2237b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qaZ2237b"
Received: by smtp.kernel.org (Postfix)
	id D3482C2BCB4; Mon, 20 Apr 2026 17:31:35 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EEB9C2BCB0
	for <soc@kernel.org>; Mon, 20 Apr 2026 17:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0EEB9C2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso37785345e9.2
        for <soc@kernel.org>; Mon, 20 Apr 2026 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706292; x=1777311092; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mY//u7sg+42QXalxUid10GxLcQ4s1uuTMxgqca1+Zkk=;
        b=qaZ2237bo/9e37aNy/krPYeF/VxzwPhAQPl0BgzjNVA+efqKHtEDeaKdg7ckBdOd00
         KnvPYHO8397aCpT1/kVhL7o36LWkwz/mxbU+TWjoVN/+HbS8EXcQ07O8FVVINDtieJ/r
         arU/2sqX0a27tXq+PINvn2cuX2BbVHmJZhZoe8h6YbL5Zz3HD0OA3RbyV+Eq+53lIOze
         ErGqa4wwmETOglsPvWrwQZ2R1ZIH/GFd3yRAM8uGCeS7jp2Q35F+Ihlp6791uJlvzbJv
         2Ax/+067J2ws0PJXQJLLDs//HhUFyTXBEN3o7M8mag8qR2lo764pTnSwpQTMKamb4KZy
         46tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706292; x=1777311092;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY//u7sg+42QXalxUid10GxLcQ4s1uuTMxgqca1+Zkk=;
        b=U4Tekfdp6IMK6Ki4dDFeNrsZskxMdmX0akFo3yPzEj14oeJQIpZ/b1QxhvboBRx6bR
         JyXK/cFYLVOOBE7YAj6jOIavxI2g/780iZwxlVwJ/Sd+ti+e34giOxdvha9klN/jh8UD
         HVFOwK8NK5cf9lyRpHpOsRu84lObvys9RdnatvBhp6VU/a/SWbM3G2lDJ3TSLFefY/2H
         D4sQ4HiKhQG4Lc5hzRK98D9b6EpdUkz45owTIwupM+6UUEj13VFtd9Ey/P8VYndaCIsc
         88n/tHZ+Kq2H1zEcpnbg46f25fTiaASCpb08bALMeIG/fJ13V2sYWk+tO60XppSzfGDQ
         lzSQ==
X-Gm-Message-State: AOJu0YwOr3noQ+pbF3j9FyXW+nax7EkZspyzHLEz2IB+ijewnSqcCSWM
	/bTrzQf/YY6XggPAxzJoq7gZgDf65CvwfROBeRoHI1MIuPl1GDga82fHzp9A+rTctHiEXwP2xKB
	rR0hjVfySRX7y
X-Gm-Gg: AeBDiet+3KOtAhnfgYcLBxNBdixM98Qa0jfHtVIYFiZBTsjhfDXjlJGirFgxOUvpj09
	QBi+Sl/X3ZdyP7wwIA0KjkLQ2UAipB3TYryar648sd87IorFop+S0oRPSWR7Hpy7SBYsbLREakf
	tO7NnYvmNW4zGw66+1Zcl2nF69bZqCzVdmHN3v03dIIBlWQdB/Ya0Wgns0rdBwCcmDFJJEAwxp7
	R8osoJ5TGb/evbIujnyhB5Uzv+azCmUkcn/WdE8Hb/Yeb2YEJymbzz0whKwe7IM+qN1GDZpMHoe
	4hzynAXtMlo3i7YdvKFSjhXDZW08/BIcS3jtsEKFe7eNnZrjAnCcwTjS7Lqw/ThjD2s2SH7gEAs
	7eewdhvaPRli8SOPPk2CG+wkTJDIQgFEXuAmDAGTkPjV0i9/lpuTqlWsMZJorKLt125O+Pceofp
	72Ka6OjL0NHDO9Zx05rc3nvzeXGXwM/Fb+qetLYtGyX2AUGq+EQ+IRR2hDBkQs1ZJw8gYMmw1f/
	f1KksytWwYqHMQeAQ==
X-Received: by 2002:a05:600c:c4a2:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-488fb78eebdmr202614535e9.26.1776706291547;
        Mon, 20 Apr 2026 10:31:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:9a74:aa46:4b5c:7fd5? ([2a01:e0a:106d:1080:9a74:aa46:4b5c:7fd5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4633bsm30305685f8f.26.2026.04.20.10.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 10:31:31 -0700 (PDT)
Message-ID: <5d9c1c31-5e89-4699-b910-f5ca2c36260f@linaro.org>
Date: Mon, 20 Apr 2026 19:31:30 +0200
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
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, arm <arm@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
 <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
 <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
 <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
 <43ae9d05-5cc9-4f68-933a-99eb744756b7@app.fastmail.com>
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
In-Reply-To: <43ae9d05-5cc9-4f68-933a-99eb744756b7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/20/26 17:25, Arnd Bergmann wrote:
> On Mon, Apr 13, 2026, at 09:30, Krzysztof Kozlowski wrote:
>> On 13/04/2026 09:17, Krzysztof Kozlowski wrote:
>>> On 13/04/2026 09:10, Neil Armstrong wrote:
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
>>
>> and that people are allowed to take weekends off, then there is simply
>> almost no way that pull can be merged before v7.1 is released, so by
>> definition it is a *late pull*. The policy for late pulls, like that,
>> did not change.
>>
>> Lack of exposure of a few commits to linux-next is only the explanation
>> why I did not pull it while doing last round of pulls.
> 
> I'm looking through the backlog for any missing fixes that should
> still make it into -rc1 or -rc2. Just a few more points to add
> from my end:
> 
> - I had in the past always trusted platform maintainers to only
>    send pull requests when they felt the contents had spent enough
>    time in linux-next already, but I did not have any scripting
>    to ensure this was done correctly.
> 
> - I see that only a few of the patches in the branch got applied
>    during the fineal days before the merge window, while the rest
>    had been part of next-20260330 or earlier. Aside from just
>    sending the bulk of the contents earlier, I think the best
>    solution on Neil's side would have been to send two separate
>    pull requests, for the earlier and the later contents
>    respectively, even if sending them on the same day

I never did a split because I don't have enought changes to justify
2 PRs and I had some contributors & other maintainers activity late
in the cycle.
Anyway I'll make sure to send the PRs earlier.

> 
> - I see that some of the late commits are clear bugfixes that
>    we should still merge as soon as possible. Neil, can you go
>    through the branch and send another PR for anything that
>    qualifies as a bugfix? While by now it's clearly too late
>    for any of the new features, there is no need to delay those
>    any further.

The fixes are clearly low priority, but I can lop over and send them as fixes.

Thanks,
Neil

> 
>        Arnd

