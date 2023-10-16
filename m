Return-Path: <SRS0=eUZ1=F6=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF96CDB474
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 08:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2888BC433CC; Mon, 16 Oct 2023 08:37:41 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A04BC433C8
	for <soc@kernel.org>; Mon, 16 Oct 2023 08:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A04BC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4075c58ac39so43534725e9.3
        for <soc@kernel.org>; Mon, 16 Oct 2023 01:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697445458; x=1698050258; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTcYqYafZKh61MOwbQxVbQ/Lja6In1E83xTrWheBRJc=;
        b=UQcfqljIfBNFWAsSCo5S5kqh/3V0+3kOhoqJ0flVeijfVmayeln6BTiul/BlnoW2u6
         CGrO4uso+IerIeuMSXupC2tF9WxZ+9KQUdGHQ59eivduAYtJXP2ThjjXqzgqAw9jA1U7
         oxuILoukUx6eXh1A6nIlAn2GGJqUVXJaQ8lppPn/GXZ2rphTzIBQz9OwZkBpEU+pb9zc
         FodEA55VZ2Ch3veqVFgdqhxCYqgy8KeXG4PlbBVRZZ8ak+E0engYVlRCfSGBuC2Uv8Jd
         P5J7M4OH+rekmVw6jeNiDazoEQfxbRox5C5xmz3FI+3Huc0U5WeaI7xn7U5nYUz1x9Rg
         S9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697445458; x=1698050258;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rTcYqYafZKh61MOwbQxVbQ/Lja6In1E83xTrWheBRJc=;
        b=bphUSlVaQS774EjUdqiCFrtGFOzaGBomBkKckmSKOF7/ULTOnlGxhk5PCA12XouR/p
         cmfeSxrbY8p5oOtJYoEV9KBKTTpbGVMaSzT88ctoE5Cl8923on+yH2GhUfAew733dd5G
         dU94oVW4d+TaDhsDRdnBiDcF6KocnN8yJ8IqkFNCkrj5+vs9hY1Gg9wzxvOYElgJedTP
         +KdV/qLLwOwjVzp2kDneTrcCm4ozaNu4WUvj6biFXdA/lmoYyA8/Hxh7JiChtcKB6v02
         LOHSzNd/T3y0NndXfRCJs1O2GotNzuuw9DBS1ICeTZMGp+P8Wy1XRLWFPkH0tAVVESC/
         zyEA==
X-Gm-Message-State: AOJu0YyR3+Vfft6XKGnJS3KqiY8lVbngvGJkIXpKOzLYErZa4Fabygbw
	KGXjxAY7kK/ZVTYVCN1cMLH6HFCcX3CrXqooYDNJEAcJ
X-Google-Smtp-Source: AGHT+IHsEMQ8SCTS8ZorNLkIIvReNSc630e0ztnD1QL89wKHDLcTVq16AdmilglEKYOkydPvSU9ppQ==
X-Received: by 2002:a05:600c:b4b:b0:405:3b1f:968b with SMTP id k11-20020a05600c0b4b00b004053b1f968bmr29498842wmr.21.1697445458392;
        Mon, 16 Oct 2023 01:37:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b5ab:4a16:fd45:8130? ([2a01:e0a:982:cbb0:b5ab:4a16:fd45:8130])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c358b00b004075d5664basm6629320wmq.8.2023.10.16.01.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 01:37:38 -0700 (PDT)
Message-ID: <00ef6ab3-59c1-484a-9d70-50f16e4cc584@linaro.org>
Date: Mon, 16 Oct 2023 10:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic Drivers updates for v6.7
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

Here's an Amlogic Drivers changeset for v6.7, with only a couple of
low priority fixes concerning the meson_sm driver.

Neil

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.7

for you to fetch changes up to 5d59b6a49bb8f6841acf53affc0c4720fe7450e5:

   firmware: meson: Use device_get_match_data() (2023-10-09 10:48:15 +0200)

----------------------------------------------------------------
Amlogic drivers changes for v6.7:
- correct meson_sm_* API retval handling
- Use device_get_match_data() in meson SM

----------------------------------------------------------------
Alexey Romanov (1):
       drivers: meson: sm: correct meson_sm_* API retval handling

Rob Herring (1):
       firmware: meson: Use device_get_match_data()

  drivers/firmware/meson/meson_sm.c       | 25 ++++++++++++++++---------
  include/linux/firmware/meson/meson_sm.h |  2 +-
  2 files changed, 17 insertions(+), 10 deletions(-)
