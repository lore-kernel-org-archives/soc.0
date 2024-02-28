Return-Path: <SRS0=TB8A=KF=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9698DC47DD9
	for <soc@archiver.kernel.org>; Wed, 28 Feb 2024 08:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D030C433F1; Wed, 28 Feb 2024 08:40:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F176C433C7
	for <soc@kernel.org>; Wed, 28 Feb 2024 08:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F176C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-412b20dc555so5694895e9.3
        for <soc@kernel.org>; Wed, 28 Feb 2024 00:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709109635; x=1709714435; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jUu2uy0p2IpnzUEB//uQxtY12cZ7UCFdxLeU35hb/g=;
        b=M7yjHSqYXJBCrDhL5jtgl0Rt2xORwRE6unhcA03PrslvvbPoLB8TET6fg0Ye5oRZkD
         iVMatTz18vYot94LoG8vIIG/gfDvbW9Mf2KDCyeTbvas9K4gRtgZM9Xrlhj0XFP28JOI
         cHNvapvT42WQXEs0UgOsfNejbKmtyJ4DWDJd941Cn3W4s6MB7VlNDQ2R25M/bCzMyt7b
         DmdmtG9HqCngRbVNARI2+aFk6Ol4Y6bEknqMBx/IBgyQpxqer1K8wNiR1nSNZczvAuEc
         I2l9iZz++BH5nCUdhoef2/OnOeGEgCsqGy5KdNg88PFE8KeNu6Gdvy+ouxCUhHs+uppW
         hnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709109635; x=1709714435;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jUu2uy0p2IpnzUEB//uQxtY12cZ7UCFdxLeU35hb/g=;
        b=bwr5o5cFbNqy1KloAMQR+is79ZAxMcK2S3IZBCIEBH/bjh1Vl+kROsv3d2lmEFPPy5
         AkO+TRG04LKuzpMMlpaV/hcf6QLo7jpAPPtnH1ln7HfvpMyVXk65uojCPn2u1g9kQ4Mu
         s3M5n0OSYhjTwP0FtIHBouLe3nxG1pQUg5kiAD8zr8uB73i6Jh37Pw+oMyi7TPw2JkNV
         AocbUPaspWsr8lXabjiS8i5HVc2ly/hwKhhTfRkKF13mmRBC10Ksd+59wl5H59dkp14t
         COMXvUGMQZwrl4ERpzCTHOdqH0B19mem3gjdNo283mg0TYvw7jI0lgDLJ1GPit1icoFi
         p36A==
X-Gm-Message-State: AOJu0YyzqeFiu3MccyAxlUWgQNmjrGBTGmdPnxFdmHcsTb43+Mh7qFOl
	j42o4W7fkAjRvPM0klNFMzNWiTO71dxToSeEk01VH5ttS7fQNn6ELc+4Z/xT+s+sbjlOWjU1Mp1
	QHpk=
X-Google-Smtp-Source: AGHT+IEkPVIC6W2dTP2yze/D6cpf5DvUZ1YIJUqvsKdDOKL9grIjorJJQ2tOrJ8i2ZG42X+Mm1Witw==
X-Received: by 2002:a05:600c:310d:b0:412:b5ce:6e07 with SMTP id g13-20020a05600c310d00b00412b5ce6e07mr488284wmo.26.1709109634644;
        Wed, 28 Feb 2024 00:40:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8e80:16d6:ae57:b1cb? ([2a01:e0a:982:cbb0:8e80:16d6:ae57:b1cb])
        by smtp.gmail.com with ESMTPSA id cc13-20020a5d5c0d000000b0033db0bbc2ccsm14384186wrb.3.2024.02.28.00.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 00:40:34 -0800 (PST)
Message-ID: <b9c60991-65b3-4c80-bf43-b3bb95bea9e4@linaro.org>
Date: Wed, 28 Feb 2024 09:40:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM updates for v6.9
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
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of fixups for Amlogic ARM DT  for v6.9,

Neil

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.9

for you to fetch changes up to 778a2c000470ee56551d0833a0eaa387530e4bec:

   ARM: dts: meson8b: fix &hwrng node compatible string (2024-02-19 09:55:01 +0100)

----------------------------------------------------------------
Amlogic ARM mach-meson changes for v6.9:
- bus name & node compatible DT fixups for bindings check

----------------------------------------------------------------
Martin Blumenstingl (3):
       ARM: dts: meson: fix bus node names
       ARM: dts: meson8: fix &hwrng node compatible string
       ARM: dts: meson8b: fix &hwrng node compatible string

  arch/arm/boot/dts/amlogic/meson.dtsi   | 6 +++---
  arch/arm/boot/dts/amlogic/meson8.dtsi  | 1 -
  arch/arm/boot/dts/amlogic/meson8b.dtsi | 1 -
  3 files changed, 3 insertions(+), 5 deletions(-)
