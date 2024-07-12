Return-Path: <SRS0=twV0=OM=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0975BC2BD09
	for <soc@archiver.kernel.org>; Fri, 12 Jul 2024 10:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BBC1CC4AF07; Fri, 12 Jul 2024 10:06:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7A54C32786
	for <soc@kernel.org>; Fri, 12 Jul 2024 10:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7A54C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4266b1f1b21so12187815e9.1
        for <soc@kernel.org>; Fri, 12 Jul 2024 03:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720778800; x=1721383600; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViaHCNAeG8ihbJc6bdCSZIRUdRyAnEBp69+5NJzbeVY=;
        b=yX7eJ3AKS4K+T2Y95cGFu91yUbRaXjdYRfuB45RE+IBLIkKPfXwCJNWWba4+5FaQbC
         zkxlzvO3yUrEdntJbp0MNxh3PR10KIBxaKhIeYG6luwApkHbgmWMFLes3h91Rr5uR5kE
         VAAfdZP8gzikpYgOlgCbGkno5dbIDKohJr3Z75DLFzvC7g3rBJoVuPeIPbJw/xQ6yyyA
         v4b7ryr6y0IZZlviWEAKeYRojayfA5Bxu32QFaK77+pC9ae+lDGQqbJlXJakaGRhVdgX
         XeYhwg00MRuKtVEmdFKxYbwsV5WC6Kekcpj3dxaKy+EcRqDLBTD8wm6YRCnZxKuHP1to
         EXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720778800; x=1721383600;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ViaHCNAeG8ihbJc6bdCSZIRUdRyAnEBp69+5NJzbeVY=;
        b=GtqG6rgJQpAfao6wSE+hzqK/FJEyZnZllgbc/WIMr7Mxm7zytAhi6jxc0epbK3cvfQ
         geUdQDT4TCk3PdnuqGb2W87wV9MWFkmBHkrfFvmY6m8pTc2ywbPhl/0rqeDxdZxF6Jte
         EJrGDxm0X9iUzkSHXwyzH/xXoDh+bUVhTyoi3/lPs/AawuQFgyYZI5pjEgvfXJ8wHa2B
         /jFsQ7Hct1Ehmpk7SLU/ndFMG8PlX5NU4Yj7SR/xzX6Z00xwqbrQpxwGaSpw8sLi/m7+
         4bbWnVcoM1rxgwyp1BkixnQnEXwkaGbcRsTSlbLHEBji2ENCgvzYo/pBx8iA5xuKgtHh
         AGRQ==
X-Gm-Message-State: AOJu0Yx2nUuX2U6yMHompsjLBIfqVyzdSOS3jZcww0p7kAbDLY3xm5J+
	AV8jAN/yuTXzlMMb4D0Ok17PvmuPmPUXAiN5XIezMrQqLuR1LCZRr7UjikLuEQ4Zx5CY0rsq1h9
	Q
X-Google-Smtp-Source: AGHT+IFjDPNqzHVUPGQZeWkzhMj4GwK79Q50L8ldtb5YVInT6BRpxyTEGawez7JSBfYDoDqBL6iBwg==
X-Received: by 2002:a05:600c:5748:b0:426:597c:7d58 with SMTP id 5b1f17b1804b1-426708fabf5mr69180275e9.39.1720778799904;
        Fri, 12 Jul 2024 03:06:39 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:123f:f92c:dc0b:c36a:f16e:7964? ([2a0d:e487:123f:f92c:dc0b:c36a:f16e:7964])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2c2078sm18516615e9.47.2024.07.12.03.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 03:06:39 -0700 (PDT)
Message-ID: <220683c1-e250-4c55-bbe5-c36e89391c32@linaro.org>
Date: Fri, 12 Jul 2024 12:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.11
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
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

Here's a single Amlogic ARM DT change for v6.11, correcting a binding check error for
a gpio keys node name.

Thanks,
Neil

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.11

for you to fetch changes up to 488386d7ec680c8900f81b3fd7570797935bf1ff:

   ARM: dts: amlogic: meson8b-ec100: align GPIO keys node name with bindings (2024-07-09 17:30:23 +0200)

----------------------------------------------------------------
Amlogic ARM DT changes for v6.11:
- simple dt bindings check fix for gpio keys node name

----------------------------------------------------------------
Krzysztof Kozlowski (1):
       ARM: dts: amlogic: meson8b-ec100: align GPIO keys node name with bindings

  arch/arm/boot/dts/amlogic/meson8b-ec100.dts | 2 --
  1 file changed, 2 deletions(-)
