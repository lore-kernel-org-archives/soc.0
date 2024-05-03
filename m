Return-Path: <SRS0=u4mD=MG=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795D8C4345F
	for <soc@archiver.kernel.org>; Fri,  3 May 2024 08:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63625C4AF19; Fri,  3 May 2024 08:34:27 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D78CC116B1
	for <soc@kernel.org>; Fri,  3 May 2024 08:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D78CC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e242b1df60so6084311fa.1
        for <soc@kernel.org>; Fri, 03 May 2024 01:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714725264; x=1715330064; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qOIGpp+UI7FlgvnWTiaj9AF30Udmc4L7gLFm5A9fuzU=;
        b=y2fuRTr8Jp4vcTaX+wLhcaYaozFXBEJc/tA3/FEHcX5vivtHnhUcKJbVEN/PwQnMrK
         OWWMmammpvu536JnxZq8t7V7BG3vKxuCuseQnl3YLrTJ87l1JEJHFzbFi1bdERz3BUEb
         69XMQ6W1NobzJDkUJdm3w610Jvkjb1XEKIR47GBtBZgKBVrKbkY3QPzGi0nKdxm4exaN
         RwpFFsXKhn57n/Zqdb80p9qaM0v2JiQY8WsMnpBUWGlMmeOQXiJw9ZwFnO7HZGmhKrcB
         RgpTI78oJWfjQbwDMc749wnAMGMdBFZPa/pNnAF7y3DgljLYjkqQVQfMp15Bq/hb0pGa
         TXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714725264; x=1715330064;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOIGpp+UI7FlgvnWTiaj9AF30Udmc4L7gLFm5A9fuzU=;
        b=sXk43m7WqdbU/3UrSeyRnxj6U+CFhg2Ffx/f+gq9nPF6cG0MyTQvYVUrcnhLHyVGB4
         2yKRDKyJCXu7k/aBjghZlWX0CWsSMmCOQJ0FCAw9hJ8vR4cKkdtIDtWXbdTHnek3eq/F
         4sL0qFbQLt93IYgFvSW54SCI5T+GzMwXeL847B0lGI4cuseiIdodEm85B2+UfMZYWHn2
         IUHfl+1230AczjDBBeqwY4PoU/B1MseIuaYG5OaFoLen3ha5RA1icGlHCGvHBjnfJ4Q9
         kGKEZugvyF/wrtbeBoBBHF8HUrWNbU79uGGr4EFONhG2UDQjvsIWHe7kxkCloZThRUGw
         W/KQ==
X-Gm-Message-State: AOJu0YwUIIljSl8mO9vqUr4m4apPqCIsozYK3NIvpiJaolqxNjohZgki
	gQ1P8uJ4h0Tq60UL+i2VJw052ap8zo9Y7Bz0g4uAHwYlvdsS3UWbyEhn5Gb1jBLOIT3PvJWYWxa
	jMCk=
X-Google-Smtp-Source: AGHT+IGGTVCKUZpd9nxrLaMW9MPrZZHef1AgJCu+TEJjPw7NkF5hZAooohOdNcL5VycwN96eAnfaAA==
X-Received: by 2002:a2e:7312:0:b0:2e0:3f37:5af5 with SMTP id o18-20020a2e7312000000b002e03f375af5mr1508286ljc.41.1714725264448;
        Fri, 03 May 2024 01:34:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2? ([2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2])
        by smtp.gmail.com with ESMTPSA id q8-20020a05600c46c800b0041ac4aafd3dsm4818075wmo.12.2024.05.03.01.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 01:34:24 -0700 (PDT)
Message-ID: <13bf8bc4-1cb7-4b94-8c98-9d1cdae5e1f8@linaro.org>
Date: Fri, 3 May 2024 10:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic defconfig update for v6.10
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

Here's a simple Amlogic Defconfig changeset for v6.10 enabling the
Khadas TS050 panel driver as module.

Neil

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-defconfig-for-v6.10

for you to fetch changes up to fb73c312a939cfcf9bae0d88fdb382516b424e50:

   arm64: defconfig: enable Khadas TS050 panel as module (2024-05-03 10:23:35 +0200)

----------------------------------------------------------------
Amlogic defconfig changes for v6.10:
- Enable Khadas TS050 driver as module

----------------------------------------------------------------
Neil Armstrong (1):
       arm64: defconfig: enable Khadas TS050 panel as module

  arch/arm64/configs/defconfig | 1 +
  1 file changed, 1 insertion(+)
