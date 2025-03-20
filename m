Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D1211710
	for <soc@lists.linux.dev>; Thu, 20 Mar 2025 08:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742459249; cv=none; b=mjzVDIqR8o+eIOl3HidBokBV7e5s+Bc0e1ws/ItUxcU6Vi4KbMCuq3mMrPt8r4/NQc6avRHigCamMq5kkb5g6VhRvoEz0lyBgGHY7NuwAwfTQqpTZG5+X4iRcZ6/vcgzMpjPsiER6rY3fbxGXPYrvrwvDa8+XwXhRqTvpxNL6cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742459249; c=relaxed/simple;
	bh=YthTGfDyr3VuWYwWaxSDq4m8gwx6ApOI6Hd+DFGWo4Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=j7sRMqvgsAH9ob+xPQ41lujRfC+GR2uEp51PM38ipsF4q91cMq/aeyw/njijHjGnU8DG3XsPxJkRciz7wDNCW87gQ9PnG0ftBgUWulGHMZ4TCEl4vmBsGjwktNbLqO7aFhxG9T21y5dXDO4kik4gHL2WvBjxH+kqgnnz8lBjPoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CvsKkIXN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvsKkIXN"
Received: by smtp.kernel.org (Postfix)
	id 3D9C9C4CEDD; Thu, 20 Mar 2025 08:27:29 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A37AFC4CEE7
	for <soc@kernel.org>; Thu, 20 Mar 2025 08:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A37AFC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe574976so2392105e9.1
        for <soc@kernel.org>; Thu, 20 Mar 2025 01:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742459246; x=1743064046; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+erH12JTFHkGszHXH70kAPUXVCU5rQMoVMOmGYqd4SQ=;
        b=CvsKkIXNUWKrpyiLGagumC2av0g+zalfIqSO5JdmAlECpu97qPn7C66IoYuRyicOrL
         XTk/WuCaC4GwoiFL29bl2m5ld3cEk+gx4C42xvXtrRc/ewPuLbHzhrXsFVK4X7hpfqEL
         /wXxoXs8Z/7BnnibnTJb7N6VX3kOm7ksTyqhLYSMgnc3vibHncoCpQ7lhbX+DKrwdPib
         C07XH060sgHI177YqPZAhqpSpt6vSl+0GRpUTwEftCok5kbjr8vRkvUg/G9wa0pV5Fgt
         RVgPhqEFMoTCVWRzzv3hSPJQMsW9fGiQ9LgCLZz30RQ4+zbdQJsy+jTtUDF8cS3jrRBD
         bTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742459246; x=1743064046;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+erH12JTFHkGszHXH70kAPUXVCU5rQMoVMOmGYqd4SQ=;
        b=rOBuRXyDNLqvO+06w+E+YE+lVLfVepLfw0V7TqjGAobJIMbk4hHNvcS9j0PkBwLV20
         J5ur4lES7e5i1SrpYvlT2ADD0ieI9i9/TqXkrB4Nc281MhudXP4pBlee5EKwzLJ58El1
         Fz34KLEZDvvQlOJNc266dcxVw62J/rIwEpXk6/f8xjfaUU9SSdBHPN8dYXJ3eSmf4K6W
         34ZsqwKQ2nvYs5wM6YtzZMHxvjdXKb9LTJST2aKepaRQ/cluormubAvG7iu/q/0Osrsc
         JFitiqmHKYuz2f+YL1uWb4q7Er295Vfwq8dP2uogopb0ly1F09cAyYtOq6GvlOv8BLiw
         p1gA==
X-Forwarded-Encrypted: i=1; AJvYcCWHFp8UCsjrGqpFlrN5bk/i8hMgIQi7p8RcLtGLqyJKcrRu0un7d8oaRflUuaGI+lDrOUk=@kernel.org
X-Gm-Message-State: AOJu0YyR9dYQnFkD6qA/ojuF7cECjKGCsaQfo7ZkPHo3HqayNnNqJhaU
	B0C2ug21vKR49C7TbN0rJfoeE/CtiJaVEWkOEobXWmXNUxD5UhvCyIglDWcvFZU=
X-Gm-Gg: ASbGncswD3q+2tVgQKih+e+NwzKsGYtjgqqEfvKuEVzy7ZGS7rdpSR/UiflxvYd0pIN
	XDfUk6eU4cpUMGkIqQLmb/8p4U7pereijpEZcNrUy41OLJmDOlE2mbswhDZ+gHQFy0vRxjQTGmw
	9MjwOJDVm+1SgjLZHC4/tFUETwWnxDj/U3heqWNmMf17g7yVweBuJ89QCMyMpgWRZkRYVQHdeEk
	PgdyAE9Bhe1jKu+ngSj3aB1SiW6tlANHYQqDmIten0qFOzFDIvCTxUh2d/JrbY3Fbta3rFGKr8z
	XLo0302mgWkpjW+hMIVpL2so95cLbjkTjUyAiMFyTSahgr7vsSEucdUSao3v4BBoBfMaCTgTWYT
	zJFbS0/Shl1p8gKOU0KRT4uE5SQ==
X-Google-Smtp-Source: AGHT+IF9ntj9rVCuYJmVSLlknrn3/lHxFJEaoLc1jGC6Y/jMguf0SnRpjv0h4ucU2vCCQxEgs4Fv/A==
X-Received: by 2002:a05:600c:4e0f:b0:43c:e9d0:9ee5 with SMTP id 5b1f17b1804b1-43d437937a5mr57216825e9.18.1742459245849;
        Thu, 20 Mar 2025 01:27:25 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:41cf:ed29:6024:4821:e502:e016? ([2a0d:e487:41cf:ed29:6024:4821:e502:e016])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3ae040f9sm55512075e9.0.2025.03.20.01.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 01:27:25 -0700 (PDT)
Message-ID: <49026ae3-bf51-40ee-990a-e1cfc03e0c35@linaro.org>
Date: Thu, 20 Mar 2025 09:27:23 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.15
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <41ced8db-caeb-4deb-9193-9802fc603180@linaro.org>
 <47683e40-aa0e-4d86-9226-94f7d56f34ae@app.fastmail.com>
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
In-Reply-To: <47683e40-aa0e-4d86-9226-94f7d56f34ae@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/03/2025 21:57, Arnd Bergmann wrote:
> On Mon, Mar 17, 2025, at 17:13, Neil Armstrong wrote:
>> Hi,
>>
>> Here's a changeset for Amlogic ARM64 DT, also switching to the new PWM bindings,
>> adding pinctrl support for Amlogic A4 SoC with a brand new binding style then
>> finally gpio_intc node for Amlogic A4 & A5 SoCs.
> 
> I'll skip this one for 6.15, seeing that the branch contains both
> driver and devicetree changes, which messes up the way I send
> the contents.

Sure, I can strip out the pinctrl DT changes, since they can definitely wait another cycle.

> 
>  From the description I also can't tell to what degree there is
> backwards compatibility in the new binding, I assume the changed
> PWM and pinctrl drivers continue to work find with the old dts
> but not the other way round, which is why you sent them together?

For the PWM bindings, they are in -next for a long time already, and
everything was done to keep the old bindings still work over time.

So we're pretty confident it works fine since it has run over CI for
multiple months.

I'll resent a new PR without the new A4 pinctrl changes.

Thanks,
Neil

> 
>       Arnd

