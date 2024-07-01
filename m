Return-Path: <SRS0=KWei=OB=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E07C2BD09
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 08:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50FADC32786; Mon,  1 Jul 2024 08:38:08 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8D9BC116B1
	for <soc@kernel.org>; Mon,  1 Jul 2024 08:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8D9BC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-366e70d0330so1753783f8f.1
        for <soc@kernel.org>; Mon, 01 Jul 2024 01:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719823085; x=1720427885; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxVs/aFlSL+ewuyexawKywQPxcZUDdKkKdHaRAPiuwY=;
        b=d4En+nJUkf5MRjyKg6QVWwChA5JWAnz3SF8kwN5DOOzYFup+qLINFGMKp7dFA/9qIO
         /2fCSESjxmwYFrp8ioc13erQp4UMLxyGguuNm0+Tn/B02jrhUNyED8fX6TF5jlANCBb6
         ESG5ND8aTYM26vVHuGZIXvyC9tGulxa5FbAHaZ87I5VsTTR/rkR+xKFLvMF57NL07lTr
         SYTGuGLlsDFROdY3hczNiI4QOrMBl80QaclJ1bruAjvFyBbsjv2UCD4DbMnsNbY0Rovk
         oxwoxoYLiIHJ129L8n7VRA1fyR6/sWPuRgTvTt8pg5MTD8v0ZZ564iTQ+ovhcWSgFqrf
         bp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719823085; x=1720427885;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxVs/aFlSL+ewuyexawKywQPxcZUDdKkKdHaRAPiuwY=;
        b=BMMtMcSp52GnHMsSjiJ5YU9uYOp73N9IGVapALjrsuxO/GG/LMf1RBafCbiEgQbumz
         jG4Qm5e4DJR227nlX8Z1zPUrPRT0oOfbFGxHMw/B5L2ch/56kPin5/afzrwAU+5K0Mut
         AW3clgz4tbALUo/lVw0/foQKPtabHwirfQ+ducKC9v6+hdFwaWJlsZTdzqBgf+RDj44j
         +awAASIILgmTJvUCSwPEatV9rhOp82bFdPZnLNYlSOcydens5uV5014unrupEeFQ4ZTN
         bjTaJ/A+P2VxyFKZQd7PT6JuQSa0w2i8E8Lu1fx/QhmWhJqTSGKgjhFHv5Djdy26ovx/
         b88Q==
X-Gm-Message-State: AOJu0YyE3iTfG0o8Nrbc5+JgBo/wxl55U13jgdOy6RPWDbdJHCyxDX9I
	DgsyRT+6ainzrVbzfaabEzHCJC4pvpkc+htCys0Atlfiqlao/SPHeufb/Z1Jk1JN/4tBuEMr/Bl
	LHYfK/w==
X-Google-Smtp-Source: AGHT+IEC+y0QGzsFdQF98bWxNSJQWWcmdbLYujB9UH+gGS0CAQK2LeEtDTr24X4WKIbxypVU1ZvcTQ==
X-Received: by 2002:a5d:5301:0:b0:367:40e6:46bd with SMTP id ffacd0b85a97d-3677572985bmr2724924f8f.61.1719823084737;
        Mon, 01 Jul 2024 01:38:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4719:99ea:652b:10d0? ([2a01:e0a:982:cbb0:4719:99ea:652b:10d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d8cd8sm9347934f8f.27.2024.07.01.01.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 01:38:04 -0700 (PDT)
Message-ID: <35093904-c4a8-432d-b010-a994fc1ee536@linaro.org>
Date: Mon, 1 Jul 2024 10:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic drivers updates for v6.11
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

Here's a couple of new SoC IDs and MODULE_DESCRIPTION() fixuo for meson_sm.

Thanks,
Neil

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.11

for you to fetch changes up to 5375986e16207e573c0493009d25b0c01f44e01d:

   firmware: meson_sm: add missing MODULE_DESCRIPTION() macro (2024-06-24 10:08:53 +0200)

----------------------------------------------------------------
Amlogic drivers changes for v6.11:
- Add S905L & A113X SoC IDs
- add missing MODULE_DESCRIPTION() macro for meson_sm driver

----------------------------------------------------------------
Christian Hewitt (1):
       soc: amlogic: meson-gx-socinfo: Add S905L ID

Jeff Johnson (1):
       firmware: meson_sm: add missing MODULE_DESCRIPTION() macro

Viacheslav Bocharov (1):
       soc: amlogic: meson-gx-socinfo: add new A113X SoC id

  drivers/firmware/meson/meson_sm.c      | 1 +
  drivers/soc/amlogic/meson-gx-socinfo.c | 2 ++
  2 files changed, 3 insertions(+)
