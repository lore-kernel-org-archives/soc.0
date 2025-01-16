Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB0E22FAC3
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737053976; cv=none; b=Cwz+5NIFOo1V+E6SBxmkmI20C5j36MoiXgg4Lay2sUGWgZLlTVri3wGPC9r0vvs+LbUilqWsiHeTdiSqUS9ukXLW650UlGzCwa6yEE8UM2ounRVlf5Pg3MtHf5NhngBU7UBlEy9u5c9pZ5Cx3gz8EUuEuj8nXLUOcAsgb1o0GW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737053976; c=relaxed/simple;
	bh=Ay5wvUvC3GInTtwVNHWTLCokWh2rzb8xAA7X0ZIBJ7w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jldQz/WVw1/UkcluMlx95CZaAHe70tmnHsyVzhSjVB0czFqG4Q0Kj2pkNUr0l3kQ6qvMd8gXQmShhtlg7g/FvIDFemV2BQa3BwmBd8Wv+Xy61TuuCuL7tTGZs3ysHozIPmGGx+CnbSUMkOUKaT0DYs20f7MKgpPlSdn4G1kXnrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N7R31XkJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N7R31XkJ"
Received: by smtp.kernel.org (Postfix)
	id A9423C4CEE2; Thu, 16 Jan 2025 18:59:34 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 808FCC4CED6
	for <soc@kernel.org>; Thu, 16 Jan 2025 18:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 808FCC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385deda28b3so887757f8f.0
        for <soc@kernel.org>; Thu, 16 Jan 2025 10:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737053972; x=1737658772; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37HtimKr485PbaD3XoteeqWp1nYoQComDij3qR3WGqc=;
        b=N7R31XkJ+xtOzowgsIuO0LN23y5fk9KRai01VvW2bGJEBkNVDqp2ue3wNh/2VgIrZ2
         XZltrYlmsXeW9nBcI4BeDT585CNivlEESProPtN+wHbATnc2l8pBRMZUvl+cz7/rtjSq
         hVRY7ZLYXPEFzK0B1bHXC0ljeAw799SYbqozeIkUXLgkz/m53QjajCLZrsC16ux2ImIS
         YdUeF4bHvtM3Qqe29k72cbppBfJZnRxIN/YxC+TTm0+iwWmTO4W0CwsNpSSIn8fFM0zT
         0TUAZHd+uO/YEm3TqhluaFP66e6iAlprfmq3uItQX1GA7M8yyoOgIVB48wC/o3MAhTSZ
         FRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737053972; x=1737658772;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=37HtimKr485PbaD3XoteeqWp1nYoQComDij3qR3WGqc=;
        b=Z+EFggbFRUX3FAouToxPNwe/tSkq1uXDfPOkemwd540M+Kd9Zf74LlG/NS8a2arGnO
         lpQtQKxdFNI3s3kzoaPSzKzvxxvTSmnFBjHtRwXrL2DA2QmL4xSbBpQ/1qAic9xzbA3v
         GWFLvyX0Mi6BBNCHQpzGFoS/CD/oPzwyi3IniwnazXZVr1AI45LTXC/4iGxDmfa7NWqD
         WY2laHnw6fP9RvNmfTfTuu5SofYSO3/cDWb7DL8PQAI8fesxTizQtbU0FeWyYw+u5fuv
         CAE6NfnTUmg64UvL617yD2OYARzus1AIiedCAomvT3zUOJWMXKYuNnD1YmSAaGdmSWyt
         zUcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk/Ppk7ZhpLwh73+PLJ6W/GNbx6+uJN93dLTfd2otvF/IO1uX6qgM/RyijxfQ/yf48Bj4=@kernel.org
X-Gm-Message-State: AOJu0Yw1b+9ByEFLaaRZ0xowsVpK0KLekcqwWegpd4c2Hh350XHCqPQL
	Bsh65LFOwnOsWQEP39w+dyQprhqYStlRi1DQyx8gWpksz+HKsE726dSIYyrB7MI=
X-Gm-Gg: ASbGnctmhFgV8eLm2asT19zXIcJI+sMLxO0S2wjNph9s5ayEX8t5Po/u32HgGsgx0A8
	DvV5NwTliCD0uE3tIe0Y6g6Yr41SNAY6Qc7Zas0nbFEtx8h9kJqY/bV6iH2ABG3A2xO0jGIwJ/f
	qwXXYY9iZ6inc8OyNomL/pq3XX0LSEWKtpDE1xHbvlTLoNVxdet83UY3KHz5fxrzaEQWxCaB5X9
	Z8J2R0dR3zB1G12PAxaj+zM3orPtOffK99/4x/BbHsw4qsRqTG+hXXE/4gNuet69o7nlUFTeqrG
	Uv9HKbhQnJH/vf3yNu76DAk9FjZQai+ATQ==
X-Google-Smtp-Source: AGHT+IH3W6FfvO5MKHlIxezNlbuPTL0ABpO9AzP7DQkWpt737/v72/n+Y0P8KUBuGXfr0M9VdKfUyw==
X-Received: by 2002:a5d:64eb:0:b0:385:f349:fffb with SMTP id ffacd0b85a97d-38a8732c439mr31526672f8f.45.1737053971883;
        Thu, 16 Jan 2025 10:59:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d? ([2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904625f5sm7932335e9.28.2025.01.16.10.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 10:59:31 -0800 (PST)
Message-ID: <6bb8e9c3-5eec-40c4-8685-d016579a04fd@linaro.org>
Date: Thu, 16 Jan 2025 19:59:30 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [GIT PULL] Amlogic drivers updates for v6.14
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <d22513cc-c326-443c-982b-78adf755d3dc@linaro.org>
 <724c4e81-184a-489c-aaaa-85c21a19b64a@linaro.org>
 <909e85a4-8861-41ee-8b4b-97d4bad29994@app.fastmail.com>
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
In-Reply-To: <909e85a4-8861-41ee-8b4b-97d4bad29994@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/01/2025 17:39, Arnd Bergmann wrote:
> On Thu, Jan 16, 2025, at 16:23, Neil Armstrong wrote:
>> On 06/01/2025 15:25, Neil Armstrong wrote:
>>> Hi,
>>>
>>> Here's the final DT bindings change that will give 100% success in Amlogic
>>> ARM64 & ARM64 DT Bindings checks, with the mmc-slot bindings change routed
>>> via the MMC tree.
>>
>> Gentle ping, it doesn't seem you pulled this PR.
> 
> Thanks for catching this, I had indeed missed it in my first pass
> through the backlog.
> 
> When I first looked at the "drivers" branches, I decided to skip
> it and instead merge it into the soc/dt branch since it's just
> binding updates. I don't normally care which of the two (or both)
> the binding updates go through, but if the drivers don't depend
> on it, I pick soc/dt.

Yeah I was unsure which tree using, yeah next time I'll properly use the
DT tree if there's no C changes.

> 
> When I later looked through the dts branches, I skipped over this
> because the subject said "drivers". I'm now in the second pass of
> looking at everything I skipped originally, and would have
> eventually caught it, but it does help to have you look at what
> I'm doing to ensure it doesn't get lost entirely.

You're welcome!

Thanks,
Neil

> 
>        Arnd

