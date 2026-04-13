Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C2B3932E0
	for <soc@lists.linux.dev>; Mon, 13 Apr 2026 07:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065285; cv=none; b=KrCcx9LeGmHyNM5Bv5iYIiYmrLG7pNTPu5bMELHYZ4/eEmy3jKjfMyGHopG8dxagYgIg6z1kIGjUeq6F5QjnYd1qjgoEuUvbKLREVSyCrbbYscS5DxA7fd15hHdZ0SMhHsdiU1OXfRNrypTIAodgnLrNADqZv1oS+mtyaDA/iFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065285; c=relaxed/simple;
	bh=BH2c0fmSUlpWD0BLikCPCvRpC74B+WSrYzrpkfaDYNg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NdpnAA0ESCQwaZ2RthHztGeMo1Ch2DVZDldZvtK4Orbns8j2oyiiIOmdRMXbjzhTFOz0RmdaSZKbkjrutYpiQmqYFvhzuGwNFhpT4TBHPxsGp3GPzB75XKn+lfWgF24Y6w46EB+GT18xFQ9IVxNjcxYM7ss7UQX++NtaVbu+BPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uGG8YPqA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGG8YPqA"
Received: by smtp.kernel.org (Postfix)
	id 5138AC2BCB1; Mon, 13 Apr 2026 07:28:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E573C116C6
	for <soc@kernel.org>; Mon, 13 Apr 2026 07:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E573C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d73352cf2so720547f8f.1
        for <soc@kernel.org>; Mon, 13 Apr 2026 00:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776065282; x=1776670082; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx2a1IZxvXHDsI/lPp8GVBpoyU8uNZ4jofzPVCpCBPc=;
        b=uGG8YPqATZ7aEF0oXk/TlSgbFHIsszytFe+4XiGW4Wwzsai0mO5XquSr9IKu1U8l4Y
         /+lyWMBLfq4RswU/fTDQM4+XuqjpQEBbVk1B4e+4FdYePgZTT732I8SiK4OFSAak1UZA
         6VsUB6jdhRDTcifI6o9wPjhc/Nb0EbcYw6EwIY6SyQVgP6EASmQSXMA4dMP/vd4m1Y4O
         a2wzfrLjF4YqRAbsRAdcI6KfPvqZIQZ1K7Lv+r86zmbkE6t8StDdebZMIY74pLWx/DSu
         dhXgP9TFqXDHOo6zqXon3GSKwWP1A3DxtD/ZdoGkRBLzyHuzLUF5Q5+n1Yb5sA4Z2Ujw
         b3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065282; x=1776670082;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx2a1IZxvXHDsI/lPp8GVBpoyU8uNZ4jofzPVCpCBPc=;
        b=d4Qn+gMMhWDO0ORFoOUUs44X1I4cTRFK3L2Gc2C7kUFOTBNgDMRWU79020Z+gqDeAO
         YH2mTOMWDbe/Nylm3MXNYKHwXfdYIFLECXGGBEAqvCwRY/lEnNvIx3rlnzYTdmJsGf8w
         6eZ8Hd5Pv3lEECdMMhvWrHW4X27uLI5hrkLCOfCve/AoZVqRqhI9uWJs/g0ye+zx3mDg
         we65kNtupRiECGTJrRYcSHbod1clIL10lyHVzJNnCVEKL7I+yhPPGRZbCgtZHUjZTtXy
         jAWTG75Zt0Xf5D1vlPUFuO3i1n3ZBucpZowXP+V1RMcw/Qnts7j27GplqViG7KdTwomF
         tkmg==
X-Gm-Message-State: AOJu0YzoXkXhHJPBO1ALKFu6IPgt2yZqokxQIUXLhT4ELJmeiWZv00rZ
	eicUnWYBkFHQQYhVNVwx6eyUFd6i2BCyKx/AzTx9maXzOfYDftjKXttIGKO+bVx0VPDEPf5TXKI
	BDlUG
X-Gm-Gg: AeBDieva5CpuQTnAaeUnbyOYN60qmu8yqx5R3LOgo0dPdEg4tmMFBK+Chn29z9+SVYz
	ARoEvaYFfNh4U0twsD5bUeAG4PTIlcs1dWkvo6EWeDSAY5ei0TJ+0xPflMb4khMsEijr7b66Ram
	/2epjZrabgGJ83eSrtUR3fsEUzrzlmuNJaOTbES4uGNCmhsrJKv4AAX/zetdD1Fdz0+4kEUO4Nx
	MyVRwwbTCxiL4zZpf8DNk0ZXFcIHWz/uZ+q2qMXjAEMs0fsHY66eYqtdEISFFK0M8MzfSSEz1E/
	g2/e4HO5buRAkKXP4rTdtTDElG4E1srL8ZeKCHus4WjSH4BaVkmoKOU9aRvImokqh//iIIgMDik
	vqWPx8BldS92kbxKv92GUV76ZKpe4FbOg+IaCGn4ZWMktUuyDikGixXRXPIDCAWuRXfBtSVz+Q/
	e660QEZo+iTOLTrxu4OjheGE7EiTV4vs4VsfDzPxnSfwYzE7q2mF/6KPkVJnaqc9ei9GcemkXGS
	bAvXxbomrLrMHD6L8I=
X-Received: by 2002:a05:6000:2888:b0:43b:3d44:6624 with SMTP id ffacd0b85a97d-43d6427bad1mr17588580f8f.2.1776065281560;
        Mon, 13 Apr 2026 00:28:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2e4csm32927373f8f.2.2026.04.13.00.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 00:28:00 -0700 (PDT)
Message-ID: <96c11b9a-9494-40ae-97c4-af27a721df0c@linaro.org>
Date: Mon, 13 Apr 2026 09:27:59 +0200
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
In-Reply-To: <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/13/26 09:17, Krzysztof Kozlowski wrote:
> On 13/04/2026 09:10, Neil Armstrong wrote:
>> On 4/11/26 11:32, Krzysztof Kozlowski wrote:
>>> On Fri, Apr 10, 2026 at 10:50:58AM +0200, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> Here's the Amlogic ARM64 DT changes for v7.1, including a bunch of fixes
>>>> and improvements for the Khadas VIM4 and VIM1s SBCs, plus some additions
>>>> for the Phicomm N1 and a couple of low priority fixes.
>>>>
>>>> Thanks,
>>>> Neil
>>>>
>>>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>>>
>>>>     Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.1
>>>>
>>>> for you to fetch changes up to 401e5c73eedde8225e87bd11c794b8409248ff41:
>>>>
>>>>     arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-08 14:27:20 +0200)
>>>
>>> Days in linux-next:
>>> ----------------------------------------
>>>    1 | ++++++++ (8)
>>>    ...
>>>
>>> So a few things were just applied, unless this was rebased?
>>
>> This one has been applied lately, but this is news for me, I always took
>> in account the time spent in the lists, not in linux-next.
>> I made sure this one landed at least once in -next to trigger CIs.
>>
>> So if there’s new rules, we should be made aware of those.
> 
> How is it a new rule? Linus posting from 2023:
> 
> https://lore.kernel.org/all/CAHk-=wgXDTfWFbn-481=it6W_B0KTQsOhdgXL6mweVm6ewtSvA@mail.gmail.com/
> 
> Plus this is simply logic - why soc tree should be the first tree
> exposed to integration issues and robot reports? If soc tree merges
> stuff which was not on next, all such reports will be applicable to soc
> tree as well. That's nothing new about this.

1) It was in next
2) My tree is clean, review and bindings are tested
3) My PR is a minor PR, low priority change, low impact, no risk

There's still people sending commits to Linux which didn't even go to the lists,
so it's irrelevant to apply this vague rule to me in a strict way with not reasoning.

> 
>>
>>>
>>> I will wait with this. It might miss the merge window if v7.0 is
>>> released this weekend.
>>
>> Ok wow, just like that... I mean the amlogic DT is stable, all patches
>> patches bindings checks and none is critical since it mainly touches
> 
> You sent your pull very late, just before v7.1, and skipping late
> posting is not a new rule. It was always going late pulls, which might
> make it or might not make it.

Yes I've been late, my bad, not the first time, never been rejected before for that.

> 
>> new platforms and the incriminated commit is a low priority fix for
>> 10y old development boards...
> 
> I did not check which commit was not in next. You can provide feedback
> to my reply with actual argument, because such explanation was missing
> in tag. Instead you decided to be surprised that patches needs to be in
> next...

No, I'm surprised because there's still a lot of subsystems not in -next
and I've always made sure my tree were in next before sending PRs, were
building properly with no warning and bindings checked.

Neil

> 
> 
> Best regards,
> Krzysztof

