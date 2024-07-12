Return-Path: <SRS0=twV0=OM=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5CEC2BD09
	for <soc@archiver.kernel.org>; Fri, 12 Jul 2024 10:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B47D2C4AF0C; Fri, 12 Jul 2024 10:09:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA994C32782
	for <soc@kernel.org>; Fri, 12 Jul 2024 10:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA994C32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4266ea6a488so14524775e9.1
        for <soc@kernel.org>; Fri, 12 Jul 2024 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720778983; x=1721383783; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TiwMVqGgBWGhXcER0nCBtLIs2MWDaYiuBsqvkHeF/7k=;
        b=HgB2vQ7X3EFzNfDHwv5LqpWmuX1Pq2eF+vUIolJp3RmfyMR/PaigMBb+d6VlDZGTle
         +XZqqI2anhuhLgw8tFtW4xNJjbxjD7hyM6cQlhpo/4wlfDBSwpf66dmVajPo3OrB87BP
         zeAbMP85BWBFXx/gDyr85CCoSgZaBE3sU27XUHyNmI+814Q4kAe5/UCUnGReKQvWtDkr
         AkPrvznKmCr2mOf2WsP2EP8pyX82z9GTihSmve8tqUq5hkjdDXNQfmYGvqXbOE1RbEdF
         CKUG/PnJqeRdAnKkDDbJlzi1R2QQ66XafRC6BuPcGkZhktsHTHECtidK4vSnKxaJQT5E
         XQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720778983; x=1721383783;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TiwMVqGgBWGhXcER0nCBtLIs2MWDaYiuBsqvkHeF/7k=;
        b=S5N7lSQ0n4ZW+omGqACFViTrBhpmEZY5djGI9W53yyJIACEfywpdYJmlvJFHtwAxl+
         HickDkYAoQPfHKkOSZh5iEnW1kIIa3leWoE3vvrNR/mN+VTymb8NVoU9kU93tAS76MAs
         sfC//qiefvWsvyVpYC/In+YTybZiioXscQE2TTGWCNmHOeNW+i7YhHb++fgdKyVyW+nU
         zykL7r+1PgSoVQQzX6VfDgAZraMz5qWKi4w6hgZ5q4v4E0JXn3u1BReLoWuAjhhiPFwg
         XYXpgxdPhpRloic3YOZpKuoDLKYlgK22oeyRCUh5JJJghYwfYdgdzCmtOTxw6CHnW3xK
         /rrg==
X-Gm-Message-State: AOJu0YwOd2q283gPBwTnRTot5mfKG4+pgCu8GYLXjnSzmIkQEjXrOZtt
	qOqq1uLiqkJWrX9gCEMb5TXmrGRhQ9cD0WJypFbChfCz3sgv3fBJ34WbQ37fYG27bll+nq/mPAF
	D
X-Google-Smtp-Source: AGHT+IH5s2V+DJ+Mg475jEQzq3YEFuiu4gRnmubqYbwskqcjAGe3kG2fO4b9+LV/TZeusErFvbT53g==
X-Received: by 2002:a05:600c:2d84:b0:426:5e8e:aa48 with SMTP id 5b1f17b1804b1-426707db6d5mr96144765e9.22.1720778982874;
        Fri, 12 Jul 2024 03:09:42 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:123f:f92c:dc0b:c36a:f16e:7964? ([2a0d:e487:123f:f92c:dc0b:c36a:f16e:7964])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2cc286sm18561655e9.33.2024.07.12.03.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 03:09:42 -0700 (PDT)
Message-ID: <d7810433-71a2-45c2-9095-4abd23c12431@linaro.org>
Date: Fri, 12 Jul 2024 12:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.11, take 2
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

Here's a second set of Amlogic ARM64 DT changes for v6.11, with:
- Amlogic A5 power domain
- Amlogic S4 supplementary device nodes
- Watchdog for Amlogic A4

I again merged  Ulf's immutable dt branch for the A5 Power Domain DT changes.

Thanks,
Neil

The following changes since commit 1443b6ea806dfcdcee6c894784332c9c947ac319:

   arm64: dts: amlogic: setup hdmi system clock (2024-06-28 10:10:42 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.11-take-2

for you to fetch changes up to 34b60b78550eedbb596274f0336d1f86a80fcd19:

   arm64: dts: amlogic: add watchdog node for A4 SoCs (2024-07-10 09:40:08 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.11, take2:
- Amlogic A5 power domain (+ merge of pmdomain/dt immutable branch)
- Amlogic S4 supplementary device nodes
- Watchdog for Amlogic A4

----------------------------------------------------------------
Huqiang Qin (1):
       arm64: dts: amlogic: add watchdog node for A4 SoCs

Neil Armstrong (1):
       Merge branch 'dt' of https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm into v6.11/arm64-dt

Xianwei Zhao (3):
       dt-bindings: power: add Amlogic A5 power domains
       arm64: dts: amlogic: a5: add power domain controller node
       arm64: dts: amlogic: enable some device nodes for S4

  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |   1 +
  arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi |   6 +
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  10 ++
  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 145 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 128 ++++++++++++++++++
  include/dt-bindings/power/amlogic,a5-pwrc.h        |  21 +++
  6 files changed, 311 insertions(+)
  create mode 100644 include/dt-bindings/power/amlogic,a5-pwrc.h
