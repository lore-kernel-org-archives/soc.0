Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5B5143736
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737041012; cv=none; b=h83LuFLXDyl/gfTSJCVJT/w3F0A2WdSb9IhXVICTziCwrfNkCr2ks3fMqJ40vtDe8/wXXmOqjFSJZ5CUoxNNjN4oxoAEAp33GEYz+BKLTHdsItK9/JQlFlt7cvfkTvS9RaHjVUC9f8tT4WzgfsO0fv+gdhmPudfD0L4Lc1aoue4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737041012; c=relaxed/simple;
	bh=P+gUs4RkecxZhOEy/kvf9gsvuNVc3o8um+ZDsf7TTL0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=l96TM+oFq/JAHzN3aQ2IhYsE79st3KXsOv4GMAzBZmWI5vSATFmxAu7G6CxXYJCb7Huc2abtcNHdaT4szDozTqLQqfUEogmP/c/5znNQFsbxEHTacIYct3FakSCUmQU9omGp6PkQSXFw1f9bO+dCsw4qmw0cy//yBjiI/R+Ju5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NbOgzuv0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NbOgzuv0"
Received: by smtp.kernel.org (Postfix)
	id 33004C4CED6; Thu, 16 Jan 2025 15:23:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25A82C4CEE2
	for <soc@kernel.org>; Thu, 16 Jan 2025 15:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25A82C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-386329da1d9so607371f8f.1
        for <soc@kernel.org>; Thu, 16 Jan 2025 07:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737041009; x=1737645809; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlroyb/jMU2zXy9fkhNJx0reIXqOwAkc96UjIWcJbcc=;
        b=NbOgzuv0DqNbro/Mhm6VRzF2dMFldVz96vgZYZ/yowKS0E1WuuvnksPrFzmH985yuD
         FkWXsj6hQS3HiueZ9lF/GLCpR7bWu5JLx9WHc31ENWchLMjpDH8DtJtWSY6gmpdJi1c8
         UdK/4+C766Zeau74UVDcr1nL7ihiotaviHOB9iCwIWWKhy1uEdlUBO5XfPoUrrF+gF5X
         3VSogxyZH9457QMyyPd58TvjZNJrMRRSUPgDJ+WS+PUiyu8GWG9nic3UrjRYeSJwwoPO
         GkDNdrxg1oxlq3HGC7jdJeNFvXX99GVZfVhri/oZZJPVqjXNdi9ibubOHmQJ8Tggo2MJ
         iakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737041009; x=1737645809;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mlroyb/jMU2zXy9fkhNJx0reIXqOwAkc96UjIWcJbcc=;
        b=tt9s4tfbLQwnFbeLZLjzpycDp7iHpFHVeI9GbK/nb2hUE+fkxMYfENdcDS7TZ1YUx0
         fXhFdZh2qd7gljer7z/YiARckhFXfkvsptbemHDonjByCZLDKPU5wkFGV+n3Rmnvs+ai
         rMd5mlYumGAX6bD4iX+9B+sSbYp4VoeiZQtT5dd66tskRcFWRF1iA0vKHZPp5Kk0L7YX
         O18XiMaepoL5JRlSSLQ2MYJjRbxx21NgGrtlyn9llRAiYGov1us//k5lbJUlgZtXWz83
         mgYN35eHZQUKZ2D+p45IBM40i6fboJfDEkx53Ne3zE5P2LkX9JUSg3lTvkbZV33OAl1k
         1tPg==
X-Gm-Message-State: AOJu0YzNALpeURrszAzFg/w5YbEnOPTNVHIj4y+Y9SkVkxZdkwu8xfwT
	KGJI9W43Z+WAQJ20s0HdB+oWjxORXu8Bp6QIF1FNkYNnBA3dWRRfUCr/Qa8wjRRY1ayS0GAjv1J
	a
X-Gm-Gg: ASbGncs16QYGdylSioPMdd1R8AwYjq7T6VzXuHonsA75e67ebzA6SvzKN/RB2+4Q4xp
	lYzopp3S40UVdzRf/eXK231Wb0jTQPvO+mHBs5fZgxqt9yysW1j8062Lulx2THN0uqu+qLfU1Ji
	54SNrVD16lFtvmC/qOgVnAd0X/Lz36oIzr7wld2ZDTcXLEKqdaIhIC4aE3eqUeefZGLVo+EFeFF
	yNLU5Mz0tsKBbnoAw4Cc8Kv39B9Ey4gOw5Dj+phhEDj32Mc8F197V/OE0Ikop1OoJz7Vdd8gkMA
	PHazNWbQwr7a2hsfjRERAooxgRBcXhvymQ==
X-Google-Smtp-Source: AGHT+IH3ev2Y3m0geQ3OUPWjCKlIaWRioGBD546DlWZImq11tIxFW9OCinJY3Zz6eI2GrZ4WeAHyFw==
X-Received: by 2002:a05:6000:1564:b0:38a:8d32:274e with SMTP id ffacd0b85a97d-38a8d322b18mr26448297f8f.5.1737041009433;
        Thu, 16 Jan 2025 07:23:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d? ([2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c75298adsm63384035e9.30.2025.01.16.07.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 07:23:28 -0800 (PST)
Message-ID: <724c4e81-184a-489c-aaaa-85c21a19b64a@linaro.org>
Date: Thu, 16 Jan 2025 16:23:28 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: neil.armstrong@linaro.org
Subject: Re: [GIT PULL] Amlogic drivers updates for v6.14
From: Neil Armstrong <neil.armstrong@linaro.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <d22513cc-c326-443c-982b-78adf755d3dc@linaro.org>
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
In-Reply-To: <d22513cc-c326-443c-982b-78adf755d3dc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 06/01/2025 15:25, Neil Armstrong wrote:
> Hi,
> 
> Here's the final DT bindings change that will give 100% success in Amlogic
> ARM64 & ARM64 DT Bindings checks, with the mmc-slot bindings change routed
> via the MMC tree.

Gentle ping, it doesn't seem you pulled this PR.

Thanks,
Neil

> 
> Thanks,
> Neil
> 
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>    Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.14
> 
> for you to fetch changes up to 960a4140ade8f6ba44e78dc40b80bbf272027805:
> 
>    dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document the System Control registers found on early Meson SoC (2024-12-11 09:49:49 +0100)
> 
> ----------------------------------------------------------------
> Amlogic drivers changes for v6.14:
> - Document the System Control registers found on early Meson SoC
> 
> ----------------------------------------------------------------
> Neil Armstrong (1):
>        dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document the System Control registers found on early Meson SoC
> 
>   .../bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 

