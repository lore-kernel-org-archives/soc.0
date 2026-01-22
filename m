Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5265A331A6E
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093554; cv=none; b=cXsJxoLqM0bfrVy2pwCd5lOHHc6CZI0IRUZ1N1+pRTLe/QJkQi6UfZ/uizjAqYCCIPWA3cdBg4raALvoudmQEQ44eUbhGLeUgOAx8CqeTyg2gmS6D7be9165K2p5l0K3TvGbV6Fp8Q77YwDz7J1eDByuNd3o5hiJhXIwIQBn2ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093554; c=relaxed/simple;
	bh=z2Mc+JkNE1M8XCAC/pKgMutUjNfI+7MkOn6CsISsYpY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=mtQgn1uhT1zieCfmMj7QhOuIEukxjfztjBTKDC1vW6Ky8cz3QWlNfozOaJKSy/nTaQPrCSQMUklRHDhiPdNSf1UMsje2JDMEZTfPI9LBrf3y8ngpDEESX8ZJ8lswYBgQ6NnfO3+ErJt9y2p5y5HS+uVP7PD3m+HqBQ1a/Y+93fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VQE4sTOi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VQE4sTOi"
Received: by smtp.kernel.org (Postfix)
	id E1F2AC116D0; Thu, 22 Jan 2026 14:52:33 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E209C116C6
	for <soc@kernel.org>; Thu, 22 Jan 2026 14:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0E209C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43591b55727so909988f8f.3
        for <soc@kernel.org>; Thu, 22 Jan 2026 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769093550; x=1769698350; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUR54Tyd17FTCOVGsEwV6x6lAtcghwoM6kBxhyVcCRI=;
        b=VQE4sTOiZBZXNxra1kLzD8XU1qCYTGpALcpLSa5DkxzYqXfeRnA2KiPLWeM2wE1XSb
         6tgi4DlHFS+baI5wWCVi6u5aCYYsYh2NwwB4BcU7P+e7s/4A7nhbIhhpGZVD+VWbAqtU
         +/DK6o/63B6gye9CkrnEa9Xr4npPTcpVG5eKlgGo8EsgcTvsSyxyTkBcxgrlh3tOzhrh
         r5amkaIJHONYPfeIpG1WU6cMmTnj9Zg0lLeqJjehGzV0v+yS0CRu7XD+IUXxXhmGo0Hh
         ZeTX8rmqeqYGHT3S05POWOHJSTenPbA1MCkuOWHyeKK/dMdSJxZP0yMifcUPV+5Sv64H
         OSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093550; x=1769698350;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUR54Tyd17FTCOVGsEwV6x6lAtcghwoM6kBxhyVcCRI=;
        b=r+oF+20FG1Chga7ho447ToWEXQ3DDDdTAVZAzQrGiUCbuOavgqjee7kdDue58UiSrL
         2c3WY6AbK0zZzM3/bLcQa2OseC6y31/iPerBwplv1/J3P0AE5KIs/frBIHgSSpMqXCYF
         9uI6fvI3QJrPVqYAD6ibmmgmZrj3CN4jvI98BqOkktY69NYUlY7SHC+wNwwMuDJ3HcBh
         WswIQwvFvNhJ2t6OESiqaGBNH2O6pE2wd1+zeE7D3nb50fzpoJOKPwE69Lbjyu32r5R8
         7znibLaaOiIxWrBQmFLbMt7aYLP1M3r6UKH63PldrpbiPxf9Z8ysiH/kEmk3Gv0gCxRb
         b21g==
X-Gm-Message-State: AOJu0Yx2w82nEJXCF1cWN0lQbEa4n5Kd/Wl1XoGotDMpZ7z5vSDG2Xkg
	X3iFX0mA64zfyy42HK2t+whaieDDzB1UWU7ynJprHeqrDFZ4C9Dnj7P4N/XausIeQ9RlWT43JKV
	qH0zW6OJlKA==
X-Gm-Gg: AZuq6aJNPBuQs/scPYURZOnDp6b3iHAt8qK/f5bSVwEZbV4eZEFoY4ilsYTSFDffImW
	9F5WY2gdeqW4Br8mO33hfaZoQTKAB5Tx6I6XVpKd9lghS9AAAI2LAHbWCE3LKsIiyqiyQqSH81z
	J4FH7hYISlAGZk8Ncqrvw0Wn+G2xSZSm4go16C+9VZ67P0hbPAIG+jpArbg7S5ZLMxwUObOvJ07
	zi9hcYcxuPdX4FyKV20udRvHvP/y4E1f7w+2wE0cXLgXwiRrpc7GNe0kpF2QaEGogOCatJXCfDY
	kAdSpRstF50+dr8OM0YYNPYrtJH34KPMl7T7exDJlfbrRGPqhVvp0vWJE8lmGo5k2Yz7DCMezfo
	oWJrmgfkiTj/4L027V6z8TEJeUTMWuGzrRnZvKngnQA0/g6VgskOchuzexEF/wxrIPyNfyYIniZ
	KVeXJNLLikLNytY5tzXvIdhkpOC9j7DBsdBugHXhlHgOMwSjtzlJfk++f9erGOPao=
X-Received: by 2002:a05:6000:1acd:b0:431:656:c73a with SMTP id ffacd0b85a97d-4356a07745fmr33106298f8f.31.1769093550144;
        Thu, 22 Jan 2026 06:52:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258? ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997df75sm45715217f8f.29.2026.01.22.06.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:52:29 -0800 (PST)
Message-ID: <ffd5947f-788a-4fe9-9d64-6298840d0212@linaro.org>
Date: Thu, 22 Jan 2026 15:52:28 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.20
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's drivers updates for Amlogic SoCs, a single new SoC ID addition.

Thanks,
Neil

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.20

for you to fetch changes up to 31fce0d2b13e6a4a12c9ba016e961418f8c82e34:

   soc: amlogic: meson-gx-socinfo: add new SoC id for S905Y4 (2026-01-13 08:58:58 +0100)

----------------------------------------------------------------
Amlogic Drivers for v6.20:
- add new SoC id for S905Y4

----------------------------------------------------------------
Nick Xie (1):
       soc: amlogic: meson-gx-socinfo: add new SoC id for S905Y4

  drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
  1 file changed, 1 insertion(+)
