Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607C3392C25
	for <soc@lists.linux.dev>; Mon, 13 Apr 2026 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776064239; cv=none; b=ID8egZbjVS/yOAen1bshbtjK6LXAFoLfTEW636D6HTsM2yWTrX9AksjA5Z99y84ercsYz+Vq+dCVjX/5zGlliYQOLlxRRPvG/dpT+/xSfui1WDQCfnCiE/AKuWjmSrQ9mHARMrRLiis9SKI3G1m4IKikWyVNu8gBfGYPczIRxc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776064239; c=relaxed/simple;
	bh=aeyD78d2cemdPofKD/bUKFO2Cp2Lca4v82qoxvH6Ccs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WyLX1FTt00yV1MKKBy2DGhzieg9w+txkiwyNKfpLuAZqGgMd8cgmuOeRFgoiWzLO6zVsP1MNt+BCzOrWSq+PQkmq7ua8nkLbTlMniICS1mfTCIN1w3rJqkJziFbfX/ipUuBc+kxw6mndSs3UrZg2niTJvvEmCvtLTJtAAVbtKIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jnJyWQI2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jnJyWQI2"
Received: by smtp.kernel.org (Postfix)
	id 1D69AC2BCB0; Mon, 13 Apr 2026 07:10:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E9B0C116C6
	for <soc@kernel.org>; Mon, 13 Apr 2026 07:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E9B0C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso43748955e9.2
        for <soc@kernel.org>; Mon, 13 Apr 2026 00:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776064236; x=1776669036; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTEWMiKgWWJTQ9Wt/NJF5efY3D+FA4RYVlQMZj0kIcY=;
        b=jnJyWQI2aVnCXZL6NggEA8DIiHzJg6pPykd6iD9oj5xFGmrN5QShmnvTX1m/DCdbhI
         6bEat7/h/STOI3juc5FHjYHy7wArfKkuU3T2FcqLjoDyt2nLzqep1NImMqLfQXkhNBb8
         gBw291/EE44MuJAePHDHT6hnNSJ/rxniq5XT/1Co9PMW11mBiz+/kOSFo35oUn3O/J9B
         zc+66ZMuJEnr+Pm3TQXGSnHdvPk0UWTyS+2JAXeWqD4rAQ1I9s7+DQlGitX4BnN/hk5g
         Ju+8UxJ6GiYJ36ZYAkd2bDRTH9duF2jUmyIxwO2wGnrSGWL3Cl72QZgJ6pLx/FGsZmzD
         BTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776064236; x=1776669036;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTEWMiKgWWJTQ9Wt/NJF5efY3D+FA4RYVlQMZj0kIcY=;
        b=CJLlq3sfdp4BeGHGhjECPqbwfqFYFG4rpHGWHL9Br9+po7Pf2KjmdemTlJVVlFzBGW
         ojSgKOgAlcNuO+E9x1izp9Me73KpEdqJLSBRYQaGSqEqp+/EMP3P1paL54JD/ys8rIdh
         azicosSDSBzlZCaaW9DmVEXt/r4lcRHwp2I4KHVXHyMpuP0YdR3sXsYKxFK9ZlRkbVEc
         E75LlneiY2liDzfrIJLf+fps1aP/2s850TJS6tGFacLdvSD4XJt1vGWh9C8rhlpHIiqJ
         RAiW74GOF38rtN78PF9WWYnKoy0jzVHaj/F0PDXAa3gspyR2BLnUvG6TcSOXBhN1Tdt8
         brtw==
X-Gm-Message-State: AOJu0YySxnkh7X2j7cCaEJKfTtBzLMMGIjOR2wz5hwbU1ZOzI/n5JlhO
	PRd2CTdIft5zDjVLtYlFw0qFC3Jfhdg6u2RnwAKDcTEbcnu8nFsGnMVK2VSffv21hoQ=
X-Gm-Gg: AeBDievPhIuWgZXeIeQQceOW9aB29NLV/r9i1UHhlUCR59t1ka2/Egoak8MmV0OC2bP
	rqO3bLw4ieQElxiGdzZUH0TNslT/UAlbJxMhaYqg3A+qrhzvjHPmwfJ/3Hsqls4ysEAhHpPwxOo
	Qo/PTUfgAA2HTHSHTSrNOs5gpAnOJqtdPkCZq4Uzpl92gj/auc1QWK4F6nYS9xa8N9jNsi5ItQ8
	LmMHOYIAYFqZUTZeWYk8NECYMKWm89358hsDriMfhY8NtDx8xntpeHSDzjRriQKKxIIMKUN6OFb
	REyeSoAz6H8Jz1PvKuTw09Q0D4Rk435UZc20EVWszzJ3+YBcploxdMdsiJAU0y+fVf0E4KaqMgc
	qiIhGLCxa2MIrwERsiF5l83FicG+2hRIyIhlUMMunssv5V19kLTnvAPki+6RE7694pPFeybyaHd
	dcL3cyYGdx+bQuFsSrJgKY/igfW7x5FLBxOcCCkJ6DhWhLDyr9hc4qgVOxg3ZXXNEcq8lEhLjph
	6ady0Ui
X-Received: by 2002:a05:600c:8591:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488d6abe9e4mr118911365e9.26.1776064236236;
        Mon, 13 Apr 2026 00:10:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d538c03esm276356665e9.13.2026.04.13.00.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 00:10:35 -0700 (PDT)
Message-ID: <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
Date: Mon, 13 Apr 2026 09:10:36 +0200
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
In-Reply-To: <20260411-spicy-apricot-newt-afa8a7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/11/26 11:32, Krzysztof Kozlowski wrote:
> On Fri, Apr 10, 2026 at 10:50:58AM +0200, Neil Armstrong wrote:
>> Hi,
>>
>> Here's the Amlogic ARM64 DT changes for v7.1, including a bunch of fixes
>> and improvements for the Khadas VIM4 and VIM1s SBCs, plus some additions
>> for the Phicomm N1 and a couple of low priority fixes.
>>
>> Thanks,
>> Neil
>>
>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>
>>    Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.1
>>
>> for you to fetch changes up to 401e5c73eedde8225e87bd11c794b8409248ff41:
>>
>>    arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-08 14:27:20 +0200)
> 
> Days in linux-next:
> ----------------------------------------
>   1 | ++++++++ (8)
>   ...
> 
> So a few things were just applied, unless this was rebased?

This one has been applied lately, but this is news for me, I always took
in account the time spent in the lists, not in linux-next.
I made sure this one landed at least once in -next to trigger CIs.

So if there’s new rules, we should be made aware of those.

> 
> I will wait with this. It might miss the merge window if v7.0 is
> released this weekend.

Ok wow, just like that... I mean the amlogic DT is stable, all patches
patches bindings checks and none is critical since it mainly touches
new platforms and the incriminated commit is a low priority fix for
10y old development boards...

Neil

> 
> Best regards,
> Krzysztof
> 

